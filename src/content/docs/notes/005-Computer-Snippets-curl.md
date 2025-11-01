---
filetags: ":curl:snippets:epubnote:"
id: eeea3c28-1982-465b-9fd0-a0af71b779e1
title: curl Snippets
---

``` bash

# Test connectivity to an IP and port
curl -v telnet://10.10.10.10:1433

# Test internet connectivity and get IP
curl ifconfig.me
curl ifconfig.me/all
curl -I checkip.amazonaws.com
## Get IPv4 or IPv6 address
curl -4 ifconfig.me # IPv4
curl -6 ifconfig.me # IPv6

# Use a proxy
curl -x http://localhost:8080 -k mydestinationURL
## -x proxy server

# --- Get URLs, internet endpoints

# Download a file with the current directory
curl -O https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua
# Download a file
curl -O https://www.digitalocean.com/robots.txt
# Download a file with resuming downloads
curl -C - -O https://www.digitalocean.com/robots.txt
# Download multiple files simultaneously
curl -Z -O "https://httpbin.org/image/jpeg" -O "https://httpbin.org/image/png"
# Download in parallel with file name globbing
curl --parallel -O "https://example.com/ssets/icon-[01-10].svg"

# Check curl version and supported protocols
curl --version

# Check connectivity on an IP/domain and port
curl -v ontario.ca:443

# with proxy
curl -x http://proxy.example.com:8080 http://www.example.com/

# with username and password to REST API
curl -u user:pwd -X GET 'http:1.1.1.1:8081/service/rest/v1/components?repository=maven-snapshots'

# Run a get request, query an API
curl https://jsonplaceholder.typicode.com/todos/1
## Same as
curl -X GET https://jsonplaceholder.typicode.com/todos/1
curl --get https://jsonplaceholder.typicode.com/todos/1

# Get headers, verbose
curl -iv --get https://jsonplaceholder.typicode.com/todos/1
# -v verbose
# -i get headers
# -I only get headers, exclude response

# Get response, pipe to jq
curl https://jsonplaceholder.typicode.com/todos/1 | jq

# Get request information, useful for checking network information
curl -s -o /dev/null -w " dns_lookup: %{time_namelookup}s connect: %{time_connect}s appconnect: %{time_appconnect}s pretransfer: %{time_pretransfer}s http_code: %{http_code} " https://api.github.com
# -s - silent
# -o /dev/null - suppress output
# -w - write out request information

# Find actual location of a shortened URL
curl -sIL https://youtu.be/3xmD4E2aqxo?si=oi0G7bv0B10IoPhU | grep location:

# -- Using Curl to access information, application like functionality

# Get weather in a city using wttr.in
curl wttr.in/toronto
# Get weather in metric
curl wttr.in/toronto?m
# If running in fish, use bash -c

# Get dictionary definition of curl
curl "dict://dict.org/d:curl"

# Access AWS API with AWS authentication
curl --request GET "https://aws-id.s3.us-eastnaws.com" --user myuser --aws-sigv4 "aws:amz:us-east-1:s3"

```

## See Also

- [Wait… cURL can do WHAT - DevOps Toolbox -
  YouTube](https://www.youtube.com/watch?app=desktop&v=3xmD4E2aqxo)
