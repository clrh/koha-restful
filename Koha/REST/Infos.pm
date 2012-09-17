package Koha::REST::Infos;

use base 'CGI::Application';
use Modern::Perl;
use C4::Context;

use Koha::REST::Response qw(format_response response_boolean format_error);

sub setup {
    my $self = shift;
    $self->run_modes(
        informations => 'rm_informations',
    );
}

# Updates the password of a koha user 
sub rm_informations {
    my $self = shift;
    my $response;
    push @$response, {
        ilsname    => "Koha",
        ilsversion => C4::Context::KOHAVERSION,
        clientip   => $ENV{'REMOTE_ADDR'}
    };
    return format_response($self, $response);
}

1;
