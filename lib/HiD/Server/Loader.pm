# ABSTRACT: Another helper for 'hid publish -A'

=head1

Another helper for C<hid publish -A>

=cut

package HiD::Server::Loader;

use 5.014;  # strict, unicode_strings
use warnings;

use parent 'Plack::Loader::Restarter';

# FIXME this is kinda not the greatest idea but this is less re-implementation
# than overriding the 'run' method and there really are zero hooks provided
# for this...
sub _fork_and_start {
  my($self, $server) = @_;

  delete $self->{pid};          # re-init in case it's a restart

  my $pid = fork;
  die "Can't fork: $!" unless defined $pid;

  if ($pid == 0) {              # child
    $server->republish();

    return $server->run($self->{builder}->());
  }
  else {
    $self->{pid} = $pid;
  }
}

1;
