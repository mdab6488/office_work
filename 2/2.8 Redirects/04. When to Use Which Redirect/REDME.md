# Complete Guide to Canonicalization and Redirects

## 2.8 Redirects

---


### When to Use Which Redirect

#### Decision Tree

```
START: Do you need a redirect?
│
├─ NO → No redirect needed
│
└─ YES
   │
   ├─ Is the change permanent?
   │  │
   │  ├─ YES
   │  │  │
   │  │  ├─ Are you redirecting POST/PUT/DELETE requests?
   │  │  │  │
   │  │  │  ├─ YES → Use 308
   │  │  │  └─ NO → Use 301
   │  │
   │  └─ NO (temporary change)
   │     │
   │     ├─ Are you redirecting POST/PUT/DELETE requests?
   │     │  │
   │     │  ├─ YES → Use 307
   │     │  └─ NO → Use 302
```

#### Comprehensive Scenario Guide

| Scenario | Redirect Type | Notes |
|----------|---------------|-------|
| **Site Migration** | 301 | Map each URL individually |
| **HTTPS Migration** | 301 | Use HSTS after stable |
| **URL Cleanup** | 301 | Keep redirect for 1+ year |
| **Discontinued Product** | 301 | Don't redirect to homepage |
| **Consolidating Pages** | 301 | Choose best-performing page |
| **Seasonal Campaign** | 302 | Remove redirect after campaign |
| **A/B Testing** | 302 | Use proper testing tools |
| **Maintenance Mode** | 302 or 503 | 503 better for SEO |
| **Geo-targeting** | 302 | User should be able to override |
| **Mobile Detection** | 302 | Or use responsive design |
| **API Endpoint Move (temp)** | 307 | Preserve HTTP method |
| **API Endpoint Move (perm)** | 308 | Preserve HTTP method |
| **Form Moved (temp)** | 307 | Preserve POST data |
| **Form Moved (perm)** | 308 | Preserve POST data |

---

## Quick Reference Cheat Sheet

### Canonical Tags
```html
<!-- Standard canonical -->
<link rel="canonical" href="https://www.example.com/page" />

<!-- Cross-domain canonical -->
<link rel="canonical" href="https://www.otherdomain.com/page" />

<!-- Self-referencing canonical -->
<link rel="canonical" href="https://www.example.com/current-page" />
```

### Redirect Code Snippets

**Apache (.htaccess)**
```apache
# 301 Redirect
Redirect 301 /old-page /new-page

# 302 Redirect
Redirect 302 /temporary /temp-location

# Domain redirect
RewriteEngine On
RewriteCond %{HTTP_HOST} ^olddomain\.com [NC]
RewriteRule ^(.*)$ https://newdomain.com/$1 [R=301,L]
```

**Nginx**
```nginx
# 301 Redirect
location /old-page {
    return 301 /new-page;
}

# Domain redirect
server {
    server_name olddomain.com;
    return 301 https://newdomain.com$request_uri;
}
```

**PHP**
```php
<?php
// 301 Redirect
header("HTTP/1.1 301 Moved Permanently");
header("Location: https://example.com/new-page");
exit();

// 302 Redirect
header("Location: https://example.com/temp-page");
exit();
?>
```

**JavaScript (Client-side, use server-side when possible)**
```javascript
// 301 equivalent (immediate)
window.location.replace('https://example.com/new-page');

// 302 equivalent
window.location.href = 'https://example.com/temp-page';
```

---

## Common Mistakes to Avoid

### Canonicalization Mistakes

❌ **Using relative URLs**
```html
<!-- WRONG -->
<link rel="canonical" href="/products/shoes" />

<!-- CORRECT -->
<link rel="canonical" href="https://www.shop.com/products/shoes" />
```

❌ **Multiple canonical tags**
```html
<!-- WRONG - Only use one! -->
<link rel="canonical" href="https://example.com/page1" />
<link rel="canonical" href="https://example.com/page2" />
```

❌ **Canonical to non-200 page**
```html
<!-- WRONG - Canonical points to 404 or redirect -->
<link rel="canonical" href="https://example.com/deleted-page" />
```

❌ **Canonical chain**
```
Page A canonical → Page B canonical → Page C
(Wrong! A should point directly to C)
```

### Redirect Mistakes

❌ **Using 302 for permanent changes**
```apache
# WRONG for permanent migration
Redirect 302 /old-site /new-site
```

❌ **Redirect chains**
```
/page-old → /page-temp → /page-new
(Should be: /page-old → /page-new directly)
```

❌ **Redirecting all old pages to homepage**
```apache
# WRONG - Loss of SEO value
Redirect 301 /products/laptop-x200 /
Redirect 301 /products/mouse-pro /
Redirect 301 /blog/seo-tips-2024 /

# CORRECT - Redirect to relevant pages
Redirect 301 /products/laptop-x200 /products/laptops
Redirect 301 /products/mouse-pro /products/accessories
Redirect 301 /blog/seo-tips-2024 /blog
```

❌ **Client-side redirects for SEO**
```html
<!-- WRONG - Search engines may not follow -->
<meta http-equiv="refresh" content="0;url=/new-page">

<!-- Use server-side 301 instead -->
```

---

## Testing Your Implementation

### Tools to Verify Canonicals

1. **View Page Source**
   - Right-click → View Page Source
   - Search for "canonical"
   - Verify correct URL

2. **Chrome DevTools**
   - F12 → Elements tab
   - Look in `<head>` section
   - Check canonical tag

3. **Google Search Console**
   - URL Inspection Tool
   - Enter URL
   - Check "Google-selected canonical"

4. **Screaming Frog SEO Spider**
   - Crawl website
   - Check "Canonicals" tab
   - Identify issues

### Tools to Test Redirects

1. **Online Redirect Checker**
   - https://httpstatus.io
   - https://www.redirect-checker.org

2. **Command Line (curl)**
   ```bash
   curl -I https://example.com/old-page
   ```

3. **Chrome DevTools Network Tab**
   - F12 → Network tab
   - Load page
   - Check status codes

4. **Screaming Frog**
   - Crawl site in "List" mode
   - Check redirect chains
   - Identify loops

---

## Summary

### Key Takeaways

**Canonicalization:**
1. Always use absolute URLs in canonical tags
2. Use self-referencing canonicals as best practice
3. Handle URL parameters properly (tracking vs. filtering)
4. Cross-domain canonicals for syndicated content
5. One canonical tag per page

**Redirects:**
1. 301 = Permanent (passes SEO value)
2. 302 = Temporary (doesn't pass SEO value)
3. 307 = Temporary + preserve HTTP method
4. 308 = Permanent + preserve HTTP method
5. Avoid redirect chains and loops
6. Map old URLs to relevant new URLs (not homepage)
7. Monitor and fix redirect issues regularly

### Action Items

✅ Audit your site for duplicate content issues
✅ Implement canonical tags site-wide
✅ Check for redirect chains using tools
✅ Update old redirects to point directly to final URLs
✅ Monitor Google Search Console for canonical/redirect issues
✅ Document all redirects in a spreadsheet
✅ Set up alerts for 404 errors and redirect loops
✅ Regular redirect audits (quarterly)

---

## Additional Resources

- Google Search Central: Consolidate duplicate URLs
- Moz: The Ultimate Guide to Canonical Tags
- Screaming Frog: Redirect Mapping Guide
- Google Search Console Documentation
- HTTP Status Codes Specification (RFC 7231)

---

**Created:** November 2025  
**Version:** 1.0  
**For:** SEO Technical Training
