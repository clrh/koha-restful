#!/usr/bin/env perl

use Modern::Perl;

use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 6;
use Test::WWW::Mechanize::CGIApp;
use JSON;

t::rest::lib::Mocks::mock_config;

my $mech = Test::WWW::Mechanize::CGIApp->new;
$mech->app('Koha::REST::Dispatch');


t::rest::lib::Mocks::mock_preference('AllowOnShelfHolds', '0');

my $path = "/item/7/holdable?user_name=23529001000463";
$mech->get_ok($path);
my $got = from_json( $mech->response->content );
my $expected = {
    'is_holdable' => JSON::false,
    'reasons' => {
        'reserved' => 1
    }
};
is_deeply( $got, $expected, q{cannot reserve because already reserved} );

$path = "/item/4/holdable?user_name=23529001000463";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::true,
};
is_deeply( $got, $expected, q{cannot reserve because already checked out} );

$path = "/item/5/holdable?user_name=23529001000463";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::false,
    'reasons' => {
        'item_available' => 1
    },
};
is_deeply( $got, $expected, q{cannot reserve because the item is available} );

$path = "/item/7/holdable?user_name=23529000152273";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::true,
};
is_deeply( $got, $expected, q{can reserve} );



t::rest::lib::Mocks::mock_preference('AllowOnShelfHolds', '1');
$path = "/item/7/holdable?user_name=23529001000463";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::false,
    'reasons' => {
        'reserved' => 1
    }
};
is_deeply( $got, $expected, q{cannot reserve because already reserved} );


$path = "/item/4/holdable?user_name=23529001000463";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::true,
};
is_deeply( $got, $expected, q{cannot reserve because already checked out} );


$path = "/item/5/holdable?user_name=23529001000463";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::true,
    'reasons' => []
};
is_deeply( $got, $expected, q{cannot reserve because the item is available} );

$path = "/item/7/holdable?user_name=23529000152273";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = {
    'is_holdable' => JSON::true,
};
is_deeply( $got, $expected, q{can reserve} );
