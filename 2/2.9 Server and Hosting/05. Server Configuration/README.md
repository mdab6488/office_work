# Technical SEO: Server, Hosting & International Implementation

## Server and Hosting

---

### Server Configuration

Proper server configuration is essential for optimal SEO performance.

#### 1. Gzip Compression

**What it does:** Compresses text-based files before sending to browser.

**SEO Impact:**
- ✅ 60-80% reduction in file size
- ✅ Faster page load times
- ✅ Improved Core Web Vitals

**Apache Configuration:**
```apache
# Enable mod_deflate
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE text/javascript
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE application/json
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/atom+xml
    AddOutputFilterByType DEFLATE image/svg+xml
    
    # Compression level (1-9)
    DeflateCompressionLevel 6
    
    # Don't compress images, videos
    SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png|mp4)$ no-gzip
</IfModule>
```

**Nginx Configuration:**
```nginx
# Enable Gzip compression
gzip on;
gzip_vary on;
gzip_proxied any;
gzip_comp_level 6;
gzip_types
    text/plain
    text/css
    text/xml
    text/javascript
    application/json
    application/javascript
    application/xml+rss
    application/rss+xml
    font/truetype
    font/opentype
    application/vnd.ms-fontobject
    image/svg+xml;
gzip_min_length 1024;
gzip_disable "MSIE [1-6]\.";
```

**Real-Life Impact:**
```
Before Gzip:
- HTML file: 45 KB
- CSS file: 120 KB  
- JavaScript: 230 KB
Total: 395 KB

After Gzip:
- HTML file: 12 KB (73% reduction)
- CSS file: 25 KB (79% reduction)
- JavaScript: 65 KB (72% reduction)
Total: 102 KB (74% reduction)

Result:
- Page load time: 3.2s → 1.1s
- LCP improved: 2.8s → 0.9s
- Google PageSpeed score: 67 → 94
```

**Testing Compression:**
```bash
# Check if Gzip is working
curl -H "Accept-Encoding: gzip" -I https://example.com

# Should see:
Content-Encoding: gzip
```

---

#### 2. Browser Caching

**What it does:** Instructs browsers to store static files locally.

**SEO Impact:**
- ✅ Faster repeat visits
- ✅ Reduced server load
- ✅ Improved performance scores

**Apache Configuration:**
```apache
<IfModule mod_expires.c>
    ExpiresActive On
    
    # Default expiration: 1 month
    ExpiresDefault "access plus 1 month"
    
    # HTML (no caching for dynamic content)
    ExpiresByType text/html "access plus 0 seconds"
    
    # CSS and JavaScript
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType application/x-javascript "access plus 1 year"
    
    # Images
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    
    # Fonts
    ExpiresByType font/ttf "access plus 1 year"
    ExpiresByType font/woff "access plus 1 year"
    ExpiresByType font/woff2 "access plus 1 year"
    
    # Media files
    ExpiresByType video/mp4 "access plus 1 year"
    ExpiresByType video/webm "access plus 1 year"
</IfModule>

<IfModule mod_headers.c>
    # Cache-Control headers
    <FilesMatch "\.(ico|jpg|jpeg|png|gif|webp|svg|css|js|woff|woff2|ttf)$">
        Header set Cache-Control "public, max-age=31536000, immutable"
    </FilesMatch>
    
    # No caching for HTML
    <FilesMatch "\.(html|htm|php)$">
        Header set Cache-Control "no-cache, no-store, must-revalidate"
        Header set Pragma "no-cache"
        Header set Expires 0
    </FilesMatch>
</IfModule>
```

**Nginx Configuration:**
```nginx
# Browser caching
location ~* \.(jpg|jpeg|png|gif|ico|webp|svg)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location ~* \.(css|js)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location ~* \.(woff|woff2|ttf|otf|eot)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location / {
    add_header Cache-Control "no-cache, no-store, must-revalidate";
    add_header Pragma "no-cache";
    add_header Expires 0;
}
```

**Real-Life Example:**
```
Scenario: Blog with many images

First Visit:
- Downloads all resources
- Total: 2.5 MB
- Load time: 3.2 seconds

Second Visit (with caching):
- Only downloads updated HTML
- Cached assets: 2.4 MB (from browser cache)
- Download: 0.1 MB
- Load time: 0.4 seconds (87% faster!)

Result:
- Bounce rate decreased by 35%
- Pages per session increased by 52%
- Better user engagement
```

---

#### 3. HTTP/2 Configuration

**What it is:** Modern protocol allowing multiplexing, header compression, server push.

**SEO Impact:**
- ✅ Significantly faster loading
- ✅ Better for sites with many resources
- ✅ Required for modern web performance

**Apache HTTP/2 Setup:**
```apache
# Enable HTTP/2 module
LoadModule http2_module modules/mod_http2.so

# Enable HTTP/2
<VirtualHost *:443>
    ServerName example.com
    
    # Enable HTTP/2
    Protocols h2 h2c http/1.1
    
    # SSL Configuration
    SSLEngine on
    SSLCertificateFile /path/to/cert.pem
    SSLCertificateKeyFile /path/to/key.pem
    
    # HTTP/2 specific settings
    H2Direct on
    H2ModernTLSOnly on
    H2Push on
    
    # Push important resources
    <Location "/">
        Header add Link "</css/style.css>; rel=preload; as=style"
        Header add Link "</js/main.js>; rel=preload; as=script"
    </Location>
</VirtualHost>
```

**Nginx HTTP/2 Setup:**
```nginx
server {
    listen 443 ssl http2;
    server_name example.com;
    
    # SSL certificates
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;
    
    # SSL optimization
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;
    
    # HTTP/2 push
    location / {
        http2_push /css/style.css;
        http2_push /js/main.js;
    }
}
```

**Real-Life Performance Comparison:**
```
Test Site: E-commerce homepage with 85 resources

HTTP/1.1:
- Resources loaded sequentially
- 6 concurrent connections max
- Load time: 4.2 seconds
- Fully loaded: 5.8 seconds

HTTP/2:
- All resources loaded in parallel
- Single connection, multiplexed
- Load time: 1.7 seconds (60% faster)
- Fully loaded: 2.3 seconds (60% faster)

SEO Impact:
- Core Web Vitals improved significantly
- FCP: 2.1s → 0.8s
- LCP: 3.8s → 1.4s
- PageSpeed Score: 73 → 95
```

---

#### 4. SSL/HTTPS Configuration

**Why Essential:**
- ✅ Google ranking factor since 2014
- ✅ Required for modern features (PWA, HTTP/2)
- ✅ Builds user trust
- ✅ Secures data

**Apache SSL Configuration:**
```apache
<VirtualHost *:443>
    ServerName example.com
    ServerAlias www.example.com
    
    # SSL Engine
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/example.com.crt
    SSLCertificateKeyFile /etc/ssl/private/example.com.key
    SSLCertificateChainFile /etc/ssl/certs/chain.pem
    
    # Strong SSL settings
    SSLProtocol all -SSLv2 -SSLv3 -TLSv1 -TLSv1.1
    SSLCipherSuite ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256
    SSLHonorCipherOrder on
    
    # HSTS (HTTP Strict Transport Security)
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
    
    # Security headers
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-XSS-Protection "1; mode=block"
</VirtualHost>

# Redirect HTTP to HTTPS
<VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R=301,L]
</VirtualHost>
```

**Nginx SSL Configuration:**
```nginx
# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name example.com www.example.com;
    return 301 https://example.com$request_uri;
}

# HTTPS server
server {
    listen 443 ssl http2;
    server_name www.example.com;
    
    # Redirect www to non-www
    return 301 https://example.com$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com;
    
    # SSL certificates
    ssl_certificate /etc/ssl/certs/example.com.crt;
    ssl_certificate_key /etc/ssl/private/example.com.key;
    ssl_trusted_certificate /etc/ssl/certs/chain.pem;
    
    # SSL protocols and ciphers
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256;
    ssl_prefer_server_ciphers on;
    
    # SSL session settings
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;
    ssl_session_tickets off;
    
    # OCSP Stapling
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout 5s;
    
    # Security headers
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
}
```

**Real-Life Migration Example:**
```
Scenario: Migrating from HTTP to HTTPS

Before Migration:
URL: http://example.com
Status: Unsecured
Google warning: "Not secure"
Traffic: 50,000 visits/month

Migration Steps:
1. Obtained SSL certificate (Let's Encrypt - Free)
2. Installed certificate
3. Configured server (see above)
4. 301 redirected all HTTP to HTTPS
5. Updated Google Search Console
6. Updated internal links
7. Updated XML sitemap
8. Submitted new sitemap to Google

After Migration (3 months):
URL: https://example.com
Status: Secured
Traffic: 58,000 visits/month (16% increase)
Rankings: Minor improvements
Conversion rate: +12%
Trust signals: Improved

Common Issues Prevented:
✓ Mixed content (ensured all resources HTTPS)
✓ Redirect chains (direct HTTP → HTTPS)
✓ Updated canonical tags
✓ Updated hreflang tags
✓ Monitored for 404s
```

**Getting Free SSL Certificate:**
```bash
# Using Let's Encrypt (Certbot)

# Install Certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx

# Get certificate for Nginx
sudo certbot --nginx -d example.com -d www.example.com

# Auto-renewal (runs automatically)
sudo certbot renew --dry-run

# Certificate valid for 90 days, auto-renews at 60 days
```

---

#### 5. Security Headers

**Why Important:**
- ✅ Protects against attacks
- ✅ Builds trust
- ✅ May indirectly affect rankings

**Essential Headers:**
```nginx
# Content Security Policy
add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://www.google-analytics.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' data:; connect-src 'self';" always;

# Prevent clickjacking
add_header X-Frame-Options "SAMEORIGIN" always;

# Prevent MIME sniffing
add_header X-Content-Type-Options "nosniff" always;

# XSS Protection
add_header X-XSS-Protection "1; mode=block" always;

# Referrer Policy
add_header Referrer-Policy "strict-origin-when-cross-origin" always;

# Permissions Policy
add_header Permissions-Policy "geolocation=(self), microphone=(), camera=()" always;
```

**Testing Security Headers:**
```
Tools:
- SecurityHeaders.com
- Mozilla Observatory
- SSL Labs

Target Score: A or A+
```

---