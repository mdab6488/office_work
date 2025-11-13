
## 2.2 Crawling and Indexing

---


### Managing Crawl Errors

Crawl errors prevent search engines from accessing your content. Finding and fixing them is crucial for SEO.

#### Types of Crawl Errors

**1. Server Errors (5xx)**
```
500 Internal Server Error
502 Bad Gateway
503 Service Unavailable
504 Gateway Timeout
```

**Impact:** Google can't access your content.

**2. Not Found Errors (404)**
```
404 Page Not Found
```

**Impact:** Page doesn't exist, no content to index.

**3. Redirect Errors**
```
Redirect loop
Too many redirects (>5)
Redirect chain
```

**Impact:** Wastes crawl budget, poor UX.

**4. robots.txt Issues**
```
Blocked by robots.txt
robots.txt not accessible
```

**Impact:** Content not crawled.

**5. Timeout Errors**
```
Page takes too long to respond (>30 seconds)
```

**Impact:** Googlebot gives up, page not indexed.

#### Finding Crawl Errors

**Method 1: Google Search Console**

```
1. Go to "Coverage" report
2. View error types:
   - Submitted URL not found (404)
   - Redirect error
   - Server error (5xx)
   - Submitted URL blocked by robots.txt
   
3. Click each error for details
4. Export list of affected URLs
```

**Method 2: Server Logs Analysis**

```bash
# Apache access.log
# Find all 404 errors
grep "404" /var/log/apache2/access.log | awk '{print $7}' | sort | uniq -c | sort -rn

# Find 5xx errors
grep "50[0-9]" /var/log/apache2/access.log

# Find Googlebot requests
grep "Googlebot" /var/log/apache2/access.log | grep "404"
```

**Method 3: Screaming Frog SEO Spider**

```
1. Crawl your site
2. Check "Response Codes" tab
3. Filter by:
   - 404 Not Found
   - 5xx Server Errors
   - Redirect chains
4. Export affected URLs
```

**Method 4: Online Tools**

```
- sitechecker.pro
- ahrefs.com/site-audit
- semrush.com/site-audit
```

#### Fixing Common Crawl Errors

**1. Fixing 404 Errors**

**Option A: Redirect to relevant page (preferred)**
```apache
# .htaccess
Redirect 301 /old-product/ /new-product/
Redirect 301 /discontinued-item/ /similar-item/
```

**Option B: Restore the page**
```
If the page was deleted by mistake, recreate it.
```

**Option C: Create a helpful 404 page**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Page Not Found | Example Store</title>
</head>
<body>
    <h1>Oops! Page Not Found</h1>
    <p>The page you're looking for doesn't exist.</p>
    
    <h2>Try these popular pages:</h2>
    <ul>
        <li><a href="/bestsellers/">Best Sellers</a></li>
        <li><a href="/new-arrivals/">New Arrivals</a></li>
        <li><a href="/categories/">All Categories</a></li>
    </ul>
    
    <form action="/search/" method="get">
        <input type="search" name="q" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</body>
</html>
```

**2. Fixing Server Errors (5xx)**

```bash
# Check error logs
tail -f /var/log/apache2/error.log

# Common causes:
- Database connection issues
- Insufficient memory
- Timeout errors
- Coding errors
```

**Solutions:**
```php
// Increase PHP memory limit
ini_set('memory_limit', '256M');

// Increase execution time
set_time_limit(60);

// Enable error logging (not display)
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', '/path/to/error.log');
```

**3. Fixing Redirect Chains**

**❌ Bad: Multiple redirects**
```
example.com/page 
  → 301 → www.example.com/page
    → 301 → www.example.com/page/
      → 301 → https://www.example.com/page/
```

**✅ Good: Direct redirect**
```apache
# .htaccess
RewriteEngine On
RewriteCond %{HTTP_HOST} !^www\. [OR]
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://www.example.com/$1 [R=301,L]
```

**4. Fixing Soft 404s**

**What's a Soft 404?**
Page returns 200 OK but has no content (should be 404).

**Example:**
```
URL: /product-that-doesnt-exist/
Response: 200 OK
Content: "This product is not available"
```

**Fix:**
```php
<?php
$product = getProduct($id);

if (!$product) {
    header("HTTP/1.1 404 Not Found");
    include('404.php');
    exit;
}
?>
```

**5. Fixing Timeout Errors**

```php
// Optimize database queries
// Before:
$products = DB::table('products')->get(); // Gets ALL products

// After:
$products = DB::table('products')
    ->select('id', 'title', 'price')
    ->where('active', 1)
    ->limit(20)
    ->get();

// Enable caching
if (Cache::has('products')) {
    $products = Cache::get('products');
} else {
    $products = getProductsFromDatabase();
    Cache::put('products', $products, 3600);
}
```

#### Creating Error Monitoring System

**Simple PHP Error Logger:**

```php
<?php
// error-logger.php

function logCrawlError($url, $errorType, $errorMessage) {
    $logFile = '/var/log/crawl-errors.log';
    $timestamp = date('Y-m-d H:i:s');
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
    
    $logEntry = sprintf(
        "[%s] %s | %s | %s | UA: %s\n",
        $timestamp,
        $errorType,
        $url,
        $errorMessage,
        $userAgent
    );
    
    file_put_contents($logFile, $logEntry, FILE_APPEND);
    
    // Alert if Googlebot encounters error
    if (strpos($userAgent, 'Googlebot') !== false) {
        sendAlertEmail($url, $errorType);
    }
}

// Usage in your error handler
set_error_handler(function($errno, $errstr, $errfile, $errline) {
    if (error_reporting() & $errno) {
        logCrawlError(
            $_SERVER['REQUEST_URI'],
            'PHP Error',
            $errstr
        );
    }
    return false;
});
?>
```

#### Real Case Study: Crawl Error Resolution

**Company:** News Website (5,000+ articles)

**Problem Discovery:**
```
Google Search Console showed:
- 450 404 errors
- 89 5xx server errors
- 234 soft 404s
- Organic traffic declining 5% month-over-month
```

**Investigation:**

```bash
# Analyzed server logs
grep "404" access.log | grep "Googlebot" | awk '{print $7}' | sort | uniq -c | sort -rn

# Top 404 errors:
1,234 /old-blog-category/
  892 /products/discontinued-item-*
  456 /author/john-smith/
  234 /feed/
  189 /wp-content/uploads/2020/*.jpg
```

**Root Causes Found:**

1. **Site redesign broke URLs**
```
Old: /blog-category/article-name/
New: /news/article-name/
No redirects implemented!
```

2. **Deleted author pages**
```
Author left company, all articles reassigned
Author page deleted, causing 404s
```

3. **Broken image links**
```
CDN migration broke image URLs
Internal links still pointing to old CDN
```

4. **Server errors on popular pages**
```
Database query timeout on high-traffic articles
Comments section causing slowdown
```

**Solutions Implemented:**

**Step 1: Bulk Redirects**
```apache
# .htaccess
RewriteRule ^blog-category/(.*)$ /news/$1 [R=301,L]
RewriteRule ^author/john-smith/$ /news/ [R=301,L]
```

**Step 2: Fixed Image URLs**
```sql
-- Database update
UPDATE articles 
SET content = REPLACE(content, 'old-cdn.com', 'new-cdn.com')
WHERE content LIKE '%old-cdn.com%';
```

**Step 3: Optimized slow queries**
```php
// Before: Loading all comments
$comments = Comment::where('article_id', $id)->get();

// After: Pagination + caching
$comments = Cache::remember("article_{$id}_comments", 3600, function() use ($id) {
    return Comment::where('article_id', $id)
        ->where('approved', 1)
        ->orderBy('created_at', 'DESC')
        ->limit(20)
        ->get();
});
```

**Step 4: Improved 404 page**
```html
<!-- Added search, categories, popular articles -->
<!-- Logged 404s to database for monitoring -->
```

**Step 5: Monitoring Setup**
```php
// error-monitor.php
// Sends daily email with error summary
// Alerts immediately for critical errors (5xx)
```

**Results After 2 Months:**

```
Crawl Errors:
✅ 404 errors: 450 → 12 (97% reduction)
✅ 5xx errors: 89 → 3 (97% reduction)
✅ Soft 404s: 234 → 0 (100% fixed)

SEO Impact:
✅ Pages indexed: 4,200 → 4,980
✅ Crawl rate: +65%
✅ Organic traffic recovered: +28%
✅ Search visibility: +42%

User Experience:
✅ Bounce rate: 58% → 41%
✅ Page load time: 3.2s → 1.4s
✅ Server errors: 0.5% → 0.03%
```

---

## Summary: Technical SEO Checklist

### Website Architecture
- ✅ Flat site structure (max 3-4 clicks deep)
- ✅ Clean, descriptive URLs
- ✅ Strategic internal linking
- ✅ Breadcrumb navigation implemented
- ✅ Pagination properly configured
- ✅ Faceted navigation optimized

### Crawling & Indexing
- ✅ robots.txt configured correctly
- ✅ XML sitemaps generated and submitted
- ✅ HTML sitemap created
- ✅ Crawl budget optimized (for large sites)
- ✅ JavaScript rendering handled properly
- ✅ Crawl errors monitored and fixed

### Ongoing Maintenance
- ✅ Monitor Google Search Console weekly
- ✅ Check for new crawl errors monthly
- ✅ Update sitemaps when content changes
- ✅ Review site structure quarterly
- ✅ Test new pages for indexability
- ✅ Monitor page speed and server response

---

## Tools & Resources

**Essential Tools:**
- Google Search Console (Free)
- Screaming Frog SEO Spider (Free/Paid)
- Google PageSpeed Insights (Free)
- GTmetrix (Free/Paid)

**Advanced Tools:**
- Ahrefs Site Audit (Paid)
- SEMrush Site Audit (Paid)
- DeepCrawl (Paid)
- Sitebulb (Paid)

**Learning Resources:**
- Google Search Central Documentation
- Search Engine Journal
- Moz Blog
- Ahrefs Blog

---

**Next Steps:**
Ready to move on to On-Page SEO, Keyword Research, or Link Building? Let me know which section you'd like to dive into next!

---

*Guide created: November 2025*  
*Last updated: November 3, 2025*
