
## 2.4 Mobile Optimization

Mobile traffic accounts for over 60% of all web traffic globally. Google uses mobile-first indexing, making mobile optimization critical for SEO.


### Accelerated Mobile Pages (AMP)

AMP is a stripped-down HTML framework for lightning-fast mobile pages.

**Note:** AMP is less critical now (Google removed AMP badge in 2021), but still relevant for publishers.

#### AMP vs Regular HTML

**Regular HTML:**
```html
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <script src="jquery.js"></script>
    <script src="app.js"></script>
</head>
<body>
    <img src="hero.jpg" alt="Hero">
    <iframe src="video.html"></iframe>
</body>
</html>
```

**AMP HTML:**
```html
<!doctype html>
<html ⚡>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <link rel="canonical" href="https://example.com/article.html">
    
    <!-- AMP Boilerplate -->
    <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style>
    <noscript><style amp-boilerplate>body{-webkit-animation:none;animation:none}</style></noscript>
    
    <!-- AMP Runtime -->
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    
    <!-- Custom Styles (inline only, max 75KB) -->
    <style amp-custom>
        body { font-family: sans-serif; }
        .header { background: #333; color: white; }
    </style>
</head>
<body>
    <!-- AMP Components -->
    <amp-img src="hero.jpg" 
             width="1200" 
             height="800" 
             layout="responsive" 
             alt="Hero">
    </amp-img>
    
    <amp-video width="720"
               height="405"
               src="video.mp4"
               poster="poster.jpg"
               layout="responsive"
               controls>
    </amp-video>
</body>
</html>
```

#### AMP Restrictions

```markdown
❌ No custom JavaScript (except AMP components)
❌ No external stylesheets
❌ CSS limited to 75KB (inline only)
❌ No form elements (without amp-form)
❌ All resources must have fixed dimensions
```

#### Real-Life Example: News Publisher

**The Washington Post AMP Implementation:**

**Before AMP:**
```
Mobile load time: 3.8 seconds
Average session: 1.2 pages
Bounce rate: 67%
```

**After AMP:**
```
AMP load time: 0.4 seconds (89% faster)
Average session: 2.8 pages (133% increase)
Bounce rate: 42% (37% improvement)
Page views: +23% overall
Ad viewability: +31%
```

**Implementation:**
```html
<!-- Regular page with AMP version -->
<link rel="amphtml" href="https://example.com/article.amp.html">

<!-- AMP page with canonical -->
<link rel="canonical" href="https://example.com/article.html">
```

---