package Koha::REST::Catalogue;

use base 'CGI::Application';
use Modern::Perl;

use Koha::REST::Response qw(format_response response_boolean);
use C4::Context;
use C4::Reserves;
use C4::Items;
use C4::Branch;
use C4::Members;

sub setup {
    my $self = shift;
    $self->run_modes(
        'get_biblio_items' => 'rm_get_biblio_items',
        'biblio_is_holdable' => 'rm_biblio_is_holdable',
        'item_is_holdable' => 'rm_item_is_holdable',
        'get_biblio_items_holdable_status' => 'rm_get_biblio_items_holdable_status',
    );
}

my @items_columns;
sub items_columns {
    if (scalar @items_columns == 0) {
        @items_columns = keys %{C4::Context->dbh->selectrow_hashref("
            SELECT * FROM items LIMIT 1")};
    }
    return @items_columns;
}

# return the list of all items for one biblio
sub rm_get_biblio_items {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');
    my $q = $self->query();
    my $get_reserves = $q->param('reserves');

    my $response = [];

    my %reserves;
    if ($get_reserves) {
        my $res = C4::Reserves::GetReservesFromBiblionumber($biblionumber);
        if ($res) {
            foreach my $reserve (@$res) {
                push @{ $reserves{ $reserve->{itemnumber} } }, $reserve;
            }
        }
    }

    my @all_items = C4::Items::GetItemsInfo($biblionumber);
    foreach my $item (@all_items) {
        my $holdingbranchname = C4::Branch::GetBranchName($item->{holdingbranch});
        my $homebranchname = C4::Branch::GetBranchName($item->{homebranch});
        my $r = {
            (map { +"$_" => $item->{$_} } items_columns),
            holdingbranchname => $holdingbranchname,
            homebranchname => $homebranchname,
            withdrawn => $item->{wthdrawn},
            date_due => $item->{datedue},
        };

        if (exists $reserves{ $item->{itemnumber} }) {
            $r->{reserves} = $reserves{ $item->{itemnumber} };
        } elsif ($get_reserves) {
            $r->{reserves} = [];
        }

        push @$response, $r;
    }

    return format_response($self, $response);
}

sub get_issuing_rule {
    my ( $categorycode, $itemtype, $branchcode ) = @_;
    $categorycode ||= "*";
    $itemtype     ||= "*";
    $branchcode   ||= "*";

    # This configuration table defines the order of inheritance. We'll loop over it.
    my @attempts = (
        [ "*",           "*",       "*" ],
        [ "*",           $itemtype, "*" ],
        [ $categorycode, "*",       "*" ],
        [ $categorycode, $itemtype, "*" ],
        [ "*",           "*",       $branchcode ],
        [ "*",           $itemtype, $branchcode ],
        [ $categorycode, "*",       $branchcode ],
        [ $categorycode, $itemtype, $branchcode ],
    );

    # This complex query returns a nested hashref, so we can access a rule using :
    # my $rule = $$rules{$categorycode}{$itemtype}{$branchcode};
    # this will be usefull in the inheritance computation code
    my $dbh   = C4::Context->dbh;
    my $rules = $dbh->selectall_hashref(
        "SELECT * FROM issuingrules where branchcode IN ('*',?) and itemtype IN ('*', ?) and categorycode IN ('*',?)",
        [ "branchcode", "itemtype", "categorycode" ],
        undef, ( $branchcode, $itemtype, $categorycode )
    );

    # This block is for inheritance. It loops over rules returned by the
    # previous query. If a value is found in a more specific rule, it replaces
    # the old value from the more generic rule.
    my $oldrule;
    for my $attempt (@attempts) {
        if ( my $rule = $$rules{ @$attempt[2] }{ @$attempt[1] }{ @$attempt[0] } ) {
            if ($oldrule) {
                for ( keys %$oldrule ) {
                    if ( defined $rule->{$_} ) {
                        $oldrule->{$_} = $rule->{$_};
                    }
                }
            } else {
                $oldrule = $rule;
            }
        }
    }
    if ($oldrule) {
        return $oldrule;
    } else {
        return {
            'itemtype'         => $itemtype,
            'categorycode'     => $categorycode,
            'branchcode'       => $branchcode,
            'holdspickupdelay' => 0,

            #     'maxissueqty'       => 0,
            'renewalsallowed'   => 0,
            'firstremind'       => 0,
            'accountsent'       => 0,
            'reservecharge'     => 0,
            'fine'              => 0,
            'restrictedtype'    => 0,
            'rentaldiscount'    => 0,
            'chargename'        => 0,
            'finedays'          => 0,
            'holdrestricted'    => 0,
            'allowonshelfholds' => 0,
            'reservesallowed'   => 0,
            'chargeperiod'      => 0,

            #     'issuelength'       => 0,
            'renewalperiod' => 0,
        };
    }
}

# Replacement of C4::Reserves::CanBookBeReserved which do not check all that
# must be checked
sub biblio_is_holdable {
    my ( $borrowernumber, $biblionumber, $branch ) = @_;

    my $pending_issues = C4::Members::GetPendingIssues( $borrowernumber );
    my $checked_out = grep { $$_{biblionumber} == $biblionumber } @$pending_issues;
    if ($checked_out) {
        return wantarray ? (0, { checked_out => 1 }) : 0;
    }

    # Check if borrower has already reserved this biblio
    my @reserves = GetReservesFromBorrowernumber($borrowernumber);
    my $reserved = grep { $_->{biblionumber} == $biblionumber } @reserves;
    if ($reserved) {
        return wantarray ? (0, { reserved => 1 }) : 0;
    }

    my $homeorholdingbranch = C4::Context->preference('HomeOrHoldingBranch');
    my @items = C4::Items::GetItemsInfo($biblionumber);

    if(defined $branch and $branch ne '') {
        # Remove from list items of other branches and items which are
        # not for loan
        @items = map {
            ( $_->{$homeorholdingbranch} eq $branch and not $_->{notforloan} )
            ? $_
            : ()
        } @items;
    }

    if(not C4::Context->preference('AllowOnShelfHolds')) {
        # If at least one item is available (not on loan), prevent reservation
        my $member = C4::Members::GetMember(borrowernumber => $borrowernumber);
        my $controlbranch = C4::Context->preference('ReservesControlBranch');
        my $branchcode = ($controlbranch eq 'PatronLibrary')
            ? $member->{branchcode}
            : $branch;
        my $itype;
        if (not C4::Context->preference('item-level_itypes')) {
            my ($biblioitem) = C4::Biblio::GetBiblioItemByBiblioNumber($biblionumber);
            $itype = $biblioitem->{itemtype};
        }
        foreach my $item (@items) {
            if(not $item->{onloan}) {
                $itype //= $item->{itype};
                if ($controlbranch eq 'ItemHomeLibrary') {
                    $branchcode = $item->{homebranch};
                }
                my $ir = get_issuing_rule($member->{categorycode}, $itype, $branchcode);
                if ($ir->{reservesallowed} > 0) {
                    return wantarray ? (0, { item_available => 1 }) : 0;
                }
            }
        }
    }

    my ($currentreserves,$maxreservesallowed) = (0, -1);
    for my $item (@items){
        my @list = CanItemBeReserved($borrowernumber,$item->{itemnumber});
        if ($list[0] == 1){
            return 1;
        } else {
            $currentreserves = $list[1]
                if ($list[1] > $currentreserves);
            $maxreservesallowed = $list[2]
                if ($list[2] < $maxreservesallowed or $maxreservesallowed == -1);
        }
    }

    my $reasons = {
        currentreserves => $currentreserves,
        maxreservesallowed => $maxreservesallowed
    };
    return wantarray ? (0, $reasons) : 0;
}

sub item_is_holdable {
    my ($borrowernumber, $itemnumber) = @_;

    my $is_holdable = 0;

    if ($borrowernumber and $itemnumber) {
        my $item = C4::Items::GetItem($itemnumber);
        my $biblionumber = $item->{biblionumber};

        my $can_reserve = C4::Reserves::CanItemBeReserved($borrowernumber, $itemnumber);

        # This shouldn't be here. It should be in the
        # C4::Reserves::CanItemBeReserved function. But that's how koha works.
        my $available = IsAvailableForItemLevelRequest($itemnumber);

        my @reserves = C4::Reserves::GetReservesFromBorrowernumber($borrowernumber);
        my $already_reserved = 0;
        foreach my $reserve (@reserves) {
            if (   $reserve->{biblionumber} == $biblionumber
                || $reserve->{itemnumber} == $itemnumber )
            {
                $already_reserved = 1;
                last;
            }
        }

        $is_holdable = ($can_reserve && $available && !$already_reserved);
    }

    return $is_holdable;
}

# check if a biblio is holdable
sub rm_biblio_is_holdable {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');

    my $q = $self->query();
    my $borrowernumber = $q->param('borrowernumber');
    my $itemnumber = $q->param('itemnumber');

    my ($can_reserve, $reasons) = (undef, []);
    if ($borrowernumber) {
        if ($itemnumber) {
            $can_reserve = item_is_holdable($borrowernumber, $itemnumber);
        } else {
            ($can_reserve, $reasons) = biblio_is_holdable($borrowernumber, $biblionumber);
        }
    } else {
        $can_reserve = 1;
    }

    my $response = {
        is_holdable => response_boolean($can_reserve),
        reasons => ($can_reserve) ? [] : $reasons,
    };
    return format_response($self, $response);
}

# return the status (holdable or not) of all items of a biblio
sub rm_get_biblio_items_holdable_status {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');

    my $q = $self->query();
    my $borrowernumber = $q->param('borrowernumber');
    unless ($borrowernumber) {
        my $user_name = $q->param('user_name');
        if ($user_name) {
            my $borrower = C4::Members::GetMember(userid => $user_name);
            $borrowernumber = $borrower->{borrowernumber} if $borrower;
        }
    }

    my $response = {};
    my $itemnumbers = C4::Items::get_itemnumbers_of($biblionumber);
    if ($itemnumbers->{$biblionumber}) {
        foreach my $itemnumber (@{ $itemnumbers->{$biblionumber} }) {
            my $is_holdable;
            if ($borrowernumber) {
                $is_holdable = item_is_holdable($borrowernumber, $itemnumber);
            } else {
                $is_holdable = 0;
            }
            $response->{$itemnumber} = {
                is_holdable => response_boolean($is_holdable),
                reasons => [],
            };
        }
    }

    return format_response($self, $response);
}

# check if an item is holdable
sub rm_item_is_holdable {
    my $self = shift;
    my $itemnumber = $self->param('itemnumber');

    my $q = $self->query();
    my $user_name = $q->param('user_name');
    my $borrower = C4::Members::GetMember(userid => $user_name);
    my $borrowernumber = $borrower->{borrowernumber};

    my $can_reserve;
    if ($borrowernumber) {
        $can_reserve = item_is_holdable($borrowernumber, $itemnumber);
    } else {
        $can_reserve = 0;
    }

    my $response = {
        is_holdable => response_boolean($can_reserve),
        reasons => ($can_reserve) ? [] : [ "No reasons..." ],
    };
    return format_response($self, $response);
}

1;
