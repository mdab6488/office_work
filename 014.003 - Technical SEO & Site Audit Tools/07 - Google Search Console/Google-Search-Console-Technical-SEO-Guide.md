# Google Search Console: Technical SEO & Site Audit Tools - Complete Guide

## Table of Contents
1. [Introduction & Setup](#introduction--setup)
2. [Core Technical SEO Features](#core-technical-seo-features)
3. [URL Inspection Tool](#url-inspection-tool)
4. [Coverage Report (Index Status)](#coverage-report-index-status)
5. [Sitemaps Management](#sitemaps-management)
6. [Core Web Vitals & Page Experience](#core-web-vitals--page-experience)
7. [Mobile Usability](#mobile-usability)
8. [Structured Data & Rich Results](#structured-data--rich-results)
9. [Security Issues & Manual Actions](#security-issues--manual-actions)
10. [Crawl Stats Report](#crawl-stats-report)
11. [Technical Audit Workflows](#technical-audit-workflows)
12. [Advanced Troubleshooting](#advanced-troubleshooting)
13. [API Integration](#api-integration)

---

## Introduction & Setup

### What is Google Search Console?

Google Search Console (GSC) is Google's official platform for monitoring, maintaining, and troubleshooting your site's presence in Google Search results. For technical SEO, it's the most authoritative source for understanding how Googlebot interacts with your website.

### Initial Setup & Verification

#### Property Types

**Domain Property** (Recommended for Technical SEO)
```
Domain: example.com
Covers: All protocols (http/https) and subdomains
Verification: DNS TXT record
```

**URL Prefix Property**
```
URL Prefix: https://www.example.com
Covers: Only exact protocol and subdomain
Verification: Multiple methods available
```

#### Verification Methods

1. **DNS TXT Record** (Best for technical audits)
```dns
Type: TXT
Host: @
Value: google-site-verification=XYZ123ABC456...
TTL: 3600
```

2. **HTML File Upload**
```html
File: googleabcdef123456.html
Location: https://example.com/googleabcdef123456.html
```

3. **Meta Tag**
```html
<head>
  <meta name="google-site-verification" content="XYZ123..." />
</head>
```

4. **Google Analytics**
```javascript
// Must have edit access to GA property
gtag('config', 'GA_MEASUREMENT_ID');
```

5. **Google Tag Manager**
```javascript
// Must have publish access to GTM container
```

### Real-Life Example: Setting Up a Multi-Domain Audit

**Scenario**: E-commerce site with multiple country domains
```
Main Site: example.com
UK Site: example.co.uk
German Site: example.de
Subdomain Blog: blog.example.com
```

**Setup Strategy**:
- Create Domain Property for example.com (covers all subdomains)
- Create separate Domain Properties for .co.uk and .de
- Set up Property Sets to compare international performance
- Configure user permissions for different teams

---

## Core Technical SEO Features

### 1. Overview Dashboard

The Overview provides high-level metrics but the real value is in drilling down into technical issues.

**Key Metrics for Technical Audit**:
- Index Coverage Trends
- Enhancement Issues (CWV, Mobile, Structured Data)
- Experience Metrics

**Real-Life Use Case**: Quick Health Check
```
Morning Routine for 50+ Page Site:
1. Check Overview for any red flags
2. Look for coverage drop → investigate indexing issues
3. Check CWV trends → prioritize performance work
4. Review enhancement errors → fix structured data
```

---

## URL Inspection Tool

### Overview

The URL Inspection Tool is your **direct line to Googlebot**. It shows you exactly how Google sees and processes a specific URL.

### Key Information Provided

#### 1. **Index Status**
```
States:
- URL is on Google
- URL is not on Google
- URL is on Google but has issues
```

#### 2. **Coverage Information**
- Crawl date and time
- Discovery method (sitemap, referral, redirect)
- Crawl allowed/forbidden status
- Indexing status and reasons
- User-declared canonical vs. Google-selected canonical

#### 3. **Enhancement Data**
- Mobile usability status
- Page experience metrics
- Structured data detected
- AMP status (if applicable)

### Practical Features

#### Live URL Testing

**When to Use**:
- After fixing a critical issue
- Before requesting indexing
- To check robots.txt changes immediately

**Process**:
```
1. Enter URL in inspection tool
2. Click "Test Live URL"
3. Wait 10-30 seconds for real-time crawl
4. Compare live vs. indexed version
```

#### Request Indexing

**Best Practices**:
```
Do Request Indexing:
✓ New important pages (product launches, news)
✓ Fixed critical errors (404s now 200, fixed canonicals)
✓ Major content updates
✓ After removing noindex tags

Don't Request Indexing:
✗ Every minor content change
✗ More than 10-20 URLs per day (triggers rate limits)
✗ Low-quality or duplicate content
✗ URLs already being crawled regularly
```

### Real-Life Example 1: Diagnosing Canonical Issues

**Scenario**: Product page not ranking despite quality content

**Investigation**:
```
URL: https://example.com/products/red-widget

URL Inspection Results:
- User-declared canonical: https://example.com/products/red-widget
- Google-selected canonical: https://example.com/products/red-widget?color=red
- Status: Alternate page with proper canonical tag

Problem Identified:
Google chose the parameterized URL as canonical instead of the clean URL
```

**Diagnosis**:
1. Checked internal linking → Found most internal links point to parameterized version
2. Checked external backlinks → Major links pointed to parameterized URL
3. Sitemap included both versions

**Solution**:
```
1. Updated internal links to use clean URLs
2. Removed parameterized URLs from sitemap
3. Added canonical tag confirmation
4. Submitted clean URL for re-indexing
5. Monitored for 2-3 weeks until Google updated canonical selection
```

### Real-Life Example 2: JavaScript Rendering Issues

**Scenario**: Angular SPA with content not appearing in search

**Investigation Steps**:
```
1. URL Inspection Tool → Click "View Tested Page"
2. Compare "Crawled Page" vs. "Screenshot"
3. Check HTML in "More Info" → View Rendered HTML
```

**Findings**:
```
Raw HTML: <div id="app"></div>
Rendered HTML: Full content visible in screenshot
But: "Crawling" shows partial content only

Problem: JavaScript rendering timeout (5 seconds exceeded)
```

**Solution Implemented**:
```javascript
// Implement Server-Side Rendering (SSR) for critical content
// Add structured data in <head> (not generated by JS)
// Optimize JS bundle size to load faster
// Add static HTML fallback for core content
```

**Verification**:
```
Before: "This page does not have a meta description"
After: Meta description visible in both raw and rendered HTML
Indexing Time: Reduced from never → indexed within 3 days
```

### Real-Life Example 3: Redirect Chain Detection

**Scenario**: Category page with slow crawl rate

**URL Inspection Investigation**:
```
URL Inspected: https://example.com/category/electronics

Results Show:
1. Referring page: https://example.com/electronics (301)
2. That redirects to: https://example.com/category/electronics/ (301)
3. Final URL: https://example.com/category/electronics

Redirect Chain Detected: 2 hops before final destination
```

**Impact**:
- Crawl budget waste
- Link equity dilution
- Slower page discovery

**Fix**:
```
Updated all internal links to point directly to:
https://example.com/category/electronics

Result: Reduced redirect chain from 2 hops → direct access
Crawl frequency increased within 1 week
```

---

## Coverage Report (Index Status)

### Understanding Coverage States

#### 1. **Valid (Indexed)**
URLs that are successfully indexed and can appear in search results.

**Sub-states**:
```
- Submitted and indexed (via sitemap)
- Indexed, not submitted in sitemap
```

#### 2. **Valid with Warnings**
Indexed but with potential issues.

**Common Warnings**:
```
- Indexed, though blocked by robots.txt
  → Dangerous: URL in index but content not crawlable
  
- Indexed despite 'noindex' tag
  → Google hasn't re-crawled yet, will be removed eventually
```

#### 3. **Excluded**
URLs not indexed (intentional or problematic).

**Intentional Exclusions**:
```
✓ Excluded by 'noindex' tag
✓ Blocked by robots.txt
✓ Redirect (301/302)
```

**Problematic Exclusions**:
```
✗ Discovered - currently not indexed
✗ Crawled - currently not indexed
✗ Alternate page with proper canonical tag
✗ Duplicate without user-selected canonical
✗ Soft 404
✗ Page with redirect
```

#### 4. **Error**
URLs with technical problems preventing indexing.

**Common Errors**:
```
✗ Server error (5xx)
✗ Not found (404)
✗ Submitted URL blocked by robots.txt
✗ Submitted URL marked 'noindex'
✗ Submitted URL has crawl issue
```

### Real-Life Example 4: Mass Deindexing Investigation

**Scenario**: E-commerce site loses 40% of indexed pages overnight

**Coverage Report Analysis**:
```
Before: 10,000 indexed pages
After: 6,000 indexed pages
Loss: 4,000 pages

Error Breakdown:
- "Crawled - currently not indexed": 3,500 pages
- "Discovered - currently not indexed": 500 pages
```

**Investigation Process**:

**Step 1**: Identify affected URLs
```
Actions:
1. Export sample URLs from "Crawled - currently not indexed"
2. Categorize URLs: Product pages (80%), Category pages (15%), Other (5%)
3. Look for patterns in affected URLs
```

**Pattern Found**:
```
All affected product URLs contained:
/products/[category]/[product-name]-[random-number]

Example: /products/electronics/laptop-abc-12345

Hypothesis: Google treating these as low-quality due to random numbers
```

**Step 2**: URL Inspection of Sample Pages
```
Sample 1: /products/electronics/laptop-abc-12345
- Last crawl: 2 days ago
- Robots.txt: Allowed
- Indexing: "Crawled - currently not indexed"
- Notes: "Google chose not to index this page"

Reason: Thin content + similar to other pages
```

**Step 3**: Content Quality Analysis
```
Affected Pages:
- Product descriptions: 50-75 words
- Unique content: ~30%
- Internal links: 2-3 per page
- External links to page: 0

Indexed Pages:
- Product descriptions: 200+ words
- Unique content: ~80%
- Internal links: 8-10 per page
- External links: 2+ backlinks
```

**Root Cause Identified**:
Recent inventory expansion added 4,000 products with thin, template-based descriptions. Google determined these pages were low-quality duplicates.

**Solution Implemented**:
```
Tier 1 (High Priority - 1,000 pages):
- Rewrote descriptions to 200+ words
- Added unique specifications table
- Added customer reviews section
- Improved internal linking

Tier 2 (Medium Priority - 2,000 pages):
- Enhanced descriptions to 150+ words
- Added comparison sections
- Noindexed until content improved

Tier 3 (Low Priority - 1,000 pages):
- Combined similar products
- Noindexed low-value variations
- Created category overview pages instead
```

**Results After 6 Weeks**:
```
Indexed Pages: 8,500 (85% recovery)
- Tier 1: 95% indexed
- Tier 2: 75% indexed  
- Tier 3: Intentionally excluded

Organic Traffic: Increased 15% due to better quality pages
```

### Real-Life Example 5: Canonical Tag Confusion

**Scenario**: News website with duplicate content issues

**Coverage Report Shows**:
```
- Excluded: 15,000 URLs
- Reason: "Alternate page with proper canonical tag"
- Expected: ~5,000 URLs
- Problem: 10,000 unexpected exclusions
```

**Investigation**:
```
Sample URLs Excluded:
1. https://news.example.com/2024/article-title
   Canonical points to: https://news.example.com/article-title
   
2. https://news.example.com/category/tech/article-title
   Canonical points to: https://news.example.com/article-title

3. https://news.example.com/author/john/article-title
   Canonical points to: https://news.example.com/article-title
```

**Root Cause**:
CMS update changed canonical tag logic. All variations of article URLs now point to version without date/category/author path.

**Decision Matrix**:
```
Option 1: Keep current canonicals (consolidate signals)
Pros: Simplified indexing, concentrated link equity
Cons: Lose category/date context in URLs

Option 2: Make each URL self-referential
Pros: Index all variations
Cons: Duplicate content, diluted signals

Option 3: Strategic canonicalization
Pros: Best of both worlds
Cons: Requires more configuration
```

**Solution (Option 3)**:
```
Rule 1: Date-based URLs → Self-canonical (news value)
/2024/11/breaking-news → canonical to self

Rule 2: Category URLs → Canonical to date URL
/tech/breaking-news → canonical to /2024/11/breaking-news

Rule 3: Author URLs → Canonical to date URL
/author/john/breaking-news → canonical to /2024/11/breaking-news

Rule 4: Tag URLs → Noindex, follow
/tag/politics/breaking-news → noindex
```

**Implementation**:
```php
// WordPress example
function custom_canonical_tags() {
    if (is_date()) {
        // Date archives: self-canonical
        echo '<link rel="canonical" href="' . get_permalink() . '" />';
    } elseif (is_category() || is_author()) {
        // Category/Author: canonical to main article
        $post = get_post();
        echo '<link rel="canonical" href="' . get_permalink($post) . '" />';
    } elseif (is_tag()) {
        // Tag archives: noindex
        echo '<meta name="robots" content="noindex, follow" />';
    }
}
```

**Results After 4 Weeks**:
```
Indexed URLs: Increased from 5,000 → 12,000
Proper Canonicals: 10,000 (intentional)
Organic Traffic: +22% (better URL targeting in SERPs)
```

---

## Sitemaps Management

### Purpose in Technical SEO

Sitemaps serve as your **priority list** for Googlebot:
- Guide crawlers to important content
- Provide metadata (last modified, priority, change frequency)
- Track submission vs. indexing rate
- Identify crawl/index bottlenecks

### Sitemap Types in GSC

#### 1. **XML Sitemap** (Standard)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://example.com/page</loc>
    <lastmod>2024-11-20</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

#### 2. **Sitemap Index** (For Large Sites)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://example.com/sitemap-products.xml</loc>
    <lastmod>2024-11-20</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://example.com/sitemap-categories.xml</loc>
    <lastmod>2024-11-20</lastmod>
  </sitemap>
</sitemapindex>
```

#### 3. **News Sitemap**
```xml
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
  <url>
    <loc>https://news.example.com/article</loc>
    <news:news>
      <news:publication>
        <news:name>Example News</news:name>
        <news:language>en</news:language>
      </news:publication>
      <news:publication_date>2024-11-20T15:30:00Z</news:publication_date>
      <news:title>Breaking: Important Event</news:title>
    </news:news>
  </url>
</urlset>
```

#### 4. **Video Sitemap**
```xml
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">
  <url>
    <loc>https://example.com/video-page</loc>
    <video:video>
      <video:thumbnail_loc>https://example.com/thumb.jpg</video:thumbnail_loc>
      <video:title>Video Title</video:title>
      <video:description>Video description</video:description>
      <video:content_loc>https://example.com/video.mp4</video:content_loc>
      <video:duration>600</video:duration>
    </video:video>
  </url>
</urlset>
```

#### 5. **Image Sitemap**
```xml
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
  <url>
    <loc>https://example.com/page</loc>
    <image:image>
      <image:loc>https://example.com/image1.jpg</image:loc>
      <image:caption>Image caption</image:caption>
      <image:title>Image title</image:title>
    </image:image>
  </url>
</urlset>
```

### Sitemap Report Metrics

**Key Columns in GSC**:
```
1. Type: Standard, News, Video, Image, Sitemap Index
2. Submitted: Total URLs in sitemap
3. Indexed: URLs actually indexed by Google
4. Status: Warnings or errors
5. Last read: When Googlebot last fetched sitemap
```

### Real-Life Example 6: Low Indexing Rate Diagnosis

**Scenario**: E-commerce site with poor sitemap indexing

**Sitemap Report Data**:
```
Sitemap: https://example.com/sitemap.xml
Submitted: 50,000 URLs
Indexed: 12,000 URLs (24% index rate)
Last Read: 2 days ago
Status: Success
```

**Investigation Process**:

**Step 1**: Download and analyze sitemap
```bash
# Fetch sitemap
curl https://example.com/sitemap.xml > sitemap.xml

# Extract URLs
grep -o '<loc>[^<]*</loc>' sitemap.xml | sed 's/<loc>//; s/<\/loc>//' > urls.txt

# Count URLs
wc -l urls.txt
# Result: 50,000 URLs
```

**Step 2**: Categorize URLs in sitemap
```python
import re
from collections import Counter

with open('urls.txt', 'r') as f:
    urls = f.readlines()

categories = Counter()
for url in urls:
    if '/products/' in url:
        categories['products'] += 1
    elif '/category/' in url:
        categories['categories'] += 1
    elif '/blog/' in url:
        categories['blog'] += 1
    else:
        categories['other'] += 1

print(categories)
# Output:
# products: 45,000
# categories: 500
# blog: 2,500
# other: 2,000
```

**Step 3**: Check indexed status by category
```
Products (45,000 in sitemap):
- Indexed: 10,000 (22%)
- Discovered - not indexed: 20,000
- Crawled - not indexed: 15,000

Categories (500 in sitemap):
- Indexed: 480 (96%)

Blog (2,500 in sitemap):
- Indexed: 1,500 (60%)
```

**Step 4**: Sample URL analysis
```
Sample Product URLs with issues:

URL: /products/widget-abc-variant-123
Issue: Duplicate content (20+ similar variants)
Solution: Consolidate variants, use product with parameters

URL: /products/out-of-stock-item-456
Issue: Out of stock, thin content
Solution: Remove from sitemap until back in stock

URL: /products/new-product-789
Issue: Created yesterday, not yet crawled
Solution: Wait for natural crawling, or request indexing for critical items
```

**Root Causes Identified**:
1. **Thin Content Products**: 15,000 URLs with <100 words
2. **Out of Stock Items**: 10,000 URLs for unavailable products
3. **Variant Explosion**: 20,000 URLs for minor product variations
4. **Orphaned Products**: 5,000 URLs with no internal links

**Solution Strategy**:

```
Phase 1: Immediate Sitemap Cleanup (Week 1)
- Remove out-of-stock products: -10,000 URLs
- Remove thin content products: -15,000 URLs
- Remove minor variants: -15,000 URLs
New Sitemap: 10,000 URLs (products + categories + blog)

Phase 2: Content Improvement (Weeks 2-4)
- Enhance product descriptions
- Add technical specifications
- Include customer reviews
- Create comparison tables

Phase 3: Re-add Products Gradually (Weeks 5-12)
- Add improved products in batches of 1,000/week
- Monitor indexing rate
- Adjust based on Google's response

Phase 4: URL Structure Optimization (Ongoing)
- Convert variants to parameters: /products/widget?color=red&size=large
- Use canonical tags to consolidate signals
- Improve internal linking structure
```

**Results After 12 Weeks**:
```
New Sitemap Stats:
Submitted: 20,000 URLs (60% reduction)
Indexed: 18,500 URLs (92.5% index rate)
Quality Improvement: +70% index rate

Organic Traffic Impact:
- Overall: +35% increase
- Product pages: +45% increase
- Average time on page: +25%
- Bounce rate: -15%
```

### Sitemap Best Practices for Technical SEO

#### 1. **Dynamic Sitemap Generation**
```python
# Example: Flask application
from flask import Flask, Response
from datetime import datetime

@app.route('/sitemap.xml')
def sitemap():
    # Query database for active products
    products = db.query(Product).filter(
        Product.status == 'active',
        Product.stock > 0,
        Product.description_length > 200
    ).all()
    
    xml = ['<?xml version="1.0" encoding="UTF-8"?>']
    xml.append('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">')
    
    for product in products:
        xml.append('<url>')
        xml.append(f'<loc>{product.url}</loc>')
        xml.append(f'<lastmod>{product.updated_at.isoformat()}</lastmod>')
        xml.append(f'<changefreq>daily</changefreq>')
        
        # Priority based on stock and sales
        if product.stock > 100 and product.sales > 50:
            priority = '1.0'
        elif product.stock > 50:
            priority = '0.8'
        else:
            priority = '0.6'
        
        xml.append(f'<priority>{priority}</priority>')
        xml.append('</url>')
    
    xml.append('</urlset>')
    
    return Response('\n'.join(xml), mimetype='text/xml')
```

#### 2. **Sitemap Segmentation Strategy**
```
Large Site Structure:
/sitemap-index.xml
  ├── /sitemap-products-active.xml (10,000 URLs - updated daily)
  ├── /sitemap-products-archive.xml (5,000 URLs - updated monthly)
  ├── /sitemap-categories.xml (500 URLs - updated weekly)
  ├── /sitemap-blog-2024.xml (2,000 URLs - updated daily)
  ├── /sitemap-blog-2023.xml (1,500 URLs - static)
  └── /sitemap-pages.xml (100 URLs - updated monthly)

Benefits:
- Easier to update specific sections
- Better crawl efficiency
- Clearer performance tracking per segment
- Easier troubleshooting
```

#### 3. **Conditional URL Inclusion**
```php
// WordPress example: Only include URLs that meet quality criteria
function generate_quality_sitemap() {
    $posts = get_posts([
        'post_type' => 'post',
        'post_status' => 'publish',
        'numberposts' => -1
    ]);
    
    $urls = [];
    
    foreach ($posts as $post) {
        // Quality checks
        $word_count = str_word_count(strip_tags($post->post_content));
        $has_featured_image = has_post_thumbnail($post->ID);
        $comment_count = wp_count_comments($post->ID)->approved;
        
        // Only include if meets criteria
        if ($word_count >= 300 && $has_featured_image) {
            $urls[] = [
                'loc' => get_permalink($post),
                'lastmod' => get_the_modified_time('c', $post),
                'priority' => calculate_priority($post)
            ];
        }
    }
    
    return $urls;
}

function calculate_priority($post) {
    $age_days = (time() - strtotime($post->post_date)) / 86400;
    $views = get_post_meta($post->ID, 'views', true) ?: 0;
    
    // Newer + higher views = higher priority
    if ($age_days < 30 && $views > 1000) {
        return 1.0;
    } elseif ($age_days < 90 && $views > 500) {
        return 0.8;
    } elseif ($age_days < 180) {
        return 0.6;
    } else {
        return 0.4;
    }
}
```

---

## Core Web Vitals & Page Experience

### Understanding Core Web Vitals in GSC

GSC provides **real-world user experience data** from Chrome User Experience Report (CrUX), aggregated at the origin and URL level.

### The Three Core Web Vitals

#### 1. **Largest Contentful Paint (LCP)**
Measures loading performance.

**Thresholds**:
```
Good: ≤ 2.5 seconds
Needs Improvement: 2.5 - 4.0 seconds
Poor: > 4.0 seconds
```

**What It Measures**:
Render time of the largest content element visible in viewport (image, video, text block)

#### 2. **Interaction to Next Paint (INP)**
Measures interactivity/responsiveness.

**Thresholds**:
```
Good: ≤ 200ms
Needs Improvement: 200ms - 500ms
Poor: > 500ms
```

**What It Measures**:
Time from user interaction to visual response (replaces FID as of March 2024)

#### 3. **Cumulative Layout Shift (CLS)**
Measures visual stability.

**Thresholds**:
```
Good: ≤ 0.1
Needs Improvement: 0.1 - 0.25
Poor: > 0.25
```

**What It Measures**:
Sum of all unexpected layout shifts during page lifetime

### GSC Core Web Vitals Report

**Report Structure**:
```
Mobile / Desktop Tabs
├── Poor URLs (failing 1+ metrics)
├── URLs that need improvement
└── Good URLs (passing all metrics)

Grouped by:
- Similar issues
- Similar pages
- Page type
```

### Real-Life Example 7: Fixing Poor LCP on Product Pages

**Scenario**: E-commerce product pages failing LCP

**GSC Report Data**:
```
Mobile:
- Poor URLs: 5,000 product pages
- Issue: LCP > 4.0 seconds
- Affected Element Group: Product images

Desktop:
- Good URLs: 5,000 product pages
- LCP: 1.8 seconds average
```

**Investigation Process**:

**Step 1**: Identify common LCP elements
```javascript
// Using Chrome DevTools + Lighthouse
// Sample URLs tested:
// /products/laptop-pro-15
// /products/smartphone-x
// /products/headphones-wireless

Common Pattern Found:
LCP Element: Main product image (1200x1200px)
File Size: 500KB - 1.2MB
Format: JPEG
Loading: <img src="..." /> (no lazy loading)
```

**Step 2**: Analyze loading waterfall
```
Network Waterfall Analysis:
0ms: HTML request
200ms: HTML received
250ms: CSS request
450ms: CSS received, rendering blocked
500ms: JavaScript bundle request (2MB)
1500ms: JS received, parsing
2000ms: Image request initiated
3500ms: Image received
4200ms: LCP occurs

Problem: Image loading delayed by render-blocking resources
```

**Step 3**: Test on actual mobile device
```
Real Device Test (4G connection):
- LCP: 5.2 seconds
- Bottleneck: Large JPEG images
- Additional Issue: No caching headers
```

**Solutions Implemented**:

```
Solution 1: Image Format Optimization
Before: product.jpg (1200x1200, 800KB)
After: product.webp (1200x1200, 150KB)

HTML Update:
<picture>
  <source srcset="product-1200.webp" type="image/webp" />
  <source srcset="product-1200.jpg" type="image/jpeg" />
  <img src="product-1200.jpg" alt="Product" width="1200" height="1200" />
</picture>

Result: 81% file size reduction
```

```
Solution 2: Preload LCP Image
<head>
  <link rel="preload" 
        as="image" 
        href="product-1200.webp" 
        type="image/webp"
        fetchpriority="high" />
</head>

Result: Image request starts 1.5 seconds earlier
```

```
Solution 3: Optimize Critical Path
Before:
<link rel="stylesheet" href="all-styles.css" /> <!-- 500KB, blocks rendering -->

After:
<style>
  /* Critical CSS inlined (12KB) */
  .product-image { ... }
  .product-title { ... }
  .add-to-cart { ... }
</style>
<link rel="preload" href="all-styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'" />
<noscript><link rel="stylesheet" href="all-styles.css"></noscript>

Result: First render 600ms earlier
```

```
Solution 4: Responsive Images
<img srcset="product-400.webp 400w,
             product-800.webp 800w,
             product-1200.webp 1200w"
     sizes="(max-width: 600px) 400px,
            (max-width: 900px) 800px,
            1200px"
     src="product-1200.webp"
     alt="Product"
     width="1200"
     height="1200"
     fetchpriority="high" />

Result: Mobile devices load 400px version (45KB vs 150KB)
```

```
Solution 5: CDN + Caching
Before: Images served from origin server
After: CloudFlare CDN with aggressive caching

Cache Headers:
Cache-Control: public, max-age=31536000, immutable
```

**Implementation Code** (Node.js/Express):
```javascript
const sharp = require('sharp');
const fs = require('fs').promises;

async function generateResponsiveImages(inputPath, outputBase) {
    const sizes = [400, 800, 1200];
    
    for (const size of sizes) {
        // Generate WebP
        await sharp(inputPath)
            .resize(size, size, { fit: 'cover' })
            .webp({ quality: 85 })
            .toFile(`${outputBase}-${size}.webp`);
        
        // Generate JPEG fallback
        await sharp(inputPath)
            .resize(size, size, { fit: 'cover' })
            .jpeg({ quality: 80, progressive: true })
            .toFile(`${outputBase}-${size}.jpg`);
    }
}

// Batch process all product images
async function processAllProducts() {
    const products = await db.query('SELECT id, image_path FROM products');
    
    for (const product of products) {
        await generateResponsiveImages(
            product.image_path,
            `./images/products/${product.id}`
        );
        
        console.log(`Processed product ${product.id}`);
    }
}
```

**Results After 4 Weeks**:
```
GSC Core Web Vitals Report:

Mobile:
Before:
- Poor URLs: 5,000 (100%)
- LCP: 4.2s average

After:
- Good URLs: 4,650 (93%)
- Needs Improvement: 300 (6%)
- Poor URLs: 50 (1%)
- LCP: 2.1s average (50% improvement)

Desktop:
- Good URLs: 5,000 (100%)
- LCP: 1.2s average

Business Impact:
- Mobile conversion rate: +18%
- Bounce rate: -22%
- Average session duration: +31%
```

### Real-Life Example 8: Resolving CLS Issues

**Scenario**: Blog posts with high Cumulative Layout Shift

**GSC Report**:
```
Mobile Poor URLs: 1,500 blog posts
Issue: CLS > 0.25
Desktop: Good URLs (CLS < 0.1)
```

**Investigation**:

**Step 1**: Identify shifting elements
```javascript
// Using Chrome DevTools Performance tab
// Record page load on mobile

Layout Shifts Detected:
1. Shift at 0.5s: +0.15 (Header ads loading)
2. Shift at 1.2s: +0.08 (Social media widgets)
3. Shift at 2.0s: +0.04 (Images without dimensions)
4. Shift at 2.5s: +0.03 (Related articles section)

Total CLS: 0.30
```

**Step 2**: Analyze each shift

**Shift 1: Header Advertisement** (0.15 CLS)
```html
<!-- Before: No space reserved -->
<div id="header-ad"></div>
<script>
  // Ad loads and pushes content down
  loadAd('header-ad', 728x90);
</script>

<!-- After: Reserve space -->
<div id="header-ad" style="min-height: 90px; background: #f0f0f0;">
  <script>
    loadAd('header-ad', 728x90);
  </script>
</div>
```

**Shift 2: Social Media Widgets** (0.08 CLS)
```html
<!-- Before: Widgets render at default height -->
<div class="fb-like" data-href="..."></div>
<div class="twitter-share-button" data-url="..."></div>

<!-- After: Fixed dimensions -->
<div class="fb-like" data-href="..." style="height: 28px;"></div>
<div class="twitter-share-button" data-url="..." style="height: 28px;"></div>

<!-- Or: Load on interaction -->
<button onclick="loadSocialWidgets()" style="height: 28px;">
  Show social buttons
</button>
```

**Shift 3: Images Without Dimensions** (0.04 CLS)
```html
<!-- Before: No dimensions specified -->
<img src="blog-image.jpg" alt="..." />

<!-- After: Dimensions included -->
<img src="blog-image.jpg" 
     alt="..." 
     width="800" 
     height="450"
     style="aspect-ratio: 800/450; width: 100%; height: auto;" />

<!-- Modern approach with aspect ratio -->
<img src="blog-image.jpg" 
     alt="..." 
     style="aspect-ratio: 16/9; width: 100%; height: auto;" />
```

**Shift 4: Related Articles Section** (0.03 CLS)
```html
<!-- Before: Loaded via AJAX after page load -->
<div id="related-posts"></div>
<script>
  fetch('/api/related-posts')
    .then(r => r.json())
    .then(posts => {
      document.getElementById('related-posts').innerHTML = renderPosts(posts);
    });
</script>

<!-- After: Reserve minimum space -->
<div id="related-posts" style="min-height: 400px;">
  <div class="loading-skeleton">
    <!-- Skeleton screen matching expected layout -->
    <div class="skeleton-card"></div>
    <div class="skeleton-card"></div>
    <div class="skeleton-card"></div>
  </div>
</div>
```

**Implementation**:

```css
/* Skeleton loading styles */
.loading-skeleton {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.skeleton-card {
    height: 200px;
    background: linear-gradient(
        90deg,
        #f0f0f0 25%,
        #e0e0e0 50%,
        #f0f0f0 75%
    );
    background-size: 200% 100%;
    animation: loading 1.5s infinite;
    border-radius: 8px;
}

@keyframes loading {
    0% { background-position: 200% 0; }
    100% { background-position: -200% 0; }
}

/* Reserve space for ads */
.ad-container {
    min-height: var(--ad-height);
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f5f5f5;
}

.ad-container[data-size="728x90"] { --ad-height: 90px; }
.ad-container[data-size="300x250"] { --ad-height: 250px; }
```

```javascript
// Automated dimension injection for WordPress
add_filter('the_content', function($content) {
    // Add dimensions to images missing them
    $content = preg_replace_callback(
        '/<img((?!width=)[^>]*)src="([^"]+)"([^>]*)>/i',
        function($matches) {
            $img_path = parse_url($matches[2], PHP_URL_PATH);
            $img_file = $_SERVER['DOCUMENT_ROOT'] . $img_path;
            
            if (file_exists($img_file)) {
                list($width, $height) = getimagesize($img_file);
                return sprintf(
                    '<img%s src="%s"%s width="%d" height="%d" style="aspect-ratio: %d/%d; width: 100%%; height: auto;">',
                    $matches[1],
                    $matches[2],
                    $matches[3],
                    $width,
                    $height,
                    $width,
                    $height
                );
            }
            
            return $matches[0];
        },
        $content
    );
    
    return $content;
});
```

**Results After 6 Weeks**:
```
GSC Core Web Vitals (Mobile):

Before:
- Poor URLs (CLS > 0.25): 1,500 (100%)
- Average CLS: 0.30

After:
- Good URLs (CLS < 0.1): 1,425 (95%)
- Needs Improvement (0.1-0.25): 60 (4%)
- Poor URLs (CLS > 0.25): 15 (1%)
- Average CLS: 0.06 (80% improvement)

User Engagement:
- Pages per session: +15%
- Time on page: +12%
- Exit rate: -18%
```

---

## Mobile Usability

### What GSC Checks

The Mobile Usability report identifies issues that prevent good mobile user experience.

**Common Issues Detected**:
```
1. Uses incompatible plugins (Flash, Silverlight)
2. Viewport not set
3. Content wider than screen
4. Text too small to read
5. Clickable elements too close together
```

### Real-Life Example 9: Fixing Mobile Usability Issues

**Scenario**: Corporate website with mobile usability errors

**GSC Report**:
```
Mobile Usability Issues:
- Affected URLs: 450 pages
- Issue 1: "Text too small to read" (300 pages)
- Issue 2: "Clickable elements too close" (200 pages)
- Issue 3: "Content wider than screen" (150 pages)

Note: Some pages have multiple issues
```

**Issue 1: Text Too Small to Read**

**Investigation**:
```html
<!-- Problem code -->
<style>
  body { font-size: 12px; }
  .description { font-size: 10px; }
</style>
```

**Solution**:
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
  /* Base font size for mobile readability */
  body {
    font-size: 16px; /* Minimum recommended */
    line-height: 1.6;
  }
  
  /* Responsive typography */
  .description {
    font-size: clamp(14px, 4vw, 16px);
  }
  
  h1 {
    font-size: clamp(24px, 6vw, 32px);
  }
  
  h2 {
    font-size: clamp(20px, 5vw, 28px);
  }
  
  /* Ensure readability on all screen sizes */
  @media (max-width: 768px) {
    body {
      font-size: 16px; /* Never smaller than 16px */
    }
  }
</style>
```

**Issue 2: Clickable Elements Too Close**

**Investigation**:
```html
<!-- Problem: Navigation links too close -->
<nav>
  <a href="/home">Home</a>
  <a href="/about">About</a>
  <a href="/services">Services</a>
  <a href="/contact">Contact</a>
</nav>

<style>
nav a {
  padding: 5px;
  margin: 2px;
}
</style>
```

**Testing**:
```
Touch Target Sizes:
- Current: 30px x 20px
- Minimum Required: 48px x 48px
- Recommended: 48px x 48px with 8px spacing
```

**Solution**:
```html
<style>
/* Mobile-first navigation */
nav {
  display: flex;
  flex-direction: column;
  gap: 8px; /* Spacing between elements */
}

nav a {
  display: block;
  padding: 16px 24px; /* Larger touch targets */
  min-height: 48px;
  min-width: 48px;
  text-align: center;
  
  /* Visual feedback */
  transition: background-color 0.2s;
}

nav a:active {
  background-color: #e0e0e0;
}

/* Desktop: Horizontal layout */
@media (min-width: 768px) {
  nav {
    flex-direction: row;
    justify-content: space-between;
  }
  
  nav a {
    padding: 12px 20px;
  }
}

/* Hamburger menu for very small screens */
@media (max-width: 480px) {
  nav {
    position: fixed;
    top: 0;
    left: -100%;
    width: 80%;
    height: 100vh;
    background: white;
    transition: left 0.3s;
    z-index: 1000;
  }
  
  nav.open {
    left: 0;
  }
  
  .menu-toggle {
    display: block;
    position: fixed;
    top: 20px;
    right: 20px;
    width: 48px;
    height: 48px;
    z-index: 1001;
  }
}
</style>
```

**Issue 3: Content Wider Than Screen**

**Investigation**:
```html
<!-- Problem: Fixed-width table -->
<table width="1200">
  <tr>
    <td>Column 1</td>
    <td>Column 2</td>
    <td>Column 3</td>
    <td>Column 4</td>
    <td>Column 5</td>
  </tr>
</table>

<!-- Problem: Images with fixed width -->
<img src="banner.jpg" width="1920" height="400" />
```

**Solution**:
```html
<style>
/* Responsive tables */
.table-container {
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

table {
  width: 100%;
  max-width: 100%;
  border-collapse: collapse;
}

/* Alternative: Stack table on mobile */
@media (max-width: 768px) {
  table, tbody, tr, td {
    display: block;
    width: 100%;
  }
  
  tr {
    margin-bottom: 15px;
    border: 1px solid #ddd;
  }
  
  td {
    text-align: right;
    padding: 10px;
    position: relative;
    padding-left: 50%;
  }
  
  td:before {
    content: attr(data-label);
    position: absolute;
    left: 10px;
    font-weight: bold;
    text-align: left;
  }
}

/* Responsive images */
img {
  max-width: 100%;
  height: auto;
}

/* Prevent overflow */
* {
  box-sizing: border-box;
}

body {
  overflow-x: hidden;
}
</style>

<!-- Updated HTML -->
<div class="table-container">
  <table>
    <tr>
      <td data-label="Column 1">Data 1</td>
      <td data-label="Column 2">Data 2</td>
      <td data-label="Column 3">Data 3</td>
      <td data-label="Column 4">Data 4</td>
      <td data-label="Column 5">Data 5</td>
    </tr>
  </table>
</div>

<img src="banner.jpg" alt="Banner" style="width: 100%; height: auto;" />
```

**Complete Mobile-First CSS Framework**:
```css
/* Reset and base styles */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  font-size: 16px; /* Base font size */
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  line-height: 1.6;
  color: #333;
  overflow-x: hidden;
}

/* Typography */
h1, h2, h3, h4, h5, h6 {
  margin-bottom: 0.5em;
  font-weight: 600;
  line-height: 1.2;
}

h1 { font-size: clamp(28px, 6vw, 40px); }
h2 { font-size: clamp(24px, 5vw, 32px); }
h3 { font-size: clamp(20px, 4vw, 24px); }

p {
  margin-bottom: 1em;
  font-size: clamp(16px, 4vw, 18px);
}

/* Links and buttons */
a, button {
  min-height: 44px; /* Apple's HIG minimum */
  min-width: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 12px 24px;
  text-decoration: none;
  color: #0066cc;
}

button {
  background: #0066cc;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}

/* Touch feedback */
a:active, button:active {
  opacity: 0.7;
  transform: scale(0.98);
}

/* Images and media */
img, video, iframe {
  max-width: 100%;
  height: auto;
  display: block;
}

/* Responsive containers */
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

/* Grid system */
.grid {
  display: grid;
  gap: 20px;
  grid-template-columns: 1fr;
}

@media (min-width: 768px) {
  .grid-2 { grid-template-columns: repeat(2, 1fr); }
  .grid-3 { grid-template-columns: repeat(3, 1fr); }
  .grid-4 { grid-template-columns: repeat(4, 1fr); }
}

/* Forms */
input, textarea, select {
  width: 100%;
  padding: 12px;
  font-size: 16px; /* Prevents iOS zoom on focus */
  border: 1px solid #ddd;
  border-radius: 4px;
  margin-bottom: 16px;
}

/* Accessibility */
:focus {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}

/* Skip to content link for screen readers */
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: #000;
  color: white;
  padding: 8px;
  z-index: 100;
}

.skip-link:focus {
  top: 0;
}
```

**Validation Script**:
```javascript
// Check mobile usability programmatically
function validateMobileUsability() {
    const issues = [];
    
    // Check viewport meta tag
    const viewport = document.querySelector('meta[name="viewport"]');
    if (!viewport) {
        issues.push({
            type: 'viewport',
            message: 'Missing viewport meta tag',
            fix: '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        });
    }
    
    // Check font sizes
    const allElements = document.querySelectorAll('*');
    allElements.forEach(el => {
        const fontSize = parseFloat(window.getComputedStyle(el).fontSize);
        if (fontSize < 16 && el.textContent.trim()) {
            issues.push({
                type: 'font-size',
                element: el,
                currentSize: fontSize,
                message: `Text too small: ${fontSize}px (minimum: 16px)`
            });
        }
    });
    
    // Check touch targets
    const clickable = document.querySelectorAll('a, button, input, select, textarea');
    clickable.forEach(el => {
        const rect = el.getBoundingClientRect();
        if (rect.width < 48 || rect.height < 48) {
            issues.push({
                type: 'touch-target',
                element: el,
                currentSize: `${rect.width}x${rect.height}`,
                message: `Touch target too small (minimum: 48x48px)`
            });
        }
    });
    
    // Check horizontal overflow
    const bodyWidth = document.body.scrollWidth;
    const windowWidth = window.innerWidth;
    if (bodyWidth > windowWidth) {
        issues.push({
            type: 'overflow',
            message: `Content wider than screen: ${bodyWidth}px > ${windowWidth}px`
        });
    }
    
    return issues;
}

// Run check and log issues
const issues = validateMobileUsability();
console.table(issues);
```

**Results After 4 Weeks**:
```
GSC Mobile Usability Report:

Before:
- Affected URLs: 450
- Issue Types: 3
- Error Rate: 100%

After:
- Affected URLs: 12
- Issue Types: 1
- Error Rate: 2.7%

Remaining Issues:
- 12 legacy PDF pages (archived content, low priority)

Mobile Analytics:
- Mobile bounce rate: -25%
- Mobile session duration: +40%
- Mobile conversion rate: +32%
```

---

## Structured Data & Rich Results

### Overview

GSC monitors structured data implementation and reports eligibility for rich results in Google Search.

**Rich Result Types Monitored**:
```
- Article
- Breadcrumb
- Carousel
- Course
- Dataset
- Event
- FAQ
- How-to
- Job posting
- Local business
- Logo
- Movie
- Product
- Recipe
- Review
- Sitelinks search box
- Software app
- Video
```

### Report Structure

```
For each rich result type:
1. Valid items: Count of correctly implemented markup
2. Valid with warnings: Implemented but missing recommended properties
3. Invalid items: Errors preventing rich result display
4. Error details: Specific problems per URL
```

### Real-Life Example 10: Product Rich Results Implementation

**Scenario**: E-commerce site wants product rich results

**Initial GSC Report**:
```
Product Rich Results:
- Valid: 0
- Valid with warnings: 0
- Invalid: 0
Total: No structured data detected
```

**Implementation**:

**Step 1**: Add Product Schema
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "Wireless Bluetooth Headphones Pro",
  "image": [
    "https://example.com/photos/headphones-front.jpg",
    "https://example.com/photos/headphones-side.jpg",
    "https://example.com/photos/headphones-back.jpg"
  ],
  "description": "Premium wireless headphones with active noise cancellation and 30-hour battery life.",
  "sku": "WBHP-001",
  "mpn": "925872",
  "brand": {
    "@type": "Brand",
    "name": "AudioTech"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/products/wireless-headphones-pro",
    "priceCurrency": "USD",
    "price": "299.99",
    "priceValidUntil": "2024-12-31",
    "availability": "https://schema.org/InStock",
    "seller": {
      "@type": "Organization",
      "name": "Example Store"
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "156"
  },
  "review": [
    {
      "@type": "Review",
      "author": {
        "@type": "Person",
        "name": "John Smith"
      },
      "datePublished": "2024-10-15",
      "reviewBody": "Outstanding sound quality and comfort. Battery life is exactly as advertised.",
      "name": "Best headphones I've owned",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5",
        "bestRating": "5"
      }
    }
  ]
}
</script>
```

**Dynamic Generation** (Node.js/Express):
```javascript
function generateProductSchema(product) {
    const schema = {
        "@context": "https://schema.org/",
        "@type": "Product",
        "name": product.name,
        "image": product.images.map(img => img.url),
        "description": product.description,
        "sku": product.sku,
        "brand": {
            "@type": "Brand",
            "name": product.brand
        },
        "offers": {
            "@type": "Offer",
            "url": product.url,
            "priceCurrency": product.currency,
            "price": product.price.toFixed(2),
            "availability": product.stock > 0 
                ? "https://schema.org/InStock"
                : "https://schema.org/OutOfStock",
            "seller": {
                "@type": "Organization",
                "name": "Example Store"
            }
        }
    };
    
    // Add ratings if available
    if (product.reviews && product.reviews.length > 0) {
        const avgRating = product.reviews.reduce((sum, r) => sum + r.rating, 0) / product.reviews.length;
        
        schema.aggregateRating = {
            "@type": "AggregateRating",
            "ratingValue": avgRating.toFixed(1),
            "reviewCount": product.reviews.length.toString()
        };
        
        // Add individual reviews (up to 10)
        schema.review = product.reviews.slice(0, 10).map(review => ({
            "@type": "Review",
            "author": {
                "@type": "Person",
                "name": review.author_name
            },
            "datePublished": review.created_at.toISOString().split('T')[0],
            "reviewBody": review.text,
            "name": review.title,
            "reviewRating": {
                "@type": "Rating",
                "ratingValue": review.rating.toString(),
                "bestRating": "5"
            }
        }));
    }
    
    return schema;
}

// In route handler
app.get('/products/:slug', async (req, res) => {
    const product = await db.getProduct(req.params.slug);
    const schema = generateProductSchema(product);
    
    res.render('product', {
        product,
        structuredData: JSON.stringify(schema, null, 2)
    });
});
```

**Step 2**: Initial Testing with Rich Results Test
```
URL: https://search.google.com/test/rich-results
Test URL: https://example.com/products/wireless-headphones-pro

Results:
✓ Product detected
✓ Required properties present (name, image, offers.price, offers.availability)
⚠ Optional property missing: aggregateRating
⚠ Optional property missing: review
```

**Step 3**: Monitor in GSC

**Week 1**:
```
Product Rich Results:
- Valid: 0
- Invalid: 1,000
- Error: "Missing field 'review' (recommended)"
```

Wait for Google to recrawl (1-2 weeks for structured data changes)

**Week 3**:
```
Product Rich Results:
- Valid: 850
- Valid with warnings: 150 (missing optional properties)
- Invalid: 0
```

**Step 4**: Address Warnings
```javascript
// For products without reviews yet
if (!product.reviews || product.reviews.length === 0) {
    // Don't include review/aggregateRating properties
    // Wait until genuine reviews exist
    // NEVER fake reviews - violates Google policies
}

// Add priceValidUntil to prevent warnings
schema.offers.priceValidUntil = new Date(
    Date.now() + 90 * 24 * 60 * 60 * 1000 // 90 days from now
).toISOString().split('T')[0];
```

**Results After 6 Weeks**:
```
GSC Product Rich Results:
- Valid: 1,000 products
- Warnings: 0
- Errors: 0

Search Appearance:
- Product snippets showing in SERPs
- Star ratings visible (for 850 products with reviews)
- Price and availability displayed
- Product images in carousel

Business Impact:
- CTR improvement: +25% on product pages
- Organic traffic: +18%
- "View Product" clicks from search: +40%
```

### Real-Life Example 11: FAQ Schema for Support Pages

**Scenario**: SaaS company wants FAQ rich results

**Implementation**:
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How do I reset my password?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>To reset your password:</p><ol><li>Click 'Forgot Password' on the login page</li><li>Enter your email address</li><li>Check your email for the reset link</li><li>Click the link and create a new password</li></ol><p>If you don't receive the email within 5 minutes, check your spam folder.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "What payment methods do you accept?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>We accept the following payment methods:</p><ul><li>Credit cards (Visa, Mastercard, American Express)</li><li>Debit cards</li><li>PayPal</li><li>Bank transfers (for annual plans)</li></ul><p>All payments are processed securely through our PCI-compliant payment gateway.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Can I cancel my subscription anytime?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Yes, you can cancel your subscription at any time with no cancellation fees. Here's how:</p><ol><li>Log in to your account</li><li>Go to Settings > Subscription</li><li>Click 'Cancel Subscription'</li></ol><p>You'll continue to have access until the end of your current billing period.</p>"
      }
    }
  ]
}
</script>
```

**Important Guidelines for FAQ Schema**:
```
✓ DO:
- Only use for genuine FAQs on your site
- Include questions users actually ask
- Provide complete, helpful answers
- Keep answers concise but comprehensive
- Use HTML formatting in answers (supported)

✗ DON'T:
- Use for advertising purposes
- Include multiple FAQs about the same question
- Use on every page (only FAQ pages)
- Include questions nobody asks
- Manipulate content just for rich results
```

**GSC Monitoring**:
```
FAQ Rich Results Report:
Week 1: 0 pages detected (waiting for crawl)
Week 2: 25 pages valid
Week 4: 25 pages showing in SERPs with FAQ dropdown

CTR Impact:
Before FAQ rich results: 3.2%
After FAQ rich results: 5.8% (+81% increase)
```

### Common Structured Data Errors & Fixes

**Error 1: Missing Required Field**
```
GSC Error: "Missing field 'image' (required)"

Fix:
Ensure all required properties are present:
- Product: name, image (must be array with at least 1 URL), offers.price, offers.priceCurrency, offers.availability
- Article: headline, image, datePublished, dateModified, author
- Event: name, startDate, location
```

**Error 2: Invalid Value**
```
GSC Error: "Invalid value for 'price'"

Problem:
"price": "$299.99"  // Wrong: includes currency symbol

Fix:
"price": "299.99",  // Correct: number as string
"priceCurrency": "USD"
```

**Error 3: Inconsistent Information**
```
GSC Warning: "Value in structured data doesn't match page content"

Problem:
Schema says price is $299.99
Page displays $249.99 (sale price)

Fix:
Either:
1. Update schema to match visible price
2. Use 'price' for sale price and add 'priceSpecification' for original
```

**Error 4: Multiple Conflicting Schemas**
```
GSC Error: "Multiple schemas of same type on page"

Problem:
<script type="application/ld+json">
{ "@type": "Product", "name": "Widget" }
</script>
<script type="application/ld+json">
{ "@type": "Product", "name": "Widget Pro" }  // Conflict!
</script>

Fix:
Consolidate into single schema or use @graph:
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    { "@type": "Product", "name": "Widget" },
    { "@type": "Product", "name": "Widget Pro" }
  ]
}
</script>
```

---

## Security Issues & Manual Actions

### Security Issues

GSC alerts you to security problems detected by Google's Safe Browsing service.

**Issue Types**:
```
1. Malware: Software that harms users
2. Hacked content: Unauthorized changes to your site
3. Deceptive pages: Misleading content or phishing
4. Harmful downloads: Files that damage users' devices
5. Uncommon downloads: Rare/suspicious file types
```

### Manual Actions

Manual penalties applied by Google's human reviewers for policy violations.

**Common Manual Actions**:
```
1. Unnatural links to your site
2. Unnatural links from your site
3. Thin content with little or no added value
4. Cloaking and/or sneaky redirects
5. Pure spam
6. Hacked site
7. User-generated spam
8. Spammy structured markup
```

### Real-Life Example 12: Recovering from Link Scheme Penalty

**Scenario**: Affiliate site receives manual action

**GSC Alert**:
```
Manual Action Type: "Unnatural links to your site"
Scope: Site-wide

Message:
"Google has detected a pattern of unnatural artificial, deceptive, or manipulative links pointing to pages on this site. Buying links or participating in link schemes violates Google's Webmaster Guidelines and can negatively impact your site's ranking."

Action Date: November 1, 2024
```

**Impact**:
```
Organic Traffic Drop:
Day 1: -35%
Week 1: -50%
Week 2: -65%

Rankings:
Money keywords: Dropped from position 3-5 → 50-100
Long-tail: Dropped from position 1-10 → 20-40
```

**Recovery Process**:

**Step 1: Audit Backlink Profile**
```bash
# Export backlinks from GSC
# Analyze with Ahrefs/SEMrush for unnatural patterns
```

**Findings**:
```
Total Backlinks: 15,000
Suspicious Backlinks Identified: 4,500 (30%)

Pattern 1: Comment Spam (2,000 links)
- Blog comments with anchor text
- Irrelevant sites
- Same footer links across multiple sites

Pattern 2: Article Directories (1,500 links)
- Low-quality article submission sites
- Spun content
- Exact match anchors

Pattern 3: PBN Links (800 links)
- Private blog network
- All created same month
- Unnatural anchor text distribution

Pattern 4: Forum Profiles (200 links)
- Automated forum signatures
- No genuine engagement
```

**Step 2: Remove/Disavow Links**

**Priority 1: Request Removal**
```
Template Email:
---
Subject: Link Removal Request

Hello,

I'm reaching out regarding a link from your site to ours:
From: [their URL]
To: [your URL]
Anchor: [anchor text]

We're cleaning up our backlink profile and would appreciate if you could remove this link. 

If removal isn't possible, please let me know and I'll use Google's disavow tool.

Thank you,
[Your name]
---

Sent to: 500 highest priority domains
Response rate: 12% (60 removed)
```

**Priority 2: Disavow File Creation**
```txt
# Disavow file for example.com
# Generated: 2024-11-15
# Reason: Manual action for unnatural links

# Comment spam domains
domain:spamcomments1.com
domain:blogspam2.com
domain:comment-spam3.net

# Article directories  
domain:ezinearticles-clone1.com
domain:article-directory2.info
domain:submit-articles3.org

# PBN network
domain:pbn-site1.com
domain:pbn-site2.net
domain:pbn-site3.org

# Individual spam URLs (when can't disavow whole domain)
http://legitsite.com/spammy-directory/link.html
http://goodsite.org/user-generated-spam/profile123
```

**Upload Disavow File**:
```
1. Go to: https://www.google.com/webmasters/tools/disavow-links-main
2. Select property
3. Upload disavow.txt file
4. Confirm submission

Note: Disavow file replaces previous file, doesn't append
```

**Step 3: Clean Up On-Site Links**
```
Found Issues:
- Footer links to low-quality affiliates: Removed
- Sidebar "Partners" widget with paid links: Removed
- Blog posts with excessive affiliate links: Reduced to 2-3 per article
- "Link partners" page: Completely removed
```

**Step 4: Create New Link Building Strategy**
```
Old Strategy (Caused Penalty):
- Buy links from article directories: ✗
- Comment spam: ✗
- Forum profile links: ✗
- PBN links: ✗

New Strategy (White Hat):
- Guest posting on relevant, quality sites: ✓
- Digital PR and journalist outreach: ✓
- Creating link-worthy content (research, data): ✓
- Building relationships with industry influencers: ✓
- Earning links through product quality: ✓
```

**Step 5: Submit Reconsideration Request**

**First Attempt** (Rejected):
```
Submission Date: November 20, 2024

Our Message:
"We have removed some unnatural links and disavowed others. Please reconsider our site."

Google Response (December 1, 2024):
"We reviewed your site and the sample URLs provided. We still see violations of our webmaster guidelines. Please take further action."

Reason for Rejection: Too vague, insufficient action
```

**Second Attempt** (Accepted):
```
Submission Date: December 15, 2024

Our Message:
"We've completed a comprehensive backlink cleanup:

1. MANUAL REMOVAL EFFORTS:
   - Contacted 500 webmasters
   - Successfully removed 60 unnatural links
   - Documentation: [Google Sheet with outreach log]

2. DISAVOW FILE:
   - Disavowed 4,440 unnatural links
   - Categories: Comment spam, article directories, PBNs
   - File uploaded: December 10, 2024

3. SPECIFIC EXAMPLES OF REMOVED LINKS:
   - spamcomments1.com/page123 (removed via webmaster request)
   - article-directory2.info/submit/456 (disavowed)
   - pbn-site3.org/link (disavowed)
   [Full list of 50 examples with before/after screenshots]

4. ON-SITE IMPROVEMENTS:
   - Removed 'Link Partners' page
   - Removed paid footer links
   - Reduced affiliate links per article to 2-3 max
   - Updated editorial guidelines

5. NEW LINK BUILDING POLICY:
   We've implemented strict guidelines:
   - No paid links without nofollow
   - No comment spam or automated linking
   - Quality over quantity approach
   - Documented approval process

We understand we violated Google's guidelines and have taken comprehensive action to clean up our backlink profile. We're committed to white-hat SEO going forward.

Thank you for reconsidering our site."

Google Response (December 22, 2024):
"Your reconsideration request has been approved. The manual action on your site has been revoked."
```

**Step 6: Recovery Timeline**
```
Week 1-2 Post-Approval:
- Rankings: Slight improvement (position 40-60 for main keywords)
- Traffic: Still down 60%

Week 3-4:
- Rankings: Moderate recovery (position 20-30)
- Traffic: Down 40%

Week 5-8:
- Rankings: Significant recovery (position 8-15)
- Traffic: Down 15%

Week 9-12:
- Rankings: Strong recovery (position 5-10)
- Traffic: Back to 95% of pre-penalty levels

Month 4-6:
- Rankings: Exceeding pre-penalty (position 3-8)
- Traffic: 110% of pre-penalty (better quality links now)
```

**Lessons Learned**:
```
1. Quality backlinks take time but are worth it
2. Be thorough and specific in reconsideration requests
3. Document all cleanup efforts
4. Be patient - recovery takes 2-4 months minimum
5. Use penalty as opportunity to build proper foundation
```

---

## Crawl Stats Report

### Overview

The Crawl Stats report shows **how Googlebot interacts with your server** over time.

**Key Metrics**:
```
1. Total Crawl Requests: Number of URLs Googlebot tried to fetch
2. Total Download Size: Bandwidth consumed by crawling
3. Average Response Time: How quickly your server responds
4. Crawl Request Status: Breakdown by HTTP status code
5. File Type: Crawled resources by type (HTML, CSS, JS, images)
6. Purpose: Why Googlebot crawled (discovery, refresh)
7. Googlebot Type: Desktop, Mobile, other bots
```

### Real-Life Example 13: Optimizing Crawl Budget

**Scenario**: News site with crawl budget issues

**Initial Crawl Stats**:
```
Daily Crawl Requests: 50,000
Download Size: 2.5GB/day
Average Response Time: 850ms

Breakdown:
- HTML pages: 10,000 (20%)
- Images: 25,000 (50%)
- JavaScript: 8,000 (16%)
- CSS: 3,000 (6%)
- Other: 4,000 (8%)

Status Codes:
- 200 OK: 35,000 (70%)
- 404 Not Found: 10,000 (20%)
- 301 Redirect: 3,000 (6%)
- 500 Server Error: 2,000 (4%)
```

**Problems Identified**:

**Problem 1: Wasting Crawl Budget on 404s**
```
Analysis:
10,000 daily 404 requests = 20% of crawl budget wasted

Top 404 URLs (from server logs):
/blog/2019/old-article-1 - 500 requests/day
/blog/2019/old-article-2 - 450 requests/day
/products/discontinued-item-1 - 400 requests/day
...

Cause: Old internal links + external backlinks to removed content
```

**Solution for 404s**:
```
Step 1: Identify valuable 404s to redirect
- Used Ahrefs to find backlinks to 404 pages
- Prioritized by backlink count and domain authority

Step 2: Implement 301 redirects
# .htaccess example
Redirect 301 /blog/2019/old-article-1 /blog/2024/updated-article
Redirect 301 /products/discontinued-item-1 /products/new-item

Step 3: Return 410 Gone for truly dead pages
# For pages with no suitable redirect target
RewriteRule ^blog/2018/temporary-promotion$ - [R=410,L]

Step 4: Remove internal links to 404 pages
# Automated check with Screaming Frog
- Found 2,500 internal links to 404s
- Updated via database query
```

**Problem 2: Server Errors**
```
Analysis:
2,000 daily 500 errors = 4% of crawl budget + indexing issues

Error Log Analysis:
[2024-11-20 10:15:32] 500 - /api/product-recommendations - Timeout after 30s
[2024-11-20 10:16:45] 500 - /search?q=... - Database connection failed
[2024-11-20 10:18:12] 500 - /category/electronics - Memory limit exceeded

Patterns:
- API timeouts: 40%
- Database issues: 35%
- Memory exhaustion: 25%
```

**Solution for Server Errors**:
```
Fix 1: Block API endpoints from crawling
robots.txt addition:
User-agent: *
Disallow: /api/

Fix 2: Optimize database queries
Before:
SELECT * FROM products 
WHERE category_id = 5 
ORDER BY created_at DESC;  -- Full table scan

After:
SELECT id, name, price, image 
FROM products 
WHERE category_id = 5 AND status = 'active'
ORDER BY created_at DESC
LIMIT 50;  -- Added index on (category_id, status, created_at)

Result: Query time 2500ms → 45ms

Fix 3: Implement caching
# Nginx caching config
proxy_cache_path /var/cache/nginx levels=1:2 
                 keys_zone=my_cache:10m 
                 max_size=1g inactive=60m;

location / {
    proxy_cache my_cache;
    proxy_cache_valid 200 60m;
    proxy_cache_valid 404 10m;
    add_header X-Cache-Status $upstream_cache_status;
}

Fix 4: Increase PHP memory limit
php.ini:
memory_limit = 256M  (was 128M)
```

**Problem 3: Inefficient Image Crawling**
```
Analysis:
25,000 daily image crawls = 50% of requests
But images rarely change

Insight:
Googlebot re-crawling same images frequently
```

**Solution**:
```
Implement proper caching headers for images:

Before:
Cache-Control: no-cache

After:
# Apache .htaccess
<IfModule mod_headers.c>
  <FilesMatch "\.(jpg|jpeg|png|gif|webp)$">
    Header set Cache-Control "public, max-age=31536000, immutable"
  </FilesMatch>
</IfModule>

# Nginx
location ~* \.(jpg|jpeg|png|gif|webp)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

Result: Image re-crawl rate dropped 70%
```

**Problem 4: JavaScript Crawl Budget**
```
Analysis:
8,000 daily JS file requests
Many files unchanged for months
```

**Solution**:
```
1. Implement versioned filenames:
Before: script.js (crawled every day)
After: script.v2.4.1.js (crawled once)

2. Add cache headers:
Cache-Control: public, max-age=31536000, immutable

3. Use HTTP/2 Server Push:
Link: </css/styles.css>; rel=preload; as=style
Link: </js/app.js>; rel=preload; as=script

Result: JS crawl requests reduced 60%
```

**Results After Optimization**:
```
New Crawl Stats (4 weeks later):

Daily Crawl Requests: 35,000 (was 50,000)
Download Size: 1.2GB/day (was 2.5GB)
Average Response Time: 280ms (was 850ms)

Breakdown:
- HTML pages: 18,000 (51%) - increased from 10,000!
- Images: 8,000 (23%) - decreased from 25,000
- JavaScript: 3,000 (9%) - decreased from 8,000
- CSS: 1,500 (4%) - decreased from 3,000
- Other: 4,500 (13%)

Status Codes:
- 200 OK: 32,000 (91%) - up from 70%
- 404 Not Found: 500 (1.4%) - down from 20%
- 301 Redirect: 2,000 (5.7%) - down from 6%
- 500 Server Error: 500 (1.4%) - down from 4%

Impact on Indexing:
- New pages indexed: 50% faster (2 days → 1 day)
- Fresh content crawl rate: +80%
- Index coverage: +15% (more quality pages indexed)
- Organic traffic: +22% (better index freshness)
```

**Crawl Budget Best Practices**:
```
DO:
✓ Monitor server logs alongside GSC crawl stats
✓ Fix technical errors (404s, 500s) immediately
✓ Implement aggressive caching for static assets
✓ Use robots.txt to block low-value URLs
✓ Improve server response time (<200ms ideal)
✓ Use sitemap to guide Googlebot to important pages

DON'T:
✗ Let Googlebot waste resources on infinite scrolls
✗ Allow crawling of duplicate parameterized URLs
✗ Forget about soft 404s (empty pages returning 200)
✗ Block crawling then wonder why pages aren't indexed
✗ Ignore crawl errors reported in GSC
```

---

## Technical Audit Workflows

### Complete Site Audit Checklist

#### 1. Initial Health Check (15 minutes)

```
GSC Quick Scan:
□ Check Coverage Report for indexing issues
□ Review Core Web Vitals for performance problems
□ Check Mobile Usability for mobile issues
□ Look for Manual Actions or Security Issues
□ Review Overview for any red flags

Priority Issues:
- Manual action → Immediate attention
- Security issue → Urgent fix
- Coverage errors → Investigate within 24 hours
- CWV poor → Plan optimization within week
```

#### 2. Index Coverage Deep Dive (30 minutes)

```
Analysis Steps:
□ Export all URLs with issues
□ Categorize by error type
□ Identify patterns (affected URL types)
□ Check top 20 affected URLs individually
□ Compare submitted vs. indexed ratio in sitemap

Document:
- Total valid pages
- Total excluded pages (intentional vs. problematic)
- Total error pages
- Top 3 indexing issues by volume
```

#### 3. URL Inspection Sampling (20 minutes)

```
Test Representative URLs:
□ Homepage
□ 5 important product/service pages
□ 3 blog posts (new, medium-age, old)
□ 2 category pages
□ 1 about/contact page

For Each URL Check:
- Index status
- Canonical tag (user vs. Google-selected)
- Mobile usability
- Structured data
- Page experience
- Last crawl date
```

#### 4. Technical Infrastructure (45 minutes)

```
Robots.txt Review:
□ Check for accidental blocks: example.com/robots.txt
□ Verify sitemap declaration
□ Look for deprecated directives
□ Test with URL Inspection "Test Live URL"

Sitemap Audit:
□ Check sitemap index structure
□ Review submitted vs. indexed ratio
□ Identify sitemaps with low index rate
□ Verify lastmod dates are accurate
□ Check for errors/warnings

Crawl Stats Analysis:
□ Review average response time (target: <200ms)
□ Check error rates (target: <5%)
□ Identify wasteful crawling patterns
□ Look for server capacity issues
```

#### 5. Performance & Experience (30 minutes)

```
Core Web Vitals:
□ Review pass rate for Mobile
□ Review pass rate for Desktop
□ Identify page groups with poor metrics
□ Prioritize fixes by traffic volume

Mobile Usability:
□ Check for any issues
□ Sample test 5 mobile URLs manually
□ Verify viewport configuration
□ Test touch target sizes
```

#### 6. Enhancements & Rich Results (20 minutes)

```
Structured Data:
□ Review all rich result types
□ Check error and warning counts
□ Test sample URLs in Rich Results Test tool
□ Verify markup matches visible content

Enhancements:
□ Check Breadcrumb status
□ Review Logo status
□ Check Sitelinks Search Box (if applicable)
□ Review other applicable enhancements
```

#### 7. Security & Penalties (10 minutes)

```
Manual Actions:
□ Check for any active penalties
□ Review partial matches
□ Document resolution history

Security Issues:
□ Check for malware/hacking warnings
□ Review any suspicious activity
□ Verify HTTPS implementation
```

### Monthly Monitoring Routine

```
Week 1: Index Health
- Export and compare index coverage month-over-month
- Review newly discovered issues
- Check sitemap indexing rates

Week 2: Performance
- Analyze Core Web Vitals trends
- Review Mobile Usability changes
- Check average response times

Week 3: Content & Rich Results
- Review structured data status
- Check for enhancement errors
- Analyze search appearance features

Week 4: Comprehensive Report
- Compile all findings
- Create priority action list
- Document improvements from previous month
- Set goals for next month
```

---

## Advanced Troubleshooting

### Issue: Sudden Drop in Indexed Pages

**Investigation Workflow**:

```
Step 1: Quantify the drop
- Check Coverage Report for before/after counts
- Note date when drop occurred
- Export affected URLs

Step 2: Identify exclusion reasons
- Most common: "Crawled - currently not indexed"
- Second: "Discovered - currently not indexed"
- Third: "Duplicate without user-selected canonical"

Step 3: Sample URL analysis
- Pick 10 affected URLs
- Use URL Inspection Tool on each
- Look for common patterns

Step 4: Check recent site changes
- Code deployments around drop date
- CMS updates
- Robots.txt changes
- Template modifications
- Server migrations

Step 5: External factors
- Algorithm updates (Google announcements)
- Core Web Vitals degradation
- Server issues/downtime
- CDN problems

Step 6: Content quality assessment
- Word count of affected pages
- Uniqueness (check for duplication)
- Internal linking to affected pages
- Backlinks to affected pages
```

### Issue: Pages Indexed But Not Ranking

**Diagnosis Steps**:

```
Confirm indexing:
site:example.com "exact page title"
✓ Result appears → Page is indexed

Check potential problems:
□ Canonical tag pointing elsewhere?
□ Low-quality content (thin, duplicate)?
□ Poor Core Web Vitals?
□ No internal links to page?
□ Orphaned content?
□ Recently published (give it time)?
□ Highly competitive keywords?
□ Manual action affecting site?

Use URL Inspection:
- Verify Google-selected canonical matches URL
- Check mobile usability
- Review Core Web Vitals for this URL
- Look at referring page
```

### Issue: Rich Results Not Showing

**Troubleshooting**:

```
Step 1: Verify structured data is valid
- Use Rich Results Test tool
- Check for errors
- Ensure required properties present

Step 2: Check if indexed
- site:example.com
- Find the page
- Check if rich result appears

Step 3: Search with exact query
- Use branded search
- See if rich result shows up
- Try different devices (mobile/desktop)

Step 4: Wait for processing
- Structured data changes take 1-4 weeks
- Re-indexing required
- Can request indexing to speed up

Step 5: Check eligibility
- Not all pages qualify for all rich results
- Google may choose not to show even with valid markup
- High-quality content required

Common mistakes:
- Mismatched visible content vs. schema
- Missing required images
- Invalid URL formats
- Wrong date formats (use ISO 8601)
- Violating content policies
```

### Issue: Slow Crawling

**Solutions**:

```
Immediate actions:
1. Check Crawl Stats for server errors
   → Fix 5xx errors immediately

2. Improve server response time
   → Target: <200ms
   → Use caching, CDN, optimize database

3. Fix broken internal links
   → Remove links to 404 pages
   → Fix redirect chains

4. Update sitemap
   → Include only important, live URLs
   → Remove old/dead content
   → Update lastmod dates

5. Increase crawl rate (if server can handle)
   → GSC > Settings > Crawl rate
   → Only if server response time is good

6. Strategic internal linking
   → Link to important pages from homepage
   → Use HTML sitemaps
   → Implement breadcrumbs

7. Remove crawl traps
   → Infinite scroll/pagination
   → Calendar systems
   → Filter combinations
   → Use robots.txt or nofollow
```

---

## API Integration

### Google Search Console API

Access GSC data programmatically for:
- Automated monitoring
- Custom dashboards
- Integration with other tools
- Bulk analysis

**Setup**:

```python
# Install library
pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

# Authentication
from google.oauth2 import service_account
from googleapiclient.discovery import build

SCOPES = ['https://www.googleapis.com/auth/webmasters.readonly']
SERVICE_ACCOUNT_FILE = 'credentials.json'

credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES)

service = build('searchconsole', 'v1', credentials=credentials)
```

**Example: Get Index Coverage Data**

```python
def get_index_coverage(site_url):
    """
    Fetch index coverage data from GSC API
    """
    # Request coverage data
    request = {
        'siteUrl': site_url,
        'inspectionUrl': site_url,
    }
    
    response = service.urlTestingTools().mobileFriendlyTest().run(
        body=request
    ).execute()
    
    return response

# Usage
site = 'https://example.com/'
coverage = get_index_coverage(site)
print(f"Mobile friendly: {coverage.get('mobileFriendliness')}")
```

**Example: Monitor Core Web Vitals**

```python
import pandas as pd
from datetime import datetime, timedelta

def get_cwv_data(site_url, days=28):
    """
    Retrieve Core Web Vitals data for the last N days
    """
    end_date = datetime.now()
    start_date = end_date - timedelta(days=days)
    
    request = {
        'startDate': start_date.strftime('%Y-%m-%d'),
        'endDate': end_date.strftime('%Y-%m-%d'),
        'dimensions': ['DATE', 'PAGE'],
        'type': 'WEB',
    }
    
    response = service.searchanalytics().query(
        siteUrl=site_url,
        body=request
    ).execute()
    
    # Convert to DataFrame
    df = pd.DataFrame(response.get('rows', []))
    
    return df

# Usage
cwv_data = get_cwv_data('sc-domain:example.com')
print(cwv_data.head())
```

**Example: Automated Daily Report**

```python
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def generate_daily_report(site_url):
    """
    Generate and email daily GSC health report
    """
    # Fetch data
    coverage = get_coverage_summary(site_url)
    cwv = get_cwv_summary(site_url)
    errors = get_recent_errors(site_url)
    
    # Format report
    report = f"""
    Daily GSC Health Report - {datetime.now().strftime('%Y-%m-%d')}
    
    INDEX COVERAGE:
    - Valid Pages: {coverage['valid']}
    - Excluded: {coverage['excluded']}
    - Errors: {coverage['error']}
    - Change from yesterday: {coverage['change']}
    
    CORE WEB VITALS:
    - Good URLs: {cwv['good']} ({cwv['good_pct']}%)
    - Poor URLs: {cwv['poor']} ({cwv['poor_pct']}%)
    
    RECENT ERRORS:
    {errors}
    
    View full report: https://search.google.com/search-console?resource_id={site_url}
    """
    
    # Send email
    send_email(report)
    
def send_email(body):
    msg = MIMEMultipart()
    msg['From'] = 'reports@example.com'
    msg['To'] = 'seo-team@example.com'
    msg['Subject'] = f'GSC Daily Report - {datetime.now().strftime("%Y-%m-%d")}'
    
    msg.attach(MIMEText(body, 'plain'))
    
    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.starttls()
        server.login('reports@example.com', 'password')
        server.send_message(msg)

# Schedule with cron or Windows Task Scheduler
# 0 9 * * * /usr/bin/python3 /path/to/gsc_report.py
```

---

## Best Practices Summary

### Daily Habits

```
✓ Check Overview for critical alerts
✓ Monitor coverage trends
✓ Review any new errors
✓ Check Core Web Vitals for major changes
```

### Weekly Reviews

```
✓ Deep dive into coverage issues
✓ Analyze crawl stats
✓ Review mobile usability
✓ Check structured data status
✓ Monitor sitemap indexing rates
```

### Monthly Analysis

```
✓ Comprehensive index coverage audit
✓ Performance benchmarking
✓ Competitive analysis (if using API)
✓ Content quality assessment
✓ Technical debt review
```

### Quarterly Strategic Review

```
✓ Year-over-year comparison
✓ Goal setting for next quarter
✓ Technical infrastructure assessment
✓ Tool and process improvements
✓ Team training needs
```

---

## Key Takeaways

1. **GSC is Your Direct Line to Google**: Treat it as authoritative source for indexing and crawling data

2. **URL Inspection is Your Best Friend**: Use it liberally for troubleshooting individual pages

3. **Coverage Report Tells the Story**: Regular monitoring prevents massive deindexing surprises

4. **Core Web Vitals Matter**: Real-user experience data directly impacts rankings

5. **Structured Data Requires Maintenance**: Valid markup today can become invalid with content changes

6. **Crawl Budget is Finite**: Optimize to ensure important pages get crawled frequently

7. **Mobile-First is Default**: Always prioritize mobile experience and usability

8. **API Enables Scale**: Automate monitoring for large sites or multiple properties

9. **Documentation is Critical**: Keep detailed logs of changes and their GSC impact

10. **Patience is Required**: Most technical changes take 1-4 weeks to fully reflect in GSC

---

## Additional Resources

### Official Documentation
- Google Search Console Help: https://support.google.com/webmasters
- Google Search Central: https://developers.google.com/search
- Search Console API: https://developers.google.com/webmasters/search-console-api-original

### Tools for Enhanced Analysis
- Screaming Frog SEO Spider: Desktop crawler for technical audits
- Ahrefs/SEMrush: Backlink and keyword analysis
- PageSpeed Insights: Detailed performance metrics
- Mobile-Friendly Test: Quick mobile usability check
- Rich Results Test: Validate structured data

### Recommended Reading
- Google Webmaster Guidelines
- Google Search Quality Evaluator Guidelines
- Web.dev: Performance and best practices
- Schema.org: Structured data documentation

---

**End of Guide**

This comprehensive guide covers Google Search Console from a technical SEO perspective, providing you with the knowledge and real-world examples needed to effectively audit, monitor, and optimize websites. Each example is drawn from actual scenarios SEO professionals encounter, giving you practical insights beyond basic documentation.

Remember: GSC is a diagnostic tool, not a magic solution. Use it to identify issues, but the real work is in implementing fixes and improvements on your site.