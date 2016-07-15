package MyApp::Model::Pltidy;
use Perl::Tidy;
use Mojo::Base '-base';

has user_post =>'';
has dest_string=>'';
has stderr_string=>'';
has errorfile_string=>'';
has default_argv=>'-npro -pbp -nst -se';

sub start_change {
	my $s=shift;
	$s->user_post(shift);
	my $source_string = $s->user_post;
	my $dest_string;
	my $stderr_string;
	my $errorfile_string;
	if ($s->user_post) {
	my $error = Perl::Tidy::perltidy(
    argv        => $s->default_argv,
    source      => \$source_string,
    destination => \$dest_string,
    stderr      => \$stderr_string,
    errorfile   => \$errorfile_string,    # ignored when -se flag is set
    ##phasers   => 'stun',                # uncomment to trigger an error
	);
}
$dest_string ? $s->dest_string($dest_string) : $s->dest_string('');
$stderr_string ? $s->stderr_string($stderr_string) : $s->stderr_string('');
$errorfile_string ? $s->errorfile_string($errorfile_string) : $s->errorfile_string('');

	return $s;
}
1;