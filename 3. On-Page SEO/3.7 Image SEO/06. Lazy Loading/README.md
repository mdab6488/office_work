# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.7 Image SEO

Image SEO is crucial for driving organic traffic from Google Images, improving page load speed, and enhancing user experience. Properly optimized images can account for 20-60% of a website's total traffic.


### Lazy Loading

**What It Is:**
Deferring the loading of off-screen images until the user scrolls near them, rather than loading all images when the page first loads.

**Why It Matters:**
- Reduces initial page load time by 50-70%
- Saves bandwidth (users may never scroll to some images)
- Improves Core Web Vitals (LCP, CLS)
- Better mobile experience

**How It Works:**

```
User loads page
    ↓
Only images in viewport load immediately
    ↓
User scrolls down
    ↓
Images near viewport start loading
    ↓
User sees loaded images
```

**Native HTML Implementation:**

```html
<!-- Simple lazy loading (modern browsers) -->
<img src="image.jpg" 
     alt="Description" 
     loading="lazy" />

<!-- Eager loading (above the fold images) -->
<img src="hero-image.jpg" 
     alt="Hero banner" 
     loading="eager" />
```

**Real-Life Example - Blog Article:**

```html
<!DOCTYPE html>
<html>
<head>
  <title>Top 10 Travel Destinations 2024</title>
</head>
<body>
  
  <!-- Hero image: Load immediately (above the fold) -->
  <img src="hero-paris.jpg" 
       alt="Eiffel Tower at sunset" 
       loading="eager"
       width="1200" 
       height="600" />
  
  <article>
    <h1>Top 10 Travel Destinations 2024</h1>
    
    <!-- First paragraph visible, load normally -->
    <p>Paris continues to captivate travelers...</p>
    
    <!-- Images below fold: Lazy load -->
    <h2>1. Paris, France</h2>
    <img src="paris-street.jpg" 
         alt="Charming Paris street with cafes" 
         loading="lazy"
         width="800" 
         height="600" />
    
    <h2>2. Tokyo, Japan</h2>
    <img src="tokyo-skyline.jpg" 
         alt="Tokyo skyline at night" 
         loading="lazy"
         width="800" 
         height="600" />
    
    <h2>3. Bali, Indonesia</h2>
    <img src="bali-beach.jpg" 
         alt="Tropical beach in Bali" 
         loading="lazy"
         width="800" 
         height="600" />
    
    <!-- 7 more destinations with lazy loaded images... -->
    
  </article>
  
</body>
</html>
```

**JavaScript Implementation (for older browsers):**

```html
<!-- Add Intersection Observer polyfill for old browsers -->
<script>
document.addEventListener("DOMContentLoaded", function() {
  const lazyImages = document.querySelectorAll('img[data-src]');
  
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.add('loaded');
        imageObserver.unobserve(img);
      }
    });
  });
  
  lazyImages.forEach(img => imageObserver.observe(img));
});
</script>

<!-- HTML markup -->
<img data-src="actual-image.jpg" 
     src="placeholder.jpg" 
     alt="Description"
     class="lazy" />
```

**Real-World Performance Impact:**

**E-commerce Category Page (60 products)**

**Without Lazy Loading:**
```
Initial Load:
- 60 images loaded immediately
- Total: 4.8 MB
- Load time: 6.2 seconds
- Time to Interactive: 7.1 seconds
- Bounce rate: 55%
```

**With Lazy Loading:**
```
Initial Load:
- 12 images loaded (visible products)
- Total: 960 KB
- Load time: 1.4 seconds
- Time to Interactive: 2.1 seconds
- Bounce rate: 28%
- 80% faster initial load
```

**Best Practices:**

✅ **DO Lazy Load:**
- Images below the fold
- Product gallery images (positions 4+)
- Blog article images (after first paragraph)
- Footer images
- Sidebar images
- User-generated content images

❌ **DON'T Lazy Load:**
- Hero/banner images (above fold)
- Logo
- First product images in listings
- Critical UI elements
- Small images (<10 KB)

**WordPress Implementation:**

```php
<!-- WordPress automatically lazy loads images (5.5+) -->
<!-- Disable for specific images: -->
<?php
add_filter('wp_lazy_loading_enabled', function($default, $tag_name) {
    if ('img' === $tag_name) {
        return false; // Disable for all images
    }
    return $default;
}, 10, 2);
?>

<!-- Or use plugins: -->
<!-- - a3 Lazy Load -->
<!-- - WP Rocket -->
<!-- - Lazy Load by WP Rocket -->
```

**Common Issues and Solutions:**

**Issue 1: Layout Shift (CLS)**
```html
<!-- Problem: No dimensions specified -->
<img src="image.jpg" loading="lazy" />

<!-- Solution: Always specify width/height -->
<img src="image.jpg" 
     loading="lazy" 
     width="800" 
     height="600" />
```

**Issue 2: Images Never Load**
```html
<!-- Problem: Too aggressive threshold -->
<script>
const observer = new IntersectionObserver(callback, {
  rootMargin: '0px' // Images load only when visible
});
</script>

<!-- Solution: Load images before they're visible -->
<script>
const observer = new IntersectionObserver(callback, {
  rootMargin: '200px' // Load 200px before entering viewport
});
</script>
```

---
