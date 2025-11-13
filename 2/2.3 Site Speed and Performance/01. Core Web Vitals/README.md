
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.

### Core Web Vitals (LCP, FID, CLS)

Core Web Vitals are Google's metrics for measuring real-world user experience. These are **essential ranking factors** as of 2021.

#### 1. Largest Contentful Paint (LCP)

**What it measures:** How long it takes for the largest content element to load.

**Good Score:** Under 2.5 seconds

**Real-Life Example:**
```
❌ Bad LCP (4.5s): Amazon product page with unoptimized 5MB hero image
✅ Good LCP (1.8s): Amazon product page with WebP optimized image (200KB)

Impact: 23% increase in conversions after optimization
```

**How to Fix:**
```html
<!-- Before (Slow LCP) -->
<img src="hero-image.jpg" alt="Product">

<!-- After (Fast LCP) -->
<link rel="preload" as="image" href="hero-image.webp">
<img src="hero-image.webp" 
     srcset="hero-small.webp 480w, hero-medium.webp 800w, hero-large.webp 1200w"
     sizes="(max-width: 600px) 480px, (max-width: 1000px) 800px, 1200px"
     alt="Product" 
     loading="eager"
     width="1200" 
     height="800">
```

**Tools to Measure:**
- Chrome DevTools (Lighthouse)
- PageSpeed Insights
- Web Vitals Chrome Extension
- Search Console Core Web Vitals Report

#### 2. First Input Delay (FID) / Interaction to Next Paint (INP)

**What it measures:** How quickly the page responds to user interactions.

**Good Score:** Under 100ms (FID) or Under 200ms (INP)

**Real-Life Example:**
```
Case Study: Twitter.com
Problem: Heavy JavaScript blocking main thread
FID: 450ms (Poor)

Solution:
- Code splitting
- Defer non-critical JS
- Web Workers for heavy calculations

Result: FID reduced to 85ms
User engagement increased by 65%
```

**How to Fix:**
```javascript
// ❌ Bad: Blocking JavaScript
function heavyCalculation() {
  for(let i = 0; i < 1000000000; i++) {
    // Heavy operation
  }
}
document.addEventListener('click', heavyCalculation);

// ✅ Good: Use Web Worker
// worker.js
self.onmessage = function(e) {
  let result = 0;
  for(let i = 0; i < e.data; i++) {
    result += i;
  }
  self.postMessage(result);
}

// main.js
const worker = new Worker('worker.js');
worker.postMessage(1000000);
worker.onmessage = function(e) {
  console.log('Result:', e.data);
}
```

#### 3. Cumulative Layout Shift (CLS)

**What it measures:** Visual stability - unexpected layout shifts.

**Good Score:** Under 0.1

**Real-Life Example:**
```
Case Study: News Website (CNN.com)
Problem: Ads loading after content, pushing content down
CLS Score: 0.45 (Poor)

User Impact:
- Users clicking wrong links (25% misclick rate)
- High bounce rate (78%)

Solution:
- Reserved ad spaces with fixed dimensions
- Specify image dimensions
- Avoid inserting content above existing content

Result: CLS reduced to 0.08
Bounce rate decreased to 42%
```

**How to Fix:**
```css
/* ❌ Bad: No reserved space */
.ad-container {
  /* No dimensions specified */
}

/* ✅ Good: Reserved space */
.ad-container {
  min-height: 250px;
  width: 300px;
}

/* ✅ Better: Aspect ratio boxes */
.ad-container {
  aspect-ratio: 16 / 9;
  width: 100%;
}
```

```html
<!-- ❌ Bad: No dimensions -->
<img src="banner.jpg" alt="Banner">

<!-- ✅ Good: Specified dimensions -->
<img src="banner.jpg" alt="Banner" width="1200" height="400">
```

---