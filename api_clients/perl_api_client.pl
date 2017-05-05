use strict;
use warnings;
use LWP::UserAgent;

my $ua = new LWP::UserAgent();
my $ip = $ua->get('https://api.ipify.org')->content;
print 'My public IP address is: '. $ip;
