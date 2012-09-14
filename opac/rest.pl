#!/usr/bin/perl

# rest.pl
#
# This script provide a RESTful webservice to interact with Koha.

use Modern::Perl;
use CGI::Application::Dispatch;
use C4::Context;
use List::MoreUtils qw(any);


# First of all, let's test if the client IP is allowed to use our service
# If the remote address is not allowed, redirect to 403
my @AuthorizedIPs = split(/,/, C4::Context->preference('REST:AuthorizedIPs'));
if ( !@AuthorizedIPs # If no filter set, allow access to no one!
    or not any { $ENV{'REMOTE_ADDR'} eq $_ } @AuthorizedIPs # IP Check
    ) {
    CGI::Application::Dispatch->dispatch(
        debug => 1,
        prefix => 'Koha::REST',
        table => [
            '*' => { app => 'Auth', rm => 'forbidden' },
            '/' => { app => 'Auth', rm => 'forbidden' },
        ],
    );
    exit 0;
}


use Koha::REST::Dispatch;

Koha::REST::Dispatch->dispatch(
    debug => 1,
);

__END__

=head1 NAME

rest.pl

=head1 DESCRIPTION

This script provide a RESTful webservice to interact with Koha.

=head1 SERVICES

=head2 User

=head3 GET user/byid/:borrowernumber/holds

=over 2

Get holds of a user, given his id.

Required parameters:

=over 2

=item * borrowernumber: Patron id.

=back

Response:

=over 2

a JSON array that contains holds. Each hold is described by a hash with the
following keys:

=over 2

=item * hold_id: internal hold identifier.

=item * rank: position of the patron in reserve queue.

=item * reservedate: date of reservation.

=item * biblionumber: internal biblio identifier.

=item * title: title of bibliographic record.

=item * branchcode: pickup library code.

=item * branchname: pickup library name.

=item * found: 'W' if item is awaiting for pickup.

=back

If reserve is at item level, there are two additional keys:

=over 2

=item * itemnumber: internal item identifier.

=item * barcode: barcode of item.

=back

=back

=back

=head3 GET user/:user_name/holds

=over 2

Get holds of a user, given his username.

Required parameters:

=over 2

=item * user_name: Patron username.

=back

Response:

=over 2

a JSON array that contains holds. Each hold is described by a hash with the
following keys:

=over 2

=item * hold_id: internal hold identifier.

=item * rank: position of the patron in reserve queue.

=item * reservedate: date of reservation.

=item * biblionumber: internal biblio identifier.

=item * title: title of bibliographic record.

=item * branchcode: pickup library code.

=item * branchname: pickup library name.

=item * found: 'W' if item is awaiting for pickup.

=back

If reserve is at item level, there are two additional keys:

=over 2

=item * itemnumber: internal item identifier.

=item * barcode: barcode of item.

=back

=back

=back

=head3 GET user/byid/:borrowernumber/issues

=over 2

Get issues of a user, given his id.

Required parameters:

=over 2

=item * borrowernumber: Patron id.

=back

Response:

=over 2

a JSON array that contains issues. Each issue is described by a hash with the
following keys:

=over 2

=item * borrowernumber: internal patron identifier.

=item * biblionumber: internal biblio identifier.

=item * title: title of bibliographic record.

=item * itemnumber: internal item identifier.

=item * barcode: barcode of item.

=item * branchcode: pickup library code.

=item * issuedate: date of issue.

=item * date_due: the date the item is due.

=item * renewable: is the issue renewable ? (boolean)

=back

If the issue is not renewable, there is one additional key:

=over 2

=item * reasons_not_renewable: 2 possible values:

=over 2

=item * 'on_reserve': item is on hold.

=item * 'too_many': issue was renewed too many times.

=back

=back

=back

=back

=head3 GET user/:user_name/issues

=over 2

Get issues of a user, given his username.

Required parameters:

=over 2

=item * user_name: Patron username.

=back

Response:

=over 2

a JSON array that contains issues. Each issue is described by a hash with the
following keys:

=over 2

=item * borrowernumber: internal patron identifier.

=item * biblionumber: internal biblio identifier.

=item * title: title of bibliographic record.

=item * itemnumber: internal item identifier.

=item * barcode: barcode of item.

=item * branchcode: pickup library code.

=item * issuedate: date of issue.

=item * date_due: the date the item is due.

=item * renewable: is the issue renewable ? (boolean)

=back

If the issue is not renewable, there is one additional key:

=over 2

=item * reasons_not_renewable: 2 possible values:

=over 2

=item * 'on_reserve': item is on hold.

=item * 'too_many': issue was renewed too many times.

=back

=back

=back

=back

=head2 Biblio

=head3 GET biblio/:biblionumber/items

=over 2

Get items of a bibliographic record.

Required parameters:

=over 2

=item * biblionumber: internal biblio identifier.

=back

Response:

=over 2

a JSON array that contains items. Each item is described by a hash with the
following keys:

=over 2

=item * itemnumber: internal item identifier.

=item * holdingbranch: holding library code.

=item * holdingbranchname: holding library name.

=item * homebranch: home library code.

=item * homebranchname: home library name.

=item * withdrawn: is the item withdrawn ?

=item * notforloan: is the item not available for loan ?

=item * onloan: date of loan if item is on loan.

=item * location: item location.

=item * itemcallnumber: item call number.

=item * date_due: due date if item is on loan.

=item * barcode: item barcode.

=item * itemlost: is item lost ?

=item * damaged: is item damaged ?

=item * stocknumber: item stocknumber.

=item * itype: item type.

=back

=back

=back

=head3 GET biblio/:biblionumber/holdable

=over 2

Check if a biblio is holdable.

Required parameters:

=over 2

=item * biblionumber: internal biblio identifier.

=back

Optional parameters:

=over 2

=item * borrowernumber: internal patron identifier. It is optional but highly
recommended, as no check is performed without it and a true value is always
returned.

=item * itemnumber: internal item identifier. If given, check is done on item
instead of biblio.

=back

Response:

=over 2

a JSON hash that contains the following keys:

=over 2

=item * is_holdable: is the biblio holdable? (boolean)

=item * reasons: reasons why the biblio can't be reserved, if appropriate.
Actually there is no valid reasons...

=back

=back

=back

=head3 GET biblio/:biblionumber/items_holdable_status

=over 2

Check if items of a bibliographic record are holdable.

Required parameters:

=over 2

=item * biblionumber: internal biblio identifier.

=back

Optional parameters:

=over 2

=item * borrowernumber: Patron borrowernumber. It is optional but highly
recommended. If not given, all items will be marked as not holdable.

=item * user_name: Patron username. Only used to find borrowernumber if this one
is not given.

=back

Response:

=over 2

a JSON hash where keys are itemnumbers. Each element of this hash contain
another hash whose keys are:

=over 2

=item * is_holdable: is the item holdable ? (boolean)

=item * reasons: reasons why the biblio can't be reserved, if appropriate.
Actually there is no valid reasons...

=back

=back

=back

=head2 Item

=head3 GET item/:itemnumber/holdable

=over 2

Check if an item is holdable.

Required parameters:

=over 2

=item * itemnumber: internal item identifier.

=back

Optional parameters:

=over 2

=item * user_name: patron username. It is optional but highly recommended. If
not given, item will be marked as not holdable.

=back

Response:

=over 2

a JSON hash with following keys:

=over 2

=item * is_holdable: is item holdable ? (boolean)

=item * reasons: reasons why the biblio can't be reserved, if appropriate.
Actually there is no valid reasons...

=back

=back

=back

=head2 Auth

=head3 PUT auth/change_password

=over 2

Change user password.

Required parameters:

=over 2

=item * user_name: patron username.

=item * new_password: wanted password.

=back

Response:

=over 2

a JSON array which contains one hash with the following keys:

=over 2

=item * success: does the operation succeeded ?

=back

=back

=back

=cut
