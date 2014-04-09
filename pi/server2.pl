use base qw(Net::Server::HTTP);
__PACKAGE__->run;

sub process_http_request {
	my $self = shift;

	print "Content-type: text/html\n\n";
	print "<form method=post action=/bam><input type=text name=foo><input type=submit></form>\n";

	require Data::Dumper;
	local $Data::Dumper::Sortkeys = 1;

	require CGI;
	my $form = {};
	my $q = CGI->new; $form->{$_} = $q->param($_) for $q->param;

	print "<pre>".Data::Dumper->Dump([\%ENV, $form], ['*ENV', 'form'])."</pre>";
}
