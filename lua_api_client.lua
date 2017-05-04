http = require "socket.http"
r, c, h, s = http.request("http://api.ipify.org")
print('My public IP address is: ' .. r)