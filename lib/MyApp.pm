package MyApp;
use Mojo::Base 'Mojolicious';
use MyApp::Model::Pltidy;

# This method will run once at server start
sub startup {
  my $app = shift;
  $app->helper(pltidy => sub { state $pltidy = MyApp::Model::Pltidy->new });
  # Documentation browser under "/perldoc"
  $app->plugin('PODRenderer');

  # Router
  my $r = $app->routes;

  # Normal route to controller
  $r->any('/changes')->to('example#changes');
  
  $r->get('/*')->to('example#welcome');
  
}

1;
