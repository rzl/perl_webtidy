package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $c = shift;

  # Render template "example/welcome.html.ep" with message
  $c->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

sub changes {
	my $c = shift;
	my $sourc = $c->param('text')||'happy perl';
	my $res = $c->pltidy->start_change($sourc);
	$c->render(msg => $res);
}

1;
