
## Real-World Use Cases

### Use Case #1: Large E-commerce Site Migration

**Scenario:**
- Migrating 500,000 product pages to new platform
- Changing URL structure
- High stakes: $50M annual revenue from organic

**OnCrawl Implementation:**

**Pre-Migration (4 weeks before):**
```
1. Baseline Crawl:
   - Document all current URLs
   - Map internal link structure
   - Identify high-value pages (by traffic & revenue)
   - Create priority tiers

2. Log File Analysis:
   - Establish baseline crawl patterns
   - Identify most crawled sections
   - Calculate current crawl budget allocation

3. Redirect Mapping:
   - Export all URLs from OnCrawl
   - Match old URLs to new URLs
   - Identify orphan pages
   - Plan 301 redirects (250,000 redirects)

4. Test Environment Crawl:
   - Crawl staging site
   - Verify new URL structure
   - Test redirect implementation
   - Identify any issues pre-launch
```

**Migration Week:**
```
Day 0 (Launch):
- Run full crawl of new site
- Verify all redirects working
- Check for 404s
- Monitor log files in real-time

Day 1-3:
- Hourly log file checks
- Monitor Googlebot behavior
- Track crawl rate changes
- Identify redirect issues
- Quick-fix critical problems

Day 4-7:
- Daily comprehensive crawls
- Compare crawl patterns to baseline
- Verify redirect chains
- Monitor indexation changes
- Track traffic impacts
```

**Post-Migration (Weeks 2-8):**
```
Weekly Monitoring:
1. Crawl Analytics:
   - Total indexed pages
   - 404 error trends
   - Redirect chain issues
   - Orphan page detection

2. Log File Trends:
   - Crawl budget recovery
   - New URL discovery rate
   - Old URL crawl decline
   - Bot behavior changes

3. Traffic Correlation:
   - Cross-reference with GA4
   - Identify traffic drops by section
   - Prioritize fixes by revenue impact
```

**Actual Results:**
```
Migration Success Metrics:

Week 1:
- 404 errors: 2,340 (0.5% - excellent)
- Redirects working: 98.5%
- Organic traffic: -12% (expected initial drop)

Week 4:
- Pages indexed: 85% of target
- Crawl budget normalized
- Organic traffic: -3%

Week 8:
- Pages indexed: 97% of target
- Organic traffic: +2% (above pre-migration)
- Zero critical issues
- Revenue impact: $0 loss (huge success)

Total Investment: $15K (OnCrawl + implementation)
Protected Revenue: $50M
ROI: Immeasurable (prevented potential disaster)
```

### Use Case #2: JavaScript Site Audit

**Scenario:**
- React-based SaaS platform
- 80,000 pages
- Indexation issues (only 15% indexed)
- Organic traffic declining

**The Problem:**

```
Initial Symptoms:
- Google Search Console showing 12,000 indexed pages (15%)
- Should have 80,000+ pages indexed
- Traffic declining 5% month-over-month
- Competitors outranking on key terms
```

**OnCrawl Investigation:**

```
Phase 1: Standard Crawl (No JS Rendering)
Result: Found only 8,500 pages
Finding: Most content loaded via JavaScript

Phase 2: JavaScript Rendering Enabled
Result: Found 79,200 pages
Finding: Content is there, but requires JS execution

Phase 3: Googlebot Rendering Test
Method: Compare OnCrawl JS crawl vs. actual Google log files
Finding: Mismatch!
- OnCrawl with JS: 79,200 pages
- Google crawling: 11,500 unique URLs/month
Gap: Google not rendering most pages

Phase 4: Deep JS Analysis
OnCrawl detected:
1. Initial HTML nearly empty (just loading screen)
2. Content loaded after 3-5 seconds
3. No server-side rendering (SSR)
4. No static fallback HTML
5. Many pages loaded via JS routing (no URL changes)
6. Critical links in JavaScript onclick events
```

**The Solution:**

```
Implementation Plan:

1. Implement Next.js SSR:
   - Convert React SPA to Next.js
   - Enable server-side rendering
   - Pre-render all public pages
   - Time estimate: 8 weeks
   - Cost: $80K development

2. Quick Wins (Week 1-2):
   a. Add prerendering service (Prerender.io)
      - Detect bots and serve static HTML
      - Cost: $200/month
   
   b. Update internal linking:
      - Replace onclick with proper <a> tags
      - Add href attributes to all links
   
   c. Add structured data to initial HTML:
      - Include key metadata pre-JS load
   
   d. Implement dynamic XML sitemaps:
      - Include all JS-loaded URLs
      - Priority to high-value pages

3. Medium-term Fixes (Week 3-8):
   a. Progressive enhancement:
      - Core content in initial HTML
      - Enhanced features via JS
   
   b. Hybrid rendering approach:
      - SSR for public pages
      - CSR for authenticated areas
   
   c. Implement fragments (#) properly:
      - Use History API for routing
      - Ensure unique URLs for content
```

**Results Tracking with OnCrawl:**

```
Week 0 (Baseline):
- Crawlable pages: 79,200 (JS required)
- Google crawls: 11,500 URLs/month
- Indexed pages: 12,000

Week 2 (After Quick Wins):
- Google crawls: 18,500 URLs/month (+61%)
- Indexed pages: 15,200 (+27%)

Week 8 (After SSR Implementation):
- Google crawls: 65,000 URLs/month (+465%)
- Indexed pages: 58,000 (+383%)
- Organic traffic: +156%
- Conversion rate: +28%

Week 16 (Optimization Complete):
- Crawlable pages: 79,200
- Google crawls: 73,000 URLs/month
- Indexed pages: 74,500 (94% success rate)
- Organic traffic: +312% vs. baseline
- MRR from organic: +$285K/month

Total Cost: $95K (dev + tools)
Annual Revenue Impact: +$3.4M
ROI: 3,579%
```

### Use Case #3: News Publisher Crawl Budget Crisis

**Scenario:**
- Major news website
- Publishing 200+ articles daily
- Breaking news not ranking
- Competitors getting stories indexed faster

**The Crisis:**

```
Symptoms:
- New articles taking 24-48 hours to index
- Competitors indexed in 1-2 hours
- Missing breaking news traffic
- Revenue loss: ~$500K/month

Site Stats:
- Total pages: 2.5M (10 years of archives)
- Active articles: ~100K (recent content)
- Dead weight: 2.4M (old archives, some duplicates)
```

**OnCrawl Diagnosis:**

```
Log File Analysis (30 days):

Total Googlebot Requests: 850,000
Daily Average: 28,333 pages

Breakdown:
├── Homepage: 2,500 crawls (0.3%)
├── Section Pages: 8,500 crawls (1%)
├── New Articles (< 7 days): 42,000 crawls (4.9%)
├── Recent (7-90 days): 127,500 crawls (15%)
├── Archive (90 days - 2 years): 340,000 crawls (40%)
├── Old Archive (2+ years): 297,500 crawls (35%)
└── Static/Other: 32,000 crawls (3.8%)

KEY FINDING: 75% of crawl budget on content > 90 days old!

Crawl Data Analysis:
- Internal links heavily favored archives
- "Related Articles" widget pulling old content
- Pagination going back 10 years
- No recency signals in internal linking
```

**The Solution:**

```
Emergency Actions (Week 1):

1. Robots.txt Updates:
   User-agent: Googlebot
   Disallow: /[2014-2020]/*
   Disallow: /tag/*/page/[3-9]*
   Disallow: /category/*/page/[5-9]*
   
   Result: Block extremely old content from crawling

2. Internal Linking Overhaul:
   - Homepage: Show only today's articles
   - Related articles: Max 30 days old
   - Remove infinite pagination (max 10 pages)
   - Add "Latest News" sidebar everywhere
   
3. XML Sitemap Restructure:
   Before: Single sitemap with 2.5M URLs
   After: Multiple sitemaps:
   - sitemap-news.xml (articles < 2 days) - Priority 1.0
   - sitemap-recent.xml (2-30 days) - Priority 0.8
   - sitemap-archive.xml (30+ days) - Priority 0.3
   
4. IndexNow Implementation:
   - Auto-submit URLs on publish
   - Submit to Bing, Yandex immediately
   
5. Google PubSubHubbub:
   - Enable for instant blog ping

Strategic Actions (Week 2-4):

6. Content Audit:
   - Identified 400K truly dead pages
   - No traffic, no backlinks, outdated
   - Added noindex,follow tags
   
7. Archive Organization:
   - Created "historical" subdomain
   - Moved articles > 2 years old
   - Implemented "archive" meta robots tag
   
8. Freshen Old Content:
   - Update timestamps only on actual edits
   - Add "Last Updated" labels
   - Remove auto-modification timestamps
   
9. Strategic Internal Linking:
   - Priority to breaking news (homepage feature)
   - Cross-link between current stories
   - Reduce links to archives
```

**Results Tracking:**

```
Week 1:
- Daily crawls on new articles: 42,000 → 68,000 (+62%)
- Average indexation time: 36 hours → 18 hours

Week 2:
- Daily crawls on new articles: 68,000 → 145,000 (+113% from baseline)
- Average indexation time: 18 hours → 6 hours
- Breaking news rankings: 8% → 23% top 3 positions

Week 4:
- Daily crawls on new articles: 145,000 → 185,000 (+340% from baseline)
- Average indexation time: 6 hours → 90 minutes
- Breaking news rankings: 23% → 47% top 3 positions
- Organic traffic to new content: +275%

Week 12:
- Crawl budget optimized (stable)
- Average indexation time: 60-90 minutes
- Breaking news rankings: 52% top 3 positions
- Revenue recovered: +$485K/month
- Overall organic traffic: +68%

Tools Used:
- OnCrawl: $3,000/month
- Development time: $25K one-time
- Total first-year cost: $61K
- Revenue impact: +$5.8M annually
- ROI: 9,508%
```

---
