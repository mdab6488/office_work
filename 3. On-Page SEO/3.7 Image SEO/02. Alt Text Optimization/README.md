# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.7 Image SEO

Image SEO is crucial for driving organic traffic from Google Images, improving page load speed, and enhancing user experience. Properly optimized images can account for 20-60% of a website's total traffic.


### Alt Text Optimization

**What It Is:**
Alternative text (alt text) is HTML code that describes an image. It appears when images fail to load and is read by screen readers for visually impaired users.

**Why It Matters:**
- Primary ranking signal for Google Images
- Critical for web accessibility (ADA compliance)
- Improves user experience when images don't load
- Provides context for image content

**HTML Structure:**
```html
<img src="image.jpg" alt="description of image" />
```

**Best Practices:**

✅ **GOOD Alt Text Examples:**

**E-commerce Product:**
```html
<img src="red-leather-sofa.jpg" 
     alt="Modern red leather three-seater sofa with chrome legs" />
```

**Blog Article Image:**
```html
<img src="yoga-pose.jpg" 
     alt="Woman performing downward dog yoga pose on purple mat in bright studio" />
```

**Infographic:**
```html
<img src="seo-statistics.jpg" 
     alt="Infographic showing 75% of users never scroll past first page of search results" />
```

❌ **BAD Alt Text Examples:**

```html
<!-- Too vague -->
<img src="product.jpg" alt="product" />

<!-- Keyword stuffing -->
<img src="shoes.jpg" alt="shoes buy shoes best shoes cheap shoes running shoes" />

<!-- Too long -->
<img src="office.jpg" alt="This is a photograph taken in our modern office space located in downtown Manhattan featuring our team members working collaboratively on various projects using state-of-the-art technology and equipment in a bright, naturally lit environment with large windows" />

<!-- No alt text -->
<img src="banner.jpg" alt="" />
```

**Real-Life Examples by Industry:**

**Real Estate Website:**
```html
<!-- Living Room -->
<img src="living-room-sunset.jpg" 
     alt="Spacious living room with hardwood floors and floor-to-ceiling windows overlooking city skyline" />

<!-- Kitchen -->
<img src="modern-kitchen.jpg" 
     alt="Gourmet kitchen with white marble countertops, stainless steel appliances, and island seating" />
```

**Medical Practice:**
```html
<!-- Doctor -->
<img src="dr-sarah-johnson.jpg" 
     alt="Dr. Sarah Johnson, board-certified dermatologist, smiling in white medical coat" />

<!-- Equipment -->
<img src="dental-chair.jpg" 
     alt="Modern dental examination chair with overhead LED light in clean treatment room" />
```

**Restaurant Website:**
```html
<!-- Dish -->
<img src="grilled-salmon.jpg" 
     alt="Grilled Atlantic salmon fillet with roasted vegetables and lemon herb sauce" />

<!-- Ambiance -->
<img src="restaurant-interior.jpg" 
     alt="Candlelit tables with white tablecloths in intimate Italian restaurant dining room" />
```

**Alt Text Formula:**
```
[Object/Subject] + [Key Details] + [Context/Setting]
```

**Special Cases:**

**Decorative Images (no SEO value):**
```html
<img src="decorative-line.png" alt="" />
<!-- Empty alt for purely decorative images -->
```

**Complex Images (charts, diagrams):**
```html
<img src="sales-chart-2024.jpg" 
     alt="Bar chart showing quarterly sales growth from Q1 to Q4 2024, increasing from $500K to $2.1M" 
     longdesc="detailed-description.html" />
```

---
