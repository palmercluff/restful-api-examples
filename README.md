# restful-api-examples
Examples of how to perform RESTful API requests from Debian-based systems using different languages and bindings.

These examples and files aren't necesserily exclusive to Debian-based systems, but the aptitude (apt) packaging system is. In order to install some of these libraries, you need to obtain the software in some other way.

## Introduction
A RESTful API is an application program interface (API) that uses HTTP requests to GET, PUT, POST and DELETE data. (http://searchcloudstorage.techtarget.com/definition/RESTful-API) The following are examples of how to make the API's and API requests.

A great tool for testing to see if you are making requests correctly is to use: https://httpbin.org

Especially in web development, the ideal way to make a RESTful API request is to d it from the backend using something other than JavaScript. The reason for this is you can't always make a request from the browser because CORS headers are required. Better to use a backend technology such as shell, Python, Ruby, or something else.

## Basic GET API Requests
The GET method is probably the easiest HTTP method to work with. The following will use the ipify API that simply gives you back your public IP address. Later on we will use some different and unique API's to experiment with.

### Shell
`curl` is the command to make requests from the Linux shell. To get your current public IP address, do:
```
#!/bin/bash

ip=$(curl -s https://api.ipify.org)
echo "My public IP address is: $ip"
```

If for some reason `curl` is not installed, you can perform `apt-get install curl` to download and install it.

### Python
You can make API request sin Python using the `requests` module.
```
from requests import get

ip = get('https://api.ipify.org').text
print('My public IP address is: {}'.format(ip))
```

If the requests library is not installed, the you can download and install it with `apt-get install python-requests`

### Ruby
Ruby has API requests built in!
```
require "net/http"

ip = Net::HTTP.get(URI("https://api.ipify.org"))
puts "My public IP Address is: " + ip
```

You can also use the `rest-client` library by using `apt-get install ruby-rest-client` and do this:
```
require 'rest-client'
response = RestClient.get 'https://api.ipify.org'
puts 'My public IP Address is: ' + response
```

For more information and examples for `rest`client`, visit: https://github.com/rest-client/rest-client

### PHP
To perform a GET request, you can use the `file_get_contents()` function
```
<?php
  $ip = file_get_contents('https://api.ipify.org');
  echo "My public IP address is: " . $ip;
?>
```
PHP is usualy ran via website actions, but you can execute this script via `php php_api_client.php` from the terminal.

### Java
```
try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
    System.out.println("My current IP address is " + s.next());
} catch (java.io.IOException e) {
    e.printStackTrace();
}
```

### Perl
Perl also has API requests built in!
```
use strict;
use warnings;
use LWP::UserAgent;

my $ua = new LWP::UserAgent();
my $ip = $ua->get('https://api.ipify.org')->content;
print 'My public IP address is: '. $ip;
```

### Lua
In order to do API requests, some libraries will need to be installed.

The `lua-socket` library can be used:
```
http = require "socket.http"
r, c, h, s = http.request("http://api.ipify.org")
print('My public IP address is: ' .. r)
```
But this only supports HTTP requests, not SSL/HTTPS. To install `lua-socket`, perform an `apt-get install lua-socket`