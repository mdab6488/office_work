
### Content Pruning

Content pruning is the strategic removal or de-indexing of low-performing, outdated, or redundant content that may be hurting your site's overall performance.

#### Why Prune Content?

**1. Quality Signals to Google**

Google evaluates your entire site, not just individual pages. Low-quality content brings down your site's average quality score.

**Real-Life Example - MarketMuse Study:**

They analyzed 1,000 websites and found:
- Sites with 30%+ thin content ranked lower overall
- After pruning low-quality pages, average rankings improved by 17%
- Traffic often increased despite having fewer total pages

**2. Crawl Budget Optimization**

Search engines allocate limited resources to crawl your site. Don't waste it on poor content.

**Real-Life Example - Wayfair:**

The furniture retailer had millions of product pages. They:
- Identified 60,000 pages with zero traffic in 12 months
- De-indexed or consolidated them
- Result: 15% increase in organic traffic to remaining pages
- Reason: Googlebot spent more time on valuable pages

**3. Avoid Keyword Cannibalization**

Multiple similar pages compete against each other instead of ranking one page strongly.

**Real-Life Example:**

❌ **Before (Cannibalization):**
- "Best running shoes" (Position 23)
- "Top running shoes" (Position 31)  
- "Running shoes guide" (Position 45)

✅ **After (Pruned and Consolidated):**
- "Best Running Shoes: Complete 2024 Guide" (Position 4)

---

#### How to Prune Content: Step-by-Step Process

**Step 1: Audit Your Content**

**Tool Stack:**
- Google Search Console
- Google Analytics
- Screaming Frog
- Ahrefs or SEMrush

**Real-Life Example - Medium's Approach:**

Medium exported all URLs and analyzed:
```
Metrics tracked:
- Organic traffic (last 12 months)
- Backlinks
- Social shares
- Internal links
- Conversion rate
- Bounce rate
- Time on page
```

**Step 2: Categorize Content**

**Framework: The Content Pruning Matrix**

```
                    High Quality (well-written, comprehensive)
                              |
                              |
Low Traffic/Value ----------- + ----------- High Traffic/Value
                              |
                              |
                    Low Quality (thin, outdated, poorly written)
```

**Four Categories:**

**KEEP (High Quality + High Traffic)**
- Action: Maintain, maybe update
- Example: Your highest-trafficked evergreen guides

**IMPROVE (High Quality + Low Traffic)**
- Action: Optimize (we'll cover this in Content Updating)
- Example: Good content that needs better keywords/structure

**UPDATE (Low Quality + High Traffic)**
- Action: Rewrite completely
- Example: Old posts ranking but providing poor user experience

**REMOVE or CONSOLIDATE (Low Quality + Low Traffic)**
- Action: Delete, redirect, or merge
- Example: Thin content with no backlinks or traffic

---

**Step 3: Decision Criteria**

**When to Delete:**

**Real-Life Example - Shopify's Blog Pruning:**

They deleted posts that had:
- Zero traffic in 18 months
- Zero backlinks
- Outdated information (no longer relevant)
- Thin content (<300 words)
- Duplicate or near-duplicate topics

**Process:**
```
1. Export to "deleted" spreadsheet (for record-keeping)
2. Set up 301 redirect to relevant related post
3. Update internal links pointing to deleted post
4. Monitor traffic to new destination page
```

**When to Consolidate:**

**Real-Life Example - Backlinko:**

Brian Dean had three posts:
- "Link Building Strategies" (500 words, 50 backlinks)
- "Link Building Tactics" (800 words, 30 backlinks)
- "Link Building Techniques" (600 words, 20 backlinks)

**Consolidation strategy:**
1. Created one comprehensive guide: "Link Building: The Definitive Guide"
2. Combined best content from all three
3. Added new sections
4. Result: 3,000-word guide with 100 backlinks (combined)
5. Redirected old URLs to new guide

**Traffic impact:**
- Old posts combined: 2,000 visits/month
- New consolidated guide: 12,000 visits/month
- Improvement: 6x increase

---

**Step 4: Implement Pruning**

**Safe Pruning Process:**

**Real-Life Example - Ahrefs Blog Cleanup:**

```markdown
## Phase 1: Preparation
1. Export all URLs with metrics
2. Create backup of content
3. Document redirect mapping
4. Prepare monitoring dashboard

## Phase 2: Implementation (staged)
Week 1: Delete/redirect 10% of identified content
Week 2: Monitor traffic, rankings, errors
Week 3: Delete/redirect another 20%
Week 4: Monitor again
Week 5-6: Complete remaining pruning

## Phase 3: Monitoring
Track for 90 days:
- Overall organic traffic
- Rankings for target keywords
- Crawl errors
- 404 errors
- Redirect chains
```

**Results:**
- Removed 200 blog posts (30% of total)
- Organic traffic increased 35%
- Average post engagement up 58%

---

**Step 5: Handle Redirects Properly**

**301 Redirect Best Practices:**

❌ **Wrong approach:**
- Delete post without redirect
- Redirect everything to homepage
- Create redirect chains

✅ **Right approach:**
```
Deleted Post: "Email Marketing Tips for 2019"
Best Redirect Target: "Email Marketing Guide 2024" (similar topic)

Alternative if no similar post: Main "Email Marketing" category page
Last resort: Homepage (but avoid this)
```

**Real-Life Example - REI's Site Migration:**

When REI redesigned their site, they:
1. Mapped every old URL to new equivalent
2. Prioritized pages with backlinks
3. Used 301 redirects (not 302)
4. Created custom 404 page with search and suggestions
5. Monitored Google Search Console for errors

**Result:** Maintained 95% of organic traffic through migration

---

#### Content Pruning Checklist

```markdown
## Before Deleting/Consolidating:

□ Check for valuable backlinks
  - If yes: Definitely keep or redirect carefully
  
□ Check for traffic trends
  - Growing? Keep and optimize
  - Declining? Investigate why
  - Flat zero? Consider removing

□ Check for internal links
  - Update before deleting
  
□ Check for conversion value
  - Even low traffic might convert well
  
□ Check for brand mentions
  - Don't delete content others reference
  
□ Consider seasonality
  - "Tax tips" gets zero traffic in August
  
□ Set up 301 redirect
  - To most relevant alternative
  
□ Update sitemap
  - Remove deleted URLs
  
□ Monitor in GSC
  - Watch for errors after deletion
```

---
