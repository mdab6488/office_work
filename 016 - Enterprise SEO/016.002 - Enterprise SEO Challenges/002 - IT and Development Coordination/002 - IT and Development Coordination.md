
### IT and Development Coordination

#### 1. SEO Requirements Documentation

**Real-World Example: Salesforce Development Specs**

```markdown
# SEO TECHNICAL REQUIREMENT DOCUMENT
Project: New Product Page Template
Date: November 11, 2025
SEO Owner: [Name]
Dev Owner: [Name]

## OVERVIEW
**Objective**: Create SEO-optimized template for 10,000+ product pages
**Business Impact**: Estimated 35% increase in organic product page traffic
**Priority**: P1 (High Priority)
**Target Launch**: Q1 2026

## SEO REQUIREMENTS

### 1. URL STRUCTURE
**Requirement**: Implement clean, SEO-friendly URL pattern

**Specification**:
```
✅ CORRECT: /products/{category}/{product-name}/{product-id}
Example: /products/software/marketing-cloud/12345

❌ INCORRECT: /products?id=12345&cat=software
❌ INCORRECT: /products/product.php?id=12345
```

**Technical Implementation**:
```javascript
// URL routing configuration
app.get('/products/:category/:productSlug/:productId', (req, res) => {
  const { category, productSlug, productId } = req.params;
  
  // Validate slug matches actual product name
  const product = getProduct(productId);
  const expectedSlug = generateSlug(product.name);
  
  // 301 redirect if slug doesn't match
  if (productSlug !== expectedSlug) {
    return res.redirect(301, `/products/${category}/${expectedSlug}/${productId}`);
  }
  
  // Render product page
  res.render('product', { product });
});
```

**Acceptance Criteria**:
- [x] URLs follow specified pattern
- [x] Automatic 301 redirects for mismatched slugs
- [x] Category slugs validated against taxonomy
- [x] URL length ≤ 100 characters
