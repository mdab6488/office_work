# Technical SEO: HTTPS Security & Structured Data Guide

## 2.5 HTTPS and Security



### HTTPS Migration

**Complete Migration Checklist:**

**Phase 1: Preparation**

1. **Obtain and Install SSL Certificate**
2. **Test on Staging Environment**
3. **Backup Your Website**
4. **Create Internal HTTPS Link Inventory**

**Phase 2: Implementation**

```apache
# .htaccess redirect (Apache)
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Alternative single-line redirect
Redirect permanent / https://yoursite.com/
```

```nginx
# Nginx Configuration
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name yourdomain.com www.yourdomain.com;
    
    ssl_certificate /path/to/certificate.crt;
    ssl_certificate_key /path/to/private.key;
    
    # Your other configurations
}
```

**Phase 3: Update Internal Resources**

```html
<!-- WRONG: Hardcoded HTTP URLs -->
<img src="http://yoursite.com/image.jpg">
<script src="http://yoursite.com/script.js"></script>

<!-- RIGHT: Protocol-relative or HTTPS -->
<img src="//yoursite.com/image.jpg">
<script src="https://yoursite.com/script.js"></script>

<!-- BEST: Relative URLs -->
<img src="/images/image.jpg">
<script src="/js/script.js"></script>
```

**Phase 4: Update External Services**

1. **Google Search Console**
   - Add HTTPS version as new property
   - Submit new sitemap

2. **Google Analytics**
   ```javascript
   // Update property settings
   Admin → Property Settings → Default URL: https://
   ```

3. **Social Media & External Links**
   - Update Facebook Open Graph URLs
   - Update Twitter Card URLs
   - Update canonical tags

**Real-Life Case Study:**

**Etsy.com HTTPS Migration (2017)**
- Migrated millions of pages
- Traffic dip: Initial 2-3% drop
- Recovery: Full recovery in 2 weeks
- Result: 5% traffic increase after 2 months
- Lesson: Proper implementation with 301 redirects works!
