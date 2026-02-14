# 🚀 Deployment Guide - KwikInvoice Website

**Date:** 2026-02-14  
**Repository:** /home/siya/workspace/kwikinvoice-website  
**Status:** ✅ Built and ready for deployment

---

## ✅ Pre-Deployment Checklist

- [x] Repository created in `/home/siya/workspace/kwikinvoice-website`
- [x] 11ty configured and tested
- [x] All pages built successfully
- [x] 20 files committed to git
- [x] Build successful (7 HTML pages)
- [x] Local build tested
- [x] Git user configured (Siya Mchunu <macingwan@gmail.com>)

---

## Step 1: Push to GitHub

### 1.1 Create GitHub Repository

Go to https://github.com/new and create:
- **Name:** `kwikinvoice-website`
- **Description:** KwikInvoice legal documents and landing page
- **Visibility:** Public (or Private if preferred)
- **Don't initialize** with README, .gitignore, or license (already have them)

### 1.2 Add Remote and Push

```bash
cd /home/siya/workspace/kwikinvoice-website

# Add GitHub remote
git remote add origin https://github.com/[YOUR-USERNAME]/kwikinvoice-website.git

# Push to GitHub
git push -u origin main

# Verify
git remote -v
```

**Replace `[YOUR-USERNAME]`** with your actual GitHub username or organization.

---

## Step 2: Connect to Cloudflare Pages

### 2.1 Log in to Cloudflare

1. Go to https://dash.cloudflare.com/
2. Log in with your Cloudflare credentials
3. Navigate to **Pages** (left sidebar)

### 2.2 Create New Project

1. Click **"Create a project"**
2. Select **"Connect to Git"**
3. Choose **GitHub**
4. Authorize Cloudflare (if first time)
5. Select repository: **kwikinvoice-website**
6. Click **"Begin setup"**

### 2.3 Configure Build Settings

```
Project name:           kwikinvoice-website
Production branch:      main
Framework preset:       None (Custom)
Build command:          npm run build
Build output directory: _site
Root directory:         (leave empty)
Environment variables:  (none needed)
Node version:           18 or higher (auto-detected)
```

### 2.4 Deploy

1. Click **"Save and Deploy"**
2. Wait for build (30-60 seconds)
3. Note the preview URL: `https://kwikinvoice-website.pages.dev`
4. Click the URL to test

---

## Step 3: Add Custom Domain

### 3.1 Add Domain in Cloudflare Pages

1. In your Cloudflare Pages project
2. Go to **"Custom domains"** tab
3. Click **"Set up a custom domain"**
4. Enter: `kwikinvoice.loggedon.co.za`
5. Click **"Continue"**

### 3.2 DNS Configuration (Automatic)

Cloudflare will automatically:
- Create CNAME record: `kwikinvoice` → `kwikinvoice-website.pages.dev`
- Enable Cloudflare proxy (orange cloud)
- Provision SSL certificate
- Enable HTTPS redirect

**Verify DNS:**
```bash
dig kwikinvoice.loggedon.co.za
# Should show CNAME to *.pages.dev
```

### 3.3 Wait for SSL Provisioning

- **Estimated time:** 5-10 minutes
- **Check status:** Custom domains tab shows "Active"
- **SSL certificate:** Automatically provisioned by Cloudflare

---

## Step 4: Enable Optimizations

### 4.1 Auto Minify (Recommended)

1. Go to Cloudflare Dashboard
2. Select `loggedon.co.za` domain
3. Navigate to **Speed** → **Optimization**
4. Enable:
   - [x] Auto Minify HTML
   - [x] Auto Minify CSS
   - [x] Auto Minify JavaScript

### 4.2 Brotli Compression

1. Same page: **Speed** → **Optimization**
2. Enable **Brotli** compression

### 4.3 Caching

1. Go to **Caching** → **Configuration**
2. Caching Level: **Standard** (default)
3. Browser Cache TTL: **4 hours** (or default)

---

## Step 5: Verify Deployment

### 5.1 Test All URLs

Visit these URLs and verify they work:

```bash
# Landing page
https://kwikinvoice.loggedon.co.za/

# Privacy Policy
https://kwikinvoice.loggedon.co.za/privacy-policy

# Terms of Service
https://kwikinvoice.loggedon.co.za/terms-of-service

# Blog listing
https://kwikinvoice.loggedon.co.za/blog

# Sample blog post
https://kwikinvoice.loggedon.co.za/blog/posts/2026-02-14-welcome

# Redirects
https://kwikinvoice.loggedon.co.za/privacy (→ /privacy-policy)
https://kwikinvoice.loggedon.co.za/terms (→ /terms-of-service)
```

### 5.2 Test HTTPS

1. Click padlock in browser
2. Verify certificate is valid
3. Check "Issued by: Cloudflare"
4. Ensure HTTP → HTTPS redirect works

### 5.3 Mobile Testing

- Test on real iOS device (Safari)
- Test on real Android device (Chrome)
- Verify responsive design works
- Check all links and navigation

### 5.4 Lighthouse Audit

1. Open Chrome DevTools
2. Go to **Lighthouse** tab
3. Select:
   - [x] Performance
   - [x] Accessibility
   - [x] Best Practices
   - [x] SEO
4. Click **"Generate report"**

**Target scores:**
- Performance: > 90
- Accessibility: > 90
- Best Practices: > 90
- SEO: > 90

---

## Step 6: Update KwikInvoice App

### 6.1 Add URLs to App Configuration

Edit your app's config file (e.g., `src/config/urls.js` or similar):

```javascript
export const LEGAL_URLS = {
  website: 'https://kwikinvoice.loggedon.co.za',
  privacyPolicy: 'https://kwikinvoice.loggedon.co.za/privacy-policy',
  termsOfService: 'https://kwikinvoice.loggedon.co.za/terms-of-service',
  blog: 'https://kwikinvoice.loggedon.co.za/blog'
};
```

### 6.2 Test in App

- Open KwikInvoice app
- Navigate to settings or legal section
- Click Privacy Policy link
- Verify opens correct URL in browser
- Test Terms of Service link

### 6.3 Google Play Console

1. Log in to Google Play Console
2. Go to your app
3. **App content** → **Privacy policy**
   - Add URL: `https://kwikinvoice.loggedon.co.za/privacy-policy`
4. **App content** → **Terms of service** (if applicable)
   - Add URL: `https://kwikinvoice.loggedon.co.za/terms-of-service`
5. Save changes

---

## Step 7: Monitor & Maintain

### 7.1 Deployment Logs

- Go to Cloudflare Pages project
- Click **"Deployments"** tab
- View build logs for each deployment
- Check for errors or warnings

### 7.2 Analytics (Optional)

Cloudflare provides free Web Analytics:
1. Go to **Analytics** → **Web Analytics**
2. Add site: `kwikinvoice.loggedon.co.za`
3. No JavaScript snippet needed (automatic)

### 7.3 Future Updates

**To add a new blog post:**
```bash
cd /home/siya/workspace/kwikinvoice-website

# Create new post
cat > src/blog/posts/2026-XX-XX-title.md << 'EOF'
---
layout: layouts/blog.njk
title: Your Post Title
date: 2026-XX-XX
category: Updates
excerpt: Short description
---

Your content here...
EOF

# Build and test locally
npm run start
# Visit http://localhost:8080/blog

# Commit and push
git add src/blog/posts/2026-XX-XX-title.md
git commit -m "Add new blog post: Title"
git push origin main

# Cloudflare auto-deploys (1-2 minutes)
```

**To update legal documents:**
```bash
# Edit source docs in KwikInvoice repo
vim /home/siya/2ndBrain/KwikInvoice/docs/PRIVACY-POLICY.md

# Copy to website (keep front matter!)
# Update website repo
cd /home/siya/workspace/kwikinvoice-website

# Update privacy-policy.md (keep front matter)
# Commit and push
git add src/privacy-policy.md
git commit -m "Update Privacy Policy"
git push origin main
```

---

## Troubleshooting

### Issue: Build Fails on Cloudflare

**Check:**
- Build logs in Cloudflare Pages dashboard
- Node version (needs 18+)
- Build command correct: `npm run build`
- Build output directory: `_site`

**Fix:**
```bash
# Test locally first
cd /home/siya/workspace/kwikinvoice-website
npm run build
# If fails, check error and fix
```

### Issue: Custom Domain Not Working

**Check:**
- DNS propagation (can take 5-10 minutes)
- CNAME record exists in Cloudflare DNS
- SSL certificate status (should be "Active")

**Fix:**
```bash
# Check DNS
dig kwikinvoice.loggedon.co.za

# Clear browser cache
# Try in incognito mode
```

### Issue: 404 Errors

**Check:**
- File exists in `_site/` after build
- URL matches file structure
- Redirects in `_redirects` file

**Fix:**
- Verify build includes all files
- Check case sensitivity in URLs

### Issue: Styles Not Loading

**Check:**
- Browser console for errors
- CSS file copied to `_site/public/css/`
- Path in HTML: `/public/css/styles.css`

**Fix:**
- Verify `.eleventy.js` has `addPassthroughCopy("public")`
- Rebuild: `npm run build`

---

## Success Criteria ✅

When all these are checked, deployment is complete:

- [ ] GitHub repository created and pushed
- [ ] Cloudflare Pages connected
- [ ] First build successful
- [ ] Custom domain added (kwikinvoice.loggedon.co.za)
- [ ] DNS configured and propagated
- [ ] SSL certificate active
- [ ] All URLs work (landing, privacy, terms, blog)
- [ ] Redirects work (/privacy → /privacy-policy)
- [ ] HTTPS enforced
- [ ] Mobile responsive verified
- [ ] Lighthouse scores > 90
- [ ] Optimizations enabled (auto minify, Brotli)
- [ ] URLs added to KwikInvoice app
- [ ] URLs submitted to Google Play Console
- [ ] Documentation updated
- [ ] Team notified

---

## Post-Deployment Tasks

1. **Update Story 030**
   - Mark as "Done"
   - Add deployment date
   - Add live URLs

2. **Notify Team**
   - Share live URLs
   - Provide maintenance guide
   - Schedule quarterly legal doc review

3. **Create Reminder**
   - Quarterly review (next: May 14, 2026)
   - Check for updates needed
   - Review analytics

---

## URLs Reference

**Production:**
- Landing: https://kwikinvoice.loggedon.co.za/
- Privacy: https://kwikinvoice.loggedon.co.za/privacy-policy
- Terms: https://kwikinvoice.loggedon.co.za/terms-of-service
- Blog: https://kwikinvoice.loggedon.co.za/blog

**Preview (Cloudflare):**
- https://kwikinvoice-website.pages.dev/

**Local Development:**
- http://localhost:8080/

---

## Contact

**Questions or Issues?**
- Email: kwikinvoice@loggedon.co.za
- Developer: Siya Mchunu (macingwan@gmail.com)

---

**Deployment Date:** _____________  
**Deployed By:** _____________  
**Verification:** _____________  
**Status:** _____________

---

🎉 **Congratulations on the successful deployment!** 🎉
