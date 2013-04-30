#!/usr/bin/env perl

use Modern::Perl;

use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 10;
use Test::WWW::Mechanize::CGIApp;
use JSON;
use Data::Dumper;

t::rest::lib::Mocks::mock_config;

my $mech = Test::WWW::Mechanize::CGIApp->new;
$mech->app('Koha::REST::Dispatch');


# Edna Acosta, 1 hold on 0000000007 (biblionumber 3)
my $path = "/user/byid/5/holds";

$mech->get_ok($path);
my $got = from_json( $mech->response->content );

my $expected = [
    {
        'itemnumber' => '7',
        'itemcallnumber' => undef,
        'branchname' => 'Midway',
        'hold_id' => undef,
        'reservedate' => '2013-04-30',
        'barcode' => '0000000007',
        'found' => undef,
        'biblionumber' => '3',
        'title' => 'The black island',
        'cancellationdate' => undef,
        'rank' => '1',
        'branchcode' => 'MPL'
    }
];

is_deeply( $got, $expected, q{get user's holds (single)} );

# Tanya Daniels, 3 holds
$path = "/user/byid/3/holds";

$mech->get_ok($path);
$got = from_json( $mech->response->content );

$expected = [
    {
        'itemnumber' => '1',
        'itemcallnumber' => undef,
        'branchname' => 'Midway',
        'hold_id' => undef,
        'reservedate' => '2013-04-30',
        'barcode' => '0000000001',
        'found' => undef,
        'biblionumber' => '1',
        'title' => 'Harry Potter and the chamber of secrets',
        'cancellationdate' => undef,
        'rank' => '1',
        'branchcode' => 'MPL'
    },
    {
        'itemnumber' => '4',
        'itemcallnumber' => undef,
        'branchname' => 'Midway',
        'hold_id' => undef,
        'reservedate' => '2013-04-30',
        'barcode' => '0000000004',
        'found' => undef,
        'biblionumber' => '2',
        'title' => 'The art of programming embedded systems',
        'cancellationdate' => undef,
        'rank' => '1',
        'branchcode' => 'MPL'
    },
    {
        'itemnumber' => '7',
        'itemcallnumber' => undef,
        'branchname' => 'Midway',
        'hold_id' => undef,
        'reservedate' => '2013-04-30',
        'barcode' => '0000000007',
        'found' => undef,
        'biblionumber' => '3',
        'title' => 'The black island',
        'cancellationdate' => undef,
        'rank' => '2',
        'branchcode' => 'MPL'
    }
];

is_deeply( $got, $expected, "get a user's holds (multiple)" );

# Marcus Welch, 0 hold
$path = "/user/byid/2/holds";

$mech->get_ok($path);
$got = from_json( $mech->response->content );

$expected = [];

is_deeply( $got, $expected, q{get a user's holds (no hold)} );

# Inexistant user
# FIXME This should not return an empty array because there is an error.
$path = "/user/byid/20/holds";

$mech->get_ok($path);
$got = from_json( $mech->response->content );

$expected = undef;

is_deeply( $got, $expected, q{get holds for inexistant user} );

# Missing parameter
$path = "/user/byid//holds";

$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = undef;

is_deeply( $got, $expected, q{missing parameter borrowernumber} );
