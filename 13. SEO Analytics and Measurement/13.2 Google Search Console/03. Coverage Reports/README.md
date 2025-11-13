
### 2.3 Coverage Reports

#### Understanding Coverage Status

**Index Coverage Report Navigation:**
```
Indexing → Pages
```

**Status Categories:**

```plaintext
┌────────────────────────────────────────────────────┐
│ 1. INDEXED (Green)                                 │
│ ✓ Pages successfully indexed                      │
│ ✓ Appearing in search results                     │
│ Example: 2,456 pages indexed                      │
└────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────┐
│ 2. NOT INDEXED (Red/Orange)                        │
│ ✗ Pages found but not indexed                     │
│ ✗ Won't appear in search results                  │
│ Example: 134 pages excluded                       │
└────────────────────────────────────────────────────┘

Common Reasons:
- Crawled - currently not indexed
- Discovered - currently not indexed  
- Alternate page with proper canonical tag
- Duplicate content
- Soft 404
- Page with redirect
- Blocked by robots.txt
- Noindex tag present
```

**Real-Life Coverage Analysis:**

```plaintext
OnlineStore.com - Index Coverage Report
════════════════════════════════════════════

Total Pages: 3,250
Status Breakdown:
─────────────────────────────────────────────

✓ Indexed: 2,456 pages (75.6%)
  - Main products: 1,890
  - Category pages: 245
  - Blog posts: 287
  - Information pages: 34

⚠ Excluded: 634 pages (19.5%)
  - Noindex (intentional): 420
    → Duplicate product variations
    → Internal search results
    → Cart/checkout pages
  - Duplicate content: 89
  - Soft 404 errors: 78
  - Blocked by robots.txt: 47

✗ Error: 160 pages (4.9%)
  - Server error (5xx): 42
  - Not found (404): 78
  - Redirect error: 25
  - Other: 15

Priority Actions:
──────────────────────────────────────────────

1. Fix 78 Soft 404s (High Priority)
   Pages returning 200 but no content
   Example: /product/item-123 (discontinued)
   Solution: Return proper 404 or 301 redirect

2. Resolve 89 Duplicate Issues (Medium Priority)
   Problem: Similar products indexed separately
   Example: 
   - /blue-widget
   - /blue-widget?size=large
   - /blue-widget?color=blue
   
   Solution: Implement canonical tags
   <link rel="canonical" href="/blue-widget" />

3. Fix 42 Server Errors (High Priority)
   Problem: Pages timing out or returning 500
   Solution: 
   ✓ Optimize database queries
   ✓ Increase server resources
   ✓ Add caching layer

After Fixes:
✓ Indexed: 2,545 pages (78.3%) - +89 pages
✗ Errors: 0 pages (0%) - Fixed all
⚠ Excluded: 705 pages (21.7%) - Intentional

Estimated Impact: +12% organic traffic from indexing fixes
```

#### Handling Common Issues

**Issue 1: "Discovered - Currently Not Indexed"**

```plaintext
Problem: Google found the page but hasn't indexed it

Reasons:
❌ Low-quality or thin content
❌ Page is not important enough (low crawl priority)
❌ Duplicate or similar content exists
❌ Poor internal linking

Real-Life Fix:
─────────────────────────────────────────────────

Blog Post: "/email-marketing-tips"
Status: Discovered - not indexed (4 months)
Content: 450 words, generic advice

Action Taken:
1. Expand content: 450 → 2,100 words
2. Add unique insights and case studies
3. Include data and statistics
4. Add internal links from 5 high-traffic pages
5. Submit URL for indexing via GSC
6. Build 2 quality backlinks

Result: Indexed within 3 weeks
Traffic: 0 → 340 monthly visits
```

**Issue 2: "Crawled - Currently Not Indexed"**

```plaintext
Problem: Google crawled but chose not to index

Reasons:
❌ Content quality issues
❌ Duplicate content
❌ Page is similar to other indexed pages
❌ Thin content

Real-Life Fix:
─────────────────────────────────────────────────

Product Page: "/budget-wireless-headphones"
Status: Crawled - not indexed
Content: 200 words, manufacturer description

Action Taken:
1. Write unique 1,500-word review
2. Add comparison table with competitors
3. Include user testimonials
4. Add FAQ section with schema
5. Optimize title tag and meta description
6. Add high-quality images with alt text

Result: Indexed within 1 week
Position: 6.2 for "budget wireless headphones"
Monthly clicks: 280
```

**Issue 3: "Duplicate Without User-Selected Canonical"**

```plaintext
Problem: Multiple similar URLs, Google choosing canonical

Real-Life Example:
─────────────────────────────────────────────────

E-commerce filtering creates duplicate URLs:
- /shoes
- /shoes?color=red
- /shoes?color=red&size=10
- /shoes?size=10&color=red

Google's view:
"You have 4 similar pages. I'll index /shoes and ignore the rest."

Solution 1: Canonical Tags (Preferred)
<!-- Add to filtered pages -->
<link rel="canonical" href="https://site.com/shoes" />

Solution 2: URL Parameters in GSC
Settings → URL Parameters → Configure:
- color: Filters results
- size: Filters results
Action: Let Googlebot decide

Solution 3: Robots.txt (Nuclear option)
Disallow: /shoes?*

Result: Clear canonical signals, better indexing
```

**Issue 4: "Soft 404"**

```plaintext
Problem: Page returns 200 but has no content

Real-Life Example:
─────────────────────────────────────────────────

URL: /product/vintage-camera-123
Issue: Product sold out, page shows "Not available"
But: Server returns HTTP 200 (success)

Google sees:
"This page says it's okay (200) but has no useful content. 
It's probably an error page. I'll treat it as 404."

Correct Solutions:

Option 1: Return 410 (Gone)
```php
header("HTTP/1.1 410 Gone");
```

Option 2: Return 404 (Not Found)
```php
header("HTTP/1.1 404 Not Found");
```

Option 3: 301 Redirect to Category
```php
header("Location: /cameras/vintage", true, 301);
```

Best Practice:
- Discontinued products → 410
- Never-existed products → 404
- Temporarily unavailable → 200 (show content)
```

---

### 2.4 URL Inspection Tool

#### Using the URL Inspection Tool

**Purpose:** Deep-dive analysis of individual URLs to diagnose indexing and rendering issues.

**How to Use:**

```plaintext
1. Enter URL at top of GSC: https://yoursite.com/page
2. Click "Enter" or "Inspect URL"
3. Wait for results (5-10 seconds)
4. Review coverage, indexing, and rendering
```

**What You'll See:**

```plaintext
┌────────────────────────────────────────────────────┐
│ URL Status                                         │
├────────────────────────────────────────────────────┤
│ ✓ URL is on Google                                │
│ ✓ Coverage: Indexed                               │
│ ✓ Last crawl: 2024-11-03                          │
│ ✓ Crawled as: Smartphone Googlebot               │
│ ✓ User-declared canonical:                        │
│   https://yoursite.com/page                       │
│ ✓ Google-selected canonical:                      │
│   https://yoursite.com/page                       │
└────────────────────────────────────────────────────┘

Actions Available:
- "Test Live URL" - Check current version
- "Request Indexing" - Fast-track indexing
- "View Crawled Page" - See Google's version
```

**Real-Life Diagnostic Scenarios:**

**Scenario 1: Page Not Indexing**

```plaintext
Problem: Important product page not appearing in search

URL Inspection Results:
────────────────────────────────────────────────────
URL: /premium-wireless-earbuds
Status: ✗ URL is not on Google
Reason: Crawled - currently not indexed

Coverage Details:
- Crawl allowed: Yes
- Indexing allowed: Yes
- Page fetch: Successful
- Last crawl: 2024-10-28

Enhancements:
⚠ Mobile usability: Issues detected
  - Text too small to read
  - Clickable elements too close

⚠ Core Web Vitals: Poor
  - LCP: 4.2s (should be <2.5s)
  - CLS: 0.31 (should be <0.1)

Diagnostic Process:
───────────────────────────────────────────────────

Step 1: Click "Test Live URL"
Result: Page loads successfully, content detected

Step 2: View Rendered Page
Issue: JavaScript not loading product images
Fix: Ensure images load without JavaScript

Step 3: Check robots.txt
Status: No blocks found

Step 4: Check meta robots
<meta name="robots" content="index, follow"> ✓

Step 5: Check canonical tag
<link rel="canonical" href=".../premium-wireless-earbuds"> ✓

Root Cause: Poor Core Web Vitals + Mobile Issues

Solutions Implemented:
✓ Optimize images (WebP format, lazy loading)
✓ Fix mobile viewport settings
✓ Reduce JavaScript blocking
✓ Improve button spacing (mobile)

Re-submit for Indexing:
1. Click "Request Indexing"
2. Wait 1-2 weeks
3. Re-check with URL Inspection

Result: Page indexed within 9 days
Position: 7.8 for target keyword
Monthly clicks: 420
```

**Scenario 2: Canonical Mismatch**

```plaintext
Problem: Google indexing wrong version of page

URL Inspection: https://site.com/blog/seo-guide
────────────────────────────────────────────────────
Status: ✓ URL is on Google

⚠ WARNING:
User-declared canonical: https://site.com/blog/seo-guide
Google-selected canonical: https://site.com/seo-guide

Google's explanation:
"We found a shorter, better URL and chose it as canonical."

Impact:
- Your intended page not ranking
- Shorter URL (wrong one) appearing in search
- Confused signals, lower rankings

Diagnosis:
───────────────────────────────────────────────────

Page A: /blog/seo-guide (intended to rank)
- 3,500 words of content
- Well-structured
- Good backlinks

Page B: /seo-guide (old redirect)
- 301 redirects to Page A
- But: Google ignoring redirect
- Google prefers shorter URL

Solutions:
───────────────────────────────────────────────────

Option 1: Remove Page B entirely
✓ Delete /seo-guide completely
✓ Return 404 or 410
✓ Remove from sitemap

Option 2: Strengthen canonical signals
✓ Ensure 301 is permanent (not 302)
✓ Add self-referencing canonical to Page A
✓ Update internal links to Page A only
✓ Remove any links to Page B

Option 3: Keep Page B, canonical to A
✓ Add strong canonical from B → A
   <link rel="canonical" href="/blog/seo-guide" />
✓ Ensure redirect chain is clean

Chosen: Option 1 (simplest)
Result: Page A indexed correctly within 2 weeks
```

**Scenario 3: JavaScript Rendering Issues**

```plaintext
Modern Single-Page Application (SPA) Problem

URL: https://webapp.com/dashboard
Framework: React.js
Issue: Content not appearing in Google search

URL Inspection Test:
────────────────────────────────────────────────────

1. Test Live URL → Click "View Tested Page"

HTML View (What Google initially sees):
```html
<div id="root"></div>
<script src="app.js"></script>
```

Rendered View (After JavaScript):
```html
<div id="root">
  <h1>Dashboard Overview</h1>
  <div class="stats">...</div>
  <div class="charts">...</div>
</div>
```

Problem Identified:
❌ Critical content loads only via JavaScript
❌ Google can render JS, but it takes time
❌ Slower indexing, lower priority

Solution: Server-Side Rendering (SSR)

Before (Client-Side Only):
User requests page → Server sends empty HTML → 
Browser downloads JS → JS renders content →
Google has to execute JS to see content

After (SSR with Next.js):
User requests page → Server renders full HTML → 
Sends complete page → Content immediately visible →
Google indexes quickly

Implementation:
```javascript
// Next.js example
export async function getServerSideProps() {
  const data = await fetchDashboardData();
  return { props: { data } };
}

export default function Dashboard({ data }) {
  return (
    <div>
      <h1>Dashboard Overview</h1>
      <Stats data={data} />
    </div>
  );
}
```

Result:
- HTML contains content immediately
- Google indexes properly
- Improved search visibility
- Faster time to index
```

#### Request Indexing Feature

**When to Use:**

```plaintext
✓ New important page published
✓ Significant content update
✓ Fixing previously broken page
✓ Correcting canonical issues
✓ After major technical fixes

⨯ Don't abuse (Google has daily limits)
⨯ Don't submit low-quality pages
⨯ Don't re-submit unchanged pages
```

**Real-Life Indexing Strategy:**

```plaintext
Blog Post Publishing Workflow
════════════════════════════════════════════

Day 1: Publish New Post
- Publish at 9 AM EST
- Submit sitemap (auto-updates)
- Share on social media (crawl signal)

Day 2: Request Indexing
- Use URL Inspection Tool
- Click "Request Indexing"
- Typically indexed within 24-72 hours

Priority Pages (Request Immediately):
1. Money pages (product, service pages)
2. Time-sensitive content (news, trends)
3. High-value blog posts
4. Updated pages with significant changes

Normal Pages (Let Google Find):
1. Author pages
2. Tag/category pages
3. Archive pages
4. Less important updates

Result Tracking:
Week 1: 60% of priority pages indexed
Week 2: 90% of priority pages indexed
Week 4: 100% of priority pages indexed

vs. No Request Indexing:
Week 1: 20% indexed
Week 2: 45% indexed
Week 4: 70% indexed

Time saved: ~3 weeks to full indexing
```

---
