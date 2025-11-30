
### 📷 Product Images and Videos

Visual content is crucial for e-commerce. It reduces returns, increases conversions, and improves SEO.

#### Image Optimization Best Practices

**1. File Naming**

❌ **Bad:**
```
IMG_12345.jpg
DSC00876.jpg
product-img-1.jpg
```

✅ **Good:**
```
nike-air-max-90-white-red-mens-running-shoe.jpg
blue-oxford-button-down-shirt-front-view.jpg
samsung-65-inch-4k-smart-tv-living-room.jpg
```

**2. Alt Text**

Alt text helps search engines understand images and improves accessibility.

❌ **Bad:**
```html
<img src="shoe.jpg" alt="shoe">
<img src="product-1.jpg" alt="product image">
<img src="shirt.jpg" alt="">
```

✅ **Good:**
```html
<img src="nike-pegasus-39-black.jpg" 
     alt="Nike Air Zoom Pegasus 39 running shoe in black and white, side view">

<img src="blue-oxford-shirt-front.jpg" 
     alt="Men's blue Oxford button-down shirt, front view showing collar and buttons">

<img src="macbook-pro-14-space-gray.jpg" 
     alt="Apple MacBook Pro 14-inch laptop in space gray, open and powered on">
```

**Best Practices for Alt Text:**
- Describe what's in the image
- Include product name and key attributes
- Keep it under 125 characters
- Don't keyword stuff
- Don't use "image of" or "picture of"

**3. Image Size and Format**

Modern best practices:
```
Format Priority:
1. WebP (best compression, modern browsers)
2. JPEG (photos, gradients)
3. PNG (logos, graphics with transparency)

Sizes:
→ Thumbnail: 150x150px (under 10KB)
→ Product grid: 400x400px (under 50KB)
→ Main product image: 1200x1200px (under 150KB)
→ Zoom image: 2000x2000px (lazy loaded)
```

**4. Responsive Images**

Use `srcset` for different screen sizes:

```html
<img src="product-800.webp"
     srcset="product-400.webp 400w,
             product-800.webp 800w,
             product-1200.webp 1200w,
             product-2000.webp 2000w"
     sizes="(max-width: 600px) 400px,
            (max-width: 900px) 800px,
            1200px"
     alt="Nike Air Zoom Pegasus 39 men's running shoe in black">
```

**5. Lazy Loading**

Load images only when needed:

```html
<img src="product.webp" 
     loading="lazy"
     alt="Product description">
```

#### Real-Life Example: ASOS

ASOS sets the standard for e-commerce product images.

**Image Strategy:**

1. **Multiple Views (6-10 images minimum):**
   - Front view
   - Back view
   - Side view
   - Detail shots (fabric, buttons, zippers)
   - Outfit combinations
   - Model wearing (multiple angles)
   - Size comparison

2. **Lifestyle Images:**
   - Model in natural setting
   - Styled with other products
   - Different lighting conditions

3. **Technical Implementation:**
```html
<!-- Main product image with zoom -->
<div class="product-gallery">
  <img src="asos-blue-dress-main.webp"
       srcset="asos-blue-dress-400.webp 400w,
               asos-blue-dress-800.webp 800w,
               asos-blue-dress-1500.webp 1500w"
       alt="ASOS DESIGN midi tea dress in blue floral print, front view"
       data-zoom="asos-blue-dress-3000.webp">
</div>

<!-- Thumbnail strip -->
<div class="thumbnail-strip">
  <img src="thumb-front.webp" alt="Front view" loading="lazy">
  <img src="thumb-back.webp" alt="Back view" loading="lazy">
  <img src="thumb-side.webp" alt="Side view" loading="lazy">
  <img src="thumb-detail.webp" alt="Fabric detail" loading="lazy">
</div>
```

#### Product Videos

Video can increase conversions by 80% and reduce returns by 25%.

**Types of Product Videos:**

1. **360° Spin**
```
Show product rotating on turntable
Duration: 5-10 seconds
File size: Under 2MB
Format: MP4 or WebM
```

2. **Demonstration Video**
```
Show product in use
Duration: 30-90 seconds
Highlight key features
Include captions (most watch with sound off)
```

3. **Unboxing Video**
```
Show packaging and contents
Duration: 1-2 minutes
Builds excitement and trust
```

4. **Comparison Video**
```
Compare with similar products
Duration: 1-3 minutes
Helps customer make decision
```

#### Real-Life Example: Apple Product Pages

Apple's product videos are masterful:

**iPhone 14 Pro Page Elements:**

1. **Hero Video** (autoplays, muted)
   - 10-second loop showing key feature
   - Smooth animations
   - No audio required

2. **Feature Videos** (as user scrolls)
   - Camera capabilities (shows sample footage)
   - Display quality (shows brightness differences)
   - Performance (shows gaming and multitasking)

3. **Video Optimization:**
```html
<video autoplay muted loop playsinline
       poster="iphone-poster.jpg"
       aria-label="iPhone 14 Pro camera capturing sunset">
  <source src="iphone-camera-demo.webm" type="video/webm">
  <source src="iphone-camera-demo.mp4" type="video/mp4">
</video>
```

**SEO Best Practices for Videos:**

1. **Video Schema Markup** (covered in next section)

2. **Video Thumbnail Optimization**
   - Use compelling frame
   - Include product name in filename
   - Add alt text

3. **Video Hosting**
   - Self-hosted for product page videos
   - YouTube for tutorials (drives additional traffic)

4. **Transcripts**
   - Provide text version
   - Improves accessibility and SEO

---
