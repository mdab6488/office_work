# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.7 Image SEO

Image SEO is crucial for driving organic traffic from Google Images, improving page load speed, and enhancing user experience. Properly optimized images can account for 20-60% of a website's total traffic.


### Image Formats

**What It Is:**
Different file formats have different characteristics, compression capabilities, and use cases.

**Common Formats Compared:**

| Format | Type | Best For | Pros | Cons |
|--------|------|----------|------|------|
| **JPEG** | Lossy | Photos, complex images | Small file size, good quality | No transparency, lossy |
| **PNG** | Lossless | Logos, graphics, transparency | Transparency support, lossless | Larger file size |
| **WebP** | Both | All types | 25-35% smaller than JPEG, transparency | Limited old browser support |
| **SVG** | Vector | Icons, logos, illustrations | Infinitely scalable, tiny size | Not for photos |
| **AVIF** | Lossy/Lossless | All types | 50% smaller than JPEG | Very limited support |
| **GIF** | Lossless | Simple animations | Animation support | Limited colors (256), large |

**Real-Life Format Selection:**

**Scenario 1: E-commerce Product Photo**
```html
<!-- Traditional -->
<img src="product.jpg" alt="Blue cotton t-shirt" /> 
<!-- 85 KB -->

<!-- Modern (with fallback) -->
<picture>
  <source srcset="product.webp" type="image/webp">
  <img src="product.jpg" alt="Blue cotton t-shirt" />
</picture>
<!-- 52 KB (39% smaller) -->
```

**Scenario 2: Company Logo**
```html
<!-- Bad: Using JPEG -->
<img src="logo.jpg" alt="Company logo" />
<!-- 45 KB, no transparency, pixelated when scaled -->

<!-- Good: Using SVG -->
<img src="logo.svg" alt="Company logo" />
<!-- 3 KB, perfect at any size, transparent -->
```

**Scenario 3: Blog Featured Image**
```html
<!-- Old approach -->
<img src="article-hero.png" alt="Marketing strategies" />
<!-- 890 KB PNG -->

<!-- Optimized approach -->
<picture>
  <source srcset="article-hero.avif" type="image/avif">
  <source srcset="article-hero.webp" type="image/webp">
  <img src="article-hero.jpg" alt="Marketing strategies" />
</picture>
<!-- AVIF: 95 KB | WebP: 145 KB | JPEG: 220 KB -->
```

**WebP Implementation Example:**

```html
<picture>
  <!-- Modern browsers -->
  <source srcset="hero-image.webp" type="image/webp">
  
  <!-- Fallback for older browsers -->
  <img src="hero-image.jpg" alt="Sunset over mountains" />
</picture>
```

**Format Decision Tree:**

```
Is it a photo or complex image?
├─ YES → Use JPEG (or WebP with JPEG fallback)
└─ NO
   ├─ Does it need transparency?
   │  ├─ YES → Use PNG (or WebP with PNG fallback)
   │  └─ NO → Use JPEG
   └─ Is it a logo or icon?
      └─ YES → Use SVG (or PNG fallback)
```

**Real-World Performance Comparison:**

**Test Page: Product Gallery (20 images)**

| Format | Total Size | Load Time (4G) | Google PageSpeed Score |
|--------|------------|----------------|------------------------|
| JPEG only | 3.2 MB | 4.1s | 62/100 |
| PNG only | 8.7 MB | 9.8s | 31/100 |
| WebP with JPEG fallback | 1.9 MB | 2.3s | 89/100 |
| AVIF with fallbacks | 1.1 MB | 1.6s | 94/100 |

---
