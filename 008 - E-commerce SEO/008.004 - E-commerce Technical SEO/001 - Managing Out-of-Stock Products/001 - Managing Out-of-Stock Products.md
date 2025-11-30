
### 8.4.1 Managing Out-of-Stock Products

How you handle out-of-stock products significantly impacts SEO. The wrong approach can result in lost rankings, poor user experience, and wasted crawl budget.

#### Strategic Approaches

**1. Temporarily Out of Stock (Will Restock)**

**Best Practice: Keep page live with status indicator**

```html
<!-- Product Page HTML -->
<div class="product-page">
  <h1>Nike Air Zoom Pegasus 40 - Men's Running Shoes</h1>
  
  <!-- Out of Stock Badge -->
  <div class="availability-notice">
    <span class="badge out-of-stock">Currently Unavailable</span>
    <p>Expected back in stock: November 15, 2025</p>
  </div>
  
  <!-- Email Notification Form -->
  <form class="notify-me">
    <input type="email" placeholder="Enter your email">
    <button type="submit">Notify Me When Available</button>
    <p class="form-note">We'll email you as soon as this item is back in stock</p>
  </form>
  
  <!-- Keep all product information visible -->
  <div class="product-details">
    <h2>Product Description</h2>
    <p>Experience responsive cushioning with the Nike Air Zoom Pegasus 40...</p>
    
    <h3>Features</h3>
    <ul>
      <li>React foam midsole for comfort</li>
      <li>Zoom Air units for responsiveness</li>
      <li>Engineered mesh upper for breathability</li>
    </ul>
  </div>
  
  <!-- Show related available products -->
  <section class="alternatives">
    <h3>Similar Available Products</h3>
    <div class="product-grid">
      <!-- Show 4-6 similar in-stock products -->
    </div>
  </section>
</div>
```

**Schema Markup:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Nike Air Zoom Pegasus 40",
  "image": "https://example.com/images/pegasus-40.jpg",
  "description": "Men's running shoes with responsive cushioning",
  "sku": "NRN-PEG40-MEN-10",
  "brand": {
    "@type": "Brand",
    "name": "Nike"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/products/nike-air-zoom-pegasus-40",
    "priceCurrency": "USD",
    "price": "139.99",
    "availability": "https://schema.org/OutOfStock",
    "priceValidUntil": "2025-12-31"
  }
}
</script>
```

**Why This Works:**
- ✅ Maintains rankings for established pages
- ✅ Preserves link equity
- ✅ Captures email leads
- ✅ Provides alternative options
- ✅ Clear to users and search engines

**2. Permanently Discontinued Products**

**Option A: 301 Redirect to Similar Product**

```nginx
# Nginx Configuration
location = /products/old-running-shoe-model {
    return 301 /products/new-running-shoe-model;
}
```

```apache
# Apache .htaccess
Redirect 301 /products/old-running-shoe-model /products/new-running-shoe-model
```

**When to Use:**
- Product has a direct replacement
- Similar price point and features
- Both target the same keywords

**Option B: 301 Redirect to Category**

```nginx
# Redirect discontinued product to relevant category
location = /products/discontinued-winter-jacket-2020 {
    return 301 /winter-jackets;
}
```

**When to Use:**
- No direct replacement exists
- Multiple alternatives available
- Category page is more relevant

**Option C: 410 Gone Status**

```nginx
# For truly discontinued with no alternative
location = /products/obsolete-product {
    return 410;
}
```

**When to Use:**
- Product is outdated (old technology)
- No suitable alternatives
- Want to remove from index quickly

⚠️ **Use sparingly:** 410 removes pages from index permanently

**3. Real-World Example: Zappos Strategy**

Zappos keeps out-of-stock products live because:

```html
<!-- Zappos Approach -->
<div class="product-status">
  <h1>Adidas Ultraboost 22</h1>
  <p class="out-of-stock-msg">This item is currently unavailable</p>
  
  <!-- Cross-sell opportunities -->
  <div class="alternatives">
    <h2>Customers Also Viewed</h2>
    <!-- Similar in-stock products -->
  </div>
  
  <!-- Historical value -->
  <div class="reviews">
    <h2>Customer Reviews (2,341)</h2>
    <!-- Reviews remain valuable for SEO -->
  </div>
</div>
```

**Benefits:**
- Maintains page authority (backlinks, reviews)
- Provides user alternatives
- Can restock without starting SEO from scratch
- Reviews continue providing value

**4. Implementation Checklist**

**Temporarily Out of Stock:**
- [ ] Keep HTTP 200 status code
- [ ] Update schema markup to "OutOfStock"
- [ ] Add clear availability messaging
- [ ] Include email notification option
- [ ] Show similar available products
- [ ] Keep all product content visible
- [ ] Update sitemap to include page

**Permanently Discontinued:**
- [ ] Choose redirect strategy (product/category/410)
- [ ] Implement 301 redirect
- [ ] Update internal links
- [ ] Remove from XML sitemap
- [ ] Update product feeds (Google Shopping, etc.)
- [ ] Monitor 404 errors in Search Console

---
