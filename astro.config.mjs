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
      social: {
        github: "https://github.com/withastro/starlight",
      },
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
