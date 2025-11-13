
## 9. Advanced Features {#advanced-features}

### JavaScript Rendering

**When to Use JS Rendering**:
- React/Vue/Angular single-page apps
- Content loaded via AJAX
- Dynamic elements crucial for SEO

**Enabling JavaScript Rendering**:
```
Configuration → Spider → Rendering
├── ✓ Enable JavaScript Rendering
├── Rendering Engine: Chromium
├── Wait Time: 5 seconds (adjust as needed)
├── ✓ Wait for JavaScript Events
└── ✓ Take screenshots

Note: Significantly slower crawl speed
```

**Real-World Example: React E-commerce Site**

**Standard Crawl**:
```
URL: example.com/products
HTML Source: 
<div id="root"></div>
<script src="app.js"></script>

Pages Found: 23 (static pages only)
Product Pages: 0 ❌
```

**JavaScript Rendering Crawl**:
```
URL: example.com/products
Rendered Content:
<div id="root">
  <h1>Our Products</h1>
  <div class="product-grid">
    <a href="/product-1">Product 1</a>
    <a href="/product-2">Product 2</a>
    ...
  </div>
</div>

Pages Found: 1,847
Product Pages: 1,824 ✓
```

**Comparing Rendered vs. Raw HTML**:
```
Process:
1. Complete JS rendering crawl
2. Export → Custom → "Rendered Text"
3. Also export "Raw HTML"
4. Compare in spreadsheet

Use Case: Verify Google sees your content
```

### Custom Extraction

**Extracting Specific Data**

**Example 1: Product Prices**
```
Configuration → Custom → Extraction

Add New Extractor:
Name: Product Price
Extraction: XPath
XPath: //span[@class='price']/text()

Result:
URL | Product Price
example.com/product-1 | $29.99
example.com/product-2 | $49.99
example.com/product-3 | $19.99

Use Case: Price monitoring across all products
```

**Example 2: Review Ratings**
```
Extractor:
Name: Star Rating
Extraction: CSS Path
CSS Selector: .rating-stars::attr(data-rating)

Result:
URL | Star Rating
example.com/product-a | 4.5
example.com/product-b | 3.8
example.com/product-c | 4.9

Analysis: Export to Excel, identify low-rated products
```

**Example 3: Author Names**
```
Extractor:
Name: Blog Author
Extraction: XPath
XPath: //meta[@name='author']/@content

Result:
URL | Blog Author
example.com/blog/post-1 | John Smith
example.com/blog/post-2 | Jane Doe
example.com/blog/post-3 | No Author ⚠️

Action: Identify posts missing author attribution
```

**Example 4: Extracting Structured Data**
```
Extractor:
Name: Schema Type
Extraction: XPath
XPath: //script[@type='application/ld+json']

Result: JSON-LD structured data for each page

Advanced Analysis:
- Count pages by schema type
- Validate schema completeness
- Identify missing structured data
```

### API Integrations

**Google Analytics 4 Integration**

**Setup Process**:
```
1. Configuration → API Access → Google Analytics
2. Click "Connect to Google Analytics"
3. Authenticate with Google account
4. Select GA4 property
5. Choose metrics:
   └── Sessions, Users, Engagement Rate, Conversions
6. Date range: Last 90 days
```

**Using GA Data in Crawls**:
```
After integration:
1. Complete normal crawl
2. API → Google Analytics → Get Metrics
3. Wait for data pull (can take 10-30 min for large sites)
4. New columns appear with GA data

Export Enhanced Data:
URL | Sessions | Users | Engagement | Conversions
page-a | 15,234 | 12,456 | 67.3% | 234
page-b | 8,456 | 7,234 | 45.2% | 89
page-c | 234 | 198 | 23.1% | 2
```

**Real Use Case: ROI-Based Content Audit**
```
Objective: Find low-traffic pages with technical issues

Filter Strategy:
1. Sessions < 100 (last 90 days)
2. AND Status Code = 200
3. AND Word Count < 500

Found: 1,456 pages
Action: Delete or consolidate thin, low-traffic content

Result:
- Reduced site to 78% of original size
- Improved overall engagement rate
- Better crawl budget allocation
```

**Google Search Console Integration**

**Setup**:
```
1. Configuration → API Access → Google Search Console
2. Authenticate
3. Select property
4. Pull metrics:
   ├── Impressions (last 3 months)
   ├── Clicks (last 3 months)
   ├── Average Position
   └── CTR
```

**Use Case: Identify Low-CTR Pages**
```
Export with GSC Data:
URL | Impressions | Clicks | CTR | Avg Position
page-1 | 10,234 | 234 | 2.3% | 8.5
page-2 | 8,456 | 89 | 1.1% ❌ | 4.2 ✓

Analysis:
Page-2 ranks well (position 4.2) but low CTR

Investigation in Screaming Frog:
- Check title tag: Generic, not compelling
- Check meta description: Missing

Action:
- Rewrite title for better CTR
- Add compelling meta description

Expected Result: 2-3x CTR improvement
```

**PageSpeed Insights Integration**

**Bulk Speed Testing**:
```
Process:
1. Crawl site
2. Select URLs to test (e.g., top 50 by traffic)
3. Right-click → PageSpeed Insights
4. Wait for analysis

Results:
URL | Mobile Score | Desktop Score | FCP | LCP | CLS
homepage | 45 ❌ | 78 ⚠️ | 1.8s | 3.2s | 0.25
about | 89 ✓ | 94 ✓ | 0.9s | 1.2s | 0.05
products | 34 ❌ | 67 ❌ | 2.3s | 4.5s | 0.45

Priority: Fix homepage and products page
```

**Majestic SEO Integration** (Paid)

**Purpose**: Analyze backlink data

```
Setup:
1. Configuration → API Access → Majestic
2. Enter API key
3. Crawl site
4. API → Majestic → Get Metrics

New Columns:
├── External Backlinks
├── Referring Domains
├── Trust Flow
├── Citation Flow
└── Topical Trust Flow

Use Case: Identify pages with most link equity

Analysis:
URL | Backlinks | Referring Domains | TF | CF
page-a | 1,234 | 567 | 45 | 52
page-b | 89 | 34 | 18 | 22
page-c | 12 | 8 | 5 | 7

Strategy: 
- Internal link from high TF pages to low TF pages
- Prioritize link building for pages with low metrics
```

### Database Storage Mode

**For Massive Sites** (100,000+ URLs)

**Why Use Database Mode**:
- Reduced RAM usage
- Faster crawls for huge sites
- Data persistence between sessions

**Setup**:
```
1. System → Database Storage
2. Choose database location
3. ✓ Enable database storage mode

Benefits:
- Crawl 1M+ URLs without crashing
- Save crawl state (resume later)
- Lower memory footprint
```

**Real Example: Enterprise Site Crawl**
```
Site: Large multinational corporation
Pages: 847,234

Standard Mode:
- RAM Usage: 16GB+ (crashed)
- Crawl: Failed at 234,567 pages

Database Mode:
- RAM Usage: 4-6GB
- Crawl: Successful
- Time: 18 hours
- Storage: 8.4GB database file

Ability to resume crawl if interrupted
```

### Crawl Scheduling

**Automated Regular Audits**

**Setup** (Requires Screaming Frog SEO Spider CLI):
```bash
# Windows Task Scheduler
1. Create .bat file:

@echo off
cd "C:\Program Files (x86)\Screaming Frog SEO Spider"
ScreamingFrogSEOSpiderCli.exe --crawl https://www.example.com --export-tabs "Internal:All" --output-folder "C:\Audits\%date%"

2. Schedule in Task Scheduler (weekly)

# macOS/Linux Cron
crontab -e

# Add line (runs every Monday at 2 AM):
0 2 * * 1 /Applications/ScreamingFrogSEOSpider.app/Contents/MacOS/ScreamingFrogSEOSpiderCli --crawl https://www.example.com --export-tabs "Internal:All" --output-folder /audits/
```

**Use Case: Weekly Monitoring**
```
Schedule: Every Monday 2 AM
Site: example.com
Export: All tabs to CSV
Destination: Shared drive

Automated email alert if:
- More than 10 new 404s detected
- More than 5 redirect chains
- Any 500 errors found

Implementation: Python script parses CSVs and sends alerts
```

---
