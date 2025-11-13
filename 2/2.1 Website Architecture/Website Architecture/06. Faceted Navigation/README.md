## 2.1 Website Architecture

---

### Faceted Navigation

Faceted navigation allows users to filter products by multiple attributes. Common in e-commerce sites.

#### What is Faceted Navigation?

Filter products by multiple criteria simultaneously:

```
Category: Shoes
  ├─ Type: Running Shoes       [✓]
  ├─ Brand: Nike                [✓]
  ├─ Size: 10                   [✓]
  ├─ Color: Blue                [✓]
  ├─ Price: $50-$100           [✓]
  └─ Gender: Men's              [✓]

Result: Men's Blue Nike Running Shoes Size 10 ($50-$100)
```

#### SEO Challenges

**Problem: Millions of URL Combinations**

Example with 5 filters:
- 20 categories
- 10 brands  
- 15 sizes
- 10 colors
- 5 price ranges

**Total possible combinations:** 20 × 10 × 15 × 10 × 5 = **150,000 URLs**

**Issues:**
- ❌ Crawl budget waste (Google crawls useless combinations)
- ❌ Duplicate content
- ❌ Thin content pages
- ❌ Diluted PageRank

**Example URLs Generated:**
```
/shoes/?brand=nike&size=10&color=blue&price=50-100
/shoes/?color=blue&brand=nike&size=10&price=50-100  (duplicate!)
/shoes/?size=10  (only 2 results - thin content)
/shoes/?brand=obscureband&size=15  (0 results!)
```

#### Solutions and Best Practices

**1. Robots.txt + Meta Robots**

Block less important filter combinations:

```
# robots.txt
User-agent: *
# Block URL parameter combinations
Disallow: /*?*&*&  # Three or more filters
Disallow: /*?price=  # Price filter alone
Disallow: /*?sort=   # Sorting parameters
```

**Meta Robots on filtered pages:**
```html
<!-- On filtered pages with few products -->
<head>
  <?php if ($productCount < 5): ?>
    <meta name="robots" content="noindex, follow">
  <?php endif; ?>
</head>
```

**2. Canonical URLs**

Point filtered pages to main category:

```html
<!-- URL: /shoes/?brand=nike&color=blue&size=10 -->
<head>
  <link rel="canonical" href="https://example.com/shoes/">
</head>
```

**3. URL Parameter Handling in Google Search Console**

Configure how Google treats parameters:

```
Configuration in GSC:
Parameter: color
  Let Googlebot decide ✓
  
Parameter: sort
  Purpose: Sorts
  Crawl: No URLs

Parameter: sessionid  
  Purpose: Tracks users
  Crawl: No URLs
```

**4. Strategic Indexing**

Only index valuable filter combinations:

```
✅ Allow indexing:
/mens-running-shoes/
/mens-running-shoes/nike/
/womens-boots/
/womens-boots/leather/

❌ Block indexing:
/shoes/?color=blue  (too broad)
/shoes/?price=50-100  (not specific enough)
/shoes/?brand=nike&color=blue&size=10&width=wide  (too specific, low search volume)
```

#### Real Implementation Example

**PHP E-commerce Filter System:**

```php
<?php
// Determine if page should be indexed
function shouldIndexFilteredPage($filters, $productCount) {
    
    // Don't index if too few products
    if ($productCount < 10) {
        return false;
    }
    
    // Don't index pages with more than 2 filters
    if (count($filters) > 2) {
        return false;
    }
    
    // Don't index certain filter types alone
    $nonIndexable = ['price', 'sort', 'rating'];
    foreach ($filters as $filter => $value) {
        if (in_array($filter, $nonIndexable) && count($filters) == 1) {
            return false;
        }
    }
    
    // Index strategic combinations
    $strategicCombos = [
        ['category', 'brand'],
        ['category', 'subcategory'],
        ['gender', 'category']
    ];
    
    $filterKeys = array_keys($filters);
    sort($filterKeys);
    
    foreach ($strategicCombos as $combo) {
        sort($combo);
        if ($filterKeys == $combo) {
            return true;
        }
    }
    
    return false;
}

// Generate canonical URL
function getCanonicalUrl($filters) {
    // Always point to main category unless strategic combo
    if (shouldIndexFilteredPage($filters, getProductCount())) {
        return getCurrentUrl();
    }
    return getBaseCategory();
}

// In HTML head
$shouldIndex = shouldIndexFilteredPage($_GET, $productCount);
?>

<head>
  <?php if (!$shouldIndex): ?>
    <meta name="robots" content="noindex, follow">
  <?php endif; ?>
  
  <link rel="canonical" href="<?php echo getCanonicalUrl($_GET); ?>">
  
  <title>
    <?php echo generateTitle($category, $filters, $productCount); ?>
  </title>
</head>
```

**JavaScript Filter Implementation (SEO-Friendly):**

```html
<!-- Progressive Enhancement: Works without JS -->
<form action="/shoes/" method="get" id="filter-form">
  
  <fieldset>
    <legend>Brand</legend>
    <label><input type="checkbox" name="brand[]" value="nike"> Nike</label>
    <label><input type="checkbox" name="brand[]" value="adidas"> Adidas</label>
  </fieldset>
  
  <fieldset>
    <legend>Size</legend>
    <label><input type="checkbox" name="size[]" value="9"> 9</label>
    <label><input type="checkbox" name="size[]" value="10"> 10</label>
  </fieldset>
  
  <button type="submit">Apply Filters</button>
</form>

<script>
// Enhance with AJAX for better UX
document.getElementById('filter-form').addEventListener('submit', function(e) {
  e.preventDefault();
  
  const formData = new FormData(this);
  const params = new URLSearchParams(formData);
  
  // Update URL without page reload
  history.pushState(null, '', '?' + params.toString());
  
  // Fetch filtered products
  fetch('/api/products?' + params.toString())
    .then(response => response.json())
    .then(data => {
      updateProductGrid(data.products);
    });
});
</script>
```

#### Real-Life Case Study: Large E-commerce Site

**Company:** Electronics Retailer (50,000+ products)

**Problem:**
- Faceted navigation created 2 million indexed URLs
- 95% were duplicate or thin content
- Google crawling useless pages
- Important pages not getting crawled
- Crawl budget wasted

**Faceted Navigation Parameters:**
```
Category: 15 options
Brand: 200+ options
Price: 10 ranges
Rating: 5 options
Features: 30+ options (Screen size, RAM, Storage, etc.)

= Millions of combinations
```

**Solution Implemented:**

**Step 1: Audit Existing URLs**
```
Found in Google index:
- 2,000,000 total URLs
- 1,850,000 had < 3 products (thin content)
- 150,000 were duplicates (same products, different parameter order)
- Only 50,000 should be indexed
```

**Step 2: Create Indexing Rules**
```php
// Only index these combinations:
✅ /category/
✅ /category/brand/
✅ /category/subcategory/
✅ /brand/product-type/

// Block everything else:
❌ /category/?price=100-200
❌ /category/?brand=x&features=y&price=z
❌ /category/?sort=price
```

**Step 3: Implementation**
```html
<!-- Most filtered pages got this: -->
<meta name="robots" content="noindex, follow">
<link rel="canonical" href="/category/">

<!-- robots.txt -->
User-agent: *
Disallow: /*?*&*  # Multiple parameters
Disallow: /*?sort=
Disallow: /*?price=
Disallow: /*?rating=
```

**Step 4: Google Search Console Parameter Handling**
```
Configured 20+ parameters:
- sessionid: Ignore
- sort: Ignore  
- price: Ignore
- rating: Ignore
- ref: Ignore
```

**Results After 6 Months:**

- ✅ Indexed pages reduced: 2M → 75K (cleaned up junk)
- ✅ Crawl efficiency improved 85%
- ✅ Important pages crawled daily instead of weekly
- ✅ Organic traffic: +47%
- ✅ Rankings improved for main category pages
- ✅ New products indexed within 24 hours (vs 2 weeks before)
- ✅ PageSpeed improved (less crawl activity)
- ✅ Conversion rate: +12% (better landing pages ranking)

---
