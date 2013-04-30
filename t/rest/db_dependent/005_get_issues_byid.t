#!/usr/bin/env perl

use Modern::Perl;

use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 8;
use Test::WWW::Mechanize::CGIApp;
use JSON;
use Data::Dumper;

t::rest::lib::Mocks::mock_config;

my $mech = Test::WWW::Mechanize::CGIApp->new;
$mech->app('Koha::REST::Dispatch');


# Edna Acosta, 1 hold on 0000000007 (biblionumber 3)
my $path = "/user/byid/5/issues";

$mech->get_ok($path);
my $got = from_json( $mech->response->content );
my $expected = [
    {
        'itemnumber' => '1',
        'itemcallnumber' => undef,
        'date_due' => '2013-05-03T23:59:00',
        'barcode' => '0000000001',
        'renewable' => JSON::false,
        'issuedate' => '2013-04-30T10:53:00',
        'biblionumber' => '1',
        'reasons_not_renewable' => 'on_reserve',
        'title' => 'Harry Potter and the chamber of secrets',
        'borrowernumber' => '5',
        'branchcode' => 'MPL'
    },
    {
        'itemnumber' => '2',
        'itemcallnumber' => undef,
        'date_due' => '2013-05-03T23:59:00',
        'barcode' => '0000000002',
        'renewable' => JSON::true,
        'issuedate' => '2013-04-30T10:55:00',
        'biblionumber' => '1',
        'title' => 'Harry Potter and the chamber of secrets',
        'borrowernumber' => '5',
        'branchcode' => 'MPL'
    },
    {
        'itemnumber' => '4',
        'itemcallnumber' => undef,
        'date_due' => '2013-05-03T23:59:00',
        'barcode' => '0000000004',
        'renewable' => JSON::false,
        'issuedate' => '2013-04-30T10:56:00',
        'biblionumber' => '2',
        'reasons_not_renewable' => 'on_reserve',
        'title' => 'The art of programming embedded systems',
        'borrowernumber' => '5',
        'branchcode' => 'MPL'
    }
];

is_deeply( $got, $expected, q{get user's issues} );

# Marcus Welch, 0 hold
$path = "/user/byid/2/issues";

$mech->get_ok($path);
$got = from_json( $mech->response->content );

$expected = [];

is_deeply( $got, $expected, q{get a user's issues (no hold)} );

# Inexistant user
# FIXME This should not return an empty array because there is an error.
$path = "/user/byid/20/issues";

$mech->get_ok($path);
$got = from_json( $mech->response->content );

$expected = undef;

is_deeply( $got, $expected, q{get issues for inexistant user} );

# Missing parameter
$path = "/user/byid//issues";

$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = undef;

is_deeply( $got, $expected, q{missing parameter borrowernumber} );
