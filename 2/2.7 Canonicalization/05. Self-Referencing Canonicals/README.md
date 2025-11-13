# Complete Guide to Canonicalization and Redirects

---

## 2.7 Canonicalization


### Self-Referencing Canonicals

#### Definition
A canonical tag that points to itself (the current page).

#### Why Use Self-Referencing Canonicals?

**Example 1: Prevent Parameter Pollution**

```html
<!-- On https://shop.com/products -->
<link rel="canonical" href="https://shop.com/products" />
```

Even if someone links to:
- `https://shop.com/products?random=123`
- `https://shop.com/products#section`
- `https://shop.com/products?fbclid=xyz`

Google knows the canonical version is the clean URL.

**Example 2: Pagination Protection**

**Scenario:** A blog with paginated archives

```
Page 1: https://blog.com/category/seo
Page 2: https://blog.com/category/seo?page=2
Page 3: https://blog.com/category/seo?page=3
```

**Implementation:**
```html
<!-- On page 1 -->
<link rel="canonical" href="https://blog.com/category/seo" />
<link rel="next" href="https://blog.com/category/seo?page=2" />

<!-- On page 2 -->
<link rel="canonical" href="https://blog.com/category/seo?page=2" />
<link rel="prev" href="https://blog.com/category/seo" />
<link rel="next" href="https://blog.com/category/seo?page=3" />

<!-- On page 3 -->
<link rel="canonical" href="https://blog.com/category/seo?page=3" />
<link rel="prev" href="https://blog.com/category/seo?page=2" />
```

**Alternative Approach:** Canonical all pages to page 1
```html
<!-- On all paginated pages -->
<link rel="canonical" href="https://blog.com/category/seo" />
```

**Best Practice for E-commerce:**
- Small catalogs (< 20 products): Canonical to page 1
- Large catalogs (100+ products): Self-referencing canonicals + rel next/prev

#### Real-Life Implementation Example

**WordPress Blog Setup:**

```php
// Add to functions.php
function add_self_referencing_canonical() {
    if (is_singular()) {
        echo '<link rel="canonical" href="' . get_permalink() . '" />' . "\n";
    }
}
add_action('wp_head', 'add_self_referencing_canonical', 1);
```

**Shopify Store Setup:**

```liquid
<!-- In theme.liquid -->
{% if canonical_url != blank %}
  <link rel="canonical" href="{{ canonical_url }}">
{% endif %}
```

---
