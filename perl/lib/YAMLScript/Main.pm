use strict; use warnings;
package YAMLScript::Main;

# XXX Local dev lib:
use lib "$ENV{HOME}/src/lingy/perl/lib";

use Lingy::Common;
use YAMLScript::Reader;

BEGIN {
    package Lingy::Common;
    no warnings 'redefine';
    sub RT() { 'YAMLScript::Lang::RT' }
}

use YAMLScript::Lang::RT;
use Lingy::Main;

use base 'Lingy::Main';

sub do_version {
    RT->rep('
      (println
        (str
          "YAMLScript ["
          *HOST*
          "] version "
          (yamlscript-version)))
    ');
}

sub do_eval {
    my $self = shift;
    $YAMLScript::Reader::read_ys = 1;
    $self->SUPER::do_eval(@_);
}

sub do_repl {
    my $self = shift;
    $YAMLScript::Reader::read_ys = 1;
    $self->SUPER::do_repl(@_);
}

1;
