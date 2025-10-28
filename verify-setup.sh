#!/bin/bash

# Verification script to check if project is ready for deployment
# Usage: ./verify-setup.sh

echo "🔍 Verifying Observable Framework Project Setup..."
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

errors=0
warnings=0

# Check Node.js
echo "Checking Node.js installation..."
if command -v node &> /dev/null; then
    node_version=$(node -v)
    echo -e "${GREEN}✓${NC} Node.js is installed ($node_version)"
else
    echo -e "${RED}✗${NC} Node.js is not installed"
    errors=$((errors+1))
fi

# Check npm
echo "Checking npm installation..."
if command -v npm &> /dev/null; then
    npm_version=$(npm -v)
    echo -e "${GREEN}✓${NC} npm is installed ($npm_version)"
else
    echo -e "${RED}✗${NC} npm is not installed"
    errors=$((errors+1))
fi

echo ""
echo "Checking required files..."

# Check data file
if [ -f "src/data/pet_adoption_center.csv" ]; then
    echo -e "${GREEN}✓${NC} Dataset found: src/data/pet_adoption_center.csv"
else
    echo -e "${RED}✗${NC} Dataset missing: src/data/pet_adoption_center.csv"
    errors=$((errors+1))
fi

# Check main dashboard
if [ -f "src/index.md" ]; then
    echo -e "${GREEN}✓${NC} Dashboard found: src/index.md"

    # Check if student info is updated
    if grep -q "\[Your First Name\]" "src/index.md"; then
        echo -e "${YELLOW}⚠${NC}  Warning: Student name not updated in src/index.md"
        warnings=$((warnings+1))
    else
        echo -e "${GREEN}✓${NC} Student information appears to be updated"
    fi
else
    echo -e "${RED}✗${NC} Dashboard missing: src/index.md"
    errors=$((errors+1))
fi

# Check config
if [ -f "observablehq.config.js" ]; then
    echo -e "${GREEN}✓${NC} Config found: observablehq.config.js"

    # Check if base path is updated
    if grep -q "homework5-observable" "observablehq.config.js"; then
        echo -e "${YELLOW}⚠${NC}  Warning: Base path might need updating in observablehq.config.js"
        warnings=$((warnings+1))
    fi
else
    echo -e "${RED}✗${NC} Config missing: observablehq.config.js"
    errors=$((errors+1))
fi

# Check package.json
if [ -f "package.json" ]; then
    echo -e "${GREEN}✓${NC} Package file found: package.json"
else
    echo -e "${RED}✗${NC} Package file missing: package.json"
    errors=$((errors+1))
fi

# Check GitHub Actions workflow
if [ -f ".github/workflows/deploy.yml" ]; then
    echo -e "${GREEN}✓${NC} GitHub Actions workflow found"
else
    echo -e "${YELLOW}⚠${NC}  GitHub Actions workflow missing (optional)"
    warnings=$((warnings+1))
fi

echo ""
echo "Checking git setup..."

# Check if git is initialized
if [ -d ".git" ]; then
    echo -e "${GREEN}✓${NC} Git repository initialized"

    # Check if remote is set
    if git remote -v &> /dev/null; then
        remote=$(git remote get-url origin 2>/dev/null)
        if [ -z "$remote" ]; then
            echo -e "${YELLOW}⚠${NC}  No git remote set (run: git remote add origin <url>)"
            warnings=$((warnings+1))
        else
            echo -e "${GREEN}✓${NC} Git remote configured: $remote"
        fi
    fi
else
    echo -e "${YELLOW}⚠${NC}  Git not initialized (run: git init)"
    warnings=$((warnings+1))
fi

# Check if node_modules exists
echo ""
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✓${NC} Dependencies installed"
else
    echo -e "${YELLOW}⚠${NC}  Dependencies not installed (run: npm install)"
    warnings=$((warnings+1))
fi

# Summary
echo ""
echo "======================================"
if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Run 'npm install' to install dependencies"
    echo "2. Run 'npm run dev' to test locally"
    echo "3. Update your info in src/index.md"
    echo "4. Update base path in observablehq.config.js"
    echo "5. Deploy to GitHub Pages"
elif [ $errors -eq 0 ]; then
    echo -e "${YELLOW}⚠ Setup complete with $warnings warning(s)${NC}"
    echo ""
    echo "Review warnings above and fix before deploying."
else
    echo -e "${RED}✗ Setup incomplete with $errors error(s) and $warnings warning(s)${NC}"
    echo ""
    echo "Fix the errors above before proceeding."
fi
echo "======================================"
echo ""

# Exit with appropriate code
if [ $errors -eq 0 ]; then
    exit 0
else
    exit 1
fi
