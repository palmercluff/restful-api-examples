require("socket")
local https = require("ssl.https")
local body, code, headers, status = https.request("https://www.google.com")
print(status)