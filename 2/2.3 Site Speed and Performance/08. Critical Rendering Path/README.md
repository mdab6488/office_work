
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.


### Critical Rendering Path

The Critical Rendering Path is the sequence of steps browsers take to render a page.

#### Understanding the Process

```
1. Parse HTML → DOM Tree
2. Parse CSS → CSSOM Tree
3. Combine DOM + CSSOM → Render Tree
4. Layout (calculate positions)
5. Paint (draw pixels)
```

#### Critical CSS Inline

**Concept:** Inline CSS needed for above-the-fold content

**Before:**
```html
<head>
    <link rel="stylesheet" href="styles.css"> <!-- Blocks rendering -->
</head>
```

**After:**
```html
<head>
    <!-- Critical CSS inlined -->
    <style>
        .header{background:#333;padding:20px}
        .hero{height:100vh;background:url(hero.jpg)}
        .nav{display:flex;justify-content:space-between}
    </style>
    
    <!-- Non-critical CSS loaded asynchronously -->
    <link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="styles.css"></noscript>
</head>
```

#### Defer JavaScript

**Render-Blocking JS:**
```html
<!-- ❌ Blocks rendering -->
<script src="analytics.js"></script>
<script src="jquery.js"></script>
<script src="app.js"></script>
```

**Optimized:**
```html
<!-- ✅ Deferred execution -->
<script src="analytics.js" defer></script>
<script src="jquery.js" defer></script>
<script src="app.js" defer></script>

<!-- Or async for independent scripts -->
<script src="analytics.js" async></script>
```

**Difference:**
```
defer: Downloads in parallel, executes after HTML parsing (maintains order)
async: Downloads in parallel, executes immediately when ready (no order guarantee)
```

#### Resource Hints

**Preconnect:**
```html
<!-- Establish early connections to important third-party origins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://www.google-analytics.com">
```

**Preload:**
```html
<!-- Critical resources -->
<link rel="preload" href="critical.css" as="style">
<link rel="preload" href="hero-image.webp" as="image">
<link rel="preload" href="font.woff2" as="font" type="font/woff2" crossorigin>
```

**Prefetch:**
```html
<!-- Future navigation resources -->
<link rel="prefetch" href="next-page.html">
<link rel="prefetch" href="product-detail.js">
```

#### Real-Life Example: News Portal

**Before Optimization:**
```
First Contentful Paint (FCP): 3.8s
Largest Contentful Paint (LCP): 5.2s
Time to Interactive (TTI): 7.1s

Render-blocking resources: 12
Total blocking time: 2,800ms
```

**Optimization Strategy:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Critical CSS (inlined) -->
    <style>
        /* Above-the-fold styles only */
        body{margin:0;font-family:Arial,sans-serif}
        .header{background:#1a1a1a;color:#fff;padding:20px}
        .hero{min-height:400px;background:#f0f0f0}
    </style>
    
    <!-- Preconnect to required origins -->
    <link rel="preconnect" href="https://cdn.example.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <!-- Preload critical resources -->
    <link rel="preload" href="hero.webp" as="image">
    <link rel="preload" href="fonts/roboto.woff2" as="font" type="font/woff2" crossorigin>
    
    <!-- Defer non-critical CSS -->
    <link rel="preload" href="styles.css" as="style" onload="this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="styles.css"></noscript>
    
    <title>News Portal</title>
</head>
<body>
    <!-- Content -->
    <header class="header">...</header>
    <section class="hero">...</section>
    
    <!-- Deferred JavaScript -->
    <script src="app.js" defer></script>
    <script src="analytics.js" async></script>
</body>
</html>
```

**After Optimization:**
```
First Contentful Paint (FCP): 0.9s (76% improvement)
Largest Contentful Paint (LCP): 1.8s (65% improvement)
Time to Interactive (TTI): 2.4s (66% improvement)

Render-blocking resources: 0
Total blocking time: 180ms (94% improvement)

Business Impact:
- Page views per session: +34%
- Average session duration: +47%
- Ad revenue: +$124K monthly
```

---
