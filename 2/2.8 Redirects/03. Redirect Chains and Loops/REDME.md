# Complete Guide to Canonicalization and Redirects

## 2.8 Redirects

---


### Redirect Chains and Loops

#### Redirect Chains

**Definition:** Multiple redirects in sequence (A → B → C → D)

**Real-Life Example: The Growing E-commerce Site**

```
Timeline:

2020: Launch
URL: http://shop.com/products/shoes

2021: Add HTTPS
Redirect 1: http://shop.com → https://shop.com

2022: Add WWW
Redirect 2: https://shop.com → https://www.shop.com

2023: URL restructure
Redirect 3: https://www.shop.com/products/shoes → https://www.shop.com/footwear/shoes

2024: Category rename
Redirect 4: https://www.shop.com/footwear/shoes → https://www.shop.com/shoes

Final chain:
http://shop.com/products/shoes 
  → https://shop.com/products/shoes 
  → https://www.shop.com/products/shoes 
  → https://www.shop.com/footwear/shoes 
  → https://www.shop.com/shoes
```

**Problems:**
- ❌ Page load time: +0.5-1 second per redirect
- ❌ SEO: Link equity loss of 10-15% per hop
- ❌ User experience: Slow, frustrating
- ❌ Crawl budget: Wastes Googlebot resources

**Solution: Flatten the chain**

```apache
# .htaccess - Update all old URLs to final destination
RewriteRule ^products/shoes$ /shoes [R=301,L]
RewriteRule ^footwear/shoes$ /shoes [R=301,L]

# Ensure HTTPS and WWW in one redirect
RewriteCond %{HTTPS} off [OR]
RewriteCond %{HTTP_HOST} !^www\. [NC]
RewriteRule ^ https://www.shop.com%{REQUEST_URI} [R=301,L]
```

**Results after fixing:**
```
Before: http://shop.com/products/shoes → 4 redirects → 4 seconds
After: http://shop.com/products/shoes → 1 redirect → 0.8 seconds

SEO improvement:
- Bounce rate decreased from 45% to 32%
- Average session duration increased 28%
- Mobile rankings improved (page speed factor)
```

#### Redirect Loops

**Definition:** Redirects that circle back to themselves (A → B → C → A)

**Real-Life Example 1: WWW Configuration Error**

```apache
# WRONG - Creates a loop
# Rule 1: Non-WWW to WWW
RewriteCond %{HTTP_HOST} !^www\.
RewriteRule ^(.*)$ https://www.example.com/$1 [R=301,L]

# Rule 2: WWW to Non-WWW (CONFLICTS!)
RewriteCond %{HTTP_HOST} ^www\.example\.com$
RewriteRule ^(.*)$ https://example.com/$1 [R=301,L]

# Result: example.com ↔ www.example.com (infinite loop)
```

**Error in browser:**
```
ERR_TOO_MANY_REDIRECTS
This page isn't working
example.com redirected you too many times.
```

**Real-Life Example 2: CMS Plugin Conflict**

**Scenario:** WordPress site with two SEO plugins

```
Plugin A (Really Simple SSL): 
- Redirects all HTTP → HTTPS

Plugin B (SEO Plugin): 
- Redirects example.com → www.example.com
- Also tries to manage HTTP → HTTPS

Result:
http://example.com 
  → https://example.com (Plugin A)
  → https://www.example.com (Plugin B)
  → http://www.example.com (Plugin B rechecks protocol)
  → https://www.example.com (Plugin A)
  → [LOOP]
```

**Solution:**
```php
// Disable one plugin's redirect feature
// Or configure them to work together:

// In .htaccess (before WordPress rules)
RewriteEngine On
RewriteCond %{HTTPS} off [OR]
RewriteCond %{HTTP_HOST} !^www\. [NC]
RewriteRule ^ https://www.example.com%{REQUEST_URI} [R=301,L]
```

#### Detecting Redirect Issues

**Method 1: Chrome DevTools**
```
1. Open DevTools (F12)
2. Network tab
3. Load page
4. Look for multiple 301/302 entries
5. Check redirect path
```

**Method 2: Command Line**
```bash
# Test redirect chain
curl -I -L https://example.com/old-page

# Output shows each redirect:
HTTP/1.1 301 Moved Permanently
Location: https://www.example.com/old-page

HTTP/1.1 301 Moved Permanently  
Location: https://www.example.com/new-page

HTTP/1.1 200 OK
```

**Method 3: Online Tools**
- httpstatus.io
- redirect-checker.org
- Screaming Frog SEO Spider

**Method 4: Google Search Console**

Check "Coverage" report for:
- "Redirect error"
- "Page with redirect"
