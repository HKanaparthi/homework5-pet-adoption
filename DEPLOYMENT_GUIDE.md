# Step-by-Step Deployment Guide for GitHub Pages

This guide will walk you through deploying your Observable Framework dashboard to GitHub Pages.

## Prerequisites

✅ Git installed on your computer
✅ GitHub account created
✅ Node.js installed (v18+)

## Quick Start (5 minutes)

### Step 1: Prepare Your Repository

1. **Create a new repository on GitHub:**
   - Go to https://github.com/new
   - Repository name: `homework5-observable` (or any name you prefer)
   - Description: "Pet Adoption Center Analysis Dashboard"
   - **Important:** Keep it PUBLIC (required for free GitHub Pages)
   - **Do NOT** check "Initialize with README" (we already have one)
   - Click "Create repository"

2. **Update your student information:**
   - Open `src/index.md` in a text editor
   - Find the "Student Information" section at the top
   - Replace the placeholders with your actual information:
     ```markdown
     **Student Information:**
     Name: John Doe
     Student ID: 123456789
     ```
   - Save the file

### Step 2: Configure for Your Repository

1. **Update the config file:**
   - Open `observablehq.config.js`
   - Find the line with `base:`
   - Replace with your repository name:
     ```js
     base: "/homework5-observable"  // Use YOUR repo name
     ```
   - Save the file

### Step 3: Deploy Using GitHub Actions (Recommended)

This is the easiest method - it automatically deploys whenever you push changes.

1. **Initialize git and push to GitHub:**
   ```bash
   # Navigate to your project directory
   cd /Users/harshakanaparthi/Desktop/NewAssignment

   # Initialize git
   git init

   # Add all files
   git add .

   # Create first commit
   git commit -m "Initial commit: Pet Adoption Dashboard"

   # Rename branch to main
   git branch -M main

   # Add your GitHub repository (replace with your username and repo name)
   git remote add origin https://github.com/YOUR_USERNAME/homework5-observable.git

   # Push to GitHub
   git push -u origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click on **Settings** (top menu)
   - Scroll down and click **Pages** (left sidebar)
   - Under "Build and deployment":
     - Source: Select **GitHub Actions**
   - Click Save

3. **Wait for deployment:**
   - Click on the **Actions** tab at the top
   - You'll see a workflow running (yellow dot means in progress)
   - Wait for the green checkmark (usually takes 1-2 minutes)

4. **View your dashboard:**
   - Go back to **Settings** → **Pages**
   - You'll see: "Your site is live at https://YOUR_USERNAME.github.io/homework5-observable/"
   - Click the link to view your dashboard!

### Step 4: Submit to Canvas

1. **Copy the URL:**
   ```
   https://YOUR_USERNAME.github.io/homework5-observable/
   ```

2. **Test your submission:**
   - Open the URL in a new private/incognito browser window
   - Verify all charts load correctly
   - Test the interactive features (dropdowns, filters)
   - Make sure your name and student ID appear correctly

3. **Submit on Canvas:**
   - Paste the URL in the assignment submission
   - Also upload your source code (you can upload the entire folder as a ZIP)

## Alternative: Manual Deployment Method

If you prefer to deploy manually:

```bash
# Install dependencies
npm install

# Deploy
npm run deploy
```

Then enable GitHub Pages with source set to `gh-pages` branch.

## Troubleshooting

### Problem: Charts not showing

**Solution:**
- Check browser console for errors (F12)
- Verify data file exists at `src/data/pet_adoption_center.csv`
- Verify `base` path in `observablehq.config.js` matches your repo name
- Clear browser cache and reload

### Problem: "404 - Page not found"

**Solution:**
- Verify GitHub Pages is enabled in Settings
- Check that Source is set to "GitHub Actions"
- Wait 2-3 minutes for deployment to complete
- Make sure repository is public

### Problem: GitHub Actions workflow fails

**Solution:**
- Click on the failed workflow in Actions tab
- Read the error message
- Common fixes:
  - Run `npm install` locally to verify dependencies
  - Check that `data/pet_adoption_center.csv` exists
  - Ensure `package.json` is valid JSON

### Problem: CSS/styling issues

**Solution:**
- The `base` path in `observablehq.config.js` must exactly match your repository name
- Repository names are case-sensitive
- Don't include `.git` or trailing slashes

### Problem: Data not loading

**Solution:**
- Verify the CSV file is in `data/` folder
- Check that the path in `src/index.md` is correct: `../data/pet_adoption_center.csv`
- Ensure the CSV file is included in git (not in .gitignore)

## Making Updates After Initial Deployment

After your initial deployment, you can make changes and redeploy easily:

```bash
# Make your changes to src/index.md or other files

# Commit and push
git add .
git commit -m "Update visualizations"
git push

# GitHub Actions will automatically rebuild and deploy!
```

## Testing Locally Before Deployment

Always test locally first:

```bash
# Install dependencies (first time only)
npm install

# Start local server
npm run dev

# Open http://localhost:3000 in your browser
```

Make sure everything works locally before pushing to GitHub.

## File Checklist

Before deploying, ensure you have:

- ✅ `src/index.md` - Your dashboard with all visualizations
- ✅ `data/pet_adoption_center.csv` - Your dataset
- ✅ `observablehq.config.js` - Configuration with correct base path
- ✅ `package.json` - Dependencies list
- ✅ `.github/workflows/deploy.yml` - Deployment workflow
- ✅ `README.md` - Documentation

## Canvas Submission Checklist

Before submitting:

- ✅ Dashboard shows your name and student ID
- ✅ All 3+ visualizations are working
- ✅ Interactive features work (dropdowns, filters)
- ✅ Tooltips appear on hover
- ✅ Design insights section is complete
- ✅ URL is accessible in private/incognito browser
- ✅ No console errors (check with F12)
- ✅ Dataset description is included

## Getting Help

If you encounter issues:

1. **Check the Actions tab** - Look for build errors
2. **Test locally** - Run `npm run dev` and check for errors
3. **Browser console** - Press F12 and look for red error messages
4. **Review the README.md** - Additional troubleshooting tips there

## Success Indicators

Your deployment is successful when:

- ✅ GitHub Actions workflow shows green checkmark
- ✅ GitHub Pages settings shows "Your site is live at..."
- ✅ Opening the URL shows your dashboard
- ✅ All charts render correctly
- ✅ Interactive features respond to clicks
- ✅ No 404 or 500 errors

## Tips for Best Results

1. **Test thoroughly locally** before deploying
2. **Use descriptive commit messages** for version control
3. **Keep your repo name simple** (lowercase, hyphens instead of spaces)
4. **Check the live site** in multiple browsers
5. **Save the URL** for your Canvas submission

---

**Estimated Time:** 5-10 minutes for first deployment

**Support:** If stuck, check the Actions log for specific error messages.
