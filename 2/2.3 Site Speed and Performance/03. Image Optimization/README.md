
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.


### Image Optimization

Images typically account for 50-70% of page weight.

#### WebP Format

**Real-Life Comparison:**
```
Original JPEG: product.jpg (450 KB)
Optimized WebP: product.webp (85 KB) - 81% smaller
Quality: Visually identical

Annual Savings (1M pageviews):
Bandwidth: 365 GB saved
Cost: $2,190 saved (at $0.12/GB CDN cost)
Load Time: 1.2s faster average
```

**Implementation:**
```html
<!-- Best Practice: Progressive Enhancement -->
<picture>
  <source type="image/avif" srcset="hero.avif">
  <source type="image/webp" srcset="hero.webp">
  <img src="hero.jpg" alt="Hero Image" width="1200" height="600">
</picture>
```

#### AVIF Format

**Even Better Compression:**
```
Original JPEG: 450 KB
WebP: 85 KB (81% smaller)
AVIF: 45 KB (90% smaller) - 47% smaller than WebP!
```

**Browser Support Consideration:**
```html
<picture>
  <!-- Newest format first -->
  <source type="image/avif" srcset="image.avif">
  <source type="image/webp" srcset="image.webp">
  <!-- Fallback -->
  <img src="image.jpg" alt="Description" loading="lazy" width="800" height="600">
</picture>
```

#### Lazy Loading

**Real-Life Example: Pinterest**
```
Before Lazy Loading:
- Initial page load: 156 images
- Page size: 24 MB
- Load time: 11.3s

After Lazy Loading:
- Initial page load: 12 images (above fold)
- Initial page size: 2.1 MB
- Load time: 1.8s
- Images load as user scrolls

Results:
- 84% reduction in initial load time
- 91% reduction in initial bandwidth
- 58% increase in user engagement
```

**Implementation:**
```html
<!-- Native Lazy Loading -->
<img src="product.webp" 
     alt="Product" 
     loading="lazy" 
     width="400" 
     height="400">

<!-- Lazy Loading with Intersection Observer -->
<img data-src="product.webp" 
     src="placeholder.jpg" 
     alt="Product" 
     class="lazy" 
     width="400" 
     height="400">

<script>
document.addEventListener("DOMContentLoaded", function() {
  const lazyImages = document.querySelectorAll("img.lazy");
  
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.remove("lazy");
        observer.unobserve(img);
      }
    });
  });
  
  lazyImages.forEach(img => imageObserver.observe(img));
});
</script>
```

#### Responsive Images

**Real-Life Example:**
```html
<!-- Serve appropriate image sizes for different devices -->
<img srcset="small.webp 400w,
             medium.webp 800w,
             large.webp 1200w,
             xlarge.webp 1600w"
     sizes="(max-width: 400px) 100vw,
            (max-width: 800px) 80vw,
            (max-width: 1200px) 60vw,
            1200px"
     src="medium.webp"
     alt="Responsive Product Image"
     width="800"
     height="600"
     loading="lazy">
```

**Bandwidth Savings:**
```
Mobile User (iPhone 13):
Without srcset: Downloads 1600w image (850 KB)
With srcset: Downloads 400w image (120 KB)
Savings: 730 KB (86% reduction)

Tablet User (iPad):
Without srcset: Downloads 1600w image (850 KB)
With srcset: Downloads 800w image (280 KB)
Savings: 570 KB (67% reduction)
```

---