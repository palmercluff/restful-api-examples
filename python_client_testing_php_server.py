# This example requires the requests library be installed.  You can learn more
# about the Requests library here: http://docs.python-requests.org/en/latest/
from requests import get

message = get('http://localhost/php_api_server.php').text
print('The server says: {}'.format(message))
