
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.



### Browser Caching

Browser caching stores static assets locally to avoid re-downloading.

#### Cache-Control Headers

**Apache (.htaccess):**
```apache
<IfModule mod_expires.c>
    ExpiresActive On
    
    # Images
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    
    # CSS and JavaScript
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
    
    # Fonts
    ExpiresByType font/woff2 "access plus 1 year"
    
    # HTML (shorter cache)
    ExpiresByType text/html "access plus 0 seconds"
</IfModule>

# Cache-Control Headers
<IfModule mod_headers.c>
    <FilesMatch "\.(jpg|jpeg|png|gif|webp|svg)$">
        Header set Cache-Control "max-age=31536000, public, immutable"
    </FilesMatch>
    
    <FilesMatch "\.(css|js)$">
        Header set Cache-Control "max-age=2592000, public"
    </FilesMatch>
    
    <FilesMatch "\.(html|htm)$">
        Header set Cache-Control "no-cache, must-revalidate"
    </FilesMatch>
</IfModule>
```

**Nginx:**
```nginx
# Browser caching
location ~* \.(jpg|jpeg|png|gif|webp|svg|ico)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location ~* \.(css|js)$ {
    expires 1M;
    add_header Cache-Control "public";
}

location ~* \.(woff|woff2|ttf|otf)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location / {
    expires -1;
    add_header Cache-Control "no-cache, must-revalidate";
}
```

#### Versioning Strategy

**Problem:** Cached files don't update when changed

**Solution: Cache Busting**
```html
<!-- Method 1: Query String -->
<link rel="stylesheet" href="styles.css?v=2.1.5">
<script src="app.js?v=2.1.5"></script>

<!-- Method 2: File Hash (Better) -->
<link rel="stylesheet" href="styles.a3f5b8c9.css">
<script src="app.f2d4e6a8.js"></script>
```

**Webpack Configuration:**
```javascript
// webpack.config.js
module.exports = {
  output: {
    filename: '[name].[contenthash].js',
    path: path.resolve(__dirname, 'dist'),
    clean: true,
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '[name].[contenthash].css',
    }),
  ],
};
```

#### Real-Life Example

**Case Study: News Website**
```
First Visit:
- Downloads: 2.8 MB
- Load Time: 3.2s
- Requests: 85

Return Visit (Without Caching):
- Downloads: 2.8 MB
- Load Time: 3.2s
- Requests: 85

Return Visit (With Caching):
- Downloads: 124 KB (HTML + dynamic content)
- Load Time: 0.4s (88% faster)
- Requests: 8
- Bandwidth Saved: 2.676 MB per visit

Impact on 1M monthly visitors (avg 3 visits):
- Bandwidth saved: 7.6 TB/month
- Cost savings: $912/month (at $0.12/GB)
- User experience: 88% faster load times
```

---
