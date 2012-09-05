package Koha::RESTApplication::Response;

use Modern::Perl;
use Exporter 'import';
use JSON;

our @EXPORT_OK = qw(
    format_response
    format_error
    response_boolean
);

sub format_response {
    my ($cgi_application, $response) = @_;

    $cgi_application->header_props(-content_type => 'application/json');
    return to_json($response, { utf8 => 1, pretty => 1 });
}

sub response_boolean {
    (shift) ? JSON::true : JSON::false;
}

sub format_error {
    my ($cgi_application, $status, $response) = @_;
    $cgi_application->header_props(-content_type => 'application/json', -status => $status);
    return to_json($response, { utf8 => 1, pretty => 1 });
}

1;
