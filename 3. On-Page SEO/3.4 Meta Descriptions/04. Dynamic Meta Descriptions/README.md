
## Dynamic Meta Descriptions

### What Are Dynamic Meta Descriptions?

Dynamic meta descriptions are automatically generated based on:
- Database content
- User search query
- Page variables
- Templates with placeholders

**Use Cases:**
- E-commerce sites with thousands of products
- Real estate sites with property listings
- Job boards
- Directory sites
- News sites

---

### Template-Based Descriptions

Create templates with variables that auto-populate.

**Example: E-commerce Product Page Template**

**Template:**
```html
<meta name="description" content="Buy {product_name} at {store_name}. {key_features}. {price} with {shipping_info}. {rating} stars from {review_count} reviews. {cta}.">
```

**Generated Output:**
```html
<meta name="description" content="Buy Sony WH-1000XM5 Headphones at Audio Store. Active noise cancellation, 30-hour battery, premium sound. $399 with free 2-day shipping. 4.8 stars from 2,847 reviews. Order today.">
```

---

### Real-World Example: Amazon

Amazon uses dynamic descriptions that include:
- Product name
- Key features
- Price range
- Prime eligibility
- Rating

**Example Product:**
```html
<meta name="description" content="Apple AirPods Pro (2nd generation): Active Noise Cancellation, Adaptive Audio, Transparency mode, Personalized Spatial Audio with MageSafe Charging Case (USB‑C). Visit the Apple Store.">
```

This is auto-generated from their product database.

---

### Example: Real Estate Site

**Template:**
```php
<meta name="description" content="{bedrooms} bed, {bathrooms} bath {property_type} for {listing_type} in {city}, {state}. {square_feet} sq ft, {lot_size} lot. ${price}. {special_features}. View photos and schedule a showing.">
```

**Generated:**
```html
<meta name="description" content="4 bed, 3 bath single-family home for sale in Austin, TX. 2,400 sq ft, 0.25 acre lot. $585,000. Updated kitchen, hardwood floors, pool. View photos and schedule a showing.">
```

---

### Example: Job Board

**Template:**
```python
<meta name="description" content="{job_title} position at {company_name} in {location}. {employment_type}. {salary_range}. {top_requirements}. Apply now on {site_name}.">
```

**Generated:**
```html
<meta name="description" content="Senior Software Engineer position at Google in Mountain View, CA. Full-time. $150,000-$220,000. 5+ years experience, Python, distributed systems. Apply now on Indeed.">
```

---

### Programming Dynamic Descriptions

**Example: WordPress PHP**
```php
<?php
// For product pages
if (is_product()) {
    $product = wc_get_product(get_the_ID());
    $description = 'Buy ' . $product->get_name() . 
                   ' for $' . $product->get_price() . 
                   '. ' . wp_trim_words($product->get_short_description(), 20) . 
                   ' Free shipping on orders over $50.';
    echo '<meta name="description" content="' . esc_attr($description) . '">';
}
?>
```

**Example: JavaScript/Node.js**
```javascript
// For blog posts
const generateMetaDescription = (post) => {
  const excerpt = post.content.substring(0, 140);
  const readTime = Math.ceil(post.content.split(' ').length / 200);
  
  return `${excerpt}... Read this ${readTime}-minute article to learn more about ${post.topic}.`;
};

// Output
<meta name="description" content={generateMetaDescription(post)} />
```

**Example: Python/Django**
```python
# views.py
def product_detail(request, product_id):
    product = Product.objects.get(id=product_id)
    
    meta_description = f"Buy {product.name} for ${product.price}. " \
                       f"{product.short_description} " \
                       f"{product.rating} stars. Free shipping. Order today."
    
    return render(request, 'product.html', {
        'product': product,
        'meta_description': meta_description[:160]  # Limit to 160 chars
    })
```

---

### When Google Ignores Your Meta Description

Google may override your meta description if:

1. **It doesn't match the search query**
2. **It's too short or vague**
3. **It's keyword-stuffed**
4. **The page content better answers the query**

**Example:**

Your meta description:
```html
<meta name="description" content="Quality shoes for men and women at affordable prices.">
```

User searches: **"red running shoes size 10"**

Google might pull this from your page instead:
> "Our red Nike Air Zoom Pegasus running shoes in size 10 feature responsive cushioning and breathable mesh. Perfect for long-distance runners."

**Solution:** Write specific, keyword-rich descriptions that match likely search queries.

---

### Dynamic Description Best Practices

**✅ Do:**
- Include key variables (price, location, specs)
- Keep templates flexible but structured
- Include CTAs in templates
- Test generated outputs for readability
- Set character limits in code (155-160)
- Have fallback descriptions

**❌ Don't:**
- Auto-generate gibberish (test your logic!)
- Include pricing if it changes hourly
- Use too many variables (becomes unreadable)
- Forget to escape special characters
- Leave templates empty if data missing

---
