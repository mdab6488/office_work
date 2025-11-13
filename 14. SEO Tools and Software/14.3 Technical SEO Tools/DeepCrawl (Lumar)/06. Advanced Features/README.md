
## Advanced Features

### 1. Custom Extraction

**What It Does:**
Extracts custom data points from pages using CSS selectors, XPath, or regex.

**Real-World Example: Price Monitoring**

**Scenario:** Monitor product prices across 50,000 products to ensure they're displaying correctly.

**Configuration:**
```yaml
Custom Extraction Rule:
  Name: "Product Price"
  Type: CSS Selector
  Selector: ".product-price span.amount"
  Pages: "URL contains '/product/'"
  Data Type: Currency
  Alert: If empty or equals $0.00
```

**Results:**
```
Products Checked: 50,000
Valid Prices: 49,234 (98.5%)
Missing Prices: 543 (1.1%)
$0.00 Prices: 223 (0.4%)
```

**Action:** Fix 766 products with price display issues.

### 2. Custom Segmentation

**What It Does:**
Groups pages into segments for targeted analysis.

**Real-World Example: Content Type Segmentation**

**Scenario:** You manage a media site with different content types. You need separate performance metrics for each.

**Segment Configuration:**
```yaml
Segments:
  1. Blog Posts:
     Rule: URL contains "/blog/"
     
  2. News Articles:
     Rule: URL contains "/news/"
     
  3. Product Reviews:
     Rule: URL contains "/reviews/"
     
  4. Category Pages:
     Rule: URL matches "/(category|tag)/"
     
  5. Landing Pages:
     Rule: URL contains "/landing/"
```

**Segmented Analysis:**
```
Blog Posts (12,456 pages):
- Average Word Count: 847 words
- Average Load Time: 1.8s
- Indexability: 98%
- Average Internal Links: 12

News Articles (8,934 pages):
- Average Word Count: 423 words
- Average Load Time: 1.4s
- Indexability: 95%
- Average Internal Links: 8

Product Reviews (4,567 pages):
- Average Word Count: 1,234 words
- Average Load Time: 2.3s
- Indexability: 99%
- Average Internal Links: 18

Key Insights:
- Blog posts need more internal linking
- News articles may be too thin (sub-500 words)
- Product reviews load slowest (image heavy)
```

### 3. JavaScript Rendering Comparison

**What It Does:**
Compares content before and after JavaScript rendering to identify SEO issues.

**Real-World Example: React SPA Audit**

**Scenario:** Your React-based site isn't ranking well. You suspect content isn't visible to search engines.

**Process:**

#### Configuration:
```yaml
Crawl Settings:
  JavaScript Rendering: Enabled
  Compare Rendered vs Raw HTML: Yes
  Rendering Wait Time: 5 seconds
  Network Idle Time: 2 seconds
```

#### Analysis Results:
```
Pages with Content Differences: 3,456 (68%)

Critical Issues:
- Title tag only appears after JS: 2,341 pages
- Meta description only after JS: 2,897 pages
- Main content only after JS: 1,234 pages
- Internal links only after JS: 987 pages
- Structured data only after JS: 456 pages
```

**Key Finding:** Critical SEO elements loading only via JavaScript, potentially invisible to search engines.

**Solutions:**

1. **Server-Side Rendering (SSR):**
```javascript
// Implement Next.js for React
// or Nuxt.js for Vue.js
export async function getServerSideProps(context) {
  return {
    props: {
      title: "Product Name",
      description: "Product description",
      content: "Main content here"
    }
  };
}
```

2. **Pre-rendering:**
```javascript
// Use prerender.io or similar service
// Serve pre-rendered HTML to bots
if (isBot(userAgent)) {
  return prerenderedHTML;
} else {
  return dynamicApp;
}
```

3. **Dynamic Rendering:**
```nginx
# Nginx configuration
location / {
    if ($http_user_agent ~* "googlebot|bingbot") {
        proxy_pass http://prerender-service;
    }
    proxy_pass http://app-server;
}
```

### 4. Log File Analysis Integration

**What It Does:**
Combines crawl data with server log analysis to understand actual bot behavior.

**Real-World Example: Crawl Budget Optimization**

**Scenario:** Google crawls 100,000 pages daily on your 500,000-page site, but you suspect it's crawling the wrong pages.

**Process:**

#### Step 1: Upload Log Files
```
1. Navigate to Log File Analyzer
2. Upload server logs (Apache/Nginx)
3. Select date range: Last 30 days
4. Filter: Googlebot only
```

#### Step 2: Analysis Results
```
Googlebot Activity (30 days):
- Total Crawls: 2,847,392
- Unique URLs: 156,734
- Average Daily Crawls: 94,913
- Server Errors Encountered: 12,345

Pages Crawled Most:
1. Faceted navigation URLs: 847,392 (29.8%)
2. Parameter variations: 623,145 (21.9%)
3. Pagination pages: 412,567 (14.5%)
4. Important product pages: 287,456 (10.1%)
5. Blog articles: 234,567 (8.2%)
```

**Key Finding:** 66% of Googlebot's crawl budget wasted on faceted navigation and parameter pages.

**Optimization Actions:**

1. **Block Faceted URLs in robots.txt:**
```
User-agent: Googlebot
Disallow: /*?filter=
Disallow: /*?sort=
Disallow: /*?price_min=
Disallow: /*?price_max=
```

2. **Use Canonical Tags:**
```html
<!-- On filtered pages, point to clean URLs -->
<link rel="canonical" href="https://www.example.com/category/shoes/" />
```

3. **Implement URL Parameters in Search Console:**
```
Go to: Search Console > Legacy Tools > URL Parameters
Set: "filter" - Let Googlebot decide (Representative URLs)
Set: "sort" - No URLs (No URLs)
Set: "page" - Paginates (Let Googlebot decide)
```

**Expected Outcome:**
- Reduce wasted crawl budget from 66% to 20%
- Increase crawling of important pages by 200%
- Improve indexation of new product pages

### 5. PageSpeed Integration

**What It Does:**
Integrates Google PageSpeed Insights data directly into crawl reports.

**Real-World Example: Core Web Vitals Audit**

**Scenario:** Identify and prioritize pages failing Core Web Vitals before the ranking impact.

**Configuration:**
```yaml
PageSpeed Settings:
  API Key: [Your Google API Key]
  Devices: Desktop + Mobile
  Metrics: All Core Web Vitals
  Threshold: Pages with LCP > 2.5s
```

**Results:**
```
Pages Analyzed: 10,000
Pages Passing CWV: 6,234 (62%)
Pages Failing CWV: 3,766 (38%)

Failed Metrics Breakdown:
- LCP > 2.5s: 2,891 pages (77%)
- FID > 100ms: 876 pages (23%)
- CLS > 0.1: 1,234 pages (33%)

Top Issues by Template:
1. Product Pages (LCP: 3.8s avg)
   - Large hero images (2MB+)
   - Unoptimized images
   - Render-blocking CSS
   
2. Blog Posts (LCP: 3.2s avg)
   - Third-party embeds
   - Auto-playing videos
   - Heavy ad scripts
   
3. Category Pages (CLS: 0.18 avg)
   - Lazy-loaded images without dimensions
   - Dynamic ad insertion
   - Late-loading fonts
```

**Prioritized Fix Plan:**

**Priority 1: Product Pages (30% of organic revenue)**
```html
<!-- Before -->
<img src="product-image.jpg" />

<!-- After -->
<img src="product-image.jpg" 
     width="800" 
     height="600"
     loading="lazy"
     srcset="product-image-400.webp 400w,
             product-image-800.webp 800w,
             product-image-1200.webp 1200w"
     sizes="(max-width: 600px) 400px,
            (max-width: 1200px) 800px,
            1200px" />
```

**Priority 2: Implement Critical CSS**
```html
<head>
  <style>
    /* Critical CSS inlined */
    .header { ... }
    .product-info { ... }
  </style>
  <link rel="preload" href="main.css" as="style" onload="this.rel='stylesheet'">
</head>
```

**Priority 3: Optimize Third-Party Scripts**
```html
<!-- Load scripts after page load -->
<script defer src="analytics.js"></script>
<script async src="ads.js"></script>
```

### 6. Custom Alerts and Monitoring

**What It Does:**
Sets up automated alerts for critical issues detected during scheduled crawls.

**Real-World Example: Proactive Issue Detection**

**Scenario:** Prevent technical issues from impacting rankings by catching them immediately.

**Alert Configuration:**
```yaml
Alert: "Critical Indexability Drop"
Trigger: If indexable pages decrease > 5%
Recipients: SEO Team Lead, Dev Team Lead
Priority: Critical
Action: Pause deployments until resolved

Alert: "New 404 Errors"
Trigger: If new 404s > 50 pages
Recipients: SEO Team, Content Team
Priority: High
Action: Investigate and fix within 24 hours

Alert: "Robots.txt Changes"
Trigger: If robots.txt file modified
Recipients: Entire Tech Team
Priority: Critical
Action: Review changes immediately

Alert: "Page Speed Degradation"
Trigger: If average LCP increases > 15%
Recipients: Frontend Team
Priority: Medium
Action: Investigate performance regression

Alert: "Duplicate Title Tags"
Trigger: If duplicate titles increase > 10%
Recipients: Content Team
Priority: Medium
Action: Review and update titles
```

**Real Incident Example:**

```
Date: February 15, 2025, 3:47 AM
Alert: "Critical Indexability Drop"
Details:
- Previous crawl: 45,678 indexable pages
- Current crawl: 12,345 indexable pages
- Drop: 73% (33,333 pages)
- Trigger: robots.txt modified at 2:14 AM

Root Cause:
Developer accidentally added this line to robots.txt:
Disallow: /

Action Taken:
- Alert sent at 3:47 AM
- Team rolled back robots.txt at 4:12 AM
- Issue resolved before business hours
- Prevented major ranking and traffic loss
```

---
