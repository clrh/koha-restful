package Koha::REST::Infos;

use base 'CGI::Application';
use Modern::Perl;
use C4::Context;
use C4::Branch;

use Koha::REST::Response qw(format_response response_boolean format_error);

sub setup {
    my $self = shift;
    $self->run_modes(
        informations => 'rm_informations',
        branches => 'rm_branches',
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

sub rm_branches {
    my $self = shift;
    my $response = [];
    my $branches = C4::Branch::GetBranches();
    if ($branches) {
        foreach my $branch (values %$branches) {
            push @$response, {
                code => $branch->{branchcode},
                name => $branch->{branchname},
            };
        }
    }
    return format_response($self, $response);
}


1;
