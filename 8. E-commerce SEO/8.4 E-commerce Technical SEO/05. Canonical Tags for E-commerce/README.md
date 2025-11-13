
### 8.4.5 Canonical Tags for E-commerce

Canonical tags prevent duplicate content issues by telling search engines which URL is the "master" version when you have similar or identical content on multiple URLs.

#### Common E-commerce Canonical Scenarios

**1. Tracking Parameters**

```html
<!-- All these URLs show the same product -->
/product-123
/product-123?utm_source=facebook&utm_campaign=summer
/product-123?ref=email
/product-123?source=twitter

<!-- Solution: Canonical to base URL -->
<link rel="canonical" href="https://example.com/product-123">
```

**2. Session IDs**

```html
<!-- Different users see different session IDs -->
/category?sessionid=abc123
/category?sessionid=xyz789
/category?PHPSESSID=12345

<!-- Solution: Self-referencing canonical (clean URL) -->
<link rel="canonical" href="https://example.com/category">
```

**3. Sort and Filter Parameters**

```html
<!-- Same products, different order/filter -->
/shoes
/shoes?sort=price-low-high
/shoes?filter=size:10
/shoes?color=red&size=10&sort=popular

<!-- Canonical to base category -->
<link rel="canonical" href="https://example.com/shoes">
```

**4. WWW vs Non-WWW**

```html
<!-- Choose ONE version -->
http://www.example.com/product
http://example.com/product
https://www.example.com/product
https://example.com/product

<!-- Preferred version (HTTPS, no WWW): -->
<link rel="canonical" href="https://example.com/product">

<!-- Also set up 301 redirects -->
```

**5. Mobile vs Desktop URLs (If Separate)**

```html
<!-- Desktop URL -->
https://example.com/products/shoe-123
<link rel="canonical" href="https://example.com/products/shoe-123">

<!-- Mobile URL (if separate - not recommended) -->
https://m.example.com/products/shoe-123
<link rel="canonical" href="https://example.com/products/shoe-123">
<link rel="alternate" media="only screen and (max-width: 640px)" 
      href="https://m.example.com/products/shoe-123">
```

⚠️ **Best Practice:** Use responsive design instead of separate mobile URLs

**6. Product Variants (Covered Earlier)**

```html
<!-- Main product -->
/nike-shoes
<link rel="canonical" href="https://example.com/nike-shoes">

<!-- Color variants -->
/nike-shoes?color=red
<link rel="canonical" href="https://example.com/nike-shoes">

/nike-shoes?color=blue
<link rel="canonical" href="https://example.com/nike-shoes">
```

---

#### Canonical Implementation Checklist

**✅ Do:**

```html
<!-- Use absolute URLs -->
<link rel="canonical" href="https://example.com/products/item">

<!-- Self-reference on the main page -->
<link rel="canonical" href="https://example.com/current-page">

<!-- Place in <head> section -->
<head>
  <link rel="canonical" href="https://example.com/page">
</head>

<!-- Use consistent canonicals across paginated series -->
<!-- Page 1 -->
<link rel="canonical" href="https://example.com/category?page=1">

<!-- Page 2 -->
<link rel="canonical" href="https://example.com/category?page=2">

<!-- Each page canonicalizes to itself -->
```

**❌ Don't:**

```html
<!-- Don't use relative URLs -->
<link rel="canonical" href="/products/item"> <!-- Bad -->

<!-- Don't canonical paginated pages to page 1 -->
<!-- Page 2: -->
<link rel="canonical" href="/category?page=1"> <!-- Bad -->
<!-- This prevents pages 2+ from being indexed -->

<!-- Don't chain canonicals -->
<!-- Page A → Page B → Page C -->
<!-- Always point directly to the final URL -->

<!-- Don't canonical to different products -->
<link rel="canonical" href="/different-product"> <!-- Bad -->

<!-- Don't use multiple canonicals -->
<link rel="canonical" href="/page-1">
<link rel="canonical" href="/page-2"> <!-- Ignored -->
```

---

#### Real-World Example: Shopify Automatic Canonicals

Shopify automatically handles many canonical scenarios:

```html
<!-- Product URL -->
https://store.com/products/red-shirt

<!-- Collection URL (duplicate product content) -->
https://store.com/collections/shirts/products/red-shirt
<link rel="canonical" href="https://store.com/products/red-shirt">

<!-- Variant URLs -->
https://store.com/products/red-shirt?variant=12345
<link rel="canonical" href="https://store.com/products/red-shirt">
```

**Why This Works:**
- Products can appear in multiple collections
- Canonical prevents duplicate content penalties
- All link equity flows to main product URL

---

#### Testing Canonicals

**1. Check Implementation:**
```bash
# View source or use curl
curl -s https://example.com/product | grep canonical
```

**2. Google Search Console:**
- Coverage Report → "Excluded"
- Look for "Duplicate, submitted URL not selected as canonical"
- Verify Google respects your canonicals

**3. Screaming Frog SEO Spider:**
- Crawl your site
- Check "Canonicals" tab
- Identify canonical chains or conflicts

---

#### Advanced: Canonical vs 301 Redirect Decision Tree

```
Question: Do users ever need to access this URL?
├─ NO → Use 301 Redirect
│   └─ Example: Old product URLs, moved pages
│
└─ YES → Use Canonical Tag
    └─ Example: Filtered/sorted results, tracking parameters
```

**When to use 301 Redirect:**
- Permanently moved content
- Discontinued products
- Site migration
- URL structure change

**When to use Canonical:**
- Parameters that create duplicate content
- Multiple URLs serving same content intentionally
- Product variants
- Filtering/sorting options

---
