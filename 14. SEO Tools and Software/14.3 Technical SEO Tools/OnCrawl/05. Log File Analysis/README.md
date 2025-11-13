
## Log File Analysis

### Understanding Log File Data

Log file analysis is OnCrawl's most powerful feature for understanding actual search engine behavior.

#### What Log Files Tell You

**Basic Log Entry Example:**

```
66.249.66.1 - - [09/Nov/2025:14:23:45 +0000] "GET /products/laptop-15inch HTTP/1.1" 200 15234 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"

Breakdown:
- IP: 66.249.66.1 (Google IP range)
- Timestamp: November 9, 2025, 2:23:45 PM UTC
- URL: /products/laptop-15inch
- Status: 200 (success)
- Size: 15,234 bytes
- User Agent: Googlebot
```

### Key Log Analysis Metrics

#### 1. Crawl Budget Analysis

**Understanding Crawl Budget:**

Crawl budget = the number of pages Google will crawl on your site in a given timeframe.

```
Real Example: News Website

Site Stats:
- Total Pages: 500,000
- Daily New Articles: 150
- Google Daily Crawls: 12,000 pages/day

Log Analysis Shows:
├── Homepage: 85 crawls/day (0.7%)
├── Section Pages: 450 crawls/day (3.8%)
├── New Articles (< 7 days): 2,100 crawls/day (17.5%)
├── Recent Articles (7-30 days): 1,800 crawls/day (15%)
├── Archive (30-365 days): 4,500 crawls/day (37.5%)
├── Old Archive (> 365 days): 2,400 crawls/day (20%)
└── Static Pages: 665 crawls/day (5.5%)

Problem Identified:
- 57.5% of crawl budget spent on articles > 30 days old
- Only 17.5% on fresh news content
- News articles getting indexed 12-48 hours after publication
```

**Optimization Strategy:**

```yaml
Phase 1: Reduce Old Content Crawling
Actions:
  - Add to robots.txt: Disallow: /articles/202[0-2]/*
  - Update internal links: Remove old article links from homepage
  - XML Sitemap: Remove articles > 180 days old
  - Pagination: Add rel="nofollow" to archive pagination

Phase 2: Boost New Content Crawling
Actions:
  - IndexNow API: Submit new URLs immediately
  - Enhanced internal linking: Feature latest 50 articles on homepage
  - XML Sitemap: Priority 1.0 for articles < 7 days
  - Social signals: Auto-tweet new articles

Results After 60 Days:
  - Crawl budget on new articles: 17.5% → 68%
  - Average indexation time: 24 hours → 2.5 hours
  - Organic traffic to new content: +215%
  - Breaking news ranking: Top 3 stories increased 8x
```

#### 2. Crawl Frequency by Section

**Real Example: E-commerce Electronics Store**

```
Log Analysis Period: 30 Days

Crawl Frequency Report:
┌─────────────────────┬──────────┬────────────────┬──────────────┐
│ Section             │ Pages    │ Total Crawls   │ Avg/Page     │
├─────────────────────┼──────────┼────────────────┼──────────────┤
│ Homepage            │ 1        │ 850            │ 850/mo       │
│ Main Categories     │ 12       │ 1,450          │ 120/mo       │
│ Subcategories       │ 180      │ 8,200          │ 45/mo        │
│ Active Products     │ 25,000   │ 185,000        │ 7.4/mo       │
│ Out of Stock        │ 8,500    │ 12,500         │ 1.5/mo       │
│ Discontinued        │ 15,000   │ 3,800          │ 0.25/mo      │
│ Reviews             │ 125,000  │ 22,000         │ 0.18/mo      │
│ Blog                │ 1,200    │ 15,000         │ 12.5/mo      │
└─────────────────────┴──────────┴────────────────┴──────────────┘

Key Insights:
✓ Active products crawled weekly (good)
✗ Review pages barely crawled (lost opportunity)
✓ Discontinued products low crawl (as desired)
✗ Out of stock still consuming budget
```

**Action Plan Based on Insights:**

```
1. Boost Review Page Crawling:
   Problem: Rich user content not being discovered
   Solution:
   - Add review links to product pages
   - Create "Latest Reviews" section on homepage
   - Generate review sitemap
   - Add structured data for reviews
   
   Expected Impact: 10x increase in review crawling

2. Reduce Out-of-Stock Crawling:
   Problem: 12,500 crawls wasted monthly
   Solution:
   - Add meta noindex to products out-of-stock > 30 days
   - Remove from internal navigation
   - Add to robots.txt if discontinued
   
   Expected Impact: Save 12,500 crawls/month

3. Optimize Product Freshness Signal:
   Current: All products crawled ~7x/month regardless of update frequency
   Solution:
   - Add lastmod to XML sitemap
   - Update product timestamps only when price/stock changes
   - Priority score based on sales velocity
   
   Expected Impact: High-performing products crawled 2-3x more
```

#### 3. Bot Detection and Filtering

OnCrawl identifies real search engine bots vs. fake bots and scrapers.

```
Bot Analysis Report:

Verified Bots (30 days):
├── Googlebot: 285,450 requests (78.5%)
├── Bingbot: 45,200 requests (12.4%)
├── Baiduspider: 15,800 requests (4.3%)
├── Yandex: 8,900 requests (2.4%)
└── Other Verified: 8,650 requests (2.4%)

Suspicious Activity:
├── Fake Googlebots: 12,450 requests (not from Google IPs)
├── Aggressive Scrapers: 28,900 requests (high velocity, random UAs)
└── SEO Tools: 6,700 requests (Ahrefs, Semrush bots)

Real Example: Recipe Website

Problem:
- Server CPU at 85% constantly
- Slow response times for real users
- High hosting costs

Log Analysis Revealed:
- 65% of server requests from bots
- 35% of bot traffic was fake/scraping
- One scraper IP making 15,000 requests/day

Solution:
1. Block fake Googlebot IPs (verify via reverse DNS)
2. Rate limit aggressive scrapers
3. Block known scraper user agents
4. Implement CAPTCHA for suspicious patterns

Results:
- Server CPU: 85% → 45%
- Page response time: 2.1s → 0.7s
- Hosting costs reduced by 40%
- Real user experience significantly improved
```

#### 4. Status Code Analysis

```
Log File Status Codes (30 days):

Status Code Breakdown:
├── 200 OK: 285,000 (78.2%)
├── 301 Moved: 42,500 (11.7%)
├── 302 Found: 8,200 (2.3%)
├── 404 Not Found: 18,900 (5.2%)
├── 500 Server Error: 3,450 (0.9%)
├── 503 Unavailable: 5,950 (1.6%)
└── Other: 150 (0.04%)

Critical Finding: 404 Analysis
Top 404 URLs Hit by Googlebot:
1. /products/discontinued-widget → 450 hits
2. /old-blog-post → 380 hits
3. /promo-2024 → 320 hits
4. /out-of-stock-items → 290 hits

Source of 404s:
- Old external backlinks: 45%
- Old internal links: 30%
- Sitemap errors: 15%
- Broken redirects: 10%

Real-World Fix: SaaS Platform

404 Problem:
- 18,900 Googlebot 404 hits per month
- Wasting ~15% of crawl budget
- Hurting site quality score

Investigation via OnCrawl:
1. Cross-referenced crawl data with log files
2. Found 1,200 internal links pointing to 404s
3. Found 850 URLs in XML sitemap returning 404
4. Found 300 URLs with broken redirects

Actions Taken:
1. Fixed internal links (1,200 links)
2. Updated XML sitemap (removed 850 URLs)
3. Implemented 301 redirects for valuable 404s with backlinks
4. Removed remaining 404s from robots.txt

Results After 45 Days:
- 404 hits: 18,900 → 1,200/month (94% reduction)
- Crawl budget freed: +15%
- Index coverage: +8%
- Organic traffic: +12%
```

### Combining Crawl + Log Data

This is where OnCrawl truly shines - correlating what *can* be crawled with what *is* being crawled.

#### Analysis Framework

```
The Four Quadrants of SEO Health:

┌─────────────────────────────────────────────────────────────┐
│                    CRAWLABLE BY ONCRAWL                      │
│                                                               │
│  ┌─────────────────────────┬─────────────────────────┐     │
│  │ Q1: HEALTHY             │ Q2: INDEXATION ISSUE     │     │
│  │                         │                          │     │
│  │ ✓ OnCrawl finds it     │ ✓ OnCrawl finds it      │  C  │
│  │ ✓ Google crawls it     │ ✗ Google doesn't crawl  │  R  │
│  │                         │                          │  A  │
│  │ Status: Good           │ Status: Needs linking   │  W  │
│  │ Action: Monitor        │ Action: Add links       │  L  │
│  │                         │                          │  E  │
│  ├─────────────────────────┼─────────────────────────┤  D  │
│  │ Q3: CRAWL WASTE        │ Q4: NOT ACCESSIBLE      │     │
│  │                         │                          │  B  │
│  │ ✗ OnCrawl can't find   │ ✗ OnCrawl can't find    │  Y  │
│  │ ✓ Google crawls it     │ ✗ Google doesn't crawl  │     │
│  │                         │                          │  G  │
│  │ Status: Hidden content │ Status: Blocked/Error   │  O  │
│  │ Action: Add to sitemap │ Action: Technical fix   │  O  │
│  │                         │                          │  G  │
│  └─────────────────────────┴─────────────────────────┘  L  │
│                                                           E  │
└─────────────────────────────────────────────────────────────┘
```

**Real-World Example: Educational Platform**

```
Site: Online Course Platform
Pages: 85,000
Situation: Low indexation rate (only 40% of content indexed)

OnCrawl Crawl Results:
- Found: 85,000 pages
- No technical errors
- All pages reachable within 4 clicks

Log File Analysis (30 days):
- Google crawled: 28,000 unique URLs
- Total crawl events: 124,000

Combined Analysis:
┌────────────────────────┬───────────┬────────────┬──────────┐
│ Section                │ Crawlable │ Crawled    │ % Gap    │
├────────────────────────┼───────────┼────────────┼──────────┤
│ Homepage               │ 1         │ 1          │ 0%       │
│ Course Catalog         │ 850       │ 845        │ 0.6%     │
│ Free Courses           │ 1,200     │ 1,150      │ 4.2%     │
│ Premium Courses        │ 3,800     │ 1,420      │ 62.6%    │
│ Course Lessons (Free)  │ 18,000    │ 12,500     │ 30.6%    │
│ Course Lessons (Paid)  │ 58,000    │ 11,200     │ 80.7%    │
│ Blog                   │ 2,450     │ 2,380      │ 2.9%     │
│ Help/FAQ               │ 700       │ 650        │ 7.1%     │
└────────────────────────┴───────────┴────────────┴──────────┘

Key Finding:
80% of premium course content not being crawled, despite being technically accessible.

Root Cause Investigation:
1. All premium lessons behind login → NoIndex tags
2. XML sitemap only included free content
3. Internal linking heavily favored free courses
4. Robots.txt was correct (not blocked)

Solution Strategy:
1. Create public preview pages for each lesson (first 10%)
2. Add full course outlines with descriptions (indexable)
3. Add all course pages to XML sitemap
4. Implement structured data (Course schema)
5. Cross-link related courses
6. Build topic clusters around course subjects

Implementation:
Week 1: Remove noindex from course landing pages
Week 2: Create preview pages for all lessons
Week 3: Update XML sitemap and internal linking
Week 4: Add structured data
Week 5-8: Monitor and iterate

Results After 90 Days:
- Pages crawled: 28,000 → 76,000 (+171%)
- Pages indexed: 34,000 → 68,000 (+100%)
- Organic traffic: +185%
- Course signups from organic: +240%
- Featured snippets: 0 → 28
```

---
