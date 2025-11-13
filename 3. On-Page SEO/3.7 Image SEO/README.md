# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.7 Image SEO

Image SEO is crucial for driving organic traffic from Google Images, improving page load speed, and enhancing user experience. Properly optimized images can account for 20-60% of a website's total traffic.


### Responsive Images

**What It Is:**
Serving different image sizes based on the user's device screen size, resolution, and viewport to optimize performance and visual quality.

**Why It Matters:**
- Mobile devices don't need 4K desktop images
- Saves bandwidth (critical for mobile users)
- Improves page speed significantly
- Better user experience across all devices

**The Problem:**

```html
<!-- Same large image served to all devices -->
<img src="hero-3840x2160.jpg" alt="Hero banner" />

<!-- Results: -->
<!-- Desktop (1920px): Perfect ✓ -->
<!-- Tablet (768px): Wasted 2.8 MB ✗ -->
<!-- Mobile (375px): Wasted 3.1 MB ✗ -->
```

**HTML Responsive Image Solutions:**

**Method 1: srcset with sizes (Resolution Switching)**

```html
<img src="image-800w.jpg"
     srcset="image-400w.jpg 400w,
             image-800w.jpg 800w,
             image-1200w.jpg 1200w,
             image-1600w.jpg 1600w"
     sizes="(max-width: 600px) 100vw,
            (max-width: 1200px) 50vw,
            800px"
     alt="Responsive image example" />
```

**Explanation:**
- `srcset`: List of available images with their widths
- `sizes`: Tells browser which size to use based on viewport
- `src`: Fallback for old browsers

**Method 2: `<picture>` Element (Art Direction)**

```html
<picture>
  <!-- Mobile: Cropped portrait version -->
  <source media="(max-width: 767px)" 
          srcset="hero-mobile-600x900.jpg">
  
  <!-- Tablet: Square crop -->
  <source media="(max-width: 1023px)" 
          srcset="hero-tablet-800x800.jpg">
  
  <!-- Desktop: Full landscape -->
  <source media="(min-width: 1024px)" 
          srcset="hero-desktop-1920x1080.jpg">
  
  <!-- Fallback -->
  <img src="hero-desktop-1920x1080.jpg" 
       alt="Hero banner">
</picture>
```

**Real-Life Example 1: E-commerce Product Image**

```html
<picture>
  <!-- High-DPI mobile (iPhone Retina) -->
  <source media="(max-width: 767px) and (-webkit-min-device-pixel-ratio: 2)"
          srcset="product-mobile@2x.jpg" />
  
  <!-- Standard mobile -->
  <source media="(max-width: 767px)"
          srcset="product-mobile.jpg" />
  
  <!-- Tablet -->
  <source media="(max-width: 1023px)"
          srcset="product-tablet.jpg" />
  
  <!-- Desktop -->
  <source media="(min-width: 1024px)"
          srcset="product-desktop.jpg" />
  
  <!-- Fallback -->
  <img src="product-desktop.jpg" 
       alt="Blue cotton t-shirt front view"
       width="800" 
       height="1000" />
</picture>
```

**Real-Life Example 2: Blog Hero Image**

```html
<img src="hero-1200w.jpg"
     srcset="hero-400w.jpg 400w,
             hero-800w.jpg 800w,
             hero-1200w.jpg 1200w,
             hero-1600w.jpg 1600w,
             hero-2000w.jpg 2000w"
     sizes="(max-width: 600px) 100vw,
            (max-width: 1200px) 90vw,
            1200px"
     alt="Mountain landscape at golden hour"
     loading="eager" />
```

**Real-Life Example 3: Background Images (CSS)**

```css
.hero-section {
  /* Mobile first */
  background-image: url('hero-mobile-600w.jpg');
  background-size: cover;
  background-position: center;
}

/* Tablet */
@media (min-width: 768px) {
  .hero-section {
    background-image: url('hero-tablet-1024w.jpg');
  }
}

/* Desktop */
@media (min-width: 1200px) {
  .hero-section {
    background-image: url('hero-desktop-1920w.jpg');
  }
}

/* High DPI displays */
@media (min-width: 1200px) and (-webkit-min-device-pixel-ratio: 2) {
  .hero-section {
    background-image: url('hero-desktop-3840w.jpg');
  }
}
```

**Image Size Guidelines:**

| Device | Viewport Width | Image Width | Example Dimensions |
|--------|----------------|-------------|-------------------|
| Mobile (Portrait) | 320-428px | 400-600px | 600x800 |
| Mobile (Landscape) | 568-932px | 800-1000px | 1000x600 |
| Tablet (Portrait) | 768-834px | 800-1200px | 1200x1600 |
| Tablet (Landscape) | 1024-1112px | 1200-1400px | 1400x900 |
| Desktop | 1280-1920px | 1400-2000px | 2000x1200 |
| Large Desktop | 2560px+ | 2400-3840px | 3840x2160 |

**Generating Responsive Images:**

**Using Command Line (ImageMagick):**
```bash
# Create multiple sizes from original
convert original.jpg -resize 400x400^ -gravity center -extent 400x400 image-400w.jpg
convert original.jpg -resize 800x800^ -gravity center -extent 800x800 image-800w.jpg
convert original.jpg -resize 1200x1200^ -gravity center -extent 1200x1200 image-1200w.jpg
convert original.jpg -resize 1600x1600^ -gravity center -extent 1600x1600 image-1600w.jpg
```

**Using WordPress Plugins:**
- EWWW Image Optimizer (auto-generates sizes)
- Regenerate Thumbnails
- Imsanity (auto-resize uploads)

**Performance Impact:**

**Case Study: News Website Article**

**Before Responsive Images:**
```
Mobile (iPhone):
- Downloaded: 3840x2160px image (2.4 MB)
- Displayed: 375x211px on screen
- Wasted: 98.7% of data
- Load time: 4.2 seconds on 4G
```

**After Responsive Images:**
```
Mobile (iPhone):
- Downloaded: 800x450px image (95 KB)
- Displayed: 375x211px on screen
- Wasted: Minimal
- Load time: 0.3 seconds on 4G
- 96% data savings
- 93% faster load time
```

**Best Practices Checklist:**

✅ **DO:**
- Provide at least 3-4 image sizes
- Use WebP format with fallbacks
- Include width/height attributes
- Test on actual devices
- Use art direction for different crops
- Compress all image variations

❌ **DON'T:**
- Serve desktop images to mobile
- Forget to include fallback src
- Use same aspect ratio for all devices (when art direction needed)
- Skip width/height (causes layout shift)

**Testing Responsive Images:**

```
Chrome DevTools:
1. Open DevTools (F12)
2. Toggle device toolbar (Ctrl+Shift+M)
3. Select device (iPhone, iPad, etc.)
4. Network tab → Filter "Img"
5. Reload page
6. Verify correct image size loads
```

**Complete Real-World Example:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Responsive Image Example</title>
</head>
<body>
  
  <!-- Hero Section: Art Direction -->
  <picture>
    <source media="(max-width: 767px)" 
            srcset="hero-mobile-600w.webp" 
            type="image/webp">
    <source media="(max-width: 767px)" 
            srcset="hero-mobile-600w.jpg">
    
    <source media="(max-width: 1023px)" 
            srcset="hero-tablet-1024w.webp" 
            type="image/webp">
    <source media="(max-width: 1023px)" 
            srcset="hero-tablet-1024w.jpg">
    
    <source media="(min-width: 1024px)" 
            srcset="hero-desktop-1920w.webp" 
            type="image/webp">
    <source media="(min-width: 1024px)" 
            srcset="hero-desktop-1920w.jpg">
    
    <img src="hero-desktop-1920w.jpg" 
         alt="Mountain landscape at sunrise"
         width="1920" 
         height="1080"
         loading="eager">
  </picture>
  
  <!-- Product Gallery: Resolution Switching -->
  <section class="products">
    <img src="product-800w.jpg"
         srcset="product-400w.webp 400w,
                 product-800w.webp 800w,
                 product-1200w.webp 1200w"
         sizes="(max-width: 600px) 100vw,
                (max-width: 1200px) 50vw,
                400px"
         alt="Blue cotton t-shirt"
         width="800"
         height="1000"
         loading="lazy" />
  </section>
  
</body>
</html>
```