# restful-api-examples
Examples of how to perform RESTful API requests from Debian-based systems using different languages and bindings.

These examples and files aren't necesserily exclusive to Debian-based systems, but the aptitude (apt) packaging system is. In order to install some of these libraries, you need to obtain the software in some other way.

## Introduction
A RESTful API is an application program interface (API) that uses HTTP requests to GET, PUT, POST and DELETE data. (http://searchcloudstorage.techtarget.com/definition/RESTful-API) The following are examples of how to make the API's and API requests.

Especially in web development, the ideal way to make a RESTful API request is to d it from the backend using something other than JavaScript. The reason for this is you can't always make a request from the browser because CORS headers are required. Better to use a backend technology such as shell, Python, Ruby, or something else.

## Shell
`curl` is the command to make requests from the Linux shell. To get your current public IP address, do:
`curl 'https://api.ipify.org?format=json'`
and it will give you back:
`{"ip":"123.456.789.9"}` Or whatever your public IP address is.

If for some reason `curl` is not installed, you can perform `apt-get install curl` to download and install it.

## Python
You can make API request sin Python using the `requests` module.

```
from requests import get

ip = get('https://api.ipify.org').text
print('My public IP address is: {}'.format(ip))
```

If the requests library is not installed, the you can download and install it with `apt-get install python-requests`

## Ruby
Ruby has API requests built in!

```
require "net/http"

ip = Net::HTTP.get(URI("https://api.ipify.org"))
puts "My public IP Address is: " + ip
```

You can also use the `rest-client` library by using `apt-get install ruby-rest-client and do this:
```
require 'rest-client'
response = RestClient.get 'https://api.ipify.org'
puts 'My public IP Address is: ' + response
```

For more information and examples for `rest`client`, visit: https://github.com/rest-client/rest-client