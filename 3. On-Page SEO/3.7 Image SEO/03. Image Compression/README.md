# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.7 Image SEO

Image SEO is crucial for driving organic traffic from Google Images, improving page load speed, and enhancing user experience. Properly optimized images can account for 20-60% of a website's total traffic.


### Image Compression

**What It Is:**
Reducing image file size without significantly degrading visual quality.

**Why It Matters:**
- Page speed is a ranking factor
- 53% of mobile users abandon sites that take over 3 seconds to load
- Smaller images = faster load times = better user experience
- Reduces bandwidth costs

**Compression Types:**

**1. Lossy Compression** (Permanent quality reduction)
- Reduces file size significantly (70-90%)
- Slight quality loss (usually imperceptible)
- Best for: Photographs, complex images
- Cannot be reversed

**2. Lossless Compression** (No quality loss)
- Reduces file size moderately (10-30%)
- Perfect quality preservation
- Best for: Logos, icons, graphics with text
- Can be optimized further

**Real-Life Example:**

**Original Image:**
```
hero-banner.jpg
- Dimensions: 1920x1080px
- File Size: 2.4 MB
- Load Time: 4.8 seconds (3G connection)
```

**After Optimization:**
```
hero-banner-optimized.jpg
- Dimensions: 1920x1080px
- File Size: 180 KB
- Load Time: 0.4 seconds (3G connection)
- 92.5% size reduction
```

**Tools for Compression:**

**Online Tools:**
- TinyPNG/TinyJPG (lossy) - https://tinypng.com
- Squoosh (lossy/lossless) - https://squoosh.app
- ImageOptim (Mac only)
- Compressor.io

**Command Line Tools:**
```bash
# ImageMagick (lossy JPEG)
convert input.jpg -quality 85 output.jpg

# OptiPNG (lossless PNG)
optipng -o7 image.png

# JPEGoptim
jpegoptim --max=85 image.jpg
```

**WordPress Plugins:**
- Smush
- ShortPixel
- Imagify
- EWWW Image Optimizer

**Recommended Quality Settings:**

| Image Type | Format | Quality | Use Case |
|------------|--------|---------|----------|
| Hero Images | JPEG | 80-85% | Full-width banners |
| Product Photos | JPEG | 85-90% | E-commerce |
| Blog Images | JPEG | 75-85% | Article content |
| Logos | PNG/SVG | Lossless | Brand assets |
| Icons | SVG/PNG | Lossless | UI elements |
| Screenshots | PNG | 85-95% | Documentation |

**Real-World Case Study:**

**Before Optimization:**
```
E-commerce Product Page:
- 15 product images
- Total size: 12 MB
- Page load time: 8.2 seconds
- Bounce rate: 68%
```

**After Optimization:**
```
E-commerce Product Page:
- 15 product images (compressed)
- Total size: 1.1 MB
- Page load time: 2.1 seconds
- Bounce rate: 34%
- Conversion rate increased by 42%
```

---
