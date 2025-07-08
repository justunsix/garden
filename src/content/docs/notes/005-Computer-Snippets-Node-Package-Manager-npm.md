---
filetags: ":npm:snippets:epubnote:"
id: 445b9e5b-6983-4422-8f86-9e19f5933f7a
title: Node Package Manager - npm
---

``` shell

# Install dependencies
npm install

# Run tests
npm test

# Update dependencies
npm update

# Update global (-g) packages
npm update -g

# Install a global (-g) package to be available in path
npm install -g prettier

# List install packages
npm ls

# Uninstall a package
npm uninstall package_name

# NPM proxy setting
# per https://medium.com/@ogbemudiatimothy/using-npm-install-behind-a-corporate-proxy-server-db150c128899
npm config set proxy http://1.1.1.1:3128
npm config set https-proxy http://1.1.1.1:3128

# Remove proxy
npm config rm proxy
npm config rm https-proxy

```
