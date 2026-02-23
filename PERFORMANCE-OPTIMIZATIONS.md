# Performance Optimizations Implemented

## ✅ Current State Analysis

### What's Already Good:
1. ✓ Images have explicit width/height attributes
2. ✓ Lazy loading implemented on below-fold images
3. ✓ Hero image has `loading="eager"` and `fetchpriority="high"`
4. ✓ Font preconnect implemented
5. ✓ Responsive meta viewport

### 🔴 Critical Issues to Fix:

## 1. Largest Contentful Paint (LCP) - 4.9s → Target <2.5s

**Root Cause:** The LCP element is likely `/public/images/app-screenshot-invoice.png`

**Solutions:**

### A. Optimize Hero Image
```html
<!-- Before -->
<img src="/public/images/app-screenshot-invoice.png" alt="..." width="304" height="675" loading="eager" fetchpriority="high">

<!-- After - Add preload in <head> -->
<link rel="preload" as="image" href="/public/images/app-screenshot-invoice.png" fetchpriority="high">

<!-- Convert to WebP with fallback -->
<picture>
  <source srcset="/public/images/app-screenshot-invoice.webp" type="image/webp">
  <img src="/public/images/app-screenshot-invoice.png" 
       alt="KwikInvoice app showing invoice creation screen" 
       width="304" 
       height="675" 
       loading="eager" 
       fetchpriority="high">
</picture>
```

### B. Inline Critical CSS
Current: Blocking external stylesheet
Solution: Inline above-the-fold CSS

```html
<head>
  <style>
    /* Critical CSS - inline */
    body { margin: 0; font-family: system-ui; }
    .hero { min-height: 100vh; background: #fff; }
    /* ... more critical styles */
  </style>
  
  <!-- Load full stylesheet asynchronously -->
  <link rel="preload" href="/public/css/styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="/public/css/styles.css"></noscript>
</head>
```

## 2. Render-Blocking Resources

### Font Loading Optimization

```html
<!-- Before -->
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- After - Use font-display: swap -->
<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" media="print" onload="this.media='all'">
<noscript>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</noscript>
```

## 3. Image Optimization Strategy

### Convert to WebP
```bash
# Install sharp for image optimization
npm install --save-dev @11ty/eleventy-img

# Create image optimization script
```

### Responsive Images
```html
<picture>
  <source 
    srcset="/public/images/screenshot-dashboard-sm.webp 200w,
            /public/images/screenshot-dashboard-md.webp 400w,
            /public/images/screenshot-dashboard-lg.webp 600w"
    type="image/webp"
    sizes="(max-width: 768px) 100vw, 200px">
  <source 
    srcset="/public/images/screenshot-dashboard-sm.png 200w,
            /public/images/screenshot-dashboard-md.png 400w,
            /public/images/screenshot-dashboard-lg.png 600w"
    sizes="(max-width: 768px) 100vw, 200px">
  <img src="/public/images/screenshot-dashboard.png" 
       alt="Invoice dashboard" 
       width="200" 
       height="444" 
       loading="lazy">
</picture>
```

## 4. Resource Hints

Add to `<head>`:
```html
<!-- DNS prefetch for external resources -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com">
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link rel="dns-prefetch" href="https://play.google.com">

<!-- Preconnect for critical resources -->
<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Preload critical assets -->
<link rel="preload" as="image" href="/public/images/app-screenshot-invoice.png" fetchpriority="high">
<link rel="preload" as="font" href="/fonts/plus-jakarta-sans-v4-latin-regular.woff2" type="font/woff2" crossorigin>
```

## 5. CSS Optimization

### Critical CSS Extraction
```bash
# Install critical CSS generator
npm install --save-dev critical

# Generate critical CSS
npx critical src/_includes/layouts/base.njk --base _site --inline
```

### CSS Structure
```
styles/
├── critical.css      (inline in <head>)
├── above-fold.css    (preload, high priority)
└── styles.css        (async load)
```

## 6. JavaScript Optimization

### Current State
- No JavaScript in base template ✓
- Consider adding:

```html
<!-- Add at end of <body> -->
<script>
  // Service Worker for offline support
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('/sw.js');
    });
  }
</script>
```

## 7. Caching Strategy

### Add to .eleventy.js
```js
module.exports = function(eleventyConfig) {
  // Copy and hash assets for cache busting
  eleventyConfig.addPassthroughCopy({
    "public/css": "public/css",
    "public/images": "public/images"
  });
  
  // Add filter for cache busting
  eleventyConfig.addFilter("bust", (url) => {
    const [urlPart, paramPart] = url.split("?");
    const params = new URLSearchParams(paramPart || "");
    params.set("v", Date.now());
    return `${urlPart}?${params}`;
  });
};
```

Usage:
```html
<link rel="stylesheet" href="{{ '/public/css/styles.css' | bust }}">
```

## 8. Performance Budget

Add to package.json:
```json
{
  "scripts": {
    "lighthouse": "lighthouse http://localhost:8080 --output html --output-path ./lighthouse-report.html --chrome-flags='--headless'",
    "perf-budget": "lighthouse http://localhost:8080 --budget-path=budget.json"
  }
}
```

Create `budget.json`:
```json
[
  {
    "path": "/*",
    "timings": [
      {
        "metric": "interactive",
        "budget": 3000
      },
      {
        "metric": "first-contentful-paint",
        "budget": 1800
      }
    ],
    "resourceSizes": [
      {
        "resourceType": "image",
        "budget": 500
      },
      {
        "resourceType": "script",
        "budget": 150
      },
      {
        "resourceType": "stylesheet",
        "budget": 50
      }
    ]
  }
]
```

## 9. HTTP Headers (for Netlify)

Create `netlify.toml`:
```toml
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "/public/css/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/public/images/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/public/images/*.webp"
  [headers.values]
    Content-Type = "image/webp"
    Cache-Control = "public, max-age=31536000, immutable"
```

## 10. Implementation Priority

### Phase 1: Quick Wins (1-2 hours)
- [x] Add preload for hero image
- [x] Async load Google Fonts
- [x] Add resource hints (dns-prefetch, preconnect)
- [x] Optimize font loading with font-display

### Phase 2: Image Optimization (2-4 hours)
- [ ] Install eleventy-img plugin
- [ ] Convert all images to WebP
- [ ] Generate responsive image sets
- [ ] Update all <img> tags to <picture> elements

### Phase 3: CSS Optimization (2-3 hours)
- [ ] Extract critical CSS
- [ ] Inline critical CSS in <head>
- [ ] Async load non-critical CSS
- [ ] Minify CSS

### Phase 4: Advanced (4-6 hours)
- [ ] Implement service worker
- [ ] Add performance budgets to CI
- [ ] Set up monitoring (Lighthouse CI)
- [ ] Configure caching headers

## Expected Results

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Performance Score | 64 | 90+ | +40% |
| LCP | 4.9s | <2.5s | -49% |
| FCP | 1.6s | <1.5s | -6% |
| Speed Index | 1.6s | <1.5s | Maintain |
| Total Page Size | TBD | <500KB | -30% |

## Monitoring

- Run Lighthouse before/after each phase
- Monitor real user metrics with Google Analytics
- Set up Lighthouse CI in GitHub Actions
- Track Core Web Vitals in Google Search Console
