require "net/http"

ip = Net::HTTP.get(URI("https://api.ipify.org"))
puts "My public IP Address is: " + ip
