
## 2.2 Crawling and Indexing

---

### Crawl Budget Optimization

Crawl budget is the number of pages search engines will crawl on your site within a given timeframe.

#### What is Crawl Budget?

**Google's Resources:**
- Googlebot can only crawl so many pages
- Large sites compete for crawl resources
- Wasting crawl budget = important pages not crawled

**Crawl Budget = Crawl Rate Limit × Crawl Demand**

- **Crawl Rate Limit:** How fast Google can crawl without overwhelming your server
- **Crawl Demand:** How much Google wants to crawl your site (based on popularity and freshness)

#### Who Needs to Worry About Crawl Budget?

**✅ Sites That Should Optimize:**
- 🔹 Large sites (10,000+ pages)
- 🔹 E-commerce sites with many products
- 🔹 News sites with frequent updates
- 🔹 Sites with faceted navigation
- 🔹 Sites with crawl errors

**❌ Sites That Don't Need to Worry:**
- 🔹 Small sites (<1,000 pages)
- 🔹 Sites with all pages being crawled regularly
- 🔹 New sites with little content

**Google's Statement:**
"Most sites don't need to worry about crawl budget."

But if you're not sure, check Google Search Console → Crawl Stats.

#### Checking Your Crawl Budget

**Google Search Console > Settings > Crawl Stats**

```
Crawl requests per day:  2,500
Average response time:   200ms
Total pages crawled:     2,200
```

**Good Signs:**
- ✅ All important pages crawled regularly
- ✅ New pages indexed within days
- ✅ Low server response time

**Bad Signs:**
- ❌ Important pages not being crawled
- ❌ Crawl rate decreasing
- ❌ Many crawl errors
- ❌ High server response time

#### How to Optimize Crawl Budget

**1. Fix Server Issues**

```
High Server Response Time = Slower Crawling
```

**Check:**
```bash
# Check response time
curl -w "@curl-format.txt" -o /dev/null -s "https://yoursite.com"

# curl-format.txt:
time_namelookup:  %{time_namelookup}\n
time_connect:  %{time_connect}\n
time_appconnect:  %{time_appconnect}\n
time_pretransfer:  %{time_pretransfer}\n
time_redirect:  %{time_redirect}\n
time_starttransfer:  %{time_starttransfer}\n
----------\n
time_total:  %{time_total}\n
```

**Optimize:**
- Use CDN (Cloudflare, AWS CloudFront)
- Enable caching
- Optimize database queries
- Upgrade hosting

**2. Block Low-Value Pages**

```
# robots.txt
User-agent: *
Disallow: /search?
Disallow: /cart/
Disallow: /*?sessionid=
Disallow: /*?sort=
Disallow: /*?filter=
```

**3. Fix Broken Links and Redirect Chains**

```
❌ Bad: Too many redirects
https://old.com/page 
  → 301 → https://new.com/page
    → 301 → https://new.com/page/
      → 301 → https://www.new.com/page/

✅ Good: Direct redirect
https://old.com/page 
  → 301 → https://www.new.com/page/
```

**4. Remove Duplicate Content**

```
Canonical tags prevent crawling duplicates:

<link rel="canonical" href="https://example.com/original-page/" />
```

**5. Update Sitemap Strategically**

```xml
<!-- Only include pages you WANT crawled -->
<!-- Remove:
- Duplicate pages
- Low-value pages
- Out-of-stock products
- Old blog posts
-->

<!-- Focus on:
- Homepage
- Important categories
- Best-performing products
- Recent content
-->
```

**6. Use Noindex for Low-Value Pages**

```html
<!-- Don't waste crawl budget on thin content -->
<meta name="robots" content="noindex, follow">
```

**7. Improve Site Structure**

```
Flat structure = Better crawling

❌ Bad:
Home → Cat → Subcat → Subcat → Subcat → Product (6 clicks deep)

✅ Good:
Home → Category → Product (3 clicks deep)
```

#### Real Case Study: E-commerce Crawl Budget Optimization

**Company:** Online Furniture Store  
**Size:** 50,000 products, 500,000+ pages (with filters/parameters)

**Problem:**
```
Google Search Console showed:
- Crawl requests: 10,000/day
- Pages crawled: 8,500/day
- But site has 50,000 important pages

Many products NOT being crawled for weeks
New products taking 2-3 weeks to appear in Google
```

**Investigation:**

```python
# Analyzed crawl log
# Found Google wasting budget on:

- Filter pages: 300,000 URLs (60% of crawl budget!)
  /sofas/?color=blue&size=large&price=500-1000
  
- Search pages: 50,000 URLs
  /search?q=blue+sofa
  
- Pagination: 100,000 URLs
  /category/page/45/
  
- Out of stock: 15,000 URLs
  (Products no longer available)
  
- Redirect chains: 5,000 URLs
  (Multiple 301 redirects)
```

**Solution Implemented:**

**Step 1: Block Low-Value URLs**
```
# robots.txt
User-agent: *
Disallow: /*?color=
Disallow: /*?price=
Disallow: /*?sort=
Disallow: /*&*  # Multiple parameters
Disallow: /search?
```

**Step 2: Canonical Tags**
```html
<!-- All filtered pages point to base category -->
<link rel="canonical" href="https://store.com/sofas/" />
```

**Step 3: Remove Out-of-Stock Products**
```php
// 410 Gone (better than 404 for permanently removed)
if ($product->stock == 0 && $product->discontinued) {
    header("HTTP/1.1 410 Gone");
    exit;
}
```

**Step 4: Fix Redirect Chains**
```
Updated all internal links to point directly to final URL
Used 301 redirects only once per chain
```

**Step 5: Optimized Sitemap**
```xml
<!-- Only included:
- In-stock products
- Main category pages
- Popular products
- Recent additions
-->

<!-- Removed:
- Out of stock
- Duplicate URLs
- Paginated URLs
-->
```

**Step 6: Improved Server Speed**
```
- Implemented Redis caching
- Optimized database queries
- Upgraded hosting
- Added CDN

Response time: 800ms → 150ms
```

**Results After 3 Months:**

```
Crawl Budget Improved:
- Pages crawled: 8,500/day → 12,000/day
- Crawl of important pages: 45% → 95%
- New products indexed: 2-3 weeks → 2-3 days
- Server response time: 800ms → 150ms

SEO Impact:
✅ Organic traffic: +58%
✅ Indexed products: 22,000 → 48,000
✅ Long-tail keywords: +340%
✅ Revenue from organic: +$180K/month

Server Performance:
✅ Server load decreased 40%
✅ Costs reduced (less wasted resources)
```

---