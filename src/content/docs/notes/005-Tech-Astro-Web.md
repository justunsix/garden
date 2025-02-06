---
filetags: ":astro:web:static-site-generator:epubnote:"
id: 858f939a-cb45-4dcd-a097-9d4a28e15dc2
title: Astro web framework
---

## Project Structure

- .vscode
  - Astro provides an offical VS Code extension and compatible with
    other editor tools
- src/\* - Your project source code (components, pages, styles, images,
  etc.)
  - Can add components like a main layout with `<Head />` astro
    component that will add metadata to pages
- public/\* - Your non-code, unprocessed assets (fonts, icons, etc.)
- package.json - A project manifest
- astro.config.mjs - An Astro configuration file (recommended)
  - JS config file, can be TypeScript if desired
  - Configure you site deployment domain and related configurations like
    trailingSlash in URLs (`example.com/about vs example.com/about/`)
- tsconfig.json - A TypeScript configuration file (recommended)
  - Astro's component script is TypeScript (TS)
    - Project can accept `.ts` and `.tsx` files
  - Configure TS for type checks, plugins, import aliases, and more
  - Important for some editors to understand project
  - Recommend use `strict` or `strictest` extensive templates

## Editor and Development

- In run dev, you can use the customizable toolbar in the browser
  preview
  - Toolbar app give more functions
- See Astro documentation for more editors suport

## See Also

### Resource

- [Astro - web framework for content-driven
  websites](https://astro.build/) - see documentation for source of
  information
