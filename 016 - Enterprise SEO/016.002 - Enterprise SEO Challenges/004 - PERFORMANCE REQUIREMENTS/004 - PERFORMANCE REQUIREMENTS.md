
### 3. PERFORMANCE REQUIREMENTS
**Requirement**: Meet Core Web Vitals thresholds

**Specifications**:
| Metric | Threshold | Measurement |
|--------|-----------|-------------|
| Largest Contentful Paint (LCP) | ≤ 2.5s | Time to render largest element |
| First Input Delay (FID) | ≤ 100ms | Time to interactive |
| Cumulative Layout Shift (CLS) | ≤ 0.1 | Visual stability score |
| Time to First Byte (TTFB) | ≤ 600ms | Server response time |
| Total Page Size | ≤ 3MB | Sum of all resources |

**Implementation Requirements**:
```javascript
// 1. Image Optimization (Required)
<img 
    src="{{ product.image_url }}"
    alt="{{ product.name }}"
    width="800"
    height="600"
    loading="lazy"  // Lazy loading for below-fold images
    decoding="async"
/>

// 2. Critical CSS Inlining (Required)
<style>
    /* Inline critical above-the-fold CSS */
    .product-header { /* styles */ }
    .product-image { /* styles */ }
</style>

// 3. JavaScript Optimization (Required)
<script src="/js/product.js" defer></script>  // Use defer for non-critical JS

// 4. Resource Hints (Required)
<link rel="preconnect" href="https://cdn.salesforce.com">
<link rel="dns-prefetch" href="https://www.google-analytics.com">

// 5. Caching Headers (Required)
Cache-Control: public, max-age=31536000, immutable  // For static assets
```

**Testing Protocol**:
```bash
# Performance testing commands
lighthouse https://www.salesforce.com/products/test --view
pagespeed https://www.salesforce.com/products/test
webpagetest https://www.salesforce.com/products/test --location=Dulles:Chrome --runs=3
```

**Acceptance Criteria**:
- [x] LCP ≤ 2.5s on 75th percentile
- [x] FID ≤ 100ms on 75th percentile
- [x] CLS ≤ 0.1 on 75th percentile
- [x] Lighthouse score ≥ 90
- [x] Mobile-friendly test passes
