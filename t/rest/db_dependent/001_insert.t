#!/usr/bin/env perl

use Modern::Perl;
use FindBin qw( $Bin );

use lib "$Bin/../../..";
use t::rest::lib::Mocks;
use Test::More tests => 4;
use Test::MockModule;
use Data::Dumper;
use File::Slurp qw( read_file );

use_ok('C4::Context');

t::rest::lib::Mocks::mock_config;

recreate_db();
initialize_data();

sub recreate_db {
    my $dbh = C4::Context->dbh;
    my $dbname = C4::Context->config("database");
    ok( $dbh->do(qq{
        DROP DATABASE $dbname
    }), "drop database $dbname" );

    is( $dbh->do(qq{
        CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_bin
    }), 1, "create database $dbname" );
}

sub initialize_data {
    my $sqlfiles = qq{$Bin/data/*.sql};
    my $user = C4::Context->config('user');
    my $pass = C4::Context->config('pass');
    my $dbname = C4::Context->config("database");

    for my $file ( glob $sqlfiles ) {
        is( system( qq{/usr/bin/mysql -u $user -p'$pass' -D $dbname < $file} ), 0, "Insert data into the database" );
    }

}
