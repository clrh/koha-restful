package Koha::REST::Dispatch;

use C4::Context;

use base 'CGI::Application::Dispatch';

sub dispatch_args {
    return {
        prefix => 'Koha::REST',

        # Each entry in the table below correspond to an application and a run
        # mode. An application is a Perl module in Koha::REST. For
        # example, { app => 'User' } correspond to Koha::REST::User.
        # Run modes are described in corresponding Perl module.
        #
        # Notes for building new paths:
        #   ':variable'  : a required parameter
        #   ':variable?' : an optional parameter
        #   '[method]'   : put at the end of path, tell that we can only use
        #                  this HTTP method to run the corresponding mode.
        #   Optional parameters can be omitted from the path.
        table => [
            'user/byid/:borrowernumber/holds[get]'
                => { app => 'User', rm => 'get_holds_byid' },
            'user/:user_name/holds[get]'
                => { app => 'User', rm => 'get_holds' },
            'user/byid/:borrowernumber/issues[get]'
                => { app => 'User', rm => 'get_issues_byid' },
            'user/:user_name/issues[get]'
                => { app => 'User', rm => 'get_issues' },
            'biblio/:biblionumber/items[get]'
                => { app => 'Catalogue', rm => 'get_biblio_items' },
            'biblio/:biblionumber/holdable[get]'
                => { app => 'Catalogue', rm => 'biblio_is_holdable' },
            'biblio/:biblionumber/items_holdable_status[get]'
                => { app => 'Catalogue', rm => 'get_biblio_items_holdable_status' },
            'item/:itemnumber/holdable[get]'
                => { app => 'Catalogue', rm => 'item_is_holdable' },
            'auth/change_password[put]'
                => { app => 'Auth', rm => 'put_password' },
        ],
    };
}

1;
