#!/usr/bin/env perl

use Modern::Perl;

use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 6;
use Test::WWW::Mechanize::CGIApp;
use JSON;
use Data::Dumper;

t::rest::lib::Mocks::mock_config;

my $mech = Test::WWW::Mechanize::CGIApp->new;
$mech->app('Koha::REST::Dispatch');


my $path = "/biblio/1/items";

$mech->get_ok($path);
my $got = from_json( $mech->response->content );
my $expected = [
    {
        'withdrawn' => '0',
        'biblioitemnumber' => '1',
        'restricted' => undef,
        'wthdrawn' => '0',
        'holdingbranchname' => 'Midway',
        'notforloan' => '0',
        'replacementpricedate' => '2013-04-30',
        'itemnumber' => '1',
        'ccode' => undef,
        'itemnotes' => undef,
        'location' => undef,
        'itemcallnumber' => undef,
        'stack' => undef,
        'date_due' => '2013-05-03 23:59:00',
        'barcode' => '0000000001',
        'itemlost' => '0',
        'uri' => undef,
        'datelastseen' => '2013-04-30',
        'materials' => undef,
        'price' => undef,
        'issues' => '1',
        'homebranch' => undef,
        'replacementprice' => undef,
        'more_subfields_xml' => undef,
        'cn_source' => undef,
        'homebranchname' => undef,
        'booksellerid' => undef,
        'biblionumber' => '1',
        'renewals' => undef,
        'holdingbranch' => 'MPL',
        'timestamp' => '2013-04-30 10:34:08',
        'damaged' => '0',
        'cn_sort' => '',
        'stocknumber' => undef,
        'reserves' => undef,
        'enumchron' => undef,
        'datelastborrowed' => '2013-04-30',
        'dateaccessioned' => '2013-04-30',
        'copynumber' => undef,
        'permanent_location' => undef,
        'itype' => 'BK',
        'paidfor' => undef,
        'onloan' => '2013-05-03'
    },
    {
        'withdrawn' => '0',
        'biblioitemnumber' => '1',
        'restricted' => undef,
        'wthdrawn' => '0',
        'holdingbranchname' => 'Midway',
        'notforloan' => '0',
        'replacementpricedate' => '2013-04-30',
        'itemnumber' => '2',
        'ccode' => undef,
        'itemnotes' => undef,
        'location' => undef,
        'itemcallnumber' => undef,
        'stack' => undef,
        'date_due' => '2013-05-03 23:59:00',
        'barcode' => '0000000002',
        'itemlost' => '0',
        'uri' => undef,
        'datelastseen' => '2013-04-30',
        'materials' => undef,
        'price' => undef,
        'issues' => '1',
        'homebranch' => undef,
        'replacementprice' => undef,
        'more_subfields_xml' => undef,
        'cn_source' => undef,
        'homebranchname' => undef,
        'booksellerid' => undef,
        'biblionumber' => '1',
        'renewals' => undef,
        'holdingbranch' => 'MPL',
        'timestamp' => '2013-04-30 10:34:08',
        'damaged' => '0',
        'cn_sort' => '',
        'stocknumber' => undef,
        'reserves' => undef,
        'enumchron' => undef,
        'datelastborrowed' => '2013-04-30',
        'dateaccessioned' => '2013-04-30',
        'copynumber' => undef,
        'permanent_location' => undef,
        'itype' => 'BK',
        'paidfor' => undef,
        'onloan' => '2013-05-03'
    },
    {
        'withdrawn' => '0',
        'biblioitemnumber' => '1',
        'restricted' => undef,
        'wthdrawn' => '0',
        'holdingbranchname' => 'Centerville',
        'notforloan' => '0',
        'replacementpricedate' => '2013-04-30',
        'itemnumber' => '3',
        'ccode' => undef,
        'itemnotes' => undef,
        'location' => undef,
        'itemcallnumber' => undef,
        'stack' => undef,
        'date_due' => '',
        'barcode' => '0000000003',
        'itemlost' => '0',
        'uri' => undef,
        'datelastseen' => '2013-04-30',
        'materials' => undef,
        'price' => undef,
        'issues' => undef,
        'homebranch' => undef,
        'replacementprice' => undef,
        'more_subfields_xml' => undef,
        'cn_source' => undef,
        'homebranchname' => undef,
        'booksellerid' => undef,
        'biblionumber' => '1',
        'renewals' => undef,
        'holdingbranch' => 'CPL',
        'timestamp' => '2013-04-30 10:34:08',
        'damaged' => '0',
        'cn_sort' => '',
        'stocknumber' => undef,
        'reserves' => undef,
        'enumchron' => undef,
        'datelastborrowed' => undef,
        'dateaccessioned' => '2013-04-30',
        'copynumber' => undef,
        'permanent_location' => undef,
        'itype' => 'BK',
        'paidfor' => undef,
        'onloan' => undef
    }
];
is_deeply( $got, $expected, q{biblio with 3 items} );

# Biblio without items
$path = "/biblio/6/items";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = [];

is_deeply( $got, $expected, q{biblio without items} );

# inexistant biblio
$path = "/biblio/142/items";
$mech->get_ok($path);
$got = from_json( $mech->response->content );
$expected = undef;

is_deeply( $got, $expected, q{biblio without items} );
