require 'rest-client'
response = RestClient.get 'https://api.ipify.org'
puts 'My public IP Address is: ' + response
