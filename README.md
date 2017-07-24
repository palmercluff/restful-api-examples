# restful-api-examples
Examples of how to make RESTful API calls and create server-side web API's from Debian-based systems using different languages and bindings.

These examples and files aren't necesserily exclusive to Debian-based systems, but the aptitude (apt) packaging system is. In order to install some of these libraries, you need to obtain the software in some other way.

## Index

* [Basic GET API Clients](#basic-get-api-clients)
* [Basic GET API Servers](#basic-get-api-servers)

## Introduction
A RESTful API is an application program interface (API) that uses HTTP requests to GET, PUT, POST and DELETE data. (http://searchcloudstorage.techtarget.com/definition/RESTful-API) The following are examples of how to make the API's and API requests.

A great tool for testing to see if you are making requests correctly is to use: https://httpbin.org

A great list of public API's can be found here: https://github.com/toddmotto/public-apis

Especially in web development, the ideal way to make a RESTful API request is to d it from the backend using something other than JavaScript. The reason for this is you can't always make a request from the browser because CORS headers are required. Better to use a backend technology such as shell, Python, Ruby, or something else.

## Basic GET API Clients
The GET method is probably the easiest HTTP method to work with. The following will use the ipify API that simply gives you back your public IP address. Later on we will use some different and unique API's to experiment with.

### Shell
`curl` is the command to make requests from the Linux shell. To get your current public IP address, do:
```
#!/bin/bash

ip=$(curl -s https://api.ipify.org)
echo "My public IP address is: $ip"
```

Here is an API request that gives back JSON objects full of information on Studio Ghibli films:
```
curl -X GET -H "Content-Type: application/json" https://ghibliapi.herokuapp.com/films
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

### Node.js
In the terminal, run `node node_api_client.js` or `nodejs node_api_client.js`
```
var http = require('http');

http.get({'host': 'api.ipify.org', 'port': 80, 'path': '/'}, function(resp) {
    resp.on('data', function(ip) {
        console.log("My public IP address is: " + ip);
    });
});
```

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

For HTTPS requests, you can use the `lua-sec` package and do something like this:
```
require("socket")
local https = require("ssl.https")
local body, code, headers, status = https.request("https://www.google.com")
print(status)
```
Install LuaSec with `apt-get install lua-sec`.

### C#
Networking is bult into the .NET framework. The code below was ran using version 4.7 .NET which supports language versions up to C# 5.
```
// C#_API_Client.cs

using System;
using System.Net;

namespace Ipify.Examples {
  class Program {
    public static void Main (string[] args) {
      WebClient webClient = new WebClient();
      string publicIp = webClient.DownloadString("https://api.ipify.org");
      Console.WriteLine("My public IP Address is: {0}", publicIp);
    }
  }
}

```
Compile via: `C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe C#_API_Client.cs` which will create a .exe program.

### Windows PowerShell
REST API networking is also built into PowerShell
```
$ip = Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'
"My public IP address is: $($ip.ip)"
```

## Basic GET API Servers
We make API requests to get information that would otherwise be difficult to get ourselves. With that said, if you were to look at the server API code, it could get complicated really quick. But theoretically, getting a simple API server set up is really quite easy, it just depends on what you are doing. The following will show you how to send back a string of text when it is requested from a client. I'll show you a PHP version of this first since it is super simple.

THIS IS IMPORTANT!!!A lot of this actually depends on the framework you are using. With PHP you can just put PHP files in the `/var/www/html/` directory to get it to run, but in order for other server-side scripts to run, they may need to be placed in the `/usr/lib/cgi-bin/` in order to execute. If that directory is not available, you can do the following to perform cgi-requests(assuming you have root access):
```
a2enmod cgi
service apache2 restart
```
You must also give your server-side scripts execution rights with the following: `chmod +x whatever_the_name_of_the_server_script_is.file_name`.

Then, you can access run the script via: `http://localhost/cgi-bin/whatever_the_name_of_the_server_script_is.file_name`.

It is also importany to note that you don't need a special client to access these server-based API's. You can just use your web browser and type the URL.

### PHP
Our simple PHP script can look like this stored in the `/var/www/html/` directory with the filename `php_api_server.php`:
```
<?php
  echo 'Hello from the server!';
?>
```

then if we have a Python client like this calling the PHP server script
```
# This example requires the requests library be installed.  You can learn more
# about the Requests library here: http://docs.python-requests.org/en/latest/
from requests import get

message = get('http://localhost/php_api_server.php').text
print('The server says: {}'.format(message))
```
It should give us back: `The server says: Hello from the server!`

You could also place that PHP server script in the `/usr/lib/cgi-bin/` (which is actually preffered) and navigate the request to `http://localhost/cgi-bin/php_api_server.php`.

### Python
Server-side Python script:
```
#!/usr/bin/python
print('Content-type: text/html\n')
print('Hello from the server!')
```
- Make sure to include the first line: `#!/usr/bin/python`
- Make sure you have this line: `print('Content-type: text/html\n')`
- Place it in the `/usr/lib/cgi-bin/` directory
- Give it execution rights with `chmod +x python_api_server.py`

Ruby client-side script:
```
require "net/http"

message = Net::HTTP.get(URI("http://localhost/cgi-bin/python_api_server.py"))
puts "The server says: " + message
```
Should give you the message: `The server says: Hello from the server!`

### Perl
Server-side script:
```
#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "Hello from the server!";
```
- Make sure to include the first line: `#!/usr/bin/perl`
- Make sure you have this line: `print "Content-type: text/html\n\n";`
- Place it in the `/usr/lib/cgi-bin/` directory
- Give it execution rights with `chmod +x perl_api_server.py`

Lua client-side script:
```
http = require "socket.http"
r, c, h, s = http.request("http://localhost/cgi-bin/perl_api_server.pl")
print('The server says: ' .. r)
```
Should give you the message: `The server says: Hello from the server!`

I think you get the general idea. Depending on what kind of data the client is expecting to receive back from the server, the content type needs to be specified. In the previous examples we are just sending back plain text, but other popular types of data are JSON, XML, and more!
