package Koha::RESTApplication::Catalogue;

use base 'CGI::Application';
use Modern::Perl;

use Koha::RESTApplication::Response qw(format_response response_boolean);
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

# return the list of all items for one biblio
sub rm_get_biblio_items {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');

    my $response = [];
    my $itemnumbers = C4::Items::GetItemnumbersForBiblio($biblionumber);
    if ($itemnumbers) {
        foreach my $itemnumber (@$itemnumbers) {
            my $item = C4::Items::GetItem($itemnumber);
            my $holdingbranchname = C4::Branch::GetBranchName($item->{holdingbranch});
            my $homebranchname = C4::Branch::GetBranchName($item->{homebranch});
            my $r = {
                itemnumber => $itemnumber,
                holdingbranch => $item->{holdingbranch},
                holdingbranchname => $holdingbranchname,
                homebranch => $item->{homebranch},
                homebranchname => $homebranchname,
                withdrawn => $item->{wthdrawn},
                notforloan => $item->{notforloan},
                onloan => $item->{onloan},
                location => $item->{location},
                itemcallnumber => $item->{itemcallnumber},
                date_due => $item->{date_due},
                barcode => $item->{barcode},
                itemlost => $item->{itemlost},
                damaged => $item->{damaged},
                stocknumber => $item->{stocknumber},
                itype => $item->{itype},
            };
            push @$response, $r;
        }
    }

    return format_response($self, $response);
}

# check if a biblio is holdable
sub rm_biblio_is_holdable {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');

    my $q = $self->query();
    my $borrowernumber = $q->param('borrowernumber');
    my $itemnumber = $q->param('itemnumber');

    my $can_reserve;
    if ($borrowernumber) {
        if ($itemnumber) {
            $can_reserve = C4::Reserves::CanItemBeReserved($borrowernumber, $itemnumber);
        } else {
            $can_reserve = C4::Reserves::CanBookBeReserved($borrowernumber, $biblionumber);
        }
    } else {
        $can_reserve = 1;
    }

    my $response = {
        is_holdable => response_boolean($can_reserve),
        reasons => ($can_reserve) ? [] : [ "No reasons..." ],
    };
    return format_response($self, $response);
}

# return the status (holdable or not) of all items of a biblio
sub rm_get_biblio_items_holdable_status {
    my $self = shift;
    my $biblionumber = $self->param('biblionumber');

    my $q = $self->query();
    my $borrowernumber;
    my $user_name = $q->param('user_name');
    if ($user_name) {
        my $borrower = C4::Members::GetMember(userid => $user_name);
        $borrowernumber = $borrower->{borrowernumber} if $borrower;
    }

    my $response = {};
    my $itemnumbers = C4::Items::GetItemnumbersForBiblio($biblionumber);
    if ($itemnumbers) {
        foreach my $itemnumber (@$itemnumbers) {
            my $can_reserve;
            if ($borrowernumber) {
                $can_reserve = C4::Reserves::CanItemBeReserved($borrowernumber, $itemnumber);
            } else {
                $can_reserve = 0;
            }
            $response->{$itemnumber} = {
                is_holdable => response_boolean($can_reserve),
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
        $can_reserve = CanItemBeReserved($borrowernumber, $itemnumber);
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
