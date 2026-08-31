---
filetags: ":npm:snippets:epubnote:"
id: 445b9e5b-6983-4422-8f86-9e19f5933f7a
title: Node Package Manager - npm, Performant npm (pnpm)
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

# Run command from a local or remote rpm package
npx [args]

# npm exec Check project files with ESLint version in project
npx eslint ./*.js

# Clean npm cache
npm cache clean --force

```

## Performant npm (pnpm)

``` shell

# Install global package(s)
pnpm add -g <pkg>
pnpm add -g typescript prettier eslint

# Update global packages
## List them
pnpm outdated -g
## then update
pnpm update -g --latest

# Interactively create a package.json file
pnpm init

# Download all the packages listed as dependencies in package.json
pnpm install

# Download a specific version of a package and add it to the list of dependencies in package.json
pnpm install {{module_name}}@{{version}}

# Download a package and add it to the list of dev dependencies in package.json
pnpm install --dev {{module_name}}

# Download a package and install it globally
pnpm install -g {{module_name}}

# Uninstall a package and remove it from the list of dependencies in package.json
pnpm uninstall {{module_name}}

# Print a tree of locally installed modules
pnpm list

# List top-level [g]lobally installed modules
pnpm list -g --depth={{0}}

```

## Angular

``` shell

# Install dependencies including Angular
npm install

# NPM Execute (npx) to run a local or remote npm package, Angular CLI build
npx ng build
# Run angular CLI set up in the project
# Requires npm install first

# Run test
npx ng test

# Run application
npx ng serve

```
