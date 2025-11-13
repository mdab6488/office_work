# Technical SEO: Server, Hosting & International Implementation

## Server and Hosting

---

### Server Response Codes

HTTP status codes are critical for SEO. They tell search engines how to handle your content.

#### 1. 2xx Success Codes

##### 200 OK
**Meaning:** Request succeeded, content delivered normally.

**SEO Impact:** ✅ Page is indexed and ranked normally.

**Example:**
```
Request: GET https://example.com/blog/seo-guide
Response: 200 OK
Content-Type: text/html

This is the ideal response for all accessible pages.
```

**Real-Life Scenario:**
```
Product page: https://shop.com/products/running-shoes
Status: 200 OK
Result: 
- Page is crawled
- Content is indexed
- Appears in search results
- Link equity flows normally
```

---

##### 201 Created
**Meaning:** Request succeeded and a new resource was created.

**SEO Impact:** Minimal direct SEO impact (used mainly for APIs).

**Example:**
```http
POST /api/blog-posts
Status: 201 Created
Location: /blog/new-post-title

Used when creating new content via API or CMS.
```

---

#### 2. 3xx Redirection Codes

##### 301 Moved Permanently
**Meaning:** Resource permanently moved to a new URL.

**SEO Impact:** 
- ✅ Passes 90-99% of link equity
- ✅ Old URL is deindexed
- ✅ New URL inherits ranking signals

**When to Use:**
- Site migration
- URL structure changes
- Domain changes
- Consolidating duplicate content

**Real-Life Example 1: Site Migration**
```
Old domain: oldshop.com/products/widget
New domain: newshop.com/products/widget

.htaccess configuration:
RewriteEngine On
RewriteCond %{HTTP_HOST} ^oldshop\.com$ [NC]
RewriteRule ^(.*)$ https://newshop.com/$1 [R=301,L]

Result after 3 months:
- 95% of ranking power transferred
- Old URLs completely deindexed
- New domain ranking in same positions
```

**Real-Life Example 2: E-commerce Restructure**
```
Scenario: Changing URL structure for better SEO

Before: example.com/product.php?id=123
After: example.com/products/blue-running-shoes

Implementation:
<?php
// In product.php
$newUrl = '/products/blue-running-shoes';
header("HTTP/1.1 301 Moved Permanently");
header("Location: " . $newUrl);
exit();
?>

Results:
- All link equity transferred
- Old URLs removed from index within 4 weeks
- Rankings maintained
- Click-through rate improved by 23% (better URLs)
```

**Common 301 Redirect Mistakes:**
```
❌ Redirect chains (A→B→C)
✅ Direct redirects (A→C)

❌ Redirecting everything to homepage
✅ Redirect to most relevant equivalent page

❌ Using 302 instead of 301
✅ Always use 301 for permanent moves

❌ Not updating internal links
✅ Update internal links to point directly to new URLs
```

---

##### 302 Found (Temporary Redirect)
**Meaning:** Resource temporarily at different URL.

**SEO Impact:** 
- ⚠️ Does NOT pass link equity
- ⚠️ Original URL stays indexed
- ⚠️ Can cause confusion if used incorrectly

**When to Use:**
- A/B testing
- Temporary promotions
- Maintenance mode
- Geo-targeting before final decision

**Real-Life Example: A/B Testing**
```
Scenario: Testing new product page design

Original: /products/widget (stays indexed)
Test Version: /products/widget-test

Implementation:
<?php
// 50% of traffic sees new version
if (rand(0, 1) == 1) {
    header("HTTP/1.1 302 Found");
    header("Location: /products/widget-test");
    exit();
}
?>

Why 302 is correct:
- Original page should remain indexed
- Test is temporary (2-4 weeks)
- Not passing link equity to test page
- Will return to original after test
```

**Real-Life Example: Seasonal Redirect**
```
Scenario: Holiday promotion page

Normal URL: example.com
Holiday URL: example.com/black-friday-sale

During November 20-30:
header("HTTP/1.1 302 Found");
header("Location: /black-friday-sale");

After December 1:
Remove redirect, return to normal

Why 302:
- Temporary promotion
- Homepage should stay as primary URL in index
- Don't want to lose homepage rankings
```

---

##### 307 Temporary Redirect
**Meaning:** Temporary redirect that preserves the HTTP method.

**SEO Impact:** Similar to 302, but maintains POST requests.

**Real-Life Example: Form Submission**
```
Scenario: API endpoint temporarily moved

Original POST endpoint: /api/v1/submit-form
Temporary endpoint: /api/v2/submit-form

Response:
HTTP/1.1 307 Temporary Redirect
Location: /api/v2/submit-form

The POST method and body are preserved.
```

---

##### 308 Permanent Redirect
**Meaning:** Permanent redirect that preserves HTTP method.

**SEO Impact:** Same as 301 but maintains POST requests.

**When to Use:** RESTful APIs where method preservation matters.

---

#### 3. 4xx Client Error Codes

##### 404 Not Found
**Meaning:** Requested resource doesn't exist.

**SEO Impact:**
- ❌ Page removed from index
- ❌ Wastes crawl budget
- ❌ Poor user experience
- ❌ Lost link equity from backlinks

**Real-Life Example: E-commerce Product Discontinuation**

**Scenario:** Running shoe model discontinued

❌ **Bad Approach:**
```
URL: example.com/products/nike-air-zoom-2020
Status: 404 Not Found

Problems:
- 150 backlinks pointing to page (link equity lost)
- Still receiving 200 visits/month from Google
- Users see error page
- High bounce rate
```

✅ **Good Approach:**
```
URL: example.com/products/nike-air-zoom-2020
Status: 301 Redirect
Target: example.com/products/nike-air-zoom-2023

Result:
- Link equity preserved
- Users redirected to newer model
- Conversion rate maintained
- No broken link warnings
```

✅ **Alternative Approach: 410 Gone**
```
If product line completely discontinued with no replacement:

URL: example.com/products/discontinued-model
Status: 410 Gone

Benefits:
- Tells Google to remove from index faster than 404
- Stops wasting crawl budget
- More definitive than 404
```

**Real-Life Example: Blog Post Removal**
```
Scenario: Removing outdated content

Old URL: example.com/blog/internet-explorer-11-tips
Status: 404 (wrong) or 410 (better)

Best Strategy:
1. If content genuinely outdated and no alternative exists:
   Return 410 Gone

2. If similar updated content exists:
   301 redirect to: example.com/blog/modern-browser-tips

3. If part of important category:
   301 redirect to category page
```

**Monitoring 404 Errors:**
```bash
# Find 404 errors in server logs
grep "404" /var/log/nginx/access.log | head -20

# Google Search Console
Search Console → Coverage → Excluded → Not found (404)

Action Plan:
- Fix broken internal links immediately
- 301 redirect valuable URLs with backlinks
- 410 for truly dead content
- Monitor monthly for new 404s
```

---

##### 410 Gone
**Meaning:** Resource permanently removed and won't return.

**SEO Impact:**
- ✅ Faster removal from index than 404
- ✅ Clear signal to search engines
- ✅ Stops crawl budget waste

**When to Use:**
- Permanently deleted content
- No replacement exists
- Want faster deindexing

**Real Example:**
```
Scenario: Legal requirement to remove content

URL: example.com/old-terms-of-service-2015
Status: 410 Gone

Result:
- Removed from Google index within 1-2 weeks
- Crawlers stop trying to access
- Clear legal compliance
```

---

##### 403 Forbidden
**Meaning:** Server refuses to provide resource (permission issue).

**SEO Impact:**
- ❌ Page not indexed
- ❌ Wastes crawl budget if many pages affected

**Common Causes & Fixes:**
```
Problem: Accidentally blocking Googlebot

.htaccess causing 403:
# WRONG - blocks Googlebot
Deny from all

Fix:
# Allow Googlebot
Allow from all
# Or specific IP ranges for security
```

**Real-Life Example:**
```
Scenario: Development site accidentally live

URL: example.com/staging/
Status: 403 Forbidden

Caused by:
<Directory /var/www/staging>
    Require all denied
</Directory>

Issue: If staging indexed, creates duplicate content

Fix: Use robots.txt instead
User-agent: *
Disallow: /staging/
```

---

##### 429 Too Many Requests
**Meaning:** User sent too many requests in a given time (rate limiting).

**SEO Impact:**
- ⚠️ Can hurt crawling if too aggressive
- ⚠️ May slow indexing

**Best Practice:**
```
Don't rate limit Googlebot too aggressively

# Good rate limit for Googlebot
Limit: 10 requests per second

# Check user agent before rate limiting
if (user_agent != "Googlebot") {
    apply_rate_limit();
}
```

**Real Example:**
```
Scenario: API documentation site

Problem: Aggressive rate limiting blocking Googlebot
Limit: 5 requests/minute

Result: 
- Only 5 pages crawled per minute
- Large site takes forever to index
- New content not appearing in search

Fix:
- Increase limit for verified Googlebot
- Monitor in Google Search Console
- Set Crawl Rate in GSC settings
```

---

#### 4. 5xx Server Error Codes

##### 500 Internal Server Error
**Meaning:** Generic server error.

**SEO Impact:**
- ❌ Page temporarily removed from index if persistent
- ❌ Lost traffic and rankings
- ❌ Very poor user experience

**Real-Life Crisis Example:**
```
Scenario: E-commerce site Black Friday

Time: 9:00 AM Black Friday
Error: 500 Internal Server Error on all product pages
Cause: Database connection pool exhausted

Impact:
- $50,000/hour in lost sales
- 95% bounce rate
- Google Search Console alerts
- Temporary ranking drops

Immediate Fix:
1. Check error logs: tail -f /var/log/nginx/error.log
2. Identify: Database connection issue
3. Increase connection pool: max_connections = 500
4. Restart service: systemctl restart mysql
5. Monitor: Recovery time < 15 minutes

Post-Incident:
- Implement database connection pooling
- Set up monitoring alerts
- Load testing for future sales events
- Implement queue system for high traffic
```

**Prevention Strategy:**
```bash
# Monitor server health
# Setup alert when error rate > 1%

# Check error logs regularly
tail -f /var/log/apache2/error.log

# Common causes:
1. Database connection failures
2. Insufficient PHP memory
3. Corrupted files
4. Server overload
5. Plugin conflicts (WordPress)
```

---

##### 502 Bad Gateway
**Meaning:** Server got invalid response from upstream server.

**SEO Impact:** Similar to 500, temporary deindexing if persistent.

**Real-Life Example:**
```
Scenario: Reverse proxy misconfiguration

Setup: Nginx → Apache → PHP-FPM
Error: 502 Bad Gateway

Cause: PHP-FPM stopped responding

# Check PHP-FPM status
systemctl status php-fpm

# Common fix - increase PHP-FPM settings
pm.max_children = 50
pm.start_servers = 10
pm.min_spare_servers = 5
pm.max_spare_servers = 15

# Restart
systemctl restart php-fpm

# Monitor recovery
watch -n 1 curl -I https://example.com
```

---

##### 503 Service Unavailable
**Meaning:** Server temporarily unable to handle request.

**SEO Impact:**
- ⚠️ Google understands temporary nature
- ✅ Won't immediately deindex if proper headers used

**When to Use Properly:**
```
Scenario: Planned maintenance

Best Practice Response:
HTTP/1.1 503 Service Unavailable
Retry-After: 3600
Content-Type: text/html

This tells Google:
- Service temporarily down
- Check back in 1 hour (3600 seconds)
- Don't deindex yet
```

**Real-Life Example: Site Migration**
```
During DNS propagation:

Old Server sends:
HTTP/1.1 503 Service Unavailable
Retry-After: 1800

New Server Status: 200 OK

Result:
- Minimal SEO impact during 24-48 hour migration
- Google understands temporary state
- No panic deindexing
- Smooth transition
```

**Implementation Example:**
```php
<?php
// Maintenance mode with proper headers
if ($maintenance_mode) {
    header('HTTP/1.1 503 Service Unavailable');
    header('Retry-After: 3600'); // 1 hour
    include('maintenance.html');
    exit();
}
?>
```

---

##### 504 Gateway Timeout
**Meaning:** Upstream server didn't respond in time.

**SEO Impact:** Similar to 502 and 503.

**Real-Life Example:**
```
Scenario: Slow database queries during high traffic

Problem: 
- Product page loads in 30+ seconds
- Nginx timeout set to 30 seconds
- Results in 504 errors

Logs show:
2025/11/04 10:23:45 [error] upstream timed out (110: Connection timed out)

Quick Fix:
# Increase timeout in Nginx
proxy_connect_timeout 60s;
proxy_send_timeout 60s;
proxy_read_timeout 60s;

Long-term Fix:
- Optimize database queries
- Add caching layer (Redis/Memcached)
- Implement query indexing
- Use database query analysis
```

---
