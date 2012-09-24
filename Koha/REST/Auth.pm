package Koha::REST::Auth;

use base 'CGI::Application';
use Modern::Perl;

use Koha::REST::Response qw(format_response response_boolean format_error);
use C4::Auth;
use C4::Members;

sub setup {
    my $self = shift;
    $self->run_modes(
        put_password => 'rm_put_password',
        forbidden    => 'rm_forbidden',
    );
}

# Updates the password of a koha user 
sub rm_put_password {
    my $self = shift;
    my $q = $self->query;
    my $login = $q->param('user_name');
    my $newpassword = $q->param('new_password');

    my $response;
    my $result = 0;

    # Find the borrowernumber matching the opac login (userid)
    my $borrower = GetMember(userid => $login);
    if ($borrower) {
        warn $borrower->{'borrowernumber'};

        # Changing the password
        $result = ModMember(borrowernumber => $borrower->{'borrowernumber'}, password => $newpassword);
    }

    push @$response, {
        success => $result
    };
    return format_response($self, $response);
}

# Returns a 403 Forbidden error.
sub rm_forbidden {
    my $self = shift;
    my $response = ["Forbidden. $ENV{'REMOTE_ADDR'} is not allowed to use this service. Are you sure configuration variable 'authorizedips' is correctly configured?"];
    return format_error($self, '403', $response);
}


1;
