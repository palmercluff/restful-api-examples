https = require "socket.http"
r, c, h, s = https.request("https://api.ipify.org")
print('My public IP address is: ' .. r)