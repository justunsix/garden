// @ts-check
import starlight from "@astrojs/starlight";
import { defineConfig } from "astro/config";

// https://astro.build/config
export default defineConfig({
  site: "https://justunsix.github.io",
  base: "garden",
  integrations: [
    starlight({
      title: "My Docs",
      social: [
        {
          icon: "github",
          label: "GitHub",
          href: "https://github.com/justunsix/garden",
        },
      ],
      sidebar: [
        {
          label: "Notes",
          autogenerate: { directory: "notes" },
        },
      ],
    }),
  ],
  // trailingSlash: 'never',
});
