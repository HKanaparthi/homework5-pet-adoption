# Pet Adoption Center - Exploratory Visual Analysis

An interactive dashboard built with Observable Framework for analyzing pet adoption patterns and trends.

## Project Structure

```
NewAssignment/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions deployment workflow
├── src/
│   ├── data/
│   │   └── pet_adoption_center.csv # Dataset
│   └── index.md                # Main dashboard
├── observablehq.config.js      # Observable Framework configuration
├── package.json                # Project dependencies
└── README.md                   # This file
```

## Local Development

### Prerequisites

- Node.js (v18 or higher)
- npm (comes with Node.js)

### Setup

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start development server:**
   ```bash
   npm run dev
   ```

3. **Open your browser:**
   Navigate to `http://localhost:3000` (the URL will be shown in terminal)

4. **Make changes:**
   Edit `src/index.md` and see live updates in your browser

### Build Locally

To build the project for production:

```bash
npm run build
```

This creates a `dist/` folder with static files ready for deployment.

## Deployment to GitHub Pages

### Method 1: Automatic Deployment (Recommended)

This method uses GitHub Actions to automatically build and deploy whenever you push to the main branch.

1. **Create a new repository on GitHub**
   - Go to https://github.com/new
   - Name it (e.g., `pet-adoption-analysis`)
   - Don't initialize with README (we already have one)

2. **Update the configuration**
   - Open `observablehq.config.js`
   - Update the `base` line if needed:
     ```js
     base: "/your-repo-name"  // Replace with your actual repo name
     ```

3. **Initialize git and push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Pet adoption dashboard"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git push -u origin main
   ```

4. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under "Build and deployment", select:
     - **Source:** GitHub Actions
   - The workflow will automatically run and deploy your site

5. **Access your dashboard:**
   - After the GitHub Action completes (check the Actions tab)
   - Your site will be available at:
     ```
     https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/
     ```

### Method 2: Manual Deployment with gh-pages

If you prefer manual deployment:

1. **Install gh-pages** (if not already installed):
   ```bash
   npm install --save-dev gh-pages
   ```

2. **Update package.json** - Already configured with deploy script

3. **Deploy:**
   ```bash
   npm run deploy
   ```

4. **Enable GitHub Pages:**
   - Go to Settings → Pages
   - Select "Deploy from a branch"
   - Choose the `gh-pages` branch

### Troubleshooting Deployment

**Issue: Pages not loading assets properly**
- Solution: Make sure the `base` in `observablehq.config.js` matches your repo name

**Issue: 404 errors**
- Check that GitHub Pages is enabled in Settings
- Verify the source is set correctly (GitHub Actions or gh-pages branch)
- Wait a few minutes for DNS propagation

**Issue: Build fails**
- Check the Actions tab for error logs
- Ensure all dependencies are in package.json
- Test the build locally first with `npm run build`

## Customization

### Adding Your Information

Edit `src/index.md` and update the header section:

```markdown
**Student Information:**
Name: [Your First Name] [Your Last Name]
Student ID: [Your Student ID]
```

### Modifying Visualizations

All visualizations are in `src/index.md`. The dashboard includes:

1. **Species Adoption Analysis** - Bar chart with toggle between count and rate
2. **Adopter Demographics** - Scatter plot with species filtering
3. **Pet Age Distribution** - Box plot showing age ranges by species
4. **Adoption Timeline** - Line chart with date range selector

### Changing Data

To use a different dataset:

1. Place your CSV file in the `data/` folder
2. Update the data loading line in `src/index.md`:
   ```js
   const petData = FileAttachment("../data/YOUR_FILE.csv").csv({typed: true});
   ```
3. Modify the data transformations and visualizations accordingly

## Features

### Interactive Elements
- Radio buttons to switch between adoption count and rate views
- Species checkboxes for filtering scatter plot and box plot
- Date range selector for timeline analysis
- Tooltips on all charts showing detailed information

### Visualizations
- Bar charts for categorical comparisons
- Scatter plot for demographic relationships
- Box plot for distribution analysis
- Time series for trend analysis
- Summary statistics cards

## Technology Stack

- **Observable Framework** - Static site generator for data apps
- **Observable Plot** - High-level plotting library
- **D3.js** - Data manipulation and analysis
- **GitHub Pages** - Static site hosting
- **GitHub Actions** - CI/CD pipeline

## Assignment Requirements Checklist

✅ Dashboard header with name and student ID
✅ Dataset title and description
✅ Theme description
✅ Dataset source and cleaning documentation
✅ 3+ visualizations investigating research questions
✅ 2+ interactive features (filtering, toggles)
✅ Tooltips on all charts
✅ Design decisions and insights section
✅ Ready for GitHub Pages deployment
✅ Clean, commented code

## Resources

- [Observable Framework Documentation](https://observablehq.com/framework/)
- [Observable Plot Documentation](https://observablehq.com/plot/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions for Pages](https://github.com/actions/deploy-pages)

## License

This project is created for educational purposes as part of a data visualization course assignment.
