# Technical SEO: HTTPS Security & Structured Data Guide

## 2.5 HTTPS and Security



### Mixed Content Issues

**What is Mixed Content?**

Mixed content occurs when an HTTPS page loads resources (images, scripts, CSS) over HTTP. This creates security vulnerabilities and triggers browser warnings.

**Types of Mixed Content:**

1. **Passive Mixed Content** (Low Risk)
   - Images, audio, video
   - Browser may load with warning
   
2. **Active Mixed Content** (High Risk)
   - Scripts, stylesheets, iframes
   - Browser BLOCKS these resources
   - Breaks website functionality

**Real-Life Example:**

```html
<!-- Your page is HTTPS but... -->
https://yoursite.com/page.html

<!-- These cause mixed content warnings: -->
<img src="http://example.com/image.jpg">  <!-- Passive -->
<script src="http://cdn.example.com/jquery.js"></script>  <!-- Active - BLOCKED! -->
<iframe src="http://youtube.com/embed/video"></iframe>  <!-- Active - BLOCKED! -->
```

**How to Find Mixed Content:**

**Method 1: Browser Console**
```javascript
// Open Chrome DevTools (F12)
// Check Console for warnings like:
// "Mixed Content: The page at 'https://...' was loaded over HTTPS,
// but requested an insecure image 'http://...'"
```

**Method 2: Online Tools**
```bash
# Use Why No Padlock
https://www.whynopadlock.com/

# JitBit SSL Check
https://www.jitbit.com/sslcheck/
```

**Method 3: Command Line**
```bash
# Scan your site for mixed content
wget --spider -r -nd -nv -H -p https://yoursite.com 2>&1 | grep "http://"
```

**Fixing Mixed Content:**

```html
<!-- BEFORE: Mixed Content -->
<img src="http://cdn.example.com/logo.png">
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto">

<!-- AFTER: Secure Content -->
<img src="https://cdn.example.com/logo.png">
<script src="https://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">

<!-- BEST: Protocol-relative URLs (automatically match page protocol) -->
<img src="//cdn.example.com/logo.png">
<script src="//code.jquery.com/jquery.min.js"></script>
```

**Content Security Policy (CSP) to Upgrade Insecure Requests:**

```html
<!-- Automatically upgrade HTTP to HTTPS -->
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
```

```apache
# Or in .htaccess
Header always set Content-Security-Policy "upgrade-insecure-requests"
```
