#!/bin/bash

# Quick deployment script for GitHub Pages
# Usage: ./deploy.sh your-repo-name

set -e

if [ -z "$1" ]; then
    echo "Usage: ./deploy.sh your-repo-name"
    echo "Example: ./deploy.sh pet-adoption-analysis"
    exit 1
fi

REPO_NAME=$1

echo "📦 Installing dependencies..."
npm install

echo "🔨 Building project..."
npm run build

echo "📤 Deploying to GitHub Pages..."
npm run deploy

echo "✅ Deployment complete!"
echo "🌐 Your site will be available at:"
echo "   https://$(git config user.name | tr '[:upper:]' '[:lower:]').github.io/$REPO_NAME/"
echo ""
echo "⚠️  Make sure to:"
echo "   1. Enable GitHub Pages in repository Settings"
echo "   2. Select 'gh-pages' branch as source"
echo "   3. Wait a few minutes for deployment to complete"
