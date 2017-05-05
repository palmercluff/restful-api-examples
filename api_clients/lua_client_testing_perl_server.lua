http = require "socket.http"
r, c, h, s = http.request("http://localhost/cgi-bin/perl_api_server.pl")
print('The server says: ' .. r)