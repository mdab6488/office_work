
## Core Features and Capabilities

### 1. Website Crawling Engine

OnCrawl's crawler simulates how search engines discover and analyze your website.

**Crawl Capabilities:**
- **Unlimited Crawl Depth**: No artificial limits on how deep it crawls
- **JavaScript Rendering**: Optional JS rendering to see what search engines see
- **Custom User Agents**: Crawl as Googlebot, Bingbot, or custom agents
- **Scheduled Crawls**: Automatic recurring crawls (daily, weekly, monthly)
- **Incremental Crawls**: Only crawl changed pages to save resources
- **Multi-Domain Crawling**: Crawl multiple domains or subdomains simultaneously

**What It Detects:**
```
✓ Broken links (404s, 500s)
✓ Redirect chains and loops
✓ Duplicate content issues
✓ Missing or duplicate meta tags
✓ Thin content pages
✓ Orphan pages (pages with no internal links)
✓ Page speed issues
✓ Mobile-friendliness problems
✓ Structured data errors
✓ Canonical tag issues
✓ Hreflang implementation errors
✓ XML sitemap discrepancies
```

### 2. Log File Analysis

This is OnCrawl's signature feature that sets it apart from competitors.

**What Log Analysis Shows:**
- **Actual Googlebot Behavior**: See exactly what Google crawls, when, and how often
- **Crawl Budget Consumption**: Which pages consume your crawl budget
- **HTTP Status Codes**: What status codes Google encounters
- **Crawl Frequency**: How often each section is crawled
- **Bot Detection**: Identify real vs. fake bots
- **Crawl Depth Analysis**: How deep Google crawls your site

**Real-World Example:**
```
Scenario: E-commerce site with 500,000 products
Discovery: Log analysis revealed Google was spending 40% of crawl budget 
on old, out-of-stock products and only 15% on new inventory.

Action Taken:
1. Robots.txt block on discontinued products
2. Internal linking boost to new products
3. XML sitemap prioritization

Result: 
- 3x increase in new product crawling
- 25% improvement in new product indexation speed
- 18% increase in organic traffic to new products within 60 days
```

### 3. Page Segmentation

OnCrawl allows you to segment your site into meaningful categories for analysis.

**Built-In Segmentations:**
- Page type (product, category, blog, etc.)
- HTTP status code
- Depth from homepage
- Crawl frequency
- Traffic levels
- Content length
- Response time

**Custom Segmentations:**
- URL patterns (regex-based)
- Content categories
- Business priorities
- Geographic targeting
- Language versions

**Example Segmentation Strategy:**
```
E-commerce Site Segments:
├── Homepage (1 page)
├── Category Pages (250 pages)
├── Subcategory Pages (1,200 pages)
├── Product Pages (Active) (50,000 pages)
├── Product Pages (Out of Stock) (15,000 pages)
├── Product Pages (Discontinued) (35,000 pages)
├── Blog Articles (2,500 pages)
├── Help/Support Pages (300 pages)
└── Legal Pages (50 pages)

Analysis Goal: Ensure Google prioritizes active products
```

### 4. SEO Impact Analysis

OnCrawl correlates technical issues with business impact.

**Impact Metrics:**
- Traffic impact of technical issues
- Revenue loss from crawl problems
- Indexation vs. performance correlation
- Page speed impact on conversions
- Mobile usability effects

### 5. Data Visualization

**Dashboard Features:**
- Pre-built dashboards for common use cases
- Custom dashboard creation
- Trend analysis over time
- Comparative analysis (current vs. previous crawls)
- Export to CSV, PDF, or Data Studio

---
