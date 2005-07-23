#!/usr/bin/perl -w
use Test::Simple tests=>4;
use CGI::Session;

my $session = new CGI::Session("driver:bitbucket", undef, {Log=>1});

ok( $session );

$session->param("hello", "world");
ok( $session->param("hello") eq "world" );
ok( $session->flush );

eval {
	$session->delete;
};

ok( !$@ );
