
## Technical SEO Crawling

### Running Your First Crawl

#### Starting a Crawl

```
OnCrawl Dashboard > Projects > [Your Project] > Launch Crawl

Options:
1. Full Crawl: Crawl entire site from scratch
2. Incremental Crawl: Only crawl changes since last crawl
3. Specific Section: Crawl only certain URL patterns
4. Scheduled Crawl: Set up recurring crawls
```

**Real-World Example: E-commerce Site**

```
Site: Fashion E-commerce (250,000 URLs)
Crawl Configuration:

Start URLs:
- https://www.fashionstore.com/
- https://www.fashionstore.com/sitemap.xml (seed from sitemap)

Segmentation Rules:
1. Homepage: ^https://www.fashionstore.com/$
2. Category: /category/[^/]+/$
3. Products: /product/[^/]+/$
4. Blog: /blog/.*
5. Sale: /sale/.*

Crawl Speed: 5 pages/second (to avoid server overload)
JS Rendering: Enabled (React-based site)

Estimated Time: 13-14 hours
```

### Analyzing Crawl Results

#### 1. Crawl Overview Dashboard

**Key Metrics to Check First:**

```
Total Pages Discovered: 247,532
HTTP Status Breakdown:
  ├── 200 OK: 198,450 (80.2%)
  ├── 301/302 Redirects: 15,230 (6.2%)
  ├── 404 Not Found: 28,652 (11.6%)
  ├── 500 Server Errors: 2,150 (0.9%)
  └── 503 Service Unavailable: 3,050 (1.2%)

Average Page Depth: 3.2 clicks from homepage
Orphan Pages: 12,450 pages (5%)
Duplicate Titles: 8,920 pages (3.6%)
Missing Meta Descriptions: 15,340 pages (6.2%)
```

**Immediate Red Flags:**
```
🚨 More than 5% 404 errors → Check link structure
🚨 More than 10% redirects → Optimize redirect chains
🚨 Any 500 errors → Server issues need immediate attention
🚨 Orphan pages > 2% → Internal linking problems
🚨 Duplicate titles > 5% → Content/template issues
```

#### 2. Technical Issues Report

**Common Issues OnCrawl Detects:**

**Issue #1: Redirect Chains**
```
Example Chain Found:
Step 1: /old-product → 301 → /product-v2
Step 2: /product-v2 → 301 → /product-current
Step 3: /product-current → 200 OK

Problem: 
- Wastes crawl budget (3 requests instead of 1)
- Slower page load
- Link equity dilution

OnCrawl Solution:
- Lists all redirect chains
- Shows chain length
- Identifies source of redirects
- Calculates crawl budget waste

Action:
Replace: /old-product → /product-current (single jump)
```

**Issue #2: Thin Content Pages**

```
OnCrawl Detection:
Pages with < 200 words: 15,450 pages

Breakdown by Section:
- Category pages: 230 (mostly empty categories)
- Product pages: 12,100 (out of stock, minimal descriptions)
- Blog posts: 2,020 (incomplete drafts)
- Other: 1,100

Real Example: Pet Supply Store

Thin Content Products:
https://petstore.com/dog-collar-blue
Content Length: 45 words
Content: "Dog collar. Blue color. Available sizes: S, M, L. Price: $12.99"

Recommended Action:
1. Enrich with 300+ words:
   - Material details
   - Size guide
   - Care instructions
   - Customer reviews
   - Usage tips
   - Related products

2. For out-of-stock with no plans to restock:
   - 301 redirect to similar product
   - Add noindex, follow tag
```

**Issue #3: Duplicate Content**

```
OnCrawl Duplicate Detection:

Type 1: Near-Duplicate Titles
Example:
- "Nike Air Max Shoes - Red | ShoeMart"
- "Nike Air Max Shoes - Blue | ShoeMart"
- "Nike Air Max Shoes - Black | ShoeMart"
Issue: Template-based titles, only color differs

Type 2: Duplicate Content Across URLs
Example:
- /product/widget-123
- /product/widget-123?color=red
- /product/widget-123?ref=email
Content: Identical, only URL parameters differ

Type 3: Cross-Section Duplicates
Example:
- /blog/seo-guide-2025
- /resources/seo-guide-2025
- /learn/seo-guide-2025
Issue: Same article republished in multiple sections

OnCrawl Solution:
- Similarity percentage scores
- Groups duplicate content clusters
- Recommends canonical implementation
- Identifies parameter handling issues
```

#### 3. Page Speed Analysis

**OnCrawl Speed Metrics:**

```
Crawl Response Time Report:

Overall Site:
- Average Response Time: 1.2 seconds
- Median: 0.8 seconds
- 90th Percentile: 2.5 seconds

By Section:
├── Homepage: 0.5s (excellent)
├── Category Pages: 0.9s (good)
├── Product Pages: 1.8s (needs improvement)
├── Blog Posts: 1.1s (good)
└── Search Results: 3.5s (critical issue)

Pages > 3 seconds: 8,450 (3.4% of site)
```

**Real-World Case: Travel Booking Site**

```
Problem Identified:
- Search result pages taking 4-8 seconds
- 15,000 search pages with dynamic content
- High bounce rate on search pages (78%)

OnCrawl Analysis Revealed:
1. Database queries timing out
2. No caching on search results
3. Heavy JavaScript rendering

Solution Implemented:
1. Implement Redis caching for common searches
2. Pre-generate popular search combinations
3. Lazy load below-the-fold content
4. Add search results to CDN

Results After 30 Days:
- Search page speed: 4-8s → 0.9-1.2s
- Bounce rate: 78% → 42%
- Conversion rate: +34%
- Organic traffic to search pages: +156%
```

---
