require "net/http"

message = Net::HTTP.get(URI("http://localhost/cgi-bin/python_api_server.py"))
puts "The server says: " + message
