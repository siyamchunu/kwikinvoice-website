#!/bin/bash
# KwikInvoice Website - SEO & AI Validation Script

echo "========================================"
echo "KwikInvoice Website Validation"
echo "========================================"
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if site is built
if [ ! -d "_site" ]; then
    echo -e "${RED}✗ Site not built. Run 'npm run build' first.${NC}"
    exit 1
fi

echo "1. Checking Core SEO Files..."
echo "--------------------------------"

# Check robots.txt
if [ -f "_site/robots.txt" ]; then
    echo -e "${GREEN}✓ robots.txt exists${NC}"
    AI_CRAWLERS=$(grep -c "User-agent: GPTBot\|User-agent: Claude-Web\|User-agent: CCBot" _site/robots.txt)
    if [ $AI_CRAWLERS -ge 3 ]; then
        echo -e "${GREEN}✓ AI crawlers allowed ($AI_CRAWLERS found)${NC}"
    else
        echo -e "${RED}✗ AI crawlers not properly configured${NC}"
    fi
else
    echo -e "${RED}✗ robots.txt missing${NC}"
fi

# Check sitemap.xml
if [ -f "_site/sitemap.xml" ]; then
    echo -e "${GREEN}✓ sitemap.xml exists${NC}"
    URLS=$(grep -c "<url>" _site/sitemap.xml)
    echo -e "${GREEN}  → Contains $URLS URLs${NC}"
else
    echo -e "${RED}✗ sitemap.xml missing${NC}"
fi

# Check ai-info.json
if [ -f "_site/ai-info.json" ]; then
    echo -e "${GREEN}✓ ai-info.json exists${NC}"
    if command -v jq &> /dev/null; then
        PRODUCT_NAME=$(jq -r '.product.name' _site/ai-info.json)
        echo -e "${GREEN}  → Product: $PRODUCT_NAME${NC}"
    fi
else
    echo -e "${RED}✗ ai-info.json missing${NC}"
fi

echo ""
echo "2. Checking Structured Data..."
echo "--------------------------------"

# Check for Schema.org types
if [ -f "_site/index.html" ]; then
    SCHEMA_COUNT=$(grep -c "application/ld+json" _site/index.html)
    echo -e "${GREEN}✓ Found $SCHEMA_COUNT structured data blocks on homepage${NC}"
    
    # Check specific schema types
    if grep -q "MobileApplication" _site/index.html; then
        echo -e "${GREEN}  ✓ MobileApplication schema${NC}"
    fi
    if grep -q "FAQPage" _site/index.html; then
        echo -e "${GREEN}  ✓ FAQPage schema${NC}"
    fi
    if grep -q "HowTo" _site/index.html; then
        echo -e "${GREEN}  ✓ HowTo schema${NC}"
    fi
fi

echo ""
echo "3. Checking Meta Tags..."
echo "--------------------------------"

if grep -q 'ai:topic' _site/index.html; then
    echo -e "${GREEN}✓ AI-specific meta tags present${NC}"
else
    echo -e "${YELLOW}⚠ AI-specific meta tags missing${NC}"
fi

if grep -q 'og:image' _site/index.html; then
    echo -e "${GREEN}✓ Open Graph tags present${NC}"
else
    echo -e "${RED}✗ Open Graph tags missing${NC}"
fi

if grep -q 'twitter:card' _site/index.html; then
    echo -e "${GREEN}✓ Twitter Card tags present${NC}"
else
    echo -e "${RED}✗ Twitter Card tags missing${NC}"
fi

echo ""
echo "4. Checking Pages..."
echo "--------------------------------"

PAGES=("index.html" "about/index.html" "features/index.html" "privacy-policy/index.html" "terms-of-service/index.html")
for page in "${PAGES[@]}"; do
    if [ -f "_site/$page" ]; then
        echo -e "${GREEN}✓ /$page${NC}"
    else
        echo -e "${RED}✗ /$page missing${NC}"
    fi
done

echo ""
echo "5. Performance Checks..."
echo "--------------------------------"

# Check if images exist
IMG_COUNT=$(find _site/public/images -type f 2>/dev/null | wc -l)
echo -e "${GREEN}✓ Found $IMG_COUNT images${NC}"

# Check for WebP images
WEBP_COUNT=$(find _site/public/images -name "*.webp" 2>/dev/null | wc -l)
if [ $WEBP_COUNT -gt 0 ]; then
    echo -e "${GREEN}✓ Found $WEBP_COUNT WebP images (optimized)${NC}"
else
    echo -e "${YELLOW}⚠ No WebP images found (needs optimization - see Sipho's tasks)${NC}"
fi

# Check CSS
if [ -f "_site/public/css/styles.css" ]; then
    CSS_SIZE=$(du -h _site/public/css/styles.css | cut -f1)
    echo -e "${GREEN}✓ CSS file exists ($CSS_SIZE)${NC}"
fi

echo ""
echo "6. AI Discoverability Score..."
echo "--------------------------------"

SCORE=0
MAX_SCORE=10

[ -f "_site/robots.txt" ] && SCORE=$((SCORE+1))
[ -f "_site/sitemap.xml" ] && SCORE=$((SCORE+1))
[ -f "_site/ai-info.json" ] && SCORE=$((SCORE+2))
grep -q "application/ld+json" _site/index.html && SCORE=$((SCORE+2))
grep -q "ai:topic" _site/index.html && SCORE=$((SCORE+1))
grep -q "og:image" _site/index.html && SCORE=$((SCORE+1))
grep -q "MobileApplication" _site/index.html && SCORE=$((SCORE+1))
grep -q "FAQPage" _site/index.html && SCORE=$((SCORE+1))

echo -e "${GREEN}AI Discoverability Score: $SCORE/$MAX_SCORE${NC}"

if [ $SCORE -ge 9 ]; then
    echo -e "${GREEN}✓ Excellent - Ready for AI assistants!${NC}"
elif [ $SCORE -ge 7 ]; then
    echo -e "${YELLOW}⚠ Good - Minor improvements needed${NC}"
else
    echo -e "${RED}✗ Needs work - Review implementation${NC}"
fi

echo ""
echo "========================================"
echo "Validation Complete!"
echo "========================================"
echo ""
echo "Next Steps:"
echo "1. Review PERFORMANCE-TASKS-SIPHO.md for performance optimization"
echo "2. Run 'npm run lighthouse' for detailed audit"
echo "3. Deploy to production"
echo "4. Submit sitemap.xml to Google Search Console"
echo ""
