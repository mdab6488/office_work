
## Troubleshooting Common Issues

### 1. JavaScript Rendering Issues

**Problem:** Content Not Visible After Rendering

**Symptoms:**
```
- Crawl shows different content than browser
- Title/meta tags missing or incorrect
- Internal links not discovered
- Structured data not found
```

**Diagnosis Steps:**

```yaml
Step 1: Check Rendering Settings
  Navigate to: Crawl Settings > JavaScript
  Verify:
    - JavaScript Rendering: Enabled ✓
    - Wait Time: 3-5 seconds
    - Network Idle: 2 seconds

Step 2: Test Specific URL
  Use: "Test Single URL" feature
  Compare:
    - HTML Source (before JS)
    - Rendered HTML (after JS)
  Look for:
    - setTimeout delays
    - Lazy loading
    - Infinite scroll
    - AJAX content loading

Step 3: Check Console Errors
  View: JavaScript Console Logs
  Common issues:
    - CORS errors blocking resources
    - 404s on JS/CSS files
    - Runtime JavaScript errors
    - API endpoints returning errors
```

**Solutions:**

**A. Increase Wait Time:**
```yaml
# If content loads slowly
Wait Time: 5 seconds → 10 seconds
Network Idle: 2 seconds → 5 seconds
Additional Wait: +2 seconds after initial load
```

**B. Fix JavaScript Errors:**
```javascript
// Common issue: Undefined variable
// Before (breaks rendering)
document.getElementById('content').innerHTML = data.content;

// After (with error handling)
const element = document.getElementById('content');
if (element && data && data.content) {
    element.innerHTML = data.content;
}
```

**C. Implement SSR:**
```javascript
// Use Next.js, Nuxt.js, or similar
export async function getServerSideProps() {
    // Pre-render content server-side
    const data = await fetchData();
    return { props: { data } };
}
```

### 2. Crawl Timeouts and Failures

**Problem:** Crawl Doesn't Complete

**Symptoms:**
```
- Crawl stops at random percentage
- "Crawl timeout" errors
- Pages not fully discovered
- Inconsistent results between crawls
```

**Diagnosis Steps:**

```yaml
Step 1: Check Server Response Times
  Look for:
    - Average response time > 3 seconds
    - Timeouts (no response)
    - Rate limiting (429 errors)
    - Server errors (500s)

Step 2: Review Crawl Rate
  Current setting: [X] URLs per second
  Server capacity: [Y] requests/second
  If X > Y: Reduce crawl rate

Step 3: Check Robots.txt Delays
  Crawl-delay directive might be set
  DeepCrawl respects this setting
```

**Solutions:**

**A. Adjust Crawl Rate:**
```yaml
# From
Crawl Rate: 300 URLs/second

# To (more conservative)
Crawl Rate: 50 URLs/second
OR
Crawl Rate: Auto-throttle (DeepCrawl adjusts based on response)
```

**B. Whitelist DeepCrawl Bot:**
```nginx
# Nginx configuration
# Whitelist DeepCrawl from rate limiting
geo $deepcrawl_bot {
    default 0;
    # DeepCrawl IP ranges
    52.48.0.0/16 1;
    54.246.0.0/16 1;
}

limit_req_zone $binary_remote_addr zone=crawlers:10m rate=10r/s;

server {
    location / {
        if ($deepcrawl_bot = 0) {
            limit_req zone=crawlers burst=20;
        }
        # No rate limit for DeepCrawl
    }
}
```

**C. Optimize Server Performance:**
```
1. Enable caching for static resources
2. Use CDN for assets
3. Implement database query optimization
4. Add server resources during crawl window
5. Schedule crawls during off-peak hours
```

### 3. Incorrect Indexability Status

**Problem:** Pages Marked as Non-Indexable Incorrectly

**Symptoms:**
```
- Pages with noindex but shouldn't have it
- Pages blocked by robots.txt unexpectedly
- Canonical tags pointing to wrong URLs
```

**Diagnosis Process:**

**Step 1: Verify in Browser:**
```bash
# Check actual page source
curl -I https://www.example.com/page/
# Look for:
# - X-Robots-Tag header
# - Check meta robots tag
# - Verify canonical URL

# Check robots.txt
curl https://www.example.com/robots.txt
```

**Step 2: Compare Crawl User-Agent:**
```yaml
DeepCrawl Settings:
  User-Agent: Googlebot Desktop

Check if:
  - Site serves different content to bots
  - Server-side user-agent detection
  - Dynamic noindex based on bot detection
```

**Step 3: Check Conditional Logic:**
```php
// Bad: Adding noindex to bots
if (strpos($_SERVER['HTTP_USER_AGENT'], 'bot') !== false) {
    echo '<meta name="robots" content="noindex">';
}

// This blocks ALL bots from indexing!
```

**Solutions:**

**A. Fix Meta Robots Tag:**
```html
<!-- Before (incorrect) -->
<meta name="robots" content="noindex, nofollow">

<!-- After (correct) -->
<meta name="robots" content="index, follow">
```

**B. Update Robots.txt:**
```
# Before (too broad)
User-agent: *
Disallow: /product/

# After (specific)
User-agent: *
Disallow: /product/*?filter=
Disallow: /product/*?sort=
Allow: /product/
```

**C. Fix Canonical Tags:**
```html
<!-- Before (wrong canonical) -->
<link rel="canonical" href="https://www.example.com/category/" />

<!-- After (self-referencing) -->
<link rel="canonical" href="https://www.example.com/product/item-123/" />
```

### 4. Duplicate Content Not Detected

**Problem:** Known Duplicates Not Showing in Reports

**Symptoms:**
```
- Similar pages not flagged
- Parameter variations not detected
- International duplicates missed
```

**Diagnosis:**

```yaml
Step 1: Check Detection Settings
  Duplicate Threshold: [X]%
  Common settings:
    - 90%+ similarity: Very strict (few matches)
    - 70-80% similarity: Balanced
    - 50-60% similarity: More matches

Step 2: Review Content Sampled
  DeepCrawl samples:
    - Main content only (ignores nav/footer)
    - Text content (not HTML structure)
    - First [X] characters

Step 3: Verify Segmentation
  If segmented, duplicates only detected within same segment
  Solution: Run cross-segment duplicate check
```

**Solutions:**

**A. Adjust Similarity Threshold:**
```yaml
# For e-commerce with template content
Duplicate Threshold: 60%
Minimum Content Length: 200 characters

# For unique content sites
Duplicate Threshold: 80%
Minimum Content Length: 500 characters
```

**B. Use Custom Extraction:**
```yaml
Custom Extraction for Duplicate Detection:
  Name: "Unique Content"
  Selector: ".product-description" 
  # Extract only unique content section
  # Ignore template sections
```

**C. Implement Canonical Tags:**
```html
<!-- On duplicate/variation pages -->
<link rel="canonical" href="https://www.example.com/original-page/" />
```

### 5. Missing Integration Data

**Problem:** Analytics/Search Console Data Not Appearing

**Symptoms:**
```
- "No data available" in reports
- Integration shows as connected but no data
- Old data but nothing recent
```

**Diagnosis:**

```yaml
Step 1: Verify Connection Status
  Navigate to: Integrations
  Check:
    - Connection status: Green ✓
    - Last sync: Recent date
    - Permissions: All required scopes granted

Step 2: Check Data Availability
  Google Search Console:
    - Data available: 16 month lag
    - Date range in DeepCrawl matches GSC
  
  Google Analytics:
    - Property still active
    - Views not filtered out
    - DeepCrawl has read access

Step 3: Review URL Matching
  Common mismatch issues:
    - Trailing slash differences
    - HTTP vs HTTPS
    - www vs non-www
    - Parameter order differences
```

**Solutions:**

**A. Reconnect Integration:**
```
1. Disconnect existing integration
2. Clear browser cache
3. Reconnect with admin account
4. Grant all requested permissions
5. Wait 24 hours for data sync
```

**B. Fix URL Normalization:**
```yaml
# Ensure consistent URL format
Crawl Settings:
  URL Format: https://www.example.com/page/
  
Integration Settings:
  Match Rule: Exact match
  Normalize URLs: Yes
  Ignore parameters: No (unless specifically needed)
```

**C. Manual Data Upload:**
```csv
# If integration fails, upload CSV
url,sessions,bounce_rate,revenue
https://www.example.com/page1/,10000,45.2,15000
https://www.example.com/page2/,8500,52.1,12000
```

---
