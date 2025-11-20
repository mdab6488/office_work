
## On-Page SEO Audit

### Running Complete Page Audit

**Step-by-Step Process**:

1. **Navigate to Target Page**
   ```
   Visit: yoursite.com/product-page
   ```

2. **Open SEOquake Diagnosis**
   ```
   Click SEOquake icon > "Diagnosis"
   Or right-click page > "SEOquake" > "Diagnosis"
   ```

3. **Review Results**

### Detailed Audit Components

#### 1. **Meta Tags Analysis**

**Real-World Example**:
```
Page: E-commerce Product Page for "Organic Coffee Beans"

Title Tag:
✅ Present: "Premium Organic Coffee Beans | Fair Trade | CoffeeCo"
📏 Length: 58 characters (optimal: 50-60)
📊 Keywords: Contains primary keyword "organic coffee beans"

Meta Description:
✅ Present: "Shop our selection of premium organic coffee beans. 
    Fair trade, freshly roasted, and delivered to your door. 
    Free shipping on orders over $50."
📏 Length: 152 characters (optimal: 150-160)
📊 Keywords: Contains primary and related keywords
📊 CTA: "Shop" and "Free shipping" present

Issues to Fix:
❌ Meta Keywords: Present (outdated, remove)
⚠️ Open Graph Tags: Missing (add for social sharing)
```

**Fix Example**:
```html
<!-- Remove -->
<meta name="keywords" content="...">

<!-- Add -->
<meta property="og:title" content="Premium Organic Coffee Beans | CoffeeCo">
<meta property="og:description" content="Shop our selection...">
<meta property="og:image" content="https://yoursite.com/coffee-image.jpg">
<meta property="og:url" content="https://yoursite.com/organic-coffee-beans">
<meta name="twitter:card" content="summary_large_image">
```

#### 2. **Heading Structure Analysis**

**Real-World Example**:
```
Page: Blog Post "Complete Guide to SEO in 2024"

Heading Structure:
H1: 2 found ❌
  - "Complete Guide to SEO in 2024"
  - "Everything You Need to Know About SEO"

H2: 8 found ✅
  - "What is SEO?"
  - "On-Page SEO Techniques"
  - "Off-Page SEO Strategies"
  - "Technical SEO Fundamentals"
  - "Local SEO Best Practices"
  - "Mobile SEO Optimization"
  - "SEO Tools You Need"
  - "Measuring SEO Success"

H3: 15 found ✅
  - Under each H2, proper sub-topics

H4: 5 found ✅
  - Used for specific examples

Issues:
❌ Multiple H1 tags (SEO problem)
⚠️ H2 "SEO Tools You Need" - keyword stuffed
```

**Fix Strategy**:
```
Solution:
1. Combine H1s: "Complete Guide to SEO in 2024: Everything You Need to Know"
2. Revise H2: "SEO Tools You Need" → "Essential Tools for SEO Success"
3. Ensure logical hierarchy: H1 > H2 > H3 > H4
4. Include keywords naturally in H2s
5. Add H3s under each H2 for depth
```

#### 3. **Image Optimization Analysis**

**Real-World Example**:
```
Page: Product Gallery with 12 Images

Image Audit Results:

Image 1: product-hero.jpg
✅ Alt Text: "Organic Arabica Coffee Beans in burlap sack"
✅ File Size: 85KB (optimized)
✅ Dimensions: 1200x800 (appropriate)
⚠️ File Name: Could be more descriptive

Image 2: IMG_1234.jpg
❌ Alt Text: Missing
❌ File Size: 2.3MB (too large!)
❌ File Name: Non-descriptive

Image 3: product-roasting.jpg
✅ Alt Text: "Coffee roasting process"
⚠️ File Size: 450KB (could be smaller)
✅ File Name: Descriptive

Overall: 5 of 12 images missing alt text
       4 of 12 images too large (over 200KB)
```

**Fix Implementation**:
```html
<!-- Before -->
<img src="IMG_1234.jpg">

<!-- After -->
<img src="organic-coffee-beans-close-up.jpg" 
     alt="Close-up of premium organic Arabica coffee beans showing texture and quality" 
     width="800" 
     height="600"
     loading="lazy">
```

**Image Optimization Checklist**:
```
✅ Descriptive file names
✅ Alt text on all images
✅ Compressed/optimized file sizes
✅ Proper dimensions
✅ Lazy loading implemented
✅ Responsive images for mobile
✅ WebP format where supported
```

#### 4. **URL Structure Analysis**

**Real-World Example**:
```
Page Analysis: E-commerce Category Page

Current URL:
❌ yoursite.com/products.php?cat=23&sort=price&page=1

Issues:
- Dynamic parameters
- Not SEO-friendly
- No keywords
- Session IDs sometimes present

Competitor URLs:
✅ competitor1.com/organic-coffee-beans
✅ competitor2.com/shop/coffee/organic-arabica
✅ competitor3.com/products/beverages/coffee/organic

Recommended URL Structure:
✅ yoursite.com/shop/organic-coffee-beans
Or
✅ yoursite.com/coffee/organic-arabica-beans
```

**Best Practice URLs**:
```
Good Examples:
✅ /blog/seo-guide-2024
✅ /services/digital-marketing
✅ /products/organic-coffee
✅ /resources/email-templates

Bad Examples:
❌ /page?id=123
❌ /p/prod.php?cat=coffee&id=45
❌ /index.php?page=article&article_id=789
❌ /2024/01/15/p123 (date in URL for evergreen content)
```

#### 5. **Canonical URL Check**

**Real-World Example**:
```
Page: Product available through multiple URLs

URLs:
- yoursite.com/products/coffee-beans
- yoursite.com/shop/coffee-beans?ref=homepage
- yoursite.com/coffee-beans?utm_source=email

SEOquake Diagnosis:
✅ Canonical Tag Present: <link rel="canonical" href="https://yoursite.com/products/coffee-beans">

Result: All versions point to primary URL (good!)

Without Canonical (Problem):
- Google sees 3 duplicate pages
- Link equity split across URLs
- Confusion about which to rank
```

**Implementation**:
```html
<!-- Add to <head> of all product page variations -->
<link rel="canonical" href="https://yoursite.com/products/coffee-beans">
```

#### 6. **Robots Meta Tag Analysis**

**Real-World Example**:
```
Page: yoursite.com/blog/seo-tips

Diagnosis Shows:
✅ Robots Meta: index, follow

Meaning:
- index: Allow search engines to index this page
- follow: Allow search engines to follow links

Other Variations You Might See:

Admin Page:
❌ Robots Meta: noindex, nofollow
(Correct - don't want admin pages indexed)

Thank You Page After Purchase:
✅ Robots Meta: noindex, follow
(Correct - no need to index, but follow links)

Outdated Content You Want Removed:
✅ Robots Meta: noindex, follow
(Correct - remove from index but preserve links)
```

**When to Use Different Values**:
```
index, follow → Normal pages you want ranked
noindex, follow → Thank you pages, private content, duplicate content
noindex, nofollow → Admin pages, login pages, private account pages
index, nofollow → Rare - usually not recommended
```

#### 7. **HTTPS Security Check**

**Real-World Example**:
```
SEOquake Diagnosis:

Scenario 1:
✅ HTTPS: Secure connection active
✅ SSL Certificate: Valid
✅ All Resources: Loaded via HTTPS

Scenario 2 (Problems):
⚠️ HTTPS: Mixed content detected
❌ Some resources loaded via HTTP:
  - http://oldcdn.com/style.css
  - http://example.com/image.jpg

Impact:
- Browser security warnings
- Ranking penalty
- User trust issues
```

**Fix Mixed Content**:
```html
<!-- Before -->
<link rel="stylesheet" href="http://oldcdn.com/style.css">
<img src="http://example.com/image.jpg">

<!-- After -->
<link rel="stylesheet" href="https://oldcdn.com/style.css">
<img src="https://example.com/image.jpg">

<!-- Better - Protocol Relative -->
<link rel="stylesheet" href="//oldcdn.com/style.css">
<img src="//example.com/image.jpg">
```

#### 8. **Mobile-Friendly Check**

**Real-World Example**:
```
Page: yoursite.com/services

SEOquake Diagnosis:
⚠️ Mobile-Friendly: Not detected or issues found

Common Issues:
❌ Text too small to read
❌ Clickable elements too close together
❌ Content wider than screen
❌ No viewport meta tag

Fix:
```

```html
<!-- Add to <head> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
body {
  max-width: 100%;
  overflow-x: hidden;
}

img {
  max-width: 100%;
  height: auto;
}

/* Make text readable */
body {
  font-size: 16px;
  line-height: 1.6;
}

/* Touch-friendly buttons */
button, a {
  min-height: 44px;
  min-width: 44px;
  padding: 12px 20px;
}
```

#### 9. **Page Load Speed Analysis**

**Real-World Example**:
```
SEOquake Diagnosis:
⚠️ Load Time: 5.8 seconds (slow)

Factors Contributing:
- Large unoptimized images: 3.2s
- Render-blocking JavaScript: 1.4s
- Server response time: 0.8s
- External scripts: 0.4s

Target: Under 3 seconds
Google's Fast: Under 2.5 seconds
```

**Optimization Steps**:
```
1. Image Optimization:
   - Compress images (use TinyPNG, ImageOptim)
   - Implement lazy loading
   - Use WebP format
   - Serve responsive images

2. JavaScript Optimization:
   - Move scripts to bottom of page
   - Use async or defer attributes
   - Minify JavaScript files
   - Remove unused scripts

3. CSS Optimization:
   - Minify CSS
   - Remove unused CSS
   - Inline critical CSS
   - Load non-critical CSS asynchronously

4. Server Optimization:
   - Enable compression (Gzip/Brotli)
   - Use CDN
   - Enable browser caching
   - Optimize database queries

5. Third-Party Scripts:
   - Audit necessity of each script
   - Use async loading
   - Consider self-hosting fonts
```
