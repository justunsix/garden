---
filetags: ":astro:web:static-site-generator:epubnote:"
id: 618c93ca-18c9-41bb-8ea4-2cee102b674b
title: Astro Snippets
---

## Managing Projects

``` shell

# Create with npm a new project, pnpm and yarn also available
npm create astro@latest
## Choose project options

# Command accepts flats for configuration like following to add react and tailwind
npm create astro@latest -- --add react --add tailwind

# Choose a template
npm create astro@latest -- --template <example-name>
# or
npm create astro@latest -- --template <github-username>/<github-repo>

# Start Astro dev server
npm run dev
## Allows access to Astro dev toolbar to inspect islands, accessibility issues
## and more

# Build and preview site
npm run build
npm run preview
## Results are in dist/ folder

# Do type checking and build
astro check && astro build
## Recommended for use with TypeScript
## Use other checkers relevant for your UI framework

```
