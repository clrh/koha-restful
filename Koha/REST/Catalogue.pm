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

    my $response = [];
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
        push @$response, $r;
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
                my $can_reserve = C4::Reserves::CanItemBeReserved($borrowernumber, $itemnumber);
                # This shouldn't be here. It should be in the C4::Reserves::CanItemBeReserved function. But that's how koha works.
                my $available = IsAvailableForItemLevelRequest($itemnumber);
                $is_holdable = $can_reserve && $available;
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
        $can_reserve = C4::Reserves::CanItemBeReserved($borrowernumber, $itemnumber);
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
