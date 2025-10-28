# 🚀 Quick Start - Deploy in 5 Minutes

## Before You Start

1. **Update your info** in `src/index.md`:
   ```markdown
   Name: [Your First Name] [Your Last Name]
   Student ID: [Your Student ID]
   ```

2. **Update repo name** in `observablehq.config.js` line 10:
   ```js
   base: "/your-repo-name",  // 👈 Change this!
   ```

## Deploy to GitHub Pages

### Option A: Automatic (Recommended)

```bash
# 1. Create repo on GitHub (keep it PUBLIC)
#    Name: homework5-observable (or your choice)

# 2. Run these commands:
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main

# 3. Enable GitHub Pages:
#    - Go to repo Settings → Pages
#    - Set Source to "GitHub Actions"
#    - Wait 2 minutes

# 4. Your site will be at:
#    https://YOUR_USERNAME.github.io/YOUR_REPO/
```

### Option B: Manual Deploy

```bash
npm install
npm run deploy

# Then enable GitHub Pages:
# Settings → Pages → Source: gh-pages branch
```

## Local Development

```bash
npm install        # Install dependencies (first time)
npm run dev        # Start local server
# Open http://localhost:3000
```

## Verify Before Submitting

✅ Your name appears on the dashboard
✅ All charts load and display data
✅ Interactive filters work (click them!)
✅ Tooltips show on hover
✅ No errors in console (F12)

## Submit to Canvas

1. Copy your GitHub Pages URL
2. Test it in an incognito/private browser
3. Submit the URL on Canvas
4. Upload source code as ZIP

## Troubleshooting

| Problem | Solution |
|---------|----------|
| 404 Error | Check base path in `observablehq.config.js` |
| Charts not showing | Verify data file exists: `data/pet_adoption_center.csv` |
| Build fails | Run `npm run build` locally to see errors |
| Pages not enabled | Settings → Pages → Source: GitHub Actions |

## Need More Help?

- 📖 See `DEPLOYMENT_GUIDE.md` for detailed instructions
- 📖 See `README.md` for full documentation
- 🔍 Check GitHub Actions tab for build logs

---

**Total time:** 5-10 minutes for first deployment
