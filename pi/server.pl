use base qw(Net::Server::HTTP);

Net::Server::HTTP->run(app => {
	'/simsalabim' => sub {
		system("/usr/bin/opendoor");
	},
});


