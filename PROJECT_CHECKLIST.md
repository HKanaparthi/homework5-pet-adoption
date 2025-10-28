# 📋 Project Submission Checklist

Use this checklist to ensure your project meets all assignment requirements before submitting to Canvas.

## ✅ Pre-Deployment Checklist

### Personal Information
- [ ] Updated name in `src/index.md` (line 8)
- [ ] Updated student ID in `src/index.md` (line 9)
- [ ] Repository name updated in `observablehq.config.js` (line 10)

### Content Requirements

#### Dashboard Header (1 point)
- [ ] **0.25 pts** - Name and student ID displayed at the top
- [ ] **0.25 pts** - Clear title introducing the dataset
- [ ] **0.25 pts** - Markdown section describing the dashboard theme
- [ ] **0.25 pts** - Paragraph about dataset (source, scope, time range, key fields, cleaning)

#### Visualizations (6 points)
- [ ] **2 pts** - Chart 1: Species Adoption Analysis
  - Bar chart with adoption counts or rates
  - Radio button toggle between views
  - Properly sorted and labeled
- [ ] **2 pts** - Chart 2: Adopter Age vs Previous Pet Experience
  - Scatter plot showing relationship
  - Species filtering with checkboxes
  - Color-coded by species
- [ ] **2 pts** - Chart 3: Pet Age Distribution or Timeline
  - Box plot or line chart
  - Shows patterns across species
  - Responsive to filters

#### Interactivity (2 points)
- [ ] **1 pt** - Interactive feature #1: Radio toggle (Count/Rate view)
- [ ] **1 pt** - Interactive feature #2: Species checkboxes (filters charts)
- [ ] **Bonus** - Date range selector for timeline
- [ ] **Required** - Tooltips on all charts

#### Final Insights (1 point)
- [ ] **1 pt** - Markdown section with 3-5 bullet points
  - Design decisions explained
  - Rationale for visualization choices
  - Key observations summarized
  - Insights from the data

## ✅ Technical Checklist

### File Structure
- [ ] `src/data/pet_adoption_center.csv` - Dataset present
- [ ] `src/index.md` - Main dashboard file
- [ ] `observablehq.config.js` - Configuration file
- [ ] `package.json` - Dependencies defined
- [ ] `.github/workflows/deploy.yml` - GitHub Actions workflow
- [ ] `.gitignore` - Excludes node_modules and dist
- [ ] `README.md` - Documentation present

### Code Quality
- [ ] No unused code snippets in `src/index.md`
- [ ] All data transformations are working
- [ ] No console errors when running locally
- [ ] Comments explain complex logic
- [ ] Consistent formatting and indentation

### Testing
- [ ] ✅ Runs locally: `npm install && npm run dev`
- [ ] ✅ Builds successfully: `npm run build`
- [ ] ✅ All charts render correctly
- [ ] ✅ All interactive features work
- [ ] ✅ Tooltips appear on hover
- [ ] ✅ No broken images or missing data
- [ ] ✅ Responsive on different screen sizes

## ✅ Deployment Checklist

### GitHub Setup
- [ ] Repository created on GitHub (PUBLIC)
- [ ] Repository name matches `observablehq.config.js` base path
- [ ] All files pushed to main branch
- [ ] `.gitignore` prevents node_modules from being committed

### GitHub Pages
- [ ] GitHub Pages enabled in Settings → Pages
- [ ] Source set to "GitHub Actions"
- [ ] GitHub Actions workflow completed successfully (green checkmark)
- [ ] Live URL is accessible

### URL Testing
- [ ] Opened URL in regular browser ✅
- [ ] Opened URL in incognito/private browser ✅
- [ ] No 404 errors ✅
- [ ] No broken charts ✅
- [ ] All interactions work ✅
- [ ] Data loads correctly ✅

## ✅ Canvas Submission Checklist

### URL Submission
- [ ] Copied live GitHub Pages URL
- [ ] URL format: `https://username.github.io/repo-name/`
- [ ] URL tested and working
- [ ] URL submitted to Canvas assignment

### Source Code Submission
- [ ] Created ZIP file of project folder
- [ ] ZIP includes all source files:
  - [ ] `src/index.md`
  - [ ] `src/data/pet_adoption_center.csv`
  - [ ] `observablehq.config.js`
  - [ ] `package.json`
- [ ] ZIP does NOT include:
  - [ ] `node_modules/` folder
  - [ ] `dist/` folder
  - [ ] `.DS_Store` files
- [ ] Source code uploaded to Canvas

## ✅ Final Verification

Before clicking "Submit" on Canvas:

1. **Open your live URL** in a fresh browser tab
2. **Verify student info** is correct and visible
3. **Test all interactions:**
   - Click radio buttons
   - Check/uncheck species filters
   - Hover for tooltips
   - Adjust date slider (if present)
4. **Check browser console** (F12) for errors
5. **View on mobile** (optional but recommended)

## Assignment Requirements Summary

| Component | Points | Status |
|-----------|--------|--------|
| Dashboard header & context | 1 | ☐ |
| Visualization 1 | 2 | ☐ |
| Visualization 2 | 2 | ☐ |
| Visualization 3 | 2 | ☐ |
| Interactive feature 1 | 1 | ☐ |
| Interactive feature 2 | 1 | ☐ |
| Final insights | 1 | ☐ |
| **TOTAL** | **10** | **0** |

## Common Issues to Check

- [ ] Base path matches repo name (exact match, case-sensitive)
- [ ] All data files are committed to git
- [ ] GitHub repository is PUBLIC (not private)
- [ ] No hardcoded file paths (use FileAttachment)
- [ ] All charts have tooltips
- [ ] Design insights section is complete

## Emergency Fixes

If something breaks after deployment:

1. **Fix locally first**: `npm run dev` to test
2. **Rebuild**: `npm run build` to verify build works
3. **Commit and push**: Git will auto-redeploy
4. **Wait 2 minutes**: GitHub Actions takes time
5. **Clear cache**: Hard refresh (Ctrl+Shift+R)

## Submission Deadline

- **Due:** Thursday 11:59 PM
- **Allow:** 10-15 minutes for deployment
- **Submit:** Link + source code before deadline

---

## Final Check: Three Essential Questions

1. ✅ **Can I open my live URL and see my name?**
2. ✅ **Do all three charts load and display data?**
3. ✅ **Do the interactive filters change what's displayed?**

If YES to all three → You're ready to submit! 🎉

---

**Need help?** Check `DEPLOYMENT_GUIDE.md` or `README.md` for detailed instructions.
