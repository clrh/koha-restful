package t::rest::lib::Mocks;

use Modern::Perl;
use C4::Context;
use Test::MockModule;

sub mock_config {
    my $context = new Test::MockModule('C4::Context');
    $context->mock('config', sub {
        my ( $self, $var ) = @_;
        my $value;
        given ( $var ) {
            when ('database') {
                $value = q{koha_restful_test};
            }
            default {
                my $method = $context->original('config');
                $value = $method->($self, $var);
            }
        }
        return $value;
    });
}

1;
