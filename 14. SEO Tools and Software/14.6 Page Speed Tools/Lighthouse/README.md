# Lighthouse: Complete In-Depth Guide

## Table of Contents

1. [Introduction to Lighthouse](#introduction-to-lighthouse)
2. [What is Lighthouse?](#what-is-lighthouse)
3. [Why Use Lighthouse?](#why-use-lighthouse)
4. [How Lighthouse Works](#how-lighthouse-works)
5. [Ways to Run Lighthouse](#ways-to-run-lighthouse)
6. [Understanding Lighthouse Metrics](#understanding-lighthouse-metrics)
7. [The Five Categories](#the-five-categories)
8. [Real-World Examples](#real-world-examples)
9. [Interpreting Lighthouse Reports](#interpreting-lighthouse-reports)
10. [Optimization Strategies](#optimization-strategies)
11. [Advanced Usage](#advanced-usage)
12. [CI/CD Integration](#cicd-integration)
13. [Common Issues and Solutions](#common-issues-and-solutions)
14. [Best Practices](#best-practices)
15. [Lighthouse vs Other Tools](#lighthouse-vs-other-tools)

---

## Introduction to Lighthouse

Lighthouse is an open-source, automated tool developed by Google for improving the quality of web pages. It has become the industry standard for web performance testing and is integrated into Chrome DevTools, making it accessible to millions of developers worldwide.

### Key Features
- **Free and Open Source**: Available to everyone at no cost
- **Comprehensive Audits**: Tests performance, accessibility, PWA, SEO, and best practices
- **Multiple Run Options**: Chrome DevTools, CLI, Node module, or PageSpeed Insights
- **Actionable Insights**: Provides specific recommendations for improvements
- **CI/CD Integration**: Can be automated in deployment pipelines
- **Realistic Testing**: Uses real device emulation and network throttling

---

## What is Lighthouse?

Lighthouse is an automated website auditing tool that analyzes web pages and provides detailed reports across five key categories:

1. **Performance**: How fast your page loads and becomes interactive
2. **Accessibility**: How usable your site is for people with disabilities
3. **Best Practices**: Whether you're following modern web development standards
4. **SEO**: How well your page is optimized for search engines
5. **Progressive Web App (PWA)**: Whether your site meets PWA standards

### Core Components

```
┌─────────────────────────────────────────┐
│         Lighthouse Architecture          │
├─────────────────────────────────────────┤
│                                          │
│  ┌────────────┐      ┌──────────────┐  │
│  │  Gatherers │─────▶│   Audits     │  │
│  └────────────┘      └──────────────┘  │
│        │                     │          │
│        ▼                     ▼          │
│  ┌────────────┐      ┌──────────────┐  │
│  │   Artifacts│◀─────│   Reports    │  │
│  └────────────┘      └──────────────┘  │
│                                          │
└─────────────────────────────────────────┘
```

---

## Why Use Lighthouse?

### Business Benefits

**1. Improved User Experience**
- Faster loading times reduce bounce rates
- Better accessibility increases audience reach
- Mobile optimization captures more users

**Real-World Impact**: Amazon found that every 100ms of latency cost them 1% in sales.

**2. Better Search Rankings**
- Google uses Core Web Vitals as ranking signals
- SEO audits identify technical issues
- Mobile-first indexing compliance

**Real-World Impact**: Websites that improved their Core Web Vitals saw up to 24% reduction in abandonment rates.

**3. Cost Savings**
- Identify performance bottlenecks before they affect users
- Reduce bandwidth costs through optimization
- Prevent accessibility lawsuits

**4. Competitive Advantage**
- Benchmark against competitors
- Meet industry standards
- Deliver superior user experiences

---

## How Lighthouse Works

### Testing Process

Lighthouse follows a systematic approach to audit your website:

```
1. INITIALIZATION
   ├── Load the URL
   ├── Apply throttling settings
   └── Clear browser cache/cookies

2. GATHERING PHASE
   ├── Navigate to the page
   ├── Collect network requests
   ├── Measure JavaScript execution
   ├── Capture DOM structure
   └── Record user timing marks

3. AUDIT PHASE
   ├── Analyze gathered data
   ├── Run individual audits
   ├── Calculate metric scores
   └── Generate recommendations

4. REPORTING PHASE
   ├── Compile audit results
   ├── Calculate category scores
   ├── Create visual report
   └── Provide opportunities for improvement
```

### Throttling Configuration

Lighthouse simulates real-world conditions:

**Mobile Throttling (Default)**
- **Device**: Moto G4
- **Network**: 4G (1.6 Mbps down, 750 Kbps up)
- **CPU**: 4x slowdown
- **Screen**: 360x640px

**Desktop Throttling**
- **Network**: Faster connection simulation
- **CPU**: No throttling
- **Screen**: 1350x940px

---

## Ways to Run Lighthouse

### Method 1: Chrome DevTools (Easiest)

**Step-by-Step Guide**

1. Open Google Chrome
2. Navigate to the webpage you want to test
3. Press `F12` or `Ctrl+Shift+I` (Windows) / `Cmd+Option+I` (Mac)
4. Click on the "Lighthouse" tab
5. Select audit categories
6. Choose device type (Mobile or Desktop)
7. Click "Analyze page load"

**Real-World Example**:
```
Testing your e-commerce product page:
1. Open https://yourstore.com/products/laptop
2. Open DevTools (F12)
3. Select Lighthouse tab
4. Check all categories
5. Select "Mobile" (most users are mobile)
6. Click "Analyze page load"
7. Wait 30-60 seconds for results
```

**Pros**:
- No installation required
- Visual interface
- Immediate results
- Easy to share reports

**Cons**:
- Manual process
- One-time tests
- Limited automation

---

### Method 2: Chrome Extension (Deprecated but Still Available)

**Note**: Google has deprecated the Chrome extension in favor of DevTools integration.

If you still want to use it:
1. Search for "Lighthouse" in Chrome Web Store
2. Install the extension
3. Navigate to your page
4. Click the Lighthouse icon
5. Click "Generate report"

---

### Method 3: Command Line Interface (CLI)

**Installation**

```bash
# Install globally via npm
npm install -g lighthouse

# Or using yarn
yarn global add lighthouse
```

**Basic Usage**

```bash
# Run a basic audit
lighthouse https://example.com

# Run with specific options
lighthouse https://example.com --output=html --output-path=./report.html

# Mobile audit (default)
lighthouse https://example.com --preset=mobile

# Desktop audit
lighthouse https://example.com --preset=desktop

# Only performance and SEO
lighthouse https://example.com --only-categories=performance,seo

# Save as JSON for processing
lighthouse https://example.com --output=json --output-path=./report.json
```

**Real-World Example: E-commerce Store Audit**

```bash
# Audit homepage
lighthouse https://mystore.com \
  --output=html \
  --output-path=./reports/homepage.html \
  --preset=mobile \
  --throttling.cpuSlowdownMultiplier=4

# Audit product page
lighthouse https://mystore.com/products/item-123 \
  --output=html \
  --output-path=./reports/product-page.html \
  --preset=mobile

# Audit checkout page
lighthouse https://mystore.com/checkout \
  --output=html \
  --output-path=./reports/checkout.html \
  --preset=mobile \
  --extra-headers='{"Cookie":"session=xyz123"}'
```

**Advanced CLI Options**

```bash
# Custom throttling
lighthouse https://example.com \
  --throttling.rttMs=150 \
  --throttling.throughputKbps=1638.4 \
  --throttling.cpuSlowdownMultiplier=4

# Multiple output formats
lighthouse https://example.com \
  --output=json --output=html --output=csv \
  --output-path=./reports/report

# Custom Chrome flags
lighthouse https://example.com \
  --chrome-flags="--headless --disable-gpu"

# Screen emulation
lighthouse https://example.com \
  --emulated-form-factor=mobile \
  --screenEmulation.width=375 \
  --screenEmulation.height=812

# Budget constraints
lighthouse https://example.com \
  --budget-path=./budget.json
```

---

### Method 4: Node Module (Programmatic)

**Installation**

```bash
npm install lighthouse
```

**Basic Implementation**

```javascript
const lighthouse = require('lighthouse');
const chromeLauncher = require('chrome-launcher');

async function runLighthouse(url) {
  // Launch Chrome
  const chrome = await chromeLauncher.launch({
    chromeFlags: ['--headless']
  });

  // Run Lighthouse
  const options = {
    logLevel: 'info',
    output: 'html',
    onlyCategories: ['performance', 'accessibility', 'seo'],
    port: chrome.port
  };

  const runnerResult = await lighthouse(url, options);

  // Extract results
  const reportHtml = runnerResult.report;
  const lhr = runnerResult.lhr;

  console.log('Performance score:', lhr.categories.performance.score * 100);
  console.log('Accessibility score:', lhr.categories.accessibility.score * 100);
  console.log('SEO score:', lhr.categories.seo.score * 100);

  // Clean up
  await chrome.kill();

  return lhr;
}

// Run the audit
runLighthouse('https://example.com');
```

**Real-World Example: Automated Daily Audits**

```javascript
const lighthouse = require('lighthouse');
const chromeLauncher = require('chrome-launcher');
const fs = require('fs');
const path = require('path');

// URLs to audit
const urlsToAudit = [
  'https://mystore.com',
  'https://mystore.com/products',
  'https://mystore.com/about',
  'https://mystore.com/contact'
];

async function auditWebsite(url, outputPath) {
  const chrome = await chromeLauncher.launch({
    chromeFlags: ['--headless', '--disable-gpu', '--no-sandbox']
  });

  const options = {
    logLevel: 'info',
    output: ['json', 'html'],
    onlyCategories: ['performance', 'accessibility', 'best-practices', 'seo'],
    port: chrome.port,
    throttling: {
      rttMs: 40,
      throughputKbps: 10240,
      cpuSlowdownMultiplier: 1
    },
    emulatedFormFactor: 'mobile'
  };

  const runnerResult = await lighthouse(url, options);
  const lhr = runnerResult.lhr;

  // Save HTML report
  const reportHtml = runnerResult.report[1];
  const filename = url.replace(/[^a-z0-9]/gi, '_').toLowerCase();
  fs.writeFileSync(
    path.join(outputPath, `${filename}_${Date.now()}.html`),
    reportHtml
  );

  // Save JSON data
  fs.writeFileSync(
    path.join(outputPath, `${filename}_${Date.now()}.json`),
    JSON.stringify(lhr, null, 2)
  );

  await chrome.kill();

  return {
    url: url,
    scores: {
      performance: lhr.categories.performance.score * 100,
      accessibility: lhr.categories.accessibility.score * 100,
      bestPractices: lhr.categories['best-practices'].score * 100,
      seo: lhr.categories.seo.score * 100
    },
    metrics: {
      fcp: lhr.audits['first-contentful-paint'].numericValue,
      lcp: lhr.audits['largest-contentful-paint'].numericValue,
      cls: lhr.audits['cumulative-layout-shift'].numericValue,
      tti: lhr.audits['interactive'].numericValue,
      tbt: lhr.audits['total-blocking-time'].numericValue,
      si: lhr.audits['speed-index'].numericValue
    }
  };
}

async function runDailyAudits() {
  const outputDir = './lighthouse-reports';
  
  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  console.log('Starting daily audits...');
  const results = [];

  for (const url of urlsToAudit) {
    console.log(`Auditing: ${url}`);
    try {
      const result = await auditWebsite(url, outputDir);
      results.push(result);
      console.log(`✓ Completed: ${url}`);
      console.log(`  Performance: ${result.scores.performance.toFixed(1)}`);
      console.log(`  Accessibility: ${result.scores.accessibility.toFixed(1)}`);
    } catch (error) {
      console.error(`✗ Failed: ${url}`, error.message);
    }
  }

  // Generate summary report
  const summary = {
    date: new Date().toISOString(),
    totalPages: results.length,
    averageScores: {
      performance: average(results.map(r => r.scores.performance)),
      accessibility: average(results.map(r => r.scores.accessibility)),
      bestPractices: average(results.map(r => r.scores.bestPractices)),
      seo: average(results.map(r => r.scores.seo))
    },
    results: results
  };

  fs.writeFileSync(
    path.join(outputDir, `summary_${Date.now()}.json`),
    JSON.stringify(summary, null, 2)
  );

  console.log('\n=== Daily Audit Summary ===');
  console.log(`Average Performance: ${summary.averageScores.performance.toFixed(1)}`);
  console.log(`Average Accessibility: ${summary.averageScores.accessibility.toFixed(1)}`);
  console.log(`Average Best Practices: ${summary.averageScores.bestPractices.toFixed(1)}`);
  console.log(`Average SEO: ${summary.averageScores.seo.toFixed(1)}`);
}

function average(arr) {
  return arr.reduce((a, b) => a + b, 0) / arr.length;
}

// Run audits
runDailyAudits().catch(console.error);
```

**Real-World Example: Performance Monitoring with Alerts**

```javascript
const lighthouse = require('lighthouse');
const chromeLauncher = require('chrome-launcher');
const nodemailer = require('nodemailer');

// Performance thresholds
const THRESHOLDS = {
  performance: 90,
  accessibility: 90,
  bestPractices: 90,
  seo: 90,
  fcp: 1800, // 1.8 seconds
  lcp: 2500, // 2.5 seconds
  cls: 0.1,  // 0.1
  tbt: 300   // 300ms
};

async function monitorPerformance(url) {
  const chrome = await chromeLauncher.launch({
    chromeFlags: ['--headless']
  });

  const options = {
    logLevel: 'error',
    output: 'json',
    port: chrome.port,
    onlyCategories: ['performance', 'accessibility', 'best-practices', 'seo']
  };

  const runnerResult = await lighthouse(url, options);
  const lhr = runnerResult.lhr;

  await chrome.kill();

  // Check scores
  const scores = {
    performance: lhr.categories.performance.score * 100,
    accessibility: lhr.categories.accessibility.score * 100,
    bestPractices: lhr.categories['best-practices'].score * 100,
    seo: lhr.categories.seo.score * 100
  };

  // Check metrics
  const metrics = {
    fcp: lhr.audits['first-contentful-paint'].numericValue,
    lcp: lhr.audits['largest-contentful-paint'].numericValue,
    cls: lhr.audits['cumulative-layout-shift'].numericValue,
    tbt: lhr.audits['total-blocking-time'].numericValue
  };

  // Detect violations
  const violations = [];

  for (const [key, value] of Object.entries(scores)) {
    if (value < THRESHOLDS[key]) {
      violations.push({
        type: 'score',
        metric: key,
        value: value.toFixed(1),
        threshold: THRESHOLDS[key],
        severity: value < THRESHOLDS[key] - 20 ? 'critical' : 'warning'
      });
    }
  }

  for (const [key, value] of Object.entries(metrics)) {
    if (value > THRESHOLDS[key]) {
      violations.push({
        type: 'metric',
        metric: key.toUpperCase(),
        value: value.toFixed(0),
        threshold: THRESHOLDS[key],
        severity: value > THRESHOLDS[key] * 1.5 ? 'critical' : 'warning'
      });
    }
  }

  if (violations.length > 0) {
    await sendAlert(url, scores, metrics, violations);
  }

  return { scores, metrics, violations };
}

async function sendAlert(url, scores, metrics, violations) {
  const criticalCount = violations.filter(v => v.severity === 'critical').length;
  const warningCount = violations.filter(v => v.severity === 'warning').length;

  const emailBody = `
    Performance Alert for ${url}
    
    ${criticalCount} Critical Issues | ${warningCount} Warnings
    
    SCORES:
    - Performance: ${scores.performance.toFixed(1)}
    - Accessibility: ${scores.accessibility.toFixed(1)}
    - Best Practices: ${scores.bestPractices.toFixed(1)}
    - SEO: ${scores.seo.toFixed(1)}
    
    CORE WEB VITALS:
    - FCP: ${metrics.fcp.toFixed(0)}ms
    - LCP: ${metrics.lcp.toFixed(0)}ms
    - CLS: ${metrics.cls.toFixed(3)}
    - TBT: ${metrics.tbt.toFixed(0)}ms
    
    VIOLATIONS:
    ${violations.map(v => `
    [${v.severity.toUpperCase()}] ${v.metric}
    Current: ${v.value} | Threshold: ${v.threshold}
    `).join('\n')}
    
    Please investigate and fix these issues immediately.
  `;

  console.log(emailBody);
  
  // Send email (configure your email service)
  // const transporter = nodemailer.createTransport({ ... });
  // await transporter.sendMail({ ... });
}

// Monitor every hour
setInterval(async () => {
  console.log('Running performance check...');
  await monitorPerformance('https://mystore.com');
}, 60 * 60 * 1000); // Every hour
```

---

### Method 5: PageSpeed Insights (Online Tool)

**How to Use**:

1. Visit https://pagespeed.web.dev/
2. Enter your URL
3. Click "Analyze"
4. View results for both Mobile and Desktop

**Features**:
- No installation required
- Tests from Google's servers
- Shows Field Data (real user metrics from Chrome UX Report)
- Shows Lab Data (Lighthouse audit)
- Easy to share with stakeholders

**Real-World Usage**:
```
Client wants to know why their site is slow:
1. Go to PageSpeed Insights
2. Enter: https://clientwebsite.com
3. Share the URL of the results page
4. Point out specific issues in the report
5. Explain opportunities and diagnostics
```

---

## Understanding Lighthouse Metrics

### Core Web Vitals (Most Important)

Google uses these metrics as ranking signals:

#### 1. Largest Contentful Paint (LCP)

**What it measures**: Loading performance - when the largest content element becomes visible

**Scoring**:
- **Good**: ≤ 2.5 seconds
- **Needs Improvement**: 2.5 - 4.0 seconds
- **Poor**: > 4.0 seconds

**Real-World Example**:
```
E-commerce Product Page:
- LCP Element: Main product image
- Bad LCP: 4.5s (Image is 3MB unoptimized)
- Good LCP: 1.8s (Image optimized to 150KB, lazy loaded)

Blog Post:
- LCP Element: Hero image or first paragraph
- Bad LCP: 3.8s (Large hero image, render-blocking CSS)
- Good LCP: 2.1s (Optimized image, critical CSS inline)
```

**How to Improve**:
- Optimize images (compress, use WebP, responsive images)
- Use a CDN for static assets
- Minimize render-blocking resources
- Implement server-side rendering or static generation
- Preload important resources

---

#### 2. First Input Delay (FID) / Interaction to Next Paint (INP)

**Note**: Google is replacing FID with INP as a Core Web Vital in 2024.

**What it measures**: Responsiveness - time from user interaction to browser response

**FID Scoring**:
- **Good**: ≤ 100 milliseconds
- **Needs Improvement**: 100 - 300 milliseconds
- **Poor**: > 300 milliseconds

**INP Scoring**:
- **Good**: ≤ 200 milliseconds
- **Needs Improvement**: 200 - 500 milliseconds
- **Poor**: > 500 milliseconds

**Real-World Example**:
```
E-commerce Add to Cart Button:
- Bad FID: 350ms (Heavy JavaScript blocks main thread)
  User clicks "Add to Cart" → waits 350ms → button responds
  
- Good FID: 85ms (Code-split, optimized JavaScript)
  User clicks → button responds almost immediately

Search Autocomplete:
- Bad INP: 450ms (Unoptimized search handler)
  User types letter → waits 450ms → dropdown appears
  
- Good INP: 150ms (Debounced, optimized handler)
  User types → dropdown appears quickly
```

**How to Improve**:
- Break up long JavaScript tasks
- Use web workers for heavy computations
- Implement code splitting
- Defer non-critical JavaScript
- Optimize third-party scripts

---

#### 3. Cumulative Layout Shift (CLS)

**What it measures**: Visual stability - unexpected layout shifts during page load

**Scoring**:
- **Good**: ≤ 0.1
- **Needs Improvement**: 0.1 - 0.25
- **Poor**: > 0.25

**Real-World Example**:
```
News Article Page with Bad CLS (0.45):
1. User starts reading article
2. Ad loads at top → content shifts down 300px
3. User accidentally clicks wrong link
4. Font loads → text reflows
5. Image without dimensions loads → more shifting

Same Page with Good CLS (0.05):
1. Reserve space for ads with min-height
2. Use font-display: swap with fallback fonts
3. Set width and height on all images
4. Preload critical fonts
5. Avoid inserting content above existing content
```

**Visual Example**:
```
Bad Layout Shift:
[Header         ]
[Navigation     ]
Reading text here → [AD LOADS] → Text jumps down!
[Article content]   [Article content moves down]
[More content   ]   [More content moves down]

Good Layout (No Shift):
[Header         ]
[Navigation     ]
[Reserved space ] ← Space reserved for ad
[Article content] ← Content stays in place
[More content   ]
```

**How to Improve**:
- Always include size attributes on images and video
- Reserve space for ads and embeds
- Avoid inserting content above existing content
- Use CSS aspect-ratio for responsive images
- Preload fonts and use font-display: optional

---

### Other Performance Metrics

#### First Contentful Paint (FCP)

**What it measures**: When the first text or image is painted

**Scoring**:
- **Good**: ≤ 1.8 seconds
- **Moderate**: 1.8 - 3.0 seconds
- **Poor**: > 3.0 seconds

**Real-World Example**:
```
Landing Page:
- Bad FCP: 3.5s
  User sees white screen for 3.5 seconds
  
- Good FCP: 1.2s
  User sees logo and header within 1.2 seconds
  Page feels much faster
```

---

#### Time to Interactive (TTI)

**What it measures**: When the page becomes fully interactive

**Scoring**:
- **Good**: ≤ 3.8 seconds
- **Moderate**: 3.8 - 7.3 seconds
- **Poor**: > 7.3 seconds

**Real-World Example**:
```
React Application:
- Bad TTI: 8.5s
  Page visible at 2s, but buttons don't work until 8.5s
  User clicks multiple times in frustration
  
- Good TTI: 3.2s
  Page visible and interactive quickly
  All buttons work as expected
```

---

#### Total Blocking Time (TBT)

**What it measures**: Total time the main thread was blocked

**Scoring**:
- **Good**: ≤ 200 milliseconds
- **Moderate**: 200 - 600 milliseconds
- **Poor**: > 600 milliseconds

**Real-World Example**:
```
Single Page Application:
- Bad TBT: 850ms
  Long JavaScript tasks block user interactions
  
- Good TBT: 180ms
  Tasks are broken into smaller chunks
  Page remains responsive during load
```

---

#### Speed Index

**What it measures**: How quickly content is visually displayed

**Scoring**:
- **Good**: ≤ 3.4 seconds
- **Moderate**: 3.4 - 5.8 seconds
- **Poor**: > 5.8 seconds

**Real-World Example**:
```
Image Gallery:
- Bad SI: 6.2s
  Images load one by one slowly
  
- Good SI: 2.8s
  Images load progressively and quickly
  Progressive JPEGs show blurry → sharp
```

---

## The Five Categories

### 1. Performance (Weighted Scoring)

Lighthouse calculates the performance score using weighted metrics:

```
Performance Score = Weighted Average of:
├── First Contentful Paint (FCP)     - 10%
├── Speed Index (SI)                  - 10%
├── Largest Contentful Paint (LCP)    - 25%
├── Total Blocking Time (TBT)         - 30%
├── Cumulative Layout Shift (CLS)     - 25%
└── Time to Interactive (TTI)         - Removed in Lighthouse 10
```

**Score Ranges**:
- **90-100**: Green (Good)
- **50-89**: Orange (Needs Improvement)
- **0-49**: Red (Poor)

**Real-World Example - E-commerce Homepage**:

```
Initial Audit Results:
Score: 45 (Poor) - RED

Breakdown:
- FCP: 3.2s (Poor)
- LCP: 5.8s (Poor) 
- CLS: 0.42 (Poor)
- TBT: 920ms (Poor)
- Speed Index: 7.1s (Poor)

Issues Identified:
1. Unoptimized hero image (2.5MB)
2. No lazy loading on product images
3. Render-blocking CSS and JavaScript
4. No image dimensions causing CLS
5. Large third-party scripts

After Optimization:
Score: 92 (Good) - GREEN

Improvements:
- FCP: 1.3s (Good) - Inline critical CSS
- LCP: 2.1s (Good) - Optimized images, CDN
- CLS: 0.08 (Good) - Set image dimensions
- TBT: 150ms (Good) - Code splitting
- Speed Index: 2.9s (Good) - Progressive loading

Results:
- 42% increase in conversions
- 28% reduction in bounce rate
- Page views per session increased by 35%
```

---

### 2. Accessibility (90+ Audits)

Makes your website usable for everyone, including people with disabilities.

**Key Accessibility Audits**:

#### Color Contrast
```html
<!-- Bad: Poor contrast -->
<div style="background: #ccc; color: #999;">
  Hard to read text
</div>

<!-- Good: Sufficient contrast (4.5:1 minimum) -->
<div style="background: #000; color: #fff;">
  Easy to read text
</div>
```

#### Image Alt Text
```html
<!-- Bad: Missing alt text -->
<img src="product.jpg">

<!-- Bad: Redundant alt text -->
<img src="product.jpg" alt="Image of product">

<!-- Good: Descriptive alt text -->
<img src="product.jpg" alt="Blue running shoes with white stripes, size 10">
```

#### Form Labels
```html
<!-- Bad: No label -->
<input type="email" placeholder="Email">

<!-- Good: Proper label -->
<label for="email">Email Address</label>
<input type="email" id="email" name="email">
```

#### ARIA Attributes
```html
<!-- Navigation landmark -->
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/products">Products</a></li>
  </ul>
</nav>

<!-- Button with state -->
<button 
  aria-pressed="false" 
  aria-label="Toggle dark mode"
  onclick="toggleDarkMode()">
  🌙
</button>

<!-- Loading state -->
<div 
  role="status" 
  aria-live="polite" 
  aria-label="Loading content">
  <span>Loading...</span>
</div>
```

**Real-World Example - Blog Article**:

```
Initial Accessibility Score: 68 (Needs Improvement)

Issues Found:
1. ❌ Images missing alt attributes (12 images)
2. ❌ Background and foreground colors have insufficient contrast ratio
3. ❌ Form elements do not have associated labels
4. ❌ Links do not have discernible names
5. ❌ Heading elements are not in sequentially-descending order
6. ❌ [role] values are not valid ARIA roles

After Fixing:
Score: 98 (Good)

Fixes Applied:
1. ✅ Added descriptive alt text to all images
2. ✅ Increased contrast ratio to meet WCAG AA standards
3. ✅ Added proper labels to all form inputs
4. ✅ Made link text descriptive ("Read more" → "Read more about SEO tips")
5. ✅ Fixed heading hierarchy (H1 → H2 → H3)
6. ✅ Corrected ARIA roles and attributes

Impact:
- Site now works with screen readers
- Keyboard navigation fully functional
- WCAG 2.1 Level AA compliant
- Increased audience by 15% (accessibility users)
```

---

### 3. Best Practices (Security & Modern Standards)

Ensures you're following modern web development standards.

**Key Best Practice Audits**:

#### HTTPS Usage
```
❌ Bad: http://example.com
✅ Good: https://example.com

Why: HTTPS encrypts data, required for many modern features
```

#### No Browser Errors
```javascript
// Bad: Console errors
console.log(undefinedVariable); // ReferenceError

// Good: Error handling
try {
  riskyOperation();
} catch (error) {
  console.error('Operation failed:', error);
}
```

#### Secure Document Policies
```html
<!-- Set security headers -->
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self'; script-src 'self' 'unsafe-inline'">

<!-- Prevent clickjacking -->
<meta http-equiv="X-Frame-Options" content="SAMEORIGIN">
```

#### Image Aspect Ratios
```html
<!-- Bad: No dimensions -->
<img src="banner.jpg">

<!-- Good: Explicit dimensions -->
<img src="banner.jpg" width="1200" height="400" alt="Banner">

<!-- Better: Modern aspect-ratio -->
<img src="banner.jpg" 
     style="aspect-ratio: 16/9; width: 100%;" 
     alt="Banner">
```

#### Deprecated APIs
```javascript
// Bad: Deprecated API
document.write('Hello World');

// Good: Modern approach
document.body.innerHTML += 'Hello World';
// Or better:
const element = document.createElement('div');
element.textContent = 'Hello World';
document.body.appendChild(element);
```

**Real-World Example - SaaS Application**:

```
Initial Best Practices Score: 79 (Needs Improvement)

Issues:
1. ❌ Uses deprecated APIs
2. ❌ Browser errors logged to console
3. ❌ Images do not have explicit width and height
4. ❌ Links to cross-origin destinations are unsafe
5. ❌ Includes front-end JavaScript libraries with known vulnerabilities

After Updates:
Score: 100 (Perfect)

Fixes:
1. ✅ Removed document.write(), updated to modern DOM methods
2. ✅ Fixed all JavaScript errors, added error boundaries
3. ✅ Added width/height to all images
4. ✅ Added rel="noopener" to external links
5. ✅ Updated jQuery 2.x → 3.x, removed vulnerable libraries

Security Improvements:
- No known vulnerabilities
- HTTPS enforced everywhere
- Secure headers implemented
- Content Security Policy active
```

---

### 4. SEO (Search Engine Optimization)

Ensures your page can be properly indexed by search engines.

**Key SEO Audits**:

#### Meta Tags
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Title (50-60 characters) -->
  <title>Blue Running Shoes - Free Shipping | ShoesStore</title>
  
  <!-- Meta description (150-160 characters) -->
  <meta name="description" 
        content="Buy premium blue running shoes with free shipping. Comfortable, durable, and stylish. Shop now and save 20%!">
  
  <!-- Viewport for mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Canonical URL -->
  <link rel="canonical" href="https://example.com/products/blue-running-shoes">
  
  <!-- Open Graph for social sharing -->
  <meta property="og:title" content="Blue Running Shoes - Free Shipping">
  <meta property="og:description" content="Premium running shoes with free shipping">
  <meta property="og:image" content="https://example.com/images/shoes.jpg">
  <meta property="og:url" content="https://example.com/products/blue-running-shoes">
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="Blue Running Shoes">
  <meta name="twitter:description" content="Premium running shoes">
  <meta name="twitter:image" content="https://example.com/images/shoes.jpg">
</head>
</html>
```

#### Structured Data
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Blue Running Shoes",
  "image": "https://example.com/shoes.jpg",
  "description": "Comfortable running shoes perfect for daily training",
  "brand": {
    "@type": "Brand",
    "name": "ShoesStore"
  },
  "offers": {
    "@type": "Offer",
    "price": "79.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "https://example.com/products/blue-running-shoes"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "reviewCount": "127"
  }
}
</script>
```

#### Robots.txt
```
# Allow all bots
User-agent: *
Allow: /

# Block sensitive areas
Disallow: /admin/
Disallow: /api/
Disallow: /checkout/

# Sitemap location
Sitemap: https://example.com/sitemap.xml
```

#### XML Sitemap
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://example.com/</loc>
    <lastmod>2024-01-15</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://example.com/products</loc>
    <lastmod>2024-01-15</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

#### Mobile-Friendly Links
```html
<!-- Bad: Tiny clickable areas -->
<a href="/products" style="padding: 2px;">Products</a>

<!-- Good: Adequate tap targets (48x48px minimum) -->
<a href="/products" style="padding: 12px 16px; display: inline-block;">
  Products
</a>
```

**Real-World Example - Local Business Website**:

```
Initial SEO Score: 73 (Needs Improvement)

Issues:
1. ❌ Document does not have a meta description
2. ❌ Document doesn't have a valid `lang` attribute
3. ❌ Links do not have descriptive text
4. ❌ Image elements do not have `alt` attributes
5. ❌ Tap targets are not sized appropriately
6. ❌ `robots.txt` is not valid

After Optimization:
Score: 100 (Perfect)

SEO Fixes:
1. ✅ Added compelling meta description
2. ✅ Set <html lang="en">
3. ✅ Made all links descriptive
4. ✅ Added keyword-rich alt text to images
5. ✅ Increased button and link sizes
6. ✅ Fixed robots.txt syntax

Added Enhancements:
- Implemented structured data (LocalBusiness schema)
- Created XML sitemap
- Added breadcrumb navigation
- Optimized page titles for local search
- Added Open Graph tags

Results:
- 45% increase in organic traffic
- Appeared in Google's local pack
- Featured snippets for 3 keywords
- 62% increase in click-through rate from SERPs
```

---

### 5. Progressive Web App (PWA)

Checks if your site provides an app-like experience.

**PWA Requirements**:

#### Web App Manifest
```json
{
  "name": "My Awesome PWA",
  "short_name": "MyPWA",
  "description": "An awesome progressive web application",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#2196F3",
  "orientation": "portrait",
  "icons": [
    {
      "src": "/icons/icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

#### Service Worker
```javascript
// sw.js
const CACHE_NAME = 'my-pwa-v1';
const urlsToCache = [
  '/',
  '/styles/main.css',
  '/scripts/app.js',
  '/images/logo.png'
];

// Install service worker
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

// Fetch from cache
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});

// Update service worker
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheName !== CACHE_NAME) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
```

#### Register Service Worker
```html
<script>
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/sw.js')
    .then(registration => {
      console.log('Service Worker registered:', registration);
    })
    .catch(error => {
      console.log('Service Worker registration failed:', error);
    });
}
</script>
```

**Real-World Example - News Website**:

```
Converting Traditional Site to PWA:

Before (Not a PWA):
- No offline functionality
- Must visit website in browser
- No push notifications
- Slow repeat visits

After (Full PWA):
PWA Score: 100

Implemented:
1. ✅ Web app manifest with icons
2. ✅ Service worker for offline support
3. ✅ HTTPS throughout entire site
4. ✅ Responsive design across all devices
5. ✅ Fast load times (< 3s on 3G)
6. ✅ Install prompt for users
7. ✅ Push notifications for breaking news
8. ✅ Offline page when no connection

User Benefits:
- Add to home screen (icon on mobile)
- Works offline - read cached articles
- Instant loading on repeat visits
- Native app-like experience
- Push notifications for news alerts
- No app store download needed

Business Results:
- 68% increase in session duration
- 3x increase in page views per session
- 52% of mobile users installed PWA
- 41% increase in daily active users
```

---

## Real-World Examples

### Example 1: Optimizing an E-commerce Product Page

**Initial Situation**:
```
URL: https://myshoes.com/products/running-shoes-pro
Performance Score: 38 (Poor)
Mobile visitors: 73%
Bounce rate: 68%
Conversion rate: 1.2%
```

**Lighthouse Report Findings**:

```
PERFORMANCE (38/100) - RED
├── FCP: 4.2s (Poor)
├── LCP: 6.8s (Poor) - Main product image
├── CLS: 0.35 (Poor) - Layout shifts from ads
├── TBT: 1,240ms (Poor)
└── Speed Index: 8.1s (Poor)

Key Issues:
1. Unoptimized product images (2.1MB main image)
2. No lazy loading on gallery images (15 images)
3. Render-blocking CSS and JavaScript (485KB)
4. Third-party scripts blocking render (Analytics, Chat, Reviews)
5. No image dimensions causing massive CLS
6. No compression or minification
7. No CDN usage
```

**Optimization Strategy**:

**Phase 1: Quick Wins (Week 1)**
```bash
# Image optimization
- Compressed main product image: 2.1MB → 145KB (WebP)
- Added responsive images with srcset
- Lazy loaded gallery images
- Added explicit width/height to all images

# Code:
<img 
  src="shoes-pro-800w.webp"
  srcset="shoes-pro-400w.webp 400w,
          shoes-pro-800w.webp 800w,
          shoes-pro-1200w.webp 1200w"
  sizes="(max-width: 600px) 400px,
         (max-width: 1000px) 800px,
         1200px"
  width="1200"
  height="800"
  alt="Running Shoes Pro - Blue and white professional running shoes"
  loading="eager">

<!-- Gallery images -->
<img 
  src="gallery-1-thumb.webp"
  data-src="gallery-1-full.webp"
  width="300"
  height="300"
  alt="Running Shoes Pro side view"
  loading="lazy">
```

**Phase 2: JavaScript Optimization (Week 2)**
```javascript
// Before: One large bundle (485KB)
<script src="bundle.js"></script>

// After: Code splitting
<script src="critical.js"></script> <!-- 45KB -->
<script src="product-page.js" defer></script> <!-- 98KB -->
<script src="reviews.js" async></script> <!-- 72KB -->

// Defer third-party scripts
<script src="analytics.js" defer></script>
<script src="chat-widget.js" async></script>
```

**Phase 3: CSS Optimization (Week 2)**
```html
<!-- Before: Render-blocking CSS -->
<link rel="stylesheet" href="styles.css">

<!-- After: Critical CSS inline -->
<style>
  /* Critical above-the-fold CSS here */
  .header { ... }
  .product-image { ... }
  .product-title { ... }
  .price { ... }
  .add-to-cart-btn { ... }
</style>

<!-- Load non-critical CSS async -->
<link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="styles.css"></noscript>
```

**Phase 4: Infrastructure (Week 3)**
```bash
# Enable compression
- Gzip for text files
- Brotli for modern browsers

# CDN setup
- CloudFlare CDN for static assets
- Edge caching for product images
- Geographic distribution

# Caching headers
Cache-Control: public, max-age=31536000, immutable # Images
Cache-Control: public, max-age=3600 # HTML
Cache-Control: public, max-age=86400 # CSS/JS
```

**Results After Optimization**:

```
PERFORMANCE (92/100) - GREEN
├── FCP: 1.4s (Good) ⬇️ 67% improvement
├── LCP: 2.3s (Good) ⬇️ 66% improvement
├── CLS: 0.06 (Good) ⬇️ 83% improvement
├── TBT: 180ms (Good) ⬇️ 85% improvement
└── Speed Index: 2.8s (Good) ⬇️ 65% improvement

Business Impact:
├── Bounce Rate: 68% → 39% (⬇️ 43%)
├── Conversion Rate: 1.2% → 2.8% (⬆️ 133%)
├── Page Views/Session: 2.1 → 4.3 (⬆️ 105%)
├── Average Order Value: $85 → $102 (⬆️ 20%)
└── Mobile Revenue: ⬆️ 156%

ROI Calculation:
- Development cost: $8,000
- Monthly revenue increase: $47,000
- ROI: 488% in first month
- Break-even: 5 days
```

---

### Example 2: Blog Performance Optimization

**Initial Audit**:
```
URL: https://techblog.com/future-of-ai
Performance: 52 (Needs Improvement)
Accessibility: 71 (Needs Improvement)
SEO: 84 (Needs Improvement)
```

**Issues & Solutions**:

```markdown
## PERFORMANCE ISSUES

### Issue 1: Render-Blocking Resources
❌ Problem: 8 CSS files, 12 JavaScript files blocking render
⏱️ Impact: 3.2s delay in FCP

✅ Solution:
1. Merged CSS files → 1 file
2. Inline critical CSS in <head>
3. Load non-critical CSS async
4. Bundle and minify JavaScript
5. Use defer/async attributes

Code:
<!-- Inline critical CSS -->
<style>
  /* Critical path CSS for above-the-fold content */
  body { font-family: Arial; margin: 0; }
  .header { background: #333; color: white; }
  .article-title { font-size: 2rem; }
</style>

<!-- Async non-critical CSS -->
<link rel="preload" href="/css/main.css" as="style" 
      onload="this.rel='stylesheet'">

<!-- Deferred JavaScript -->
<script src="/js/main.js" defer></script>
<script src="/js/comments.js" async></script>

Result: FCP improved from 3.8s to 1.5s

### Issue 2: Unoptimized Images
❌ Problem: 
- Hero image: 3.2MB PNG
- Content images: Not lazy loaded
- No responsive images
- No modern formats

✅ Solution:
<!-- Hero image with WebP -->
<picture>
  <source 
    srcset="hero-800.webp 800w, hero-1200.webp 1200w" 
    type="image/webp">
  <source 
    srcset="hero-800.jpg 800w, hero-1200.jpg 1200w" 
    type="image/jpeg">
  <img 
    src="hero-1200.jpg" 
    alt="The Future of AI: Robots in Healthcare"
    width="1200"
    height="600"
    loading="eager">
</picture>

<!-- Content images with lazy loading -->
<img 
  src="placeholder.jpg"
  data-src="ai-diagram.webp"
  width="800"
  height="450"
  alt="AI neural network diagram"
  loading="lazy"
  class="lazy">

Result: 
- Hero image: 3.2MB → 185KB (94% reduction)
- LCP improved from 5.2s to 2.1s
- Bandwidth saved: 85%

### Issue 3: Third-Party Embeds
❌ Problem:
- YouTube videos auto-loading
- Twitter embeds blocking render
- Ad scripts slowing page

✅ Solution:
// Lazy load YouTube videos
<div class="video-container" data-video-id="dQw4w9WgXcQ">
  <img src="thumbnail.jpg" alt="Play video">
  <button class="play-button">▶ Play Video</button>
</div>

<script>
document.querySelectorAll('.video-container').forEach(container => {
  container.addEventListener('click', () => {
    const videoId = container.dataset.videoId;
    const iframe = document.createElement('iframe');
    iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1`;
    iframe.allow = 'accelerometer; autoplay; encrypted-media';
    container.innerHTML = '';
    container.appendChild(iframe);
  });
});
</script>

Result: 
- Reduced initial page weight by 2.1MB
- TBT improved from 820ms to 210ms

## ACCESSIBILITY ISSUES

### Issue 1: Poor Color Contrast
❌ Problem: Gray text on light gray background (2.8:1 ratio)
WCAG requirement: 4.5:1 for normal text

✅ Solution:
/* Before */
.article-text {
  color: #888888;
  background: #f0f0f0;
}

/* After - meets WCAG AA */
.article-text {
  color: #333333;
  background: #ffffff;
}

### Issue 2: Missing Alt Text
❌ Problem: 15 images without alt attributes

✅ Solution:
<!-- Bad -->
<img src="chart.png">

<!-- Good -->
<img src="chart.png" 
     alt="Bar chart showing AI adoption rates: 45% in healthcare, 
          38% in finance, 22% in retail">

### Issue 3: Heading Hierarchy
❌ Problem: Skipped from H1 to H3

✅ Solution:
<!-- Bad -->
<h1>Article Title</h1>
<h3>First Section</h3>

<!-- Good -->
<h1>The Future of AI</h1>
<h2>Introduction</h2>
<h3>Key Technologies</h3>
<h3>Applications</h3>
<h2>Conclusion</h2>

## SEO ISSUES

### Issue 1: Missing Meta Description
✅ Solution:
<meta name="description" 
      content="Explore how artificial intelligence is transforming 
               healthcare, finance, and retail. Learn about the latest 
               AI technologies and their real-world applications.">

### Issue 2: No Structured Data
✅ Solution:
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "The Future of AI in Industry",
  "image": "https://techblog.com/images/ai-future.jpg",
  "datePublished": "2024-01-15T08:00:00+00:00",
  "dateModified": "2024-01-15T08:00:00+00:00",
  "author": {
    "@type": "Person",
    "name": "John Smith",
    "url": "https://techblog.com/authors/john-smith"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Tech Blog",
    "logo": {
      "@type": "ImageObject",
      "url": "https://techblog.com/logo.png"
    }
  },
  "description": "An in-depth look at AI's impact on various industries"
}
</script>
```

**Final Results**:
```
Performance: 52 → 94 (⬆️ 81%)
Accessibility: 71 → 96 (⬆️ 35%)
SEO: 84 → 100 (⬆️ 19%)

Traffic Impact:
- Organic traffic: ⬆️ 127%
- Average time on page: 2:14 → 4:38
- Bounce rate: 61% → 34%
- Social shares: ⬆️ 89%
- Return visitors: ⬆️ 156%
```

---

### Example 3: SaaS Dashboard Optimization

**Application**: Project management dashboard with real-time updates

**Initial Lighthouse Scores**:
```
Performance: 41 (Poor)
Accessibility: 79 (Needs Improvement)
Best Practices: 71 (Needs Improvement)
```

**Critical Issues**:

```javascript
// Issue 1: Massive JavaScript Bundle
// Before: 1.2MB JavaScript bundle
import React from 'react';
import { Router } from 'react-router';
import moment from 'moment'; // 232KB
import lodash from 'lodash'; // 524KB
import d3 from 'd3'; // 314KB
// ... more imports

// After: Code splitting and tree shaking
import React, { lazy, Suspense } from 'react';
import { Router } from 'react-router';

// Use date-fns instead of moment (saves 200KB)
import { format, parseISO } from 'date-fns';

// Import only what you need
import { debounce, throttle } from 'lodash-es';

// Lazy load routes
const Dashboard = lazy(() => import('./pages/Dashboard'));
const Projects = lazy(() => import('./pages/Projects'));
const Settings = lazy(() => import('./pages/Settings'));

function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <Router>
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/projects" element={<Projects />} />
          <Route path="/settings" element={<Settings />} />
        </Routes>
      </Router>
    </Suspense>
  );
}

// Result: Initial bundle reduced from 1.2MB to 285KB (76% reduction)

// Issue 2: Unoptimized Re-renders
// Before: Component re-renders on every state change
function ProjectList({ projects }) {
  return (
    <div>
      {projects.map(project => (
        <ProjectCard key={project.id} project={project} />
      ))}
    </div>
  );
}

// After: Memoization to prevent unnecessary re-renders
const ProjectCard = React.memo(({ project }) => {
  return (
    <div className="project-card">
      <h3>{project.name}</h3>
      <p>{project.description}</p>
      <ProgressBar progress={project.progress} />
    </div>
  );
}, (prevProps, nextProps) => {
  return prevProps.project.id === nextProps.project.id &&
         prevProps.project.progress === nextProps.project.progress;
});

function ProjectList({ projects }) {
  const memoizedProjects = useMemo(() => projects, [projects]);
  
  return (
    <div>
      {memoizedProjects.map(project => (
        <ProjectCard key={project.id} project={project} />
      ))}
    </div>
  );
}

// Issue 3: Inefficient Data Fetching
// Before: Fetch all data on mount
useEffect(() => {
  fetch('/api/projects?limit=1000')
    .then(res => res.json())
    .then(data => setProjects(data));
}, []);

// After: Pagination and infinite scroll
function useProjects() {
  const [projects, setProjects] = useState([]);
  const [page, setPage] = useState(1);
  const [hasMore, setHasMore] = useState(true);

  const loadMore = useCallback(async () => {
    const response = await fetch(`/api/projects?page=${page}&limit=20`);
    const data = await response.json();
    
    setProjects(prev => [...prev, ...data.projects]);
    setHasMore(data.hasMore);
    setPage(prev => prev + 1);
  }, [page]);

  useEffect(() => {
    loadMore();
  }, []);

  return { projects, loadMore, hasMore };
}

// Issue 4: Memory Leaks from WebSocket
// Before: WebSocket never cleaned up
useEffect(() => {
  const ws = new WebSocket('wss://api.example.com/updates');
  
  ws.onmessage = (event) => {
    const update = JSON.parse(event.data);
    updateProjects(update);
  };
}, []);

// After: Proper cleanup
useEffect(() => {
  const ws = new WebSocket('wss://api.example.com/updates');
  
  ws.onmessage = (event) => {
    const update = JSON.parse(event.data);
    updateProjects(update);
  };

  // Cleanup function
  return () => {
    ws.close();
  };
}, []);

// Issue 5: Large Images Not Optimized
// Dashboard has profile pictures, project thumbnails

// Before
<img src={user.avatar} />

// After: Responsive images with CDN
<img 
  src={`${CDN_URL}/avatars/${user.id}-80w.webp`}
  srcset={`
    ${CDN_URL}/avatars/${user.id}-40w.webp 40w,
    ${CDN_URL}/avatars/${user.id}-80w.webp 80w,
    ${CDN_URL}/avatars/${user.id}-160w.webp 160w
  `}
  sizes="(max-width: 768px) 40px, 80px"
  width="80"
  height="80"
  alt={`${user.name}'s profile picture`}
  loading="lazy"
/>
```

**Performance Optimization Results**:

```
Metric Improvements:
├── FCP: 3.9s → 1.2s (⬇️ 69%)
├── LCP: 5.4s → 1.8s (⬇️ 67%)
├── TBT: 1,450ms → 195ms (⬇️ 87%)
├── TTI: 7.2s → 2.9s (⬇️ 60%)
└── Bundle Size: 1.2MB → 285KB (⬇️ 76%)

User Experience:
├── App feels instant and responsive
├── Smooth scrolling and interactions
├── Real-time updates without lag
└── Works well on slower devices

Business Metrics:
├── User engagement: ⬆️ 84%
├── Session duration: ⬆️ 112%
├── Feature adoption: ⬆️ 67%
├── Customer satisfaction: 3.2 → 4.7/5
└── Churn rate: ⬇️ 34%
```

---

## Interpreting Lighthouse Reports

### Understanding the Report Structure

```
┌─────────────────────────────────────────────┐
│          LIGHTHOUSE REPORT                   │
├─────────────────────────────────────────────┤
│                                              │
│  1. SCORES (0-100)                           │
│     ├── Performance                          │
│     ├── Accessibility                        │
│     ├── Best Practices                       │
│     ├── SEO                                  │
│     └── PWA                                  │
│                                              │
│  2. METRICS (Detailed Timings)               │
│     ├── Core Web Vitals                      │
│     ├── Other Performance Metrics            │
│     └── Diagnostic Info                      │
│                                              │
│  3. OPPORTUNITIES (Potential Savings)        │
│     ├── Reduce unused JavaScript             │
│     ├── Properly size images                 │
│     └── Eliminate render-blocking resources  │
│                                              │
│  4. DIAGNOSTICS (Issues Found)               │
│     ├── Avoid enormous network payloads      │
│     ├── Serve images in next-gen formats     │
│     └── Reduce JavaScript execution time     │
│                                              │
│  5. PASSED AUDITS                            │
│     └── Things you're doing right            │
│                                              │
└─────────────────────────────────────────────┘
```

### Reading Opportunities

Opportunities show potential time savings:

```
Opportunity: Eliminate render-blocking resources
Estimated Savings: 2,430 ms
Impact: High

Resources:
1. https://example.com/css/style.css
   Transfer Size: 145 KB
   Savings: 890 ms

2. https://example.com/js/main.js
   Transfer Size: 287 KB
   Savings: 1,240 ms

3. https://fonts.googleapis.com/css?family=Roboto
   Transfer Size: 24 KB
   Savings: 300 ms

How to Fix:
1. Inline critical CSS in <head>
2. Use <link rel="preload"> for fonts
3. Add defer/async to JavaScript
4. Split code and lazy load non-critical parts
```

### Reading Diagnostics

Diagnostics provide additional context:

```
Diagnostic: Avoid enormous network payloads
Total Size: 5,238 KB (over budget by 3,738 KB)

Largest Resources:
1. /images/hero.jpg - 2,145 KB
2. /js/vendor.bundle.js - 1,234 KB
3. /css/styles.css - 456 KB
4. /fonts/Roboto-Regular.woff2 - 234 KB

Recommendations:
- Compress images (use WebP, optimize JPEGs)
- Split JavaScript bundles
- Minify CSS
- Use system fonts or subset custom fonts
```

### Filmstrip View

The filmstrip shows visual progress:

```
[0.0s]  [1.2s]  [2.4s]  [3.6s]  [4.8s]  [6.0s]
[___]   [▓__]   [▓▓_]   [▓▓▓]   [▓▓▓]   [▓▓▓]

0.0s - Blank screen
1.2s - Header appears (FCP)
2.4s - Hero image loads (LCP)
3.6s - Content renders
4.8s - Page interactive (TTI)
6.0s - Fully loaded
```

---

## Optimization Strategies

### Strategy 1: Image Optimization

**Complete Image Optimization Workflow**:

```bash
# 1. Image Compression Tools

## Using ImageMagick
convert input.jpg -quality 85 -strip output.jpg

## Using Sharp (Node.js)
npm install sharp

const sharp = require('sharp');

sharp('input.jpg')
  .resize(1200, 800, {
    fit: 'inside',
    withoutEnlargement: true
  })
  .webp({ quality: 85 })
  .toFile('output.webp');

## Batch conversion script
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

async function optimizeImages(directory) {
  const files = fs.readdirSync(directory);
  
  for (const file of files) {
    if (file.match(/\.(jpg|jpeg|png)$/i)) {
      const inputPath = path.join(directory, file);
      const outputPath = path.join(
        directory,
        'optimized',
        file.replace(/\.(jpg|jpeg|png)$/i, '.webp')
      );
      
      await sharp(inputPath)
        .resize(1920, null, { withoutEnlargement: true })
        .webp({ quality: 85 })
        .toFile(outputPath);
      
      console.log(`Optimized: ${file}`);
    }
  }
}

optimizeImages('./images');

# 2. Responsive Images Implementation

<!-- HTML with responsive images -->
<picture>
  <!-- WebP for modern browsers -->
  <source
    type="image/webp"
    srcset="
      product-400w.webp 400w,
      product-800w.webp 800w,
      product-1200w.webp 1200w,
      product-1600w.webp 1600w
    "
    sizes="(max-width: 600px) 100vw,
           (max-width: 900px) 80vw,
           1200px">
  
  <!-- JPEG fallback -->
  <source
    type="image/jpeg"
    srcset="
      product-400w.jpg 400w,
      product-800w.jpg 800w,
      product-1200w.jpg 1200w,
      product-1600w.jpg 1600w
    "
    sizes="(max-width: 600px) 100vw,
           (max-width: 900px) 80vw,
           1200px">
  
  <!-- Fallback image -->
  <img
    src="product-800w.jpg"
    alt="Product name - detailed description"
    width="1200"
    height="800"
    loading="lazy">
</picture>

# 3. Lazy Loading Implementation

<!-- Native lazy loading -->
<img src="image.jpg" loading="lazy" alt="Description">

<!-- JavaScript lazy loading with Intersection Observer -->
<script>
// Lazy load images
const lazyImages = document.querySelectorAll('img[data-src]');

const imageObserver = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      img.removeAttribute('data-src');
      observer.unobserve(img);
    }
  });
}, {
  rootMargin: '50px 0px',
  threshold: 0.01
});

lazyImages.forEach(img => imageObserver.observe(img));
</script>

# 4. CDN Configuration

## Cloudflare Image Optimization
https://example.com/cdn-cgi/image/width=800,quality=85,format=auto/image.jpg

## imgix URL API
https://example.imgix.net/image.jpg?w=800&q=85&auto=format,compress

## Custom CDN Headers
Cache-Control: public, max-age=31536000, immutable
```

**Image Optimization Checklist**:
- [ ] Compress images (aim for <200KB per image)
- [ ] Convert to WebP with JPEG/PNG fallbacks
- [ ] Implement responsive images with srcset
- [ ] Add width and height attributes
- [ ] Use lazy loading for below-the-fold images
- [ ] Optimize thumbnails separately
- [ ] Use appropriate image dimensions (don't serve 4000px images for 400px display)
- [ ] Consider using a CDN with automatic image optimization

---

### Strategy 2: JavaScript Optimization

```javascript
// TECHNIQUE 1: Code Splitting

// Before: One large bundle
import React from 'react';
import HomePage from './pages/HomePage';
import Dashboard from './pages/Dashboard';
import Profile from './pages/Profile';
import Settings from './pages/Settings';
// Total bundle: 1.2MB

// After: Route-based code splitting
import React, { lazy, Suspense } from 'react';

const HomePage = lazy(() => import('./pages/HomePage'));
const Dashboard = lazy(() => import('./pages/Dashboard'));
const Profile = lazy(() => import('./pages/Profile'));
const Settings = lazy(() => import('./pages/Settings'));

function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/settings" element={<Settings />} />
      </Routes>
    </Suspense>
  );
}
// Result: Initial bundle reduced to 285KB

// TECHNIQUE 2: Tree Shaking

// Bad: Import entire library
import _ from 'lodash'; // 524KB
_.debounce(func, 300);

// Good: Import only what you need
import debounce from 'lodash/debounce'; // 18KB

// Better: Use modern alternatives
// Instead of moment.js (232KB), use date-fns
import { format, parseISO } from 'date-fns'; // 15KB

// TECHNIQUE 3: Deferred Execution

// Load non-critical scripts after page load
window.addEventListener('load', () => {
  // Load analytics
  const script = document.createElement('script');
  script.src = 'https://analytics.example.com/tracker.js';
  script.async = true;
  document.body.appendChild(script);
  
  // Initialize chat widget
  if (window.innerWidth > 768) {
    loadChatWidget();
  }
});

// TECHNIQUE 4: Web Workers for Heavy Tasks

// Main thread
const worker = new Worker('calculation-worker.js');

worker.postMessage({ type: 'CALCULATE', data: largeDataset });

worker.onmessage = (event) => {
  const result = event.data;
  updateUI(result);
};

// calculation-worker.js
self.onmessage = (event) => {
  if (event.data.type === 'CALCULATE') {
    const result = heavyCalculation(event.data.data);
    self.postMessage(result);
  }
};

function heavyCalculation(data) {
  // Expensive computation that would block main thread
  return processedData;
}

// TECHNIQUE 5: Request Idle Callback

// Run non-critical tasks during idle time
function performNonCriticalTasks() {
  if ('requestIdleCallback' in window) {
    requestIdleCallback(() => {
      // Prefetch next page
      prefetchNextPage();
      // Send analytics
      sendAnalytics();
      // Preload images
      preloadImages();
    }, { timeout: 2000 });
  } else {
    // Fallback for browsers without requestIdleCallback
    setTimeout(performNonCriticalTasks, 1000);
  }
}

// TECHNIQUE 6: Dynamic Imports

// Load features on demand
async function loadFeature(featureName) {
  try {
    const module = await import(`./features/${featureName}.js`);
    return module.default;
  } catch (error) {
    console.error(`Failed to load ${featureName}:`, error);
  }
}

// Usage
document.getElementById('advanced-btn').addEventListener('click', async () => {
  const advancedFeature = await loadFeature('advanced-editor');
  advancedFeature.initialize();
});
```

---

### Strategy 3: CSS Optimization

```html
<!-- TECHNIQUE 1: Critical CSS -->

<!-- Inline critical CSS in <head> -->
<style>
  /* Above-the-fold styles only */
  body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  }
  
  .header {
    height: 60px;
    background: #2c3e50;
    color: white;
  }
  
  .hero {
    height: 400px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }
  
  .cta-button {
    padding: 12px 24px;
    background: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
  }
</style>

<!-- Load full CSS asynchronously -->
<link rel="preload" href="/css/main.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="/css/main.css"></noscript>

<!-- TECHNIQUE 2: Remove Unused CSS -->

<!-- Use PurgeCSS to remove unused styles -->
// postcss.config.js
module.exports = {
  plugins: [
    require('@fullhuman/postcss-purgecss')({
      content: [
        './src/**/*.html',
        './src/**/*.jsx',
        './src/**/*.js'
      ],
      defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
    })
  ]
}

// Result: Bootstrap CSS reduced from 187KB to 23KB

<!-- TECHNIQUE 3: CSS-in-JS Optimization -->

// Using styled-components with SSR
// _document.js (Next.js)
import Document from 'next/document';
import { ServerStyleSheet } from 'styled-components';

export default class MyDocument extends Document {
  static async getInitialProps(ctx) {
    const sheet = new ServerStyleSheet();
    const originalRenderPage = ctx.renderPage;

    try {
      ctx.renderPage = () =>
        originalRenderPage({
          enhanceApp: (App) => (props) =>
            sheet.collectStyles(<App {...props} />),
        });

      const initialProps = await Document.getInitialProps(ctx);
      return {
        ...initialProps,
        styles: (
          <>
            {initialProps.styles}
            {sheet.getStyleElement()}
          </>
        ),
      };
    } finally {
      sheet.seal();
    }
  }
}
```

---

### Strategy 4: Font Optimization

```html
<!-- TECHNIQUE 1: Preload Critical Fonts -->

<head>
  <!-- Preload font files -->
  <link rel="preload" 
        href="/fonts/inter-var.woff2" 
        as="font" 
        type="font/woff2" 
        crossorigin>
  
  <!-- Define font-face with font-display -->
  <style>
    @font-face {
      font-family: 'Inter';
      src: url('/fonts/inter-var.woff2') format('woff2');
      font-weight: 100 900;
      font-display: swap; /* Show fallback immediately */
      font-style: normal;
    }
    
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 
                   'Segoe UI', Arial, sans-serif;
    }
  </style>
</head>

<!-- TECHNIQUE 2: Subset Fonts -->

<!-- Only include characters you need -->
// Using Google Fonts with subsetting
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap&text=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" rel="stylesheet">

// Using fonttools (Python)
pyftsubset font.ttf \
  --output-file=font-subset.woff2 \
  --flavor=woff2 \
  --layout-features="*" \
  --unicodes="U+0020-007E" /* Basic Latin */

<!-- TECHNIQUE 3: System Fonts Stack -->

/* Use system fonts to avoid loading external fonts */
body {
  font-family: 
    -apple-system,        /* macOS, iOS */
    BlinkMacSystemFont,   /* Chrome on macOS */
    'Segoe UI',           /* Windows */
    Roboto,               /* Android */
    'Helvetica Neue',     /* Older macOS */
    Arial,                /* Fallback */
    sans-serif;           /* Generic fallback */
}

/* Monospace */
code, pre {
  font-family:
    'SF Mono',            /* macOS */
    Monaco,               /* Older macOS */
    'Cascadia Code',      /* Windows */
    'Roboto Mono',        /* Android */
    Consolas,             /* Windows */
    'Liberation Mono',    /* Linux */
    monospace;            /* Generic fallback */
}

<!-- TECHNIQUE 4: Variable Fonts -->

/* Use variable fonts to reduce file size */
@font-face {
  font-family: 'Inter';
  src: url('inter-var.woff2') format('woff2-variations');
  font-weight: 100 900; /* Single file for all weights */
  font-display: swap;
}

/* Use different weights without loading multiple files */
h1 { font-weight: 900; }
h2 { font-weight: 700; }
body { font-weight: 400; }
caption { font-weight: 300; }
```

---

### Strategy 5: Caching and CDN

```nginx
# Nginx Caching Configuration

# Cache static assets
location ~* \.(jpg|jpeg|png|gif|ico|css|js|woff|woff2)$ {
  expires 1y;
  add_header Cache-Control "public, immutable";
}

# HTML files with shorter cache
location ~* \.html$ {
  expires 1h;
  add_header Cache-Control "public, must-revalidate";
}

# API responses
location /api/ {
  expires -1;
  add_header Cache-Control "no-store, no-cache, must-revalidate, proxy-revalidate";
}

# Gzip compression
gzip on;
gzip_vary on;
gzip_types text/plain text/css text/xml text/javascript 
           application/x-javascript application/xml+rss 
           application/json application/javascript;
gzip_min_length 1000;

# Brotli compression (if supported)
brotli on;
brotli_comp_level 6;
brotli_types text/plain text/css text/xml text/javascript 
             application/x-javascript application/xml+rss 
             application/json application/javascript;

# Service Worker for Offline Support
// sw.js
const CACHE_NAME = 'my-site-cache-v1';
const urlsToCache = [
  '/',
  '/css/main.css',
  '/js/app.js',
  '/images/logo.png'
];

// Install service worker and cache resources
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

// Network-first strategy for API calls
self.addEventListener('fetch', event => {
  if (event.request.url.includes('/api/')) {
    event.respondWith(
      fetch(event.request)
        .then(response => {
          // Clone response for cache
          const responseToCache = response.clone();
          caches.open(CACHE_NAME)
            .then(cache => cache.put(event.request, responseToCache));
          return response;
        })
        .catch(() => {
          // Fallback to cache if offline
          return caches.match(event.request);
        })
    );
  } else {
    // Cache-first for static assets
    event.respondWith(
      caches.match(event.request)
        .then(response => response || fetch(event.request))
    );
  }
});

// Clean up old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames
          .filter(name => name !== CACHE_NAME)
          .map(name => caches.delete(name))
      );
    })
  );
});
```

---

## Advanced Usage

### Custom Lighthouse Configuration

```javascript
// lighthouse-config.js
module.exports = {
  extends: 'lighthouse:default',
  settings: {
    // Only run specific audits
    onlyCategories: ['performance', 'accessibility'],
    
    // Custom throttling
    throttling: {
      rttMs: 40,
      throughputKbps: 10 * 1024,
      cpuSlowdownMultiplier: 1,
      requestLatencyMs: 0,
      downloadThroughputKbps: 0,
      uploadThroughputKbps: 0
    },
    
    // Screen emulation
    screenEmulation: {
      mobile: true,
      width: 412,
      height: 823,
      deviceScaleFactor: 2.625,
      disabled: false
    },
    
    // Custom user agent
    emulatedUserAgent: 'Mozilla/5.0 (Linux; Android 11; Pixel 5) ...',
    
    // Skip certain audits
    skipAudits: ['uses-http2', 'redirects-http']
  },
  
  // Custom audits
  audits: [
    { path: 'lighthouse/lighthouse-core/audits/metrics/first-contentful-paint.js' }
  ],
  
  // Custom categories
  categories: {
    performance: {
      title: 'Performance',
      auditRefs: [
        { id: 'first-contentful-paint', weight: 3, group: 'metrics' },
        { id: 'largest-contentful-paint', weight: 5, group: 'metrics' },
        { id: 'cumulative-layout-shift', weight: 5, group: 'metrics' }
      ]
    }
  }
};

// Run with custom config
lighthouse('https://example.com', {
  configPath: './lighthouse-config.js'
});
```

### Performance Budgets

```json
// budget.json
{
  "path": "/*",
  "resourceSizes": [
    {
      "resourceType": "document",
      "budget": 50
    },
    {
      "resourceType": "script",
      "budget": 300
    },
    {
      "resourceType": "stylesheet",
      "budget": 50
    },
    {
      "resourceType": "image",
      "budget": 500
    },
    {
      "resourceType": "font",
      "budget": 100
    },
    {
      "resourceType": "total",
      "budget": 1000
    }
  ],
  "resourceCounts": [
    {
      "resourceType": "third-party",
      "budget": 10
    }
  ],
  "timings": [
    {
      "metric": "first-contentful-paint",
      "budget": 2000
    },
    {
      "metric": "largest-contentful-paint",
      "budget": 2500
    },
    {
      "metric": "cumulative-layout-shift",
      "budget": 0.1
    },
    {
      "metric": "total-blocking-time",
      "budget": 300
    }
  ]
}
```

```bash
# Run Lighthouse with budget
lighthouse https://example.com --budget-path=./budget.json

# If budgets are exceeded, exit with error code
lighthouse https://example.com \
  --budget-path=./budget.json \
  --fail-on-budget-breach
```

---

## CI/CD Integration

### GitHub Actions

```yaml
# .github/workflows/lighthouse.yml
name: Lighthouse CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  lighthouse:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: |
          npm install -g @lhci/cli
      
      - name: Build project
        run: npm run build
      
      - name: Run Lighthouse CI
        run: |
          lhci autorun
        env:
          LHCI_GITHUB_APP_TOKEN: ${{ secrets.LHCI_GITHUB_APP_TOKEN }}
      
      - name: Upload results
        uses: actions/upload-artifact@v3
        with:
          name: lighthouse-results
          path: .lighthouseci/
```

### Lighthouse CI Configuration

```javascript
// lighthouserc.js
module.exports = {
  ci: {
    collect: {
      // URLs to audit
      url: [
        'http://localhost:3000/',
        'http://localhost:3000/products',
        'http://localhost:3000/about'
      ],
      
      // Number of runs per URL
      numberOfRuns: 3,
      
      // Start local server
      startServerCommand: 'npm run serve',
      startServerReadyPattern: 'ready on',
      
      // Settings
      settings: {
        preset: 'desktop',
        onlyCategories: ['performance', 'accessibility', 'seo']
      }
    },
    
    assert: {
      // Performance assertions
      assertions: {
        'categories:performance': ['error', {minScore: 0.9}],
        'categories:accessibility': ['error', {minScore: 0.9}],
        'categories:seo': ['warn', {minScore: 0.9}],
        
        // Metric assertions
        'first-contentful-paint': ['warn', {maxNumericValue: 2000}],
        'largest-contentful-paint': ['error', {maxNumericValue: 2500}],
        'cumulative-layout-shift': ['error', {maxNumericValue: 0.1}],
        'total-blocking-time': ['warn', {maxNumericValue: 300}],
        
        // Resource assertions
        'resource-summary:script:size': ['error', {maxNumericValue: 300000}],
        'resource-summary:image:size': ['warn', {maxNumericValue: 500000}]
      }
    },
    
    upload: {
      // Upload to Lighthouse CI server
      target: 'lhci',
      serverBaseUrl: 'https://lhci.example.com',
      token: process.env.LHCI_TOKEN
    },
    
    server: {
      // Local LHCI server configuration
      port: 9001,
      storage: {
        storageMethod: 'sql',
        sqlDialect: 'postgres',
        sqlConnectionUrl: process.env.DATABASE_URL
      }
    }
  }
};
```

---

## Common Issues and Solutions

### Issue 1: Inconsistent Scores

**Problem**: Scores vary significantly between runs

**Causes**:
- Network variability
- Background processes
- Browser extensions
- Cached resources

**Solutions**:

```bash
# Run multiple times and average
lighthouse https://example.com --output=json | \
  jq '.categories.performance.score' | \
  awk '{sum+=$1; count++} END {print sum/count * 100}'

# Use consistent environment
lighthouse https://example.com \
  --preset=desktop \
  --quiet \
  --chrome-flags="--headless --no-sandbox --disable-dev-shm-usage"

# Disable extensions and clear cache
lighthouse https://example.com \
  --disable-storage-reset=false
```

---

### Issue 2: High CLS in Production but Not in Lighthouse

**Problem**: Real users experience layout shifts that Lighthouse doesn't catch

**Cause**: Lighthouse uses lab data, not field data

**Solution**:

```javascript
// Implement Real User Monitoring (RUM)
// Using web-vitals library
import { getCLS, getFID, getLCP } from 'web-vitals';

function sendToAnalytics(metric) {
  // Send to your analytics service
  fetch('/api/analytics', {
    method: 'POST',
    body: JSON.stringify(metric)
  });
}

getCLS(sendToAnalytics);
getFID(sendToAnalytics);
getLCP(sendToAnalytics);

// Log detailed CLS sources
const observer = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    if (!entry.hadRecentInput) {
      console.log('Layout shift:', entry);
      console.log('Affected elements:', entry.sources);
    }
  }
});

observer.observe({ type: 'layout-shift', buffered: true });
```

---

### Issue 3: Large Third-Party Scripts

**Problem**: Ads, analytics, and widgets slow down the site

**Solutions**:

```html
<!-- SOLUTION 1: Lazy load third-party scripts -->
<script>
// Load analytics after page load
window.addEventListener('load', () => {
  const script = document.createElement('script');
  script.src = 'https://analytics.example.com/tracker.js';
  script.async = true;
  document.head.appendChild(script);
});

// Load chat widget on interaction
let chatLoaded = false;
window.addEventListener('scroll', () => {
  if (!chatLoaded && window.scrollY > 500) {
    loadChatWidget();
    chatLoaded = true;
  }
}, { once: true, passive: true });
</script>

<!-- SOLUTION 2: Use facade pattern for embeds -->
<!-- Instead of embedding YouTube directly -->
<div class="youtube-embed" data-video-id="dQw4w9WgXcQ">
  <img src="thumbnail.jpg" alt="Video thumbnail">
  <button class="play-button">▶</button>
</div>

<script>
document.querySelectorAll('.youtube-embed').forEach(container => {
  container.addEventListener('click', function() {
    const iframe = document.createElement('iframe');
    iframe.src = `https://www.youtube.com/embed/${this.dataset.videoId}?autoplay=1`;
    iframe.allow = 'accelerometer; autoplay; encrypted-media';
    this.innerHTML = '';
    this.appendChild(iframe);
  }, { once: true });
});
</script>

<!-- SOLUTION 3: Self-host critical resources -->
<!-- Instead of using Google Fonts CDN -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

<!-- Download and self-host the font -->
<style>
@font-face {
  font-family: 'Roboto';
  src: url('/fonts/roboto-regular.woff2') format('woff2');
  font-weight: 400;
  font-display: swap;
}

@font-face {
  font-family: 'Roboto';
  src: url('/fonts/roboto-bold.woff2') format('woff2');
  font-weight: 700;
  font-display: swap;
}
</style>
```

---

## Best Practices

### 1. Regular Monitoring

```bash
# Daily automated audits
# cron job: 0 2 * * * /path/to/audit-script.sh

#!/bin/bash
# audit-script.sh

URLS=(
  "https://example.com"
  "https://example.com/products"
  "https://example.com/about"
)

REPORT_DIR="./lighthouse-reports/$(date +%Y-%m-%d)"
mkdir -p "$REPORT_DIR"

for URL in "${URLS[@]}"; do
  FILENAME=$(echo "$URL" | sed 's/[^a-zA-Z0-9]/_/g')
  
  lighthouse "$URL" \
    --output=json \
    --output=html \
    --output-path="$REPORT_DIR/$FILENAME" \
    --preset=mobile \
    --quiet
done

# Generate summary report
node generate-summary.js "$REPORT_DIR"

# Send email if scores drop below threshold
node check-thresholds.js "$REPORT_DIR"
```

### 2. Set Performance Budgets

```javascript
// budget-checker.js
const fs = require('fs');
const path = require('path');

const BUDGETS = {
  performance: 90,
  accessibility: 90,
  bestPractices: 90,
  seo: 90,
  fcp: 1800,
  lcp: 2500,
  cls: 0.1,
  tbt: 300
};

function checkBudgets(reportPath) {
  const report = JSON.parse(fs.readFileSync(reportPath));
  const lhr = report.lhr || report;
  
  const violations = [];
  
  // Check category scores
  const scores = {
    performance: lhr.categories.performance.score * 100,
    accessibility: lhr.categories.accessibility.score * 100,
    bestPractices: lhr.categories['best-practices'].score * 100,
    seo: lhr.categories.seo.score * 100
  };
  
  for (const [key, value] of Object.entries(scores)) {
    if (value < BUDGETS[key]) {
      violations.push({
        metric: key,
        actual: value.toFixed(1),
        budget: BUDGETS[key],
        diff: (value - BUDGETS[key]).toFixed(1)
      });
    }
  }
  
  // Check metrics
  const metrics = {
    fcp: lhr.audits['first-contentful-paint'].numericValue,
    lcp: lhr.audits['largest-contentful-paint'].numericValue,
    cls: lhr.audits['cumulative-layout-shift'].numericValue,
    tbt: lhr.audits['total-blocking-time'].numericValue
  };
  
  for (const [key, value] of Object.entries(metrics)) {
    if (value > BUDGETS[key]) {
      violations.push({
        metric: key.toUpperCase(),
        actual: value.toFixed(0),
        budget: BUDGETS[key],
        diff: `+${(value - BUDGETS[key]).toFixed(0)}`
      });
    }
  }
  
  return violations;
}

module.exports = checkBudgets;
```

### 3. Document and Share Results

```javascript
// generate-report.js
const fs = require('fs');
const path = require('path');

function generateReport(reportsDir) {
  const files = fs.readdirSync(reportsDir)
    .filter(f => f.endsWith('.json'));
  
  const summary = {
    date: new Date().toISOString(),
    totalPages: files.length,
    pages: []
  };
  
  files.forEach(file => {
    const report = JSON.parse(
      fs.readFileSync(path.join(reportsDir, file))
    );
    const lhr = report.lhr || report;
    
    summary.pages.push({
      url: lhr.finalUrl,
      scores: {
        performance: Math.round(lhr.categories.performance.score * 100),
        accessibility: Math.round(lhr.categories.accessibility.score * 100),
        bestPractices: Math.round(lhr.categories['best-practices'].score * 100),
        seo: Math.round(lhr.categories.seo.score * 100)
      },
      metrics: {
        fcp: Math.round(lhr.audits['first-contentful-paint'].numericValue),
        lcp: Math.round(lhr.audits['largest-contentful-paint'].numericValue),
        cls: lhr.audits['cumulative-layout-shift'].numericValue.toFixed(3),
        tbt: Math.round(lhr.audits['total-blocking-time'].numericValue)
      }
    });
  });
  
  // Calculate averages
  summary.averages = {
    performance: average(summary.pages.map(p => p.scores.performance)),
    accessibility: average(summary.pages.map(p => p.scores.accessibility)),
    bestPractices: average(summary.pages.map(p => p.scores.bestPractices)),
    seo: average(summary.pages.map(p => p.scores.seo))
  };
  
  // Generate Markdown report
  let markdown = `# Lighthouse Audit Report\n\n`;
  markdown += `**Date:** ${new Date().toLocaleDateString()}\n\n`;
  markdown += `## Summary\n\n`;
  markdown += `| Metric | Average Score |\n`;
  markdown += `|--------|---------------|\n`;
  markdown += `| Performance | ${summary.averages.performance.toFixed(1)} |\n`;
  markdown += `| Accessibility | ${summary.averages.accessibility.toFixed(1)} |\n`;
  markdown += `| Best Practices | ${summary.averages.bestPractices.toFixed(1)} |\n`;
  markdown += `| SEO | ${summary.averages.seo.toFixed(1)} |\n\n`;
  
  markdown += `## Detailed Results\n\n`;
  summary.pages.forEach(page => {
    markdown += `### ${page.url}\n\n`;
    markdown += `**Scores:**\n`;
    markdown += `- Performance: ${page.scores.performance}\n`;
    markdown += `- Accessibility: ${page.scores.accessibility}\n`;
    markdown += `- Best Practices: ${page.scores.bestPractices}\n`;
    markdown += `- SEO: ${page.scores.seo}\n\n`;
    markdown += `**Metrics:**\n`;
    markdown += `- FCP: ${page.metrics.fcp}ms\n`;
    markdown += `- LCP: ${page.metrics.lcp}ms\n`;
    markdown += `- CLS: ${page.metrics.cls}\n`;
    markdown += `- TBT: ${page.metrics.tbt}ms\n\n`;
  });
  
  fs.writeFileSync(
    path.join(reportsDir, 'SUMMARY.md'),
    markdown
  );
  
  fs.writeFileSync(
    path.join(reportsDir, 'summary.json'),
    JSON.stringify(summary, null, 2)
  );
  
  console.log('✓ Generated summary report');
}

function average(arr) {
  return arr.reduce((a, b) => a + b, 0) / arr.length;
}

generateReport(process.argv[2]);
```

---

## Lighthouse vs Other Tools

### Comparison Table

| Feature | Lighthouse | WebPageTest | GTmetrix | PageSpeed Insights |
|---------|-----------|-------------|----------|-------------------|
| **Price** | Free | Free / Paid | Free / Paid | Free |
| **Testing Location** | Local / CI | Multiple global locations | Multiple locations | Google servers |
| **Device Emulation** | Yes | Yes | Yes | Yes |
| **Field Data** | No | No | No | Yes (CrUX) |
| **Lab Data** | Yes | Yes | Yes | Yes |
| **Custom Scripts** | No | Yes | No | No |
| **Video Filmstrip** | Yes | Yes | Yes | No |
| **Waterfall Chart** | No | Yes | Yes | No |
| **API Access** | Yes | Yes | Yes | Yes |
| **CI/CD Integration** | Excellent | Good | Good | Fair |
| **Accessibility Audits** | Extensive | Basic | Basic | None |
| **SEO Audits** | Yes | Limited | Limited | No |
| **Custom Budgets** | Yes | Yes | No | No |

### When to Use Each

**Use Lighthouse when**:
- Integrating into development workflow
- Need comprehensive audits (performance + accessibility + SEO)
- Testing locally or in CI/CD
- Want detailed recommendations
- Building PWAs

**Use WebPageTest when**:
- Need to test from specific geographic locations
- Want detailed waterfall charts
- Testing connection quality impact
- Need video comparison between versions
- Advanced performance diagnostics

**Use GTmetrix when**:
- Want both Lighthouse and legacy metrics
- Need scheduled monitoring
- Testing from specific global locations
- Want historical performance data
- Need alerts for performance degradation

**Use PageSpeed Insights when**:
- Want quick public URL test
- Need real user data (Field Data from CrUX)
- Sharing results with non-technical stakeholders
- Quick validation of Core Web Vitals
- No installation or setup required

---

## Conclusion

Lighthouse is an essential tool for modern web development. By understanding how to use it effectively and implementing the optimization strategies covered in this guide, you can significantly improve your website's performance, accessibility, SEO, and user experience.

### Key Takeaways

1. **Regular Testing**: Run Lighthouse audits regularly, not just once
2. **Multiple Methods**: Use DevTools for quick checks, CLI for automation, Node module for integration
3. **Focus on Core Web Vitals**: LCP, CLS, and INP/FID are most important for rankings and UX
4. **Prioritize Optimizations**: Start with opportunities that show largest time savings
5. **Set Performance Budgets**: Define and enforce performance standards
6. **Automate in CI/CD**: Catch performance regressions before they reach production
7. **Monitor Real Users**: Combine lab data (Lighthouse) with field data (RUM)
8. **Accessibility Matters**: Don't ignore accessibility audits—they expand your audience
9. **SEO Optimization**: Follow Lighthouse SEO recommendations for better rankings
10. **Continuous Improvement**: Performance optimization is ongoing, not one-time

### Resources

- **Official Documentation**: https://github.com/GoogleChrome/lighthouse
- **Web.dev**: https://web.dev/lighthouse/
- **Core Web Vitals**: https://web.dev/vitals/
- **Lighthouse CI**: https://github.com/GoogleChrome/lighthouse-ci
- **PageSpeed Insights**: https://pagespeed.web.dev/
- **Chrome DevTools**: https://developer.chrome.com/docs/devtools/

---

**Happy Optimizing! 🚀**
