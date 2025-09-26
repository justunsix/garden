---
filetags: ":curl:snippets:epubnote:"
id: eeea3c28-1982-465b-9fd0-a0af71b779e1
title: curl Snippets
---

``` bash

# Test connectivity to an IP and port
curl -v telnet://10.10.10.10:1433

# Test internet connectivity
curl -I checkip.amazonaws.com

# Get weather in a city using wttr.in
curl wttr.in/toronto
# Get weather in metric
curl wttr.in/toronto?m
# If running in fish, use bash -c

# --- Get URLs, internet endpoints

# Check your ip
curl http://checkip.amazonaws.com/

# Download a file with the current directory
curl -O https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua

# check connectivity on an IP/domain and port
curl -v ontario.ca:443

# with proxy
curl -x http://proxy.example.com:8080 http://www.example.com/

# with username and password to REST API
curl -u user:pwd -X GET 'http:1.1.1.1:8081/service/rest/v1/components?repository=maven-snapshots'

# Download a file
curl -O https://www.digitalocean.com/robots.txt

# Run a get request
curl https://jsonplaceholder.typicode.com/todos/1

```
