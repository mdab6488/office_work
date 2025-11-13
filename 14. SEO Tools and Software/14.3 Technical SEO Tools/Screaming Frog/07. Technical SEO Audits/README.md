
## 7. Technical SEO Audits {#technical-seo-audits}

### Audit #1: Broken Link Detection

**Finding 404 Errors**

```
Process:
1. Complete site crawl
2. Click "Response Codes" tab → "Client Error (4xx)"
3. Export list of 404 pages
4. Analyze inlinks to each 404
```

**Real Case Study: News Website**
```
Site: NewsWebsite.com
Total 404s Found: 143

Breakdown:
├── Old articles moved/deleted: 87
├── Outdated image URLs: 34
├── Broken external links: 18
└── Typos in internal links: 4

Top Priority 404s:
URL: /breaking-news/election-results
Inlinks: 47 internal pages
Traffic Lost: ~500 visitors/month

Solution Implemented:
1. Restored archived content
2. Implemented 301 redirects for permanently deleted pages
3. Fixed internal linking structure
4. Set up monitoring for future breaks

Result:
- Recovered 89% of lost traffic
- Improved user experience
- Better crawl efficiency
```

**Finding Broken Images**
```
Process:
1. Click "Images" tab
2. Filter → Response Codes → "Client Error (4xx)"
3. Review broken image URLs

Example Finding:
URL: example.com/images/product-hero-2019.jpg
Status: 404
Found on: 23 product pages

Impact:
- Poor user experience
- Missed conversion opportunities
- Wasted crawl budget

Fix:
- Locate correct image file
- Update image paths
- Implement proper image versioning
```

### Audit #2: Redirect Chain Analysis

**What Are Redirect Chains?**
```
Example Chain:
example.com/old-url 
  → 301 → example.com/temp-url
    → 301 → example.com/newer-url
      → 301 → example.com/final-url

Problem:
- Slow page load (each redirect adds ~0.1-0.5s)
- Link equity dilution
- Crawl budget waste
```

**Finding Redirect Chains in Screaming Frog**

```
Method 1: Built-in Report
1. Reports → Redirects → Redirect Chains
2. Review chains longer than 2 hops

Method 2: Manual Investigation
1. Response Codes → "Redirection (3xx)"
2. Click any redirect URL
3. Lower panel → "Redirect Chains"
4. View complete chain
```

**Real Example: Site Migration**
```
Before Optimization:

Homepage Chain (4 hops):
domain.com 
  → 301 → www.domain.com
    → 301 → www.domain.com/en/
      → 301 → https://www.domain.com/en/
        → 200 → Final destination

Load time: 2.3 seconds
Link equity passed: ~60%

After Fix:

Direct redirect:
domain.com 
  → 301 → https://www.domain.com/en/
    → 200 → Final destination

Load time: 0.4 seconds
Link equity passed: ~95%
```

### Audit #3: Duplicate Content Detection

**Finding Duplicate Titles**
```
Process:
1. Page Titles → Filter → "Duplicate"
2. Export list
3. Group by title text
4. Analyze why duplicates exist

Example from E-commerce Audit:

Title: "Products | ShopName"
Found on: 1,247 pages

URLs:
├── example.com/products?page=1
├── example.com/products?page=2
├── example.com/products?page=3
└── ... 1,244 more

Root Cause: Pagination pages using same title template

Solution:
Dynamic titles:
"Products - Page {N} of {Total} | ShopName"

or

Canonical tags pointing to page 1:
<link rel="canonical" href="/products?page=1">
```

**Finding Duplicate Meta Descriptions**
```
Process:
1. Meta Description → Filter → "Duplicate"
2. Sort by "Meta Description 1"
3. Identify patterns

Real Example: Property Listing Site

Meta Description: "Find your dream home with us"
Found on: 3,456 property pages

Impact:
- Google ignores duplicates
- Rewrite descriptions from page content
- Missed opportunity to highlight unique features

Fix Implemented:
Template: "View this {bedrooms} bedroom {property-type} in {location}. {Key feature}. Price: {price}. Schedule viewing today!"

Result:
- Unique descriptions for each property
- 23% increase in SERP CTR
- Better qualified traffic
```

**Finding Duplicate H1s**
```
Process:
1. H1 → Filter → "Duplicate"
2. Review and prioritize fixes

Example: Corporate Website

H1: "Welcome"
Found on: 12 pages (homepage + country subdomains)

Fix: Make H1s descriptive and unique
├── example.com/en → "Global Leader in Widget Manufacturing"
├── example.com/uk → "UK's Trusted Widget Supplier"
└── example.com/de → "Premium Widgets in Deutschland"
```

**Finding Duplicate Content**
```
Using Text Compare:
1. Bulk Export → Custom → "Text (first 20 words)"
2. Use Excel/Google Sheets to find duplicates
3. Investigate matching content

Example Finding:
500 pages with identical first paragraph:
"Welcome to our site. We offer high-quality products..."

Cause: Template text in CMS
Fix: Remove boilerplate, start with unique content
```

### Audit #4: Canonical Tag Analysis

**Reviewing Canonical Implementation**
```
Process:
1. Directives → Canonical
2. Check "Canonical Evaluation" column

Status Types:
├── Self-Referencing: Good (page canonicals to itself)
├── Canonicalised: Page points to different canonical
├── Missing: No canonical tag
├── Multiple: Error - multiple canonical tags
└── Non-Indexable Canonical: Error - points to non-200 page
```

**Real-World Canonical Issues**

**Issue 1: Canonicals to 404 Pages**
```
Discovery:
URL: example.com/product-variant-red
Canonical: example.com/product-master
Canonical Status: 404

Impact:
- Sends mixed signals to Google
- May cause deindexing
- Wastes crawl budget

Fix:
1. Check if master page should exist
2. If deleted, update variant canonicals
3. Or remove canonical tags if variants are unique
```

**Issue 2: Canonical Chains**
```
Problem:
Page A: example.com/page-a
  Canonical → example.com/page-b

Page B: example.com/page-b
  Canonical → example.com/page-c

Page C: example.com/page-c
  Canonical → Self

Google's View: Confusing signal

Fix: All pages should canonical to Page C directly
```

**Issue 3: HTTPS/HTTP Canonical Mismatch**
```
Site on HTTPS: https://example.com/page
Canonical Tag: http://example.com/page

Problem:
- Mixed signals
- May prefer HTTP version
- Hurts HTTPS migration

Fix:
Update all canonicals to HTTPS version
```

### Audit #5: Mobile-Friendliness Check

**Using Mobile User-Agent**
```
Configuration:
1. Configuration → User-Agent
2. Select: "Googlebot Smartphone"
3. Re-crawl site

Compare with Desktop Crawl:
├── Different page count?
├── Missing content on mobile?
├── Different redirect behavior?
└── Mobile-specific errors?
```

**Real Case: Mobile Content Mismatch**
```
Desktop Crawl: 1,250 pages
Mobile Crawl: 987 pages

Missing on Mobile:
- 263 pages not rendered
- Detected: Content hidden via CSS display:none
- Impact: Mobile-first indexing may miss content

Investigation:
URL: example.com/product-details
Desktop: Full specifications table visible
Mobile: Specifications hidden in collapsed accordion

Google View: May not see hidden content

Solution:
- Use <details> and <summary> HTML5 tags
- Ensure content is in DOM, just styled differently
- Test with Mobile-Friendly Test tool
```

### Audit #6: Page Speed Analysis

**Integrating PageSpeed Insights**
```
Setup:
1. Configuration → API Access → PageSpeed Insights
2. Enter API key (get free from Google Cloud Console)
3. Crawl site normally
4. Select URLs to test
5. Right-click → "PageSpeed Insights"

Bulk Analysis:
1. Select multiple URLs (Shift+Click or Ctrl+Click)
2. Right-click → "PageSpeed Insights"
3. Wait for analysis
4. Results appear in "PageSpeed" tab
```

**Real Performance Audit**
```
Site: E-commerce Homepage
URL: example.com

Desktop Scores:
├── Performance: 45/100 ❌
├── Accessibility: 92/100 ✓
├── Best Practices: 83/100 ⚠️
└── SEO: 90/100 ✓

Mobile Scores:
├── Performance: 23/100 ❌
├── Accessibility: 89/100 ✓
├── Best Practices: 79/100 ⚠️
└── SEO: 87/100 ✓

Top Issues Identified:
1. Largest Contentful Paint: 4.2s (should be <2.5s)
2. Total Blocking Time: 890ms (should be <200ms)
3. Cumulative Layout Shift: 0.34 (should be <0.1)

Main Culprits:
├── Unoptimized hero image (2.4MB)
├── 17 blocking JavaScript files
├── No lazy loading on images
└── Missing text compression

Solutions Implemented:
1. Compressed images → WebP format
2. Deferred non-critical JS
3. Implemented lazy loading
4. Enabled Gzip compression

After Fix:
Desktop Performance: 89/100 ✓
Mobile Performance: 76/100 ✓
Page load time reduced by 58%
```

### Audit #7: Robots.txt & XML Sitemap Validation

**Analyzing Robots.txt**
```
Process:
1. Crawl site
2. Reports → Robots.txt
3. Review directives

Common Issues:

Issue 1: Blocking Important Pages
Robots.txt:
User-agent: *
Disallow: /products/

Result: All products blocked from crawling!
Fix: Remove or modify disallow rule

Issue 2: Blocking CSS/JS (Old Practice)
Robots.txt:
User-agent: *
Disallow: /css/
Disallow: /js/

Problem: Google can't render page properly
Fix: Allow crawling of CSS and JavaScript
```

**XML Sitemap Analysis**
```
Loading Sitemap:
1. Upload → Download Sitemap
2. Enter sitemap URL: example.com/sitemap.xml
3. Screaming Frog parses and validates

Validation Checks:
✓ All URLs return 200
✓ No redirects in sitemap
✓ No 404s in sitemap
✓ All URLs are canonical versions
✓ All URLs are indexable
✓ Sitemap size <50MB
✓ Max 50,000 URLs per sitemap file

Real Issue Found:
Sitemap: example.com/sitemap.xml
Total URLs: 5,847

Problems Detected:
├── 301 Redirects: 247 URLs
├── 404 Errors: 18 URLs
├── Noindex Pages: 93 URLs
└── Non-canonical URLs: 156 URLs

Impact:
- Wasted crawl budget
- Mixed signals to Google
- Indexing delays

Solution:
1. Remove all non-200 URLs
2. Remove noindexed pages
3. Only include canonical URLs
4. Keep sitemap updated automatically
```

---
