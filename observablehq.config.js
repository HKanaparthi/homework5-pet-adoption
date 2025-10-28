export default {
  title: "Pet Adoption Center Analysis",

  // IMPORTANT: For GitHub Pages deployment, update this base path
  // Set it to your repository name (e.g., "/homework5-observable")
  // This ensures assets load correctly on GitHub Pages
  // The environment variable allows automatic detection in GitHub Actions
  base: process.env.GITHUB_REPOSITORY
    ? `/${process.env.GITHUB_REPOSITORY.split('/')[1]}`
    : "/homework5-pet-adoption",  // ✅ Configured for your repository!

  root: "src",
  output: "dist",
  theme: "light",
  header: "",
  footer: "Built with Observable Framework",
  sidebar: false,
  pages: [
    {name: "Dashboard", path: "/index"}
  ]
};
