$ip = Invoke-RestMethod -Uri 'https://api.ipify.org?format=json'
"My public IP address is: $($ip.ip)"