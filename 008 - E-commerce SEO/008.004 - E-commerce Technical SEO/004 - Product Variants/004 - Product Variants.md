
### 8.4.4 Product Variants

Product variants (size, color, material) create complex SEO challenges. Should each variant have its own URL? How do you avoid duplicate content?

#### Strategy 1: Single URL with Variants (Recommended)

**Best for:** Products where variants don't significantly change the product (colors, sizes)

**Implementation:**

```html
<!-- URL: /nike-air-max-90 (single URL for all variants) -->

<div class="product-page">
  <h1>Nike Air Max 90 - Men's Shoes</h1>
  
  <!-- Color Selector -->
  <div class="variant-selector">
    <h3>Select Color</h3>
    <div class="color-swatches">
      <button class="swatch active" data-color="white" aria-label="White">
        <img src="/white-swatch.jpg" alt="White">
      </button>
      <button class="swatch" data-color="black" aria-label="Black">
        <img src="/black-swatch.jpg" alt="Black">
      </button>
      <button class="swatch" data-color="red" aria-label="Red">
        <img src="/red-swatch.jpg" alt="Red">
      </button>
    </div>
  </div>
  
  <!-- Size Selector -->
  <div class="variant-selector">
    <h3>Select Size</h3>
    <div class="size-options">
      <button class="size" data-size="8">8</button>
      <button class="size" data-size="9">9</button>
      <button class="size" data-size="10">10</button>
      <button class="size out-of-stock" data-size="11" disabled>
        11 <span class="oos-label">(Out of Stock)</span>
      </button>
    </div>
  </div>
</div>
```

**JavaScript for URL Updates:**

```javascript
// Update URL parameters without page reload
document.querySelectorAll('.swatch').forEach(swatch => {
  swatch.addEventListener('click', function() {
    const color = this.dataset.color;
    
    // Update URL
    const url = new URL(window.location);
    url.searchParams.set('color', color);
    history.pushState({}, '', url);
    
    // Update images
    updateProductImages(color);
    
    // Update availability
    updateSizeAvailability(color);
  });
});

document.querySelectorAll('.size').forEach(button => {
  button.addEventListener('click', function() {
    const size = this.dataset.size;
    
    const url = new URL(window.location);
    url.searchParams.set('size', size);
    history.pushState({}, '', url);
  });
});
```

**Canonical Tag:**

```html
<head>
  <!-- All variants point to base URL -->
  <link rel="canonical" href="https://example.com/nike-air-max-90">
  
  <!-- Even when URL has parameters -->
  <!-- https://example.com/nike-air-max-90?color=red&size=10 -->
  <!-- Still canonicalizes to base URL -->
</head>
```

**Schema Markup for Variants:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Nike Air Max 90",
  "image": [
    "https://example.com/images/air-max-white.jpg",
    "https://example.com/images/air-max-black.jpg",
    "https://example.com/images/air-max-red.jpg"
  ],
  "description": "Classic Nike Air Max 90 sneakers",
  "sku": "AM90-BASE",
  "brand": {
    "@type": "Brand",
    "name": "Nike"
  },
  "offers": {
    "@type": "AggregateOffer",
    "priceCurrency": "USD",
    "lowPrice": "129.99",
    "highPrice": "129.99",
    "offerCount": "12",
    "offers": [
      {
        "@type": "Offer",
        "sku": "AM90-WHITE-8",
        "price": "129.99",
        "availability": "https://schema.org/InStock",
        "itemCondition": "https://schema.org/NewCondition",
        "color": "White",
        "size": "8"
      },
      {
        "@type": "Offer",
        "sku": "AM90-BLACK-9",
        "price": "129.99",
        "availability": "https://schema.org/InStock",
        "color": "Black",
        "size": "9"
      }
    ]
  }
}
</script>
```

**Pros:**
- ✅ Single page to rank and optimize
- ✅ All link equity goes to one URL
- ✅ Simpler internal linking
- ✅ No duplicate content issues
- ✅ Easier to manage

**Cons:**
- ❌ Can't rank for color-specific searches ("red nike shoes")
- ❌ Limited targeting for long-tail keywords
- ❌ All variants share same meta description

**Best For:**
- Apparel (sizes, basic colors)
- Shoes (sizes, standard colors)
- Simple variations that don't change function

---

#### Strategy 2: Separate URLs with Canonicals

**Best for:** Significantly different variants (materials, models, versions)

**Implementation:**

```html
<!-- Parent Product: /nike-air-max-90 -->
<link rel="canonical" href="https://example.com/nike-air-max-90">

<!-- Variant 1: /nike-air-max-90-white -->
<link rel="canonical" href="https://example.com/nike-air-max-90">

<!-- Variant 2: /nike-air-max-90-black -->
<link rel="canonical" href="https://example.com/nike-air-max-90">
```

**When Variants ARE Substantially Different:**

```html
<!-- iPhone 15 Pro (128GB) -->
<link rel="canonical" href="https://example.com/iphone-15-pro-128gb">
<title>iPhone 15 Pro 128GB | $999 | Apple</title>

<!-- iPhone 15 Pro (256GB) - Different price point, different audience -->
<link rel="canonical" href="https://example.com/iphone-15-pro-256gb">
<title>iPhone 15 Pro 256GB | $1,199 | Apple</title>

<!-- These should NOT canonicalize to each other -->
<!-- They're substantially different offers -->
```

**Real-World Example: Best Buy - iPhones**

Best Buy creates separate URLs for storage variants because:
- Significant price differences ($999 vs $1,199 vs $1,399)
- Different target audiences (casual users vs power users)
- Separate buying intent ("iPhone 128GB" vs "iPhone 1TB")
- Each URL can rank for specific searches

URLs:
```
/iphone-15-pro-128gb-natural-titanium/
/iphone-15-pro-256gb-natural-titanium/
/iphone-15-pro-512gb-natural-titanium/
```

**But colors point to main product:**
```
<!-- All colors canonical to main storage variant -->
/iphone-15-pro-128gb-natural-titanium/ (canonical)
/iphone-15-pro-128gb-blue-titanium/ → canonicalizes to natural-titanium
/iphone-15-pro-128gb-black-titanium/ → canonicalizes to natural-titanium
```

---

#### Strategy 3: Separate URLs for All Variants (Avoid)

**❌ Not Recommended** except in rare cases

```html
<!-- This creates massive duplicate content -->
/nike-air-max-90-white-size-8
/nike-air-max-90-white-size-9
/nike-air-max-90-white-size-10
/nike-air-max-90-black-size-8
/nike-air-max-90-black-size-9
<!-- You end up with 100+ nearly identical pages -->
```

**Problems:**
- Dilutes link equity across many pages
- Creates crawl budget waste
- Duplicate content issues
- Complex canonicalization
- Nightmare to manage

**Only acceptable if:**
- Each variant has completely unique content
- Significant price/feature differences
- Strong search volume for specific variants
- You have resources to maintain all pages

---

#### URL Parameter Handling

**Google Search Console Settings:**

```
URL Parameter: color
Effect: Changes content
Crawl: Let Googlebot decide

URL Parameter: size  
Effect: Changes content
Crawl: Let Googlebot decide

URL Parameter: sort
Effect: Reorders content
Crawl: No - don't crawl

URL Parameter: utm_source
Effect: Tracking only
Crawl: No - don't crawl
```

**Robots Meta Tags for Filtered URLs:**

```html
<!-- Base category: /running-shoes -->
<meta name="robots" content="index, follow">

<!-- Filtered URL: /running-shoes?color=red&size=10 -->
<meta name="robots" content="noindex, follow">
<link rel="canonical" href="https://example.com/running-shoes">
```

---
