# Technical SEO: HTTPS Security & Structured Data Guide

## 2.5 HTTPS and Security



### Security Headers

Security headers protect your website from various attacks and are increasingly important for SEO (Google considers site security).

**Essential Security Headers:**

**1. HTTP Strict Transport Security (HSTS)**

Forces browsers to only connect via HTTPS.

```apache
# .htaccess
Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
```

```nginx
# Nginx
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
```

**Real-Life Example:**
- **max-age=31536000**: Browser remembers for 1 year
- **includeSubDomains**: Apply to all subdomains
- **preload**: Submit to HSTS preload list (Chrome, Firefox, etc.)

Check if your site is preloaded: https://hstspreload.org/

**2. X-Content-Type-Options**

Prevents MIME type sniffing attacks.

```apache
Header always set X-Content-Type-Options "nosniff"
```

**3. X-Frame-Options**

Prevents clickjacking attacks by controlling if your site can be embedded in iframes.

```apache
# Don't allow any framing
Header always set X-Frame-Options "DENY"

# Allow only same origin
Header always set X-Frame-Options "SAMEORIGIN"

# Allow specific domain
Header always set X-Frame-Options "ALLOW-FROM https://trusted-site.com"
```

**Real-Life Example:**
Banks like Bank of America use `X-Frame-Options: DENY` to prevent their login pages from being embedded in malicious sites.

**4. X-XSS-Protection**

Enables browser's built-in XSS (Cross-Site Scripting) filter.

```apache
Header always set X-XSS-Protection "1; mode=block"
```

**5. Content-Security-Policy (CSP)**

The most powerful security header - controls what resources can load.

```apache
# Basic CSP
Header always set Content-Security-Policy "default-src 'self'; script-src 'self' https://trusted-cdn.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' https://fonts.gstatic.com;"
```

**Real-Life CSP Example (GitHub):**

```
Content-Security-Policy: 
default-src 'none'; 
base-uri 'self'; 
script-src 'self' https://github.githubassets.com; 
style-src 'self' 'unsafe-inline' https://github.githubassets.com; 
img-src 'self' data: https:; 
font-src https://github.githubassets.com; 
connect-src 'self' https://api.github.com;
```

**6. Referrer-Policy**

Controls how much referrer information is sent with requests.

```apache
Header always set Referrer-Policy "strict-origin-when-cross-origin"
```

**Options:**
- `no-referrer`: Never send referrer
- `strict-origin-when-cross-origin`: Send full URL to same origin, only origin to HTTPS, nothing to HTTP (RECOMMENDED)
- `same-origin`: Only send to same origin

**7. Permissions-Policy (formerly Feature-Policy)**

Controls which browser features can be used.

```apache
Header always set Permissions-Policy "geolocation=(), microphone=(), camera=()"
```

**Complete Security Headers Configuration:**

```apache
# .htaccess - Complete Security Headers
<IfModule mod_headers.c>
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
    Header always set Permissions-Policy "geolocation=(), microphone=(), camera=()"
    Header always set Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://trusted-cdn.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' https://fonts.gstatic.com;"
</IfModule>
```

**Testing Your Security Headers:**

1. **SecurityHeaders.com**
   ```
   https://securityheaders.com/?q=https://yoursite.com
   ```
   Gives you a letter grade (A+ to F)

2. **Mozilla Observatory**
   ```
   https://observatory.mozilla.org/
   ```
   Comprehensive security analysis

**Real-Life Success Story:**

**The Guardian (theguardian.com)**
- Implemented comprehensive security headers
- Achieved A+ rating on SecurityHeaders.com
- Result: Reduced XSS attacks by 95%, improved user trust
