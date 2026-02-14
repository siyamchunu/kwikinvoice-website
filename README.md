# KwikInvoice Website

**Live Site:** https://kwikinvoice.loggedon.co.za (coming soon)  
**Built with:** [11ty (Eleventy)](https://www.11ty.dev/)  
**Hosting:** Cloudflare Pages

Professional website for KwikInvoice - hosting legal documents, landing page, and blog/announcements.

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ 
- npm

### Installation

```bash
# Install dependencies
npm install

# Start development server (with live reload)
npm run start

# Build for production
npm run build

# Clean build directory
npm run clean
```

### Development

Visit `http://localhost:8080` after running `npm run start`.

The site will automatically reload when you make changes to:
- Source files in `src/`
- Stylesheets in `public/css/`
- Templates in `src/_includes/`

## 📂 Project Structure

```
kwikinvoice-website/
├── src/                        # Source files
│   ├── index.md               # Landing page
│   ├── privacy-policy.md      # Privacy Policy
│   ├── terms-of-service.md    # Terms of Service
│   ├── blog/                  # Blog posts
│   │   ├── index.md           # Blog listing
│   │   └── posts/             # Individual posts
│   └── _includes/             # Templates
│       ├── layouts/           # Page layouts
│       └── partials/          # Reusable components
├── public/                    # Static assets
│   ├── css/
│   ├── images/
│   └── js/
├── _site/                     # Build output (gitignored)
├── .eleventy.js               # 11ty configuration
├── _redirects                 # Cloudflare redirects
└── package.json
```

## ✍️ Adding Blog Posts

Create a new Markdown file in `src/blog/posts/`:

```markdown
---
layout: layouts/blog.njk
title: Your Post Title
date: 2026-02-14
category: Updates
excerpt: Short description for previews
---

Your content here...
```

### Post Categories

- `Updates` - App updates, releases
- `Legal` - Policy changes, legal updates  
- `Tips` - How-to guides, best practices
- `Features` - New feature announcements

## 📝 Updating Legal Documents

1. Edit the source file in `/home/siya/2ndBrain/KwikInvoice/docs/`
2. Copy updated content to `src/privacy-policy.md` or `src/terms-of-service.md`
3. Keep the front matter (the YAML between `---`)
4. Commit and push - auto-deploys to production

## 🚀 Deployment

### Automatic (Recommended)
Push to `main` branch - Cloudflare Pages automatically builds and deploys.

### Manual
```bash
npm run build
# Upload _site/ folder to Cloudflare Pages
```

### Build Settings (Cloudflare Pages)
- **Build command:** `npm run build`
- **Build output directory:** `_site`
- **Node version:** 18 or higher

## 🔗 URLs

- Landing: https://kwikinvoice.loggedon.co.za/
- Privacy: https://kwikinvoice.loggedon.co.za/privacy-policy
- Terms: https://kwikinvoice.loggedon.co.za/terms-of-service
- Blog: https://kwikinvoice.loggedon.co.za/blog

### Redirects
- `/privacy` → `/privacy-policy` (301)
- `/terms` → `/terms-of-service` (301)

## 🎨 Design

Based on wireframes by Fiona (UX/UI Designer).

**Color Palette:**
- Primary Blue: `#2563EB`
- Success Green: `#10B981`
- Text Dark: `#1F2937`
- Text Muted: `#6B7280`

**Typography:**
- Font: Inter (Google Fonts)
- Base size: 16px
- Line height: 1.6

## 🧪 Testing

### Local Testing
```bash
npm run start
# Visit http://localhost:8080
```

### Production Build Test
```bash
npm run build
npx serve _site
```

### Lighthouse Audit
Run in Chrome DevTools → Lighthouse tab

**Target Scores:**
- Performance: > 90
- Accessibility: > 90
- Best Practices: > 90
- SEO: > 90

## 📦 Tech Stack

- **Static Site Generator:** [11ty](https://www.11ty.dev/)
- **Template Engine:** Nunjucks
- **Markdown:** markdown-it
- **Hosting:** Cloudflare Pages
- **CSS:** Custom (mobile-first, no framework)
- **Fonts:** Google Fonts (Inter)

## 🔒 Security

- HTTPS enforced (automatic via Cloudflare)
- Security headers configured (see `_headers` file)
- No external scripts or tracking
- GDPR compliant

## 📄 License

Copyright © 2026 KwikInvoice | LoggedOn

## 📧 Contact

- **Email:** kwikinvoice@loggedon.co.za
- **Developer:** Siya Mchunu

## 🤝 Contributing

This is a private project. For questions or suggestions, contact the team.

---

**Last Updated:** February 14, 2026  
**Version:** 1.0.0
