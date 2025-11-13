
## Data Studio Integration

OnCrawl's native Google Data Studio (Looker Studio) connector enables custom reporting and visualization.

### Setting Up Data Studio

#### Step 1: Connect OnCrawl to Data Studio

```
1. Open Google Data Studio (Looker Studio)
2. Create New Report
3. Add Data Source
4. Search for "OnCrawl"
5. Authorize OnCrawl connector
6. Select your OnCrawl project
7. Choose data type:
   - Crawl Data
   - Log Data
   - Combined Data
```

#### Step 2: Available Data Fields

**Crawl Data Fields:**
```
Dimensions:
- URL
- Page Depth
- HTTP Status Code
- Page Type (segmentation)
- Content Type
- Title Tag
- Meta Description
- H1 Tag
- Canonical URL
- Response Time
- Page Size
- Word Count
- Internal Links (incoming/outgoing)

Metrics:
- Number of URLs
- Average Depth
- Average Response Time
- Average Page Size
- Average Word Count
- Total Internal Links
```

**Log Data Fields:**
```
Dimensions:
- URL
- Bot Name (Googlebot, Bingbot, etc.)
- Status Code
- Date
- Hour
- Day of Week

Metrics:
- Number of Crawls
- Unique URLs Crawled
- Average Frequency
- Bytes Transferred
- Crawl Duration
```

### Real-World Data Studio Reports

#### Report #1: Executive SEO Dashboard

```
Purpose: High-level KPIs for C-suite and stakeholders

Widgets:

1. Scorecard - Key Metrics:
   ┌────────────────┬────────────────┬────────────────┐
   │ Total Pages    │ Indexed Pages  │ Crawl Health   │
   │   245,000      │   198,000      │     87%        │
   │   ↑ 5.2%       │   ↑ 8.1%       │   ↑ 3 pts      │
   └────────────────┴────────────────┴────────────────┘

2. Time Series - Trend Over Time:
   Graph showing:
   - Total crawlable pages (blue line)
   - Pages crawled by Google (green line)
   - Indexed pages (purple line)
   - Technical errors (red line)
   Time range: Last 90 days, weekly granularity

3. Pie Chart - HTTP Status Distribution:
   - 200 OK: 82% (green)
   - 301/302: 10% (yellow)
   - 404: 6% (orange)
   - 5xx: 2% (red)

4. Bar Chart - Crawl Budget by Section:
   Comparing current vs. previous 30 days

5. Table - Top Priority Issues:
   Issue | Affected Pages | Impact | Trend
   Duplicate titles | 12,450 | High | ↑ 5%
   Slow pages (>3s) | 8,200 | High | ↓ 12%
   Thin content | 6,100 | Medium | → 0%
   Broken links | 3,450 | Medium | ↓ 8%

6. Geo Map - International Performance:
   If multi-country site, show indexation by region
```

#### Report #2: Crawl Budget Optimization Dashboard

```
Purpose: Technical SEO team to maximize crawl efficiency

Key Visualizations:

1. Sankey Diagram - Crawl Budget Flow:
   Shows how Google's crawl budget is distributed:
   
   Daily Crawl Budget (10,000) →
   ├→ High Value Pages (3,500) → 200 OK (3,400)
   ├→ Medium Value Pages (4,200) → 200 OK (4,000)
   ├→ Low Value Pages (1,800) → 200 OK (1,600)
   └→ Wasted Crawls (500) → 404s (200), 500s (100), Redirects (200)

2. Heatmap - Crawl Frequency by Day/Hour:
   Shows when Google crawls most actively:
   
         00 02 04 06 08 10 12 14 16 18 20 22
   Mon   ██ ░░ ░░ ██ ███ ███ ██ ██ ███ ██ ░░ ██
   Tue   ██ ░░ ░░ ██ ███ ██ ██ ██ ██ ███ ██ ░░
   Wed   ██ ░░ ██ ██ ███ ███ ██ ███ ██ ██ ░░ ██
   ...
   
   Insight: Optimize publishing for peak crawl times

3. Comparison Table - Section Performance:
   Section | Crawlable | Crawled | % Crawled | Avg Freq
   Homepage | 1 | 1 | 100% | 45/day
   Products | 50K | 35K | 70% | 2.5/mo
   Blog | 2.5K | 2.4K | 96% | 8/mo
   Archive | 100K | 15K | 15% | 0.5/mo

4. Scatter Plot - Response Time vs Crawl Frequency:
   X-axis: Page response time (ms)
   Y-axis: Crawl frequency (crawls/month)
   
   Finding: Slower pages crawled less frequently
   
5. Line Chart - Crawl Budget Trend:
   Daily crawl volume over 90 days with:
   - Actual crawls (solid line)
   - 7-day moving average (dashed line)
   - Annotations for major site changes
```

#### Report #3: Content Performance Analysis

```
Purpose: Content team to optimize content strategy

Sections:

1. Content Depth Analysis:
   ┌───────────────────┬──────────┬───────────┬──────────┐
   │ Word Count Range  │ Pages    │ % Crawled │ Avg Freq │
   ├───────────────────┼──────────┼───────────┼──────────┤
   │ 0-200 (thin)      │ 15,400   │ 35%       │ 1.2/mo   │
   │ 201-500           │ 28,900   │ 68%       │ 3.5/mo   │
   │ 501-1000          │ 45,200   │ 87%       │ 6.2/mo   │
   │ 1001-2000         │ 32,100   │ 92%       │ 8.5/mo   │
   │ 2000+ (detailed)  │ 18,450   │ 95%       │ 12.8/mo  │
   └───────────────────┴──────────┴───────────┴──────────┘
   
   Insight: Longer content crawled more frequently

2. Content Freshness Impact:
   Bubble chart:
   - X-axis: Days since last update
   - Y-axis: Crawl frequency
   - Bubble size: Page importance score
   
   Finding: Recently updated content gets crawled 5x more

3. Topic Cluster Performance:
   Compare different content topics:
   
   Topic          | Articles | Avg Words | Index % | Traffic
   SEO Tips       | 145      | 1,850     | 94%     | 45K/mo
   Case Studies   | 67       | 2,400     | 98%     | 32K/mo
   Tool Reviews   | 89       | 1,200     | 85%     | 28K/mo
   Quick Guides   | 234      | 650       | 72%     | 18K/mo

4. Content Gap Analysis:
   Venn diagram showing:
   - Content crawled by OnCrawl
   - Content crawled by Google
   - Content in XML sitemap
   - Content in GSC
   
   Overlap shows indexation efficiency
```

### Custom Calculated Fields

Create advanced metrics:

```
1. Crawl Efficiency Rate:
   Formula: (Pages Crawled by Google / Total Crawlable Pages) * 100
   
2. Indexation Rate:
   Formula: (Indexed Pages from GSC / Pages Crawled by Google) * 100
   
3. Crawl Budget Waste:
   Formula: COUNT(URLs with 404 or 500 errors crawled by Google)
   
4. Average Crawl Frequency:
   Formula: Total Crawls / Unique URLs Crawled
   
5. Content Quality Score:
   Formula: (Word Count * 0.3) + (Internal Links * 10) + (Freshness Score * 0.4)
   
6. Page Value Score:
   Formula: (Traffic * 0.4) + (Conversions * 50) + (Backlinks * 5)
```

---
