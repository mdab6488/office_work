
### Mobile Page Speed

**Why Mobile Speed Matters:**

Mobile users are typically:
- On slower connections (3G/4G vs. broadband)
- In hurry or multitasking
- Have less patience for slow sites

**The Numbers:**
- 53% of mobile users abandon sites that take longer than 3 seconds to load
- 1 second delay = 7% reduction in conversions
- Google uses page speed as a mobile ranking factor

#### **Core Web Vitals for Mobile**

**1. Largest Contentful Paint (LCP) - Loading Performance**

**Target:** < 2.5 seconds

**What it measures:** How long until the largest element (image, text block) is visible.

**❌ Bad Example:**
```html
<!-- Unoptimized hero image -->
<img src="hero-image-5mb.jpg" 
     alt="Hero" 
     style="width: 100%;">
```

LCP: 8.5 seconds on 3G

**✅ Optimized Example:**
```html
<!-- Optimized hero with modern formats -->
<picture>
  <source srcset="hero-mobile.webp" type="image/webp" media="(max-width: 768px)">
  <source srcset="hero-mobile.jpg" media="(max-width: 768px)">
  <img src="hero-desktop.jpg" 
       alt="Hero - Premium Sneakers Collection" 
       width="375" 
       height="667"
       loading="eager"
       fetchpriority="high">
</picture>
```

LCP: 1.8 seconds on 3G

**Real-Life Success Story:**
Vodafone optimized their LCP:
- Reduced hero image from 2.5MB to 200KB
- Implemented WebP format
- Added `fetchpriority="high"` to hero image
- Result: LCP improved from 8.2s to 2.1s, conversion rate increased 8%

**2. First Input Delay (FID) / Interaction to Next Paint (INP)**

**Target:** < 200ms (INP) or < 100ms (FID)

**What it measures:** How quickly the page responds to user interactions.

**Common Issues:**
```javascript
// ❌ Bad: Heavy JavaScript blocking main thread
window.addEventListener('load', function() {
  // Massive data processing on load
  for(let i = 0; i < 1000000; i++) {
    processData(i);
  }
});

// ❌ Bad: Large third-party scripts
<script src="giant-analytics-library.js"></script>
<script src="chat-widget.js"></script>
<script src="social-media-widgets.js"></script>
```

**✅ Solution:**
```javascript
// Break up long tasks
async function processData() {
  const chunks = splitDataIntoChunks(data, 100);
  
  for(const chunk of chunks) {
    await new Promise(resolve => {
      requestIdleCallback(() => {
        processChunk(chunk);
        resolve();
      });
    });
  }
}

// Defer non-critical scripts
<script src="analytics.js" defer></script>
<script src="chat-widget.js" async></script>

// Load social widgets only when needed
<button onclick="loadSocialShare()">Share</button>
```

**Real-Life Example:**
An e-commerce site had 1,200ms FID due to heavy JavaScript. Users clicked "Add to Cart" but nothing happened for 1+ second. Many assumed the site was broken and left.

After optimization:
- Reduced JavaScript bundle from 850KB to 180KB
- Lazy loaded non-critical features
- FID: 1,200ms → 75ms
- Cart abandonment: 68% → 41%

**3. Cumulative Layout Shift (CLS) - Visual Stability**

**Target:** < 0.1

**What it measures:** How much content moves around while loading.

**❌ Bad Example:**
```html
<!-- No dimensions specified -->
<img src="product.jpg" alt="Product">

<!-- Ad loads and pushes content down -->
<div id="ad-space"></div>

<p>Product description starts here...</p>

<script>
  // Ad loads later and shifts everything
  loadAdvertisement('ad-space');
</script>
```

**✅ Good Example:**
```html
<!-- Specify dimensions to reserve space -->
<img src="product.jpg" 
     alt="Product" 
     width="600" 
     height="400">

<!-- Reserve space for ad -->
<div id="ad-space" style="min-height: 250px; background: #f0f0f0;">
  <p style="text-align: center; padding-top: 100px; color: #999;">
    Advertisement
  </p>
</div>

<p>Product description starts here...</p>
```

**Real-Life Problem:**
A news website loaded banner ads after the content. Users would start reading an article, then an ad would load and push the text down. Users accidentally clicked ads (70% of ad clicks were accidental).

After fixing CLS:
- Specified ad dimensions upfront
- CLS score: 0.42 → 0.03
- Actual intentional ad clicks increased 35%
- User satisfaction scores increased

#### **Mobile Speed Optimization Techniques**

**1. Image Optimization**

**Before:**
```html
<!-- Desktop-size image served to mobile -->
<img src="product-hero-4000x3000.jpg" alt="Product">
<!-- File size: 3.5MB, Load time: 12s on 3G -->
```

**After:**
```html
<!-- Responsive images with modern formats -->
<picture>
  <!-- WebP for supported browsers -->
  <source srcset="product-400w.webp 400w,
                  product-800w.webp 800w,
                  product-1200w.webp 1200w"
          type="image/webp">
  
  <!-- JPEG fallback -->
  <source srcset="product-400w.jpg 400w,
                  product-800w.jpg 800w,
                  product-1200w.jpg 1200w"
          type="image/jpeg">
  
  <img src="product-800w.jpg" 
       alt="Premium Wireless Headphones - Black"
       loading="lazy"
       width="800"
       height="600">
</picture>
<!-- File size: 85KB, Load time: 0.9s on 3G -->
```

**Real Numbers:**
- Original JPEG (4000x3000): 3.5MB
- Optimized JPEG (800x600, 80% quality): 145KB
- WebP (800x600): 85KB
- **Savings: 97.5%**

**2. Critical CSS**

**❌ Before:**
```html
<head>
  <link rel="stylesheet" href="styles.css"> <!-- 450KB, blocks rendering -->
</head>
```

**✅ After:**
```html
<head>
  <!-- Inline critical CSS for above-the-fold content -->
  <style>
    /* Only styles needed for initial viewport */
    body { margin: 0; font-family: Arial, sans-serif; }
    .header { background: #333; color: white; padding: 20px; }
    .hero { height: 400px; background: #f0f0f0; }
    /* ~5KB of critical styles */
  </style>
  
  <!-- Load remaining CSS asynchronously -->
  <link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="styles.css"></noscript>
</head>
```

**Real-Life Results:**
Travel website KAYAK:
- Inlined critical CSS (8KB)
- Deferred non-critical CSS (350KB)
- First Contentful Paint: 4.2s → 1.1s
- User engagement increased 12%

**3. JavaScript Optimization**

**Bundle Size Matters:**

```javascript
// ❌ Before: Importing entire libraries
import _ from 'lodash'; // 71KB
import moment from 'moment'; // 329KB
import jQuery from 'jquery'; // 87KB

// Total: 487KB (minified)
```

```javascript
// ✅ After: Import only what you need
import debounce from 'lodash/debounce'; // 3KB
import { format } from 'date-fns'; // 2KB
// No jQuery - use vanilla JS

// Total: 5KB (minified)
// Savings: 98.9%
```

**Real-Life Example:**
A SaaS dashboard was loading 1.2MB of JavaScript. On mobile 3G, the site was unusable for 15+ seconds.

Optimizations:
- Code splitting: Load features only when needed
- Tree shaking: Remove unused code
- Lazy loading: Load components on-demand

Results:
- Initial bundle: 1.2MB → 85KB
- Time to Interactive: 15.8s → 2.3s
- Mobile signup conversions: +156%

**4. Server-Side Rendering (SSR) or Static Generation**

**CSR (Client-Side Rendering) Problem:**
```javascript
// ❌ Everything loads client-side
<div id="root"></div>
<script src="app.js"></script> <!-- 450KB -->

// User sees blank screen until JS loads and executes
// Time to content: 8+ seconds on mobile
```

**SSR/Static Solution:**
```html
<!-- ✅ HTML with content served immediately -->
<div id="root">
  <header>...</header>
  <main>
    <h1>Product Title</h1>
    <p>Product description visible immediately</p>
  </main>
</div>
<script src="app.js" defer></script>

// User sees content immediately
// Time to content: 0.4 seconds
```

**Real Success Story:**
Netflix switched to SSR:
- Time to Interactive improved by 50%
- Improved SEO - content immediately visible to crawlers
- Reduced bounce rate by 20%

---
