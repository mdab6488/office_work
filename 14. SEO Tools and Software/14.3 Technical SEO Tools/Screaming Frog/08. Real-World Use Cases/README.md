
## 8. Real-World Use Cases {#real-world-use-cases}

### Use Case #1: Pre-Launch Website Audit

**Scenario**: New website going live next week

**Objective**: Ensure zero technical issues at launch

**Screaming Frog Audit Process**:

**Step 1: Crawl Staging Site**
```
URL: https://staging.newsite.com
Settings:
├── Crawl all content types
├── Check images
├── Follow robots.txt
└── Max depth: 10

Result: 847 URLs discovered
```

**Step 2: Critical Issues Checklist**

```
✓ All Pages Return 200 Status
Found: 0 errors ✓

✓ No Broken Internal Links
Filter: Internal → Response Codes → 4xx
Found: 3 broken links ⚠️
├── /about-us → /team (404)
├── /services → /pricing-old (404)
└── /blog/post → /images/hero.jpg (404)
Fix: Updated links before launch

✓ No Redirect Chains
Reports → Redirects → Redirect Chains
Found: 2 chains ⚠️
├── / → /home → /en/home (3 hops)
└── /products → /shop → /shop/ (2 hops)
Fix: Direct redirects implemented

✓ Proper Canonical Tags
Directives → Canonical
Found: 12 pages missing canonicals ⚠️
Fix: Added self-referencing canonicals

✓ Unique Page Titles
Page Titles → Duplicate
Found: 34 duplicate titles ⚠️
Example: 15 blog posts with "Blog | SiteName"
Fix: Updated to unique, descriptive titles

✓ Proper Heading Structure
H1 → Missing
Found: 7 pages without H1 ⚠️
Fix: Added H1 to all pages

✓ Image Alt Text
Images → Missing Alt Text
Found: 89 images without alt text ⚠️
Fix: Added descriptive alt text

✓ Mobile Compatibility
Configuration → User-Agent → Mobile
Crawl Result: Same page count ✓

✓ XML Sitemap Valid
Upload → sitemap.xml
Issues: 12 URLs return 404 ⚠️
Fix: Removed from sitemap

✓ Robots.txt Correct
Reports → Robots.txt
Issue: Blocking /products/ ⚠️
Fix: Removed incorrect disallow rule

✓ HTTPS Implemented
Protocol → Non-Indexable
Found: 23 HTTP URLs still linked ⚠️
Fix: Updated to HTTPS
```

**Step 3: Pre-Launch Report**
```
Total Issues Found: 180
├── Critical (P0): 8 - MUST FIX
├── High (P1): 34 - Should fix
├── Medium (P2): 87 - Can fix post-launch
└── Low (P3): 51 - Minor improvements

Launch Decision: Delayed by 3 days to fix P0 and P1 issues

Post-Launch Results:
- Zero broken user experiences
- Clean Google Search Console
- 40% faster indexing vs. competitors
```

### Use Case #2: Site Migration Audit

**Scenario**: Moving from old-site.com to new-site.com

**Pre-Migration Audit**:

**Step 1: Crawl Old Site**
```
URL: https://www.old-site.com
Purpose: Inventory all existing pages

Results:
Total URLs: 3,456
├── Product pages: 1,234
├── Category pages: 89
├── Blog posts: 567
├── Static pages: 45
└── Other: 1,521

Export: "old-site-inventory.csv"
```

**Step 2: Crawl New Site** (before launch)
```
URL: https://staging.new-site.com
Purpose: Map new URL structure

Results:
Total URLs: 2,987
```

**Step 3: URL Mapping**
```
Compare exports in Excel:

Old URL: old-site.com/products/widget-a
New URL: new-site.com/shop/widget-a
Action: Create 301 redirect

Old URL: old-site.com/blog/2020/01/post
New URL: new-site.com/blog/post-title
Action: Create 301 redirect

Old URLs with No Match: 469
Action Required:
├── Determine if should be redirected
├── Create 410 Gone if intentionally removed
└── Redirect to relevant category/section
```

**Step 4: Post-Migration Audit**

**One week after launch**:
```
Process:
1. Crawl new-site.com
2. Configuration → Rendering → JavaScript
3. Full crawl with redirects

Issues Found:

1. Redirect Errors
├── 34 URLs: 301 → 404 (broken redirect targets)
├── 12 URLs: Redirect chains discovered
└── 5 URLs: 302 instead of 301

2. Content Issues
├── 89 pages: Missing titles (was on old site)
├── 156 pages: Broken images (old URLs)
└── 45 pages: 404 internal links

3. Traffic Impact
Before: 50,000 sessions/month
Week 1: 32,000 sessions/month (-36%)
Week 4: 47,000 sessions/month (-6%)
Week 8: 54,000 sessions/month (+8%)

Action: Fixed all issues within first 2 weeks
```

**Lesson Learned**:
- Created comprehensive redirect map using Screaming Frog exports
- Tested staging environment thoroughly
- Monitored weekly post-migration
- Fixed issues immediately to minimize traffic loss

### Use Case #3: Competitor Analysis

**Scenario**: Understanding competitor's SEO strategy

**Objective**: Identify competitor strengths and opportunities

**Process**:

**Step 1: Crawl Competitor Site**
```
URL: https://www.competitor.com
Settings:
├── Respect robots.txt: No (see all content)
├── Max URLs: 10,000
└── Crawl speed: Polite (1 second delay)

Note: Always respect ethical boundaries and terms of service
```

**Step 2: Content Analysis**
```
Export Data:
1. Internal → HTML
2. Export → Custom

Columns Selected:
├── Address (URL)
├── Title
├── Word Count
├── Inlinks (internal)
├── H1
├── Meta Description
└── Indexability

Analysis in Excel/Google Sheets:
```

**Finding 1: Content Depth**
```
Their blog posts:
Average word count: 2,847 words
Median: 2,456 words
Range: 1,200 - 8,500 words

Our blog posts:
Average word count: 847 words
Median: 734 words

Insight: They invest heavily in long-form content
Action: Increase our content depth for target keywords
```

**Finding 2: Internal Linking**
```
Their strategy:
Top pages by inlinks:
1. Homepage: 3,456 inlinks
2. Resource hub: 2,123 inlinks
3. Product categories: avg 800 inlinks

Our site:
1. Homepage: 1,234 inlinks
2. Product categories: avg 250 inlinks

Insight: They have strong internal linking structure
Action: Build content hubs and increase internal links
```

**Finding 3: Technical Setup**
```
Their site:
✓ All HTTPS
✓ Zero 404 errors (good redirect management)
✓ Fast load times (viewed via PageSpeed integration)
✓ Comprehensive structured data
✓ Clean URL structure

Opportunities we identified:
- They're not using video content (we can!)
- Missing FAQ schema on many pages
- Blog posts lack author schema
- No "How-to" schema despite tutorial content
```

**Finding 4: Content Gaps**
```
Their covered topics: 234 blog posts
Our covered topics: 156 blog posts

Gaps (topics they rank for, we don't cover):
├── "Widget maintenance tips" (34 posts)
├── "Industry compliance guides" (18 posts)
├── "Case studies" (45 posts)
└── "Comparison guides" (23 posts)

Action Plan:
Create content calendar targeting these gaps
```

### Use Case #4: Large-Scale Content Audit

**Scenario**: B2B SaaS site with 5,000+ pages

**Objective**: Identify underperforming content for improvement or deletion

**Step 1: Crawl + Analytics Integration**
```
1. Crawl site normally
2. Configuration → API Access → Google Analytics
3. Connect GA4 property
4. Select metrics:
   ├── Sessions (90 days)
   ├── Users (90 days)
   ├── Engagement Rate
   └── Conversions

5. Re-export with GA data included
```

**Step 2: Content Performance Analysis**

```
Exported to Google Sheets with columns:
├── URL
├── Title
├── Word Count
├── Sessions (90 days)
├── Engagement Rate
├── Conversions
└── Last Modified Date

Segmentation:
```

**High Performers** (Keep & Promote):
```
Criteria: >1,000 sessions, >60% engagement
Found: 234 pages (4.7%)

Examples:
URL: /guides/getting-started
Sessions: 15,234
Engagement: 78%
Action: Update regularly, build more links
```

**Moderate Performers** (Optimize):
```
Criteria: 100-1,000 sessions, 40-60% engagement
Found: 1,456 pages (29.1%)

Action Plan:
1. Update outdated information
2. Improve title tags for better CTR
3. Add internal links from high performers
4. Expand thin content (target 1,500+ words)
```

**Low Performers** (Fix or Remove):
```
Criteria: <100 sessions, <40% engagement
Found: 2,789 pages (55.8%)

Deep Dive Analysis:

Segment 1: Technical Issues
├── 234 pages: Slow load time (>3s)
├── 456 pages: Thin content (<300 words)
├── 189 pages: Duplicate titles
└── 345 pages: Missing meta descriptions

Action: Technical fixes + content enhancement

Segment 2: Outdated Content
├── 567 pages: >2 years old
├── 234 pages: About discontinued products
└── 189 pages: Old pricing information

Action: Update or 301 redirect to current versions

Segment 3: Non-Essential Pages
├── 575 pages: Press releases (no traffic value)
└── Result: Consolidated to single news archive

Action Plan:
1. 410 Gone for truly obsolete: 189 pages
2. 301 Redirect to updated versions: 567 pages
3. Consolidate thin content: 345 pages merged into 86 comprehensive guides
4. Delete: 575 press releases
```

**Results After Cleanup**:
```
Before:
├── Total pages: 5,000
├── Average engagement: 43%
└── Conversion rate: 2.1%

After (6 months):
├── Total pages: 3,456 (-31%)
├── Average engagement: 67% (+24%)
└── Conversion rate: 3.8% (+1.7%)

Business Impact:
- Improved crawl efficiency
- Higher quality score
- Better user experience
- 34% increase in organic conversions
```

### Use Case #5: International SEO Audit

**Scenario**: Global e-commerce site with 15 country versions

**Objective**: Ensure proper hreflang implementation

**Step 1: Crawl with Hreflang Analysis**
```
Configuration:
1. Configuration → Hreflang
2. ✓ Validate Hreflang
3. ✓ Check return tags

Crawl: example.com (all subdomains)
```

**Step 2: Hreflang Validation**
```
Directives → Hreflang

Common Issues Found:

Issue 1: Missing Return Tags
Page: example.com/en-us/products
Hreflang to: example.com/en-uk/products
Return tag: Missing ❌

Impact: UK page doesn't reference US page back
Fix: Add reciprocal hreflang tags

Issue 2: Incorrect Language Codes
Page: example.com/br/
Hreflang: pt-br ✓
Linked page: example.com/pt/
Hreflang: pt ❌ (should be pt-pt for Portugal)

Fix: Update to proper ISO codes

Issue 3: Self-Referencing Missing
Page: example.com/en-us/products
Hreflang tags:
├── en-gb
├── en-au
├── de-de
└── Missing: en-us (self) ❌

Fix: Add self-referencing tag

Issue 4: Wrong URL in Hreflang
Page: example.com/en-us/blue-widgets
Hreflang en-gb: example.com/en-gb/widgets ❌

Should be: example.com/en-gb/blue-widgets

Fix: Update to equivalent page URLs
```

**Real Implementation Example**:
```html
<!-- Correct Hreflang Implementation -->
<link rel="alternate" hreflang="en-us" href="https://example.com/en-us/products" />
<link rel="alternate" hreflang="en-gb" href="https://example.com/en-gb/products" />
<link rel="alternate" hreflang="en-au" href="https://example.com/en-au/products" />
<link rel="alternate" hreflang="de-de" href="https://example.com/de-de/produkte" />
<link rel="alternate" hreflang="fr-fr" href="https://example.com/fr-fr/produits" />
<link rel="alternate" hreflang="x-default" href="https://example.com/en-us/products" />
```

**Step 3: Cross-Country Analysis**
```
Export Data:
├── URL
├── Hreflang Count
├── Hreflang Errors
└── Hreflang Tags

Findings:

Total Pages: 45,678
Hreflang Implementation:
├── Correct: 38,234 (83.7%)
├── Missing return tags: 4,123 (9.0%)
├── Wrong codes: 2,345 (5.1%)
├── Missing self-reference: 976 (2.1%)

Priority Fix:
Focus on top 500 pages by traffic
Result: 97% correct implementation within 2 weeks
```

---
