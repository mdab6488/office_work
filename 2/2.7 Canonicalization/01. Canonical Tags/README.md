# Complete Guide to Canonicalization and Redirects

---

## 2.7 Canonicalization


## 2.7 Canonicalization

### What is Canonicalization?

Canonicalization is the process of selecting the **preferred URL** when multiple URLs have identical or very similar content. It tells search engines which version of a URL should be indexed and ranked.

---

### Canonical Tags

#### Definition
A canonical tag is an HTML element that specifies the preferred version of a web page to search engines.

#### Syntax
```html
<link rel="canonical" href="https://www.example.com/preferred-url/" />
```

#### Real-Life Examples

**Example 1: E-commerce Product Pages**

Problem: A shoe store has the same product accessible via multiple URLs:
- `https://www.shoeshop.com/nike-air-max-90`
- `https://www.shoeshop.com/nike-air-max-90?color=red`
- `https://www.shoeshop.com/nike-air-max-90?size=10`
- `https://www.shoeshop.com/nike-air-max-90?color=red&size=10`

Solution: Add canonical tag to all variants pointing to the main product page:
```html
<link rel="canonical" href="https://www.shoeshop.com/nike-air-max-90" />
```

**Example 2: Blog Post with Print Version**

URLs:
- Main article: `https://blog.example.com/seo-guide`
- Print version: `https://blog.example.com/seo-guide?print=true`
- AMP version: `https://blog.example.com/seo-guide/amp`

Solution: All versions should canonicalize to the main article:
```html
<link rel="canonical" href="https://blog.example.com/seo-guide" />
```

**Example 3: Session IDs in URLs**

Problem: A booking website generates session IDs:
- `https://hotel.com/rooms?sessionid=abc123`
- `https://hotel.com/rooms?sessionid=xyz789`

Solution: Point to clean URL:
```html
<link rel="canonical" href="https://hotel.com/rooms" />
```

#### Best Practices
✅ Place canonical tags in the `<head>` section
✅ Use absolute URLs (include https://)
✅ Ensure the canonical URL is accessible (returns 200 status)
✅ Use one canonical tag per page
❌ Don't chain canonical tags (A→B→C)
❌ Don't use relative URLs in canonical tags
