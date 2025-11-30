
### 4. CRAWLABILITY REQUIREMENTS
**Requirement**: Ensure all pages are crawlable and indexable

**Specifications**:
```javascript
// 1. Robots Meta Tag (Required)
// Default: Allow indexing
<meta name="robots" content="index, follow">

// For filtering/sorting variations: Prevent indexing
<meta name="robots" content="noindex, follow">

// 2. Canonical Tags (Required)
// Self-referencing canonical on main product page
<link rel="canonical" href="https://www.salesforce.com/products/marketing-cloud/12345">

// Filtered/sorted pages point to main version
// Example: /products/marketing-cloud/12345?sort=price
<link rel="canonical" href="https://www.salesforce.com/products/marketing-cloud/12345">

// 3. XML Sitemap (Required)
// Include in /sitemap-products.xml
<url>
    <loc>https://www.salesforce.com/products/marketing-cloud/12345</loc>
    <lastmod>2025-11-11</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
</url>

// 4. Internal Linking (Required)
// Minimum 3 contextual internal links per page
// Use descriptive anchor text
<a href="/products/sales-cloud/67890">Learn more about Sales Cloud integration</a>
```

**Acceptance Criteria**:
- [x] All product pages in sitemap
- [x] Proper canonical implementation
- [x] No orphan pages (all have internal links)
- [x] Robots.txt allows crawling of product pages
- [x] No redirect chains (max 1 redirect)
