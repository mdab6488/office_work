
### 🎚️ Filters and Faceted Navigation

Faceted navigation allows users to filter products by multiple attributes (brand, color, size, price, etc.). This creates powerful user experience but can cause serious SEO issues if not handled properly.

#### The Problem

When users apply filters, they create unique URLs:

```
shop.com/shoes
shop.com/shoes?brand=nike
shop.com/shoes?brand=nike&color=red
shop.com/shoes?brand=nike&color=red&size=10
shop.com/shoes?brand=nike&size=10&color=red  ← Duplicate of above!
```

This creates **millions of potential URLs** with duplicate or thin content, wasting crawl budget.

#### Real-Life Example: Wayfair

Wayfair handles millions of products with extensive filtering options.

**Filter Options:**
- Price range
- Brand (100+ brands)
- Material (wood, metal, fabric, etc.)
- Color (15+ colors)
- Style (modern, traditional, rustic, etc.)
- Dimensions
- Customer rating

**Potential URL Combinations:** 100s of millions!

#### SEO Solutions for Faceted Navigation

**1. Canonical Tags**

Use canonical tags to point filtered pages to the main category page:

```html
<!-- URL: shop.com/shoes?brand=nike&color=red -->
<link rel="canonical" href="https://shop.com/shoes">
```

**2. Robots Meta Tag**

Prevent indexing of filtered pages:

```html
<meta name="robots" content="noindex, follow">
```

**3. URL Parameter Handling in Google Search Console**

Tell Google which parameters to ignore:
- `sortby` → Doesn't change content (tell Google to ignore)
- `color` → Changes content (let Googlebot decide)
- `session_id` → Tracking parameter (tell Google to ignore)

**4. Strategic Indexation**

Index valuable filter combinations that users search for:

✅ **Index These (high search volume):**
```
shop.com/shoes/nike-running-shoes
shop.com/shoes/womens-red-heels
shop.com/shoes/mens-size-12-sneakers
```

❌ **Don't Index These (low value):**
```
shop.com/shoes?page=47
shop.com/shoes?sort=price-asc&view=grid
shop.com/shoes?color=burgundy&material=suede&size=7.5&width=narrow
```

#### Real-Life Example: Home Depot

**URL Strategy:**

**Main Category (indexed):**
```
homedepot.com/b/tools/power-tools/drills
```

**Popular Filter Combos (indexed as subcategories):**
```
homedepot.com/b/tools/power-tools/cordless-drills
homedepot.com/b/tools/power-tools/dewalt-drills
```

**Regular Filters (canonical to main category):**
```
homedepot.com/b/tools/drills?N=5yc1vZ1z0vZ1z115  
Canonical → homedepot.com/b/tools/power-tools/drills
```

#### Best Practices for Faceted Navigation

1. **Use AJAX for Filters** (doesn't create new URLs)
```javascript
// Filter updates content without changing URL
$('.filter-checkbox').on('change', function() {
    loadProducts(getFilters()); // AJAX call
    updateUrl(getFilters()); // Updates URL with pushState
});
```

2. **Implement View All Pages**
```
shop.com/shoes/view-all?brand=nike
→ Shows all Nike shoes without pagination
→ Can be indexed
```

3. **Smart Internal Linking**
Link to popular filter combinations from category pages:
```html
<div class="popular-filters">
  <h3>Popular Searches</h3>
  <a href="/shoes/nike-running-shoes">Nike Running Shoes</a>
  <a href="/shoes/womens-sandals">Women's Sandals</a>
  <a href="/shoes/mens-dress-shoes">Men's Dress Shoes</a>
</div>
```

---
