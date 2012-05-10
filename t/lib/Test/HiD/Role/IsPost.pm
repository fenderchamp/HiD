use strict;
use warnings;

package Test::HiD::Role::IsPost;
use Test::Routine;
use Test::More;
use namespace::autoclean;

use DateTime;

has expected_date => (
  is       => 'ro' ,
  isa      => 'Str' ,
  required => 1 ,
);

has expected_title => (
  is       => 'ro' ,
  isa      => 'Str' ,
  required => 1 ,
);

test "categories" => sub {
 TODO: {
    local $TODO = 'write category tests';
    ok(0);
  }
};

test "correct date" => sub {
  my $test    = shift;
  my $subject = $test->subject;

  my( $y , $m , $d )  = split /-/ , $test->expected_date;

  my $dt = DateTime->new( year => $y , month => $m , day => $d );

  is( 0 , DateTime->compare( $subject->date , $dt ));
};

test "tags" => sub {
 TODO: {
    local $TODO = 'write tag tests';
    ok(0);
  }
};

test "title" => sub {
  my $test    = shift;
  my $subject = $test->subject;

  is( $subject->title , $test->expected_title );
};

1;