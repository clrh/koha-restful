#!/usr/bin/env perl

use Modern::Perl;

use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 2;
use Test::WWW::Mechanize::CGIApp;
use JSON;

t::rest::lib::Mocks::mock_config;

my $mech = Test::WWW::Mechanize::CGIApp->new;
$mech->app('Koha::REST::Dispatch');


my $path = "/branches";

$mech->get_ok($path);
my $got = from_json( $mech->response->content );

my $expected = [
          {
            'name' => 'Midway',
            'code' => 'MPL'
          },
          {
            'name' => 'Centerville',
            'code' => 'CPL'
          },
          {
            'name' => 'Fairview',
            'code' => 'FPL'
          }
        ];

is_deeply( $got, $expected, 'get branches' );
