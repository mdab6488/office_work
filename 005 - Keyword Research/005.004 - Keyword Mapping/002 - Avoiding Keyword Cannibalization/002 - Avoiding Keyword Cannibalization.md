
### Avoiding Keyword Cannibalization

**What It Is:**
Keyword cannibalization occurs when multiple pages on your website compete for the same keywords, causing them to compete against each other in search results.

**Why It's Harmful:**
- Dilutes page authority across multiple pages
- Confuses Google about which page to rank
- Reduces click-through rates
- Wastes crawl budget
- Lower rankings for all competing pages
- Splits backlink equity

**Signs of Keyword Cannibalization:**

```
1. Multiple pages ranking for same keyword
2. Rankings fluctuate between different pages
3. Page ranking keeps changing
4. Lower-quality page ranks instead of better page
5. Traffic split between multiple pages
```

**How to Identify Cannibalization:**

**Method 1: Google Search**
```
Search: site:yourwebsite.com "your keyword"

Example: site:petstore.com "dog food"

If you see multiple pages targeting the same keyword, 
you likely have cannibalization.
```

**Method 2: Google Search Console**
```
1. Go to Performance report
2. Click on a keyword
3. Check "Pages" tab
4. If multiple pages appear for same query = cannibalization
```

**Method 3: SEO Tools**
```
Ahrefs: 
- Site Audit → Content Quality → Duplicate content
- Organic Keywords → Filter by keyword → Check multiple URLs

SEMrush:
- Position Tracking → Cannibalization report
- Shows keywords where multiple pages compete
```

**Real-Life Example:**

**Scenario:** E-commerce site selling running shoes

**Cannibalization Problem:**
```
Keyword: "women's running shoes"

Pages competing:
1. /womens-running-shoes (Category page) - Rank #15
2. /women-shoes (Broader category) - Rank #22
3. /blog/best-womens-running-shoes (Blog post) - Rank #18
4. /sale/womens-running-shoes (Sale page) - Rank #28

Problem:
- 4 pages diluting authority
- None ranking in top 10
- Google confused about which to rank
- Lost potential revenue
```

**How to Fix Keyword Cannibalization:**

**Solution 1: Consolidate Pages**

Merge similar content into one authoritative page.

```
BEFORE:
/blog/wordpress-seo-tips
/blog/wordpress-seo-guide  
/blog/optimize-wordpress-seo
All targeting "wordpress seo"

AFTER:
/blog/wordpress-seo-guide (comprehensive, merged content)
301 redirect other pages to main guide
Result: Rank #8 → Rank #2
```

**Solution 2: Differentiate Intent**

Assign different keyword variations to each page.

```
BEFORE (Cannibalization):
Page 1: /running-shoes → "running shoes"
Page 2: /best-running-shoes → "running shoes"
Both competing

AFTER (Differentiated):
Page 1: /running-shoes → "running shoes" (general category)
Page 2: /best-running-shoes → "best running shoes for beginners" (specific)
Page 3: /running-shoes-women → "women's running shoes" (gender-specific)
Page 4: /trail-running-shoes → "trail running shoes" (type-specific)

Each page targets distinct keyword with different intent.
```

**Solution 3: Implement 301 Redirects**

Remove duplicate/weak pages and redirect to strongest page.

```
Keep: /dog-training-guide (comprehensive, 1,500 words)
Remove & Redirect:
- /how-to-train-dogs → 301 to /dog-training-guide
- /dog-training-tips → 301 to /dog-training-guide
- /puppy-training → 301 to /dog-training-guide
```

**Solution 4: Canonical Tags**

Tell Google which version is preferred (use cautiously).

```
You have:
- /products?color=blue&size=large
- /products?size=large&color=blue
(Same content, different URL)

Solution:
<link rel="canonical" href="https://site.com/products?color=blue&size=large" />
```

**Solution 5: De-optimize Competing Pages**

Remove keyword from title/headings of pages you don't want to rank.

```
BEFORE:
Page A: "Best Coffee Makers - Ultimate Guide"
Page B: "Coffee Makers: Complete Buying Guide"
Both targeting "coffee makers"

AFTER:
Page A: "Best Coffee Makers - Ultimate Guide" (keep optimized)
Page B: "Buying Guide: How to Choose Your Perfect Morning Brew Maker" 
(de-optimized, different angle)
```

**Solution 6: Internal Linking Strategy**

Signal to Google which page is most important.

```
Primary Page: /email-marketing-guide

From other pages, link using target keyword:
"Learn more about [email marketing strategies]" 
→ Links to /email-marketing-guide

Don't link to competing page using same anchor text.
```

**Real-Life Fix Example:**

**Digital Marketing Agency**

**Problem Identified:**
```
Keyword: "SEO services"

Competing pages:
1. /seo-services (Service page)
2. /services/seo (Different service page URL)
3. /local-seo-services (Subcategory)
4. /seo-packages (Pricing page)

All ranking positions 11-20, fluctuating weekly.
```

**Solution Implemented:**

```
1. Consolidated:
   - Merged /services/seo INTO /seo-services
   - 301 redirect: /services/seo → /seo-services

2. Differentiated:
   - /seo-services → "SEO services" (main commercial)
   - /local-seo-services → "local SEO services" (specific type)
   - /seo-packages → "SEO pricing packages" (pricing intent)

3. De-optimized:
   - Changed /seo-packages title from "SEO Services Packages" 
     to "SEO Pricing & Package Options"

4. Internal linking:
   - All internal links for "SEO services" point to /seo-services
   - Links to /local-seo-services use "local SEO" anchor
   - Links to /seo-packages use "SEO pricing" anchor

5. Content differentiation:
   - /seo-services: Service overview, benefits, process
   - /local-seo-services: Local-specific strategies, case studies
   - /seo-packages: Pricing tiers, what's included, comparisons
```

**Results:**
```
8 weeks later:
/seo-services: Rank #4 (was #14)
/local-seo-services: Rank #6 for "local SEO services" (was #19)
/seo-packages: Rank #8 for "SEO pricing" (wasn't ranking)

Traffic impact: +215%
Conversion rate: +32% (clearer user journey)
```

**Prevention Checklist:**

```
✓ Use keyword mapping spreadsheet
✓ One primary keyword per page
✓ Regular SEO audits (quarterly)
✓ Content calendar with keyword assignments
✓ Internal linking strategy
✓ Clear site structure
✓ Regular Search Console monitoring
```

---
