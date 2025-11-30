
### 2. HTML STRUCTURE
**Requirement**: Implement semantic HTML with proper heading hierarchy

**Specification**:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- REQUIRED META TAGS -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- DYNAMIC TITLE (Required) -->
    <!-- Pattern: {Product Name} | {Category} | Salesforce -->
    <!-- Max Length: 60 characters -->
    <title>{{ product.name }} | {{ product.category }} | Salesforce</title>
    
    <!-- DYNAMIC META DESCRIPTION (Required) -->
    <!-- Pattern: Description of product with key features -->
    <!-- Max Length: 160 characters -->
    <meta name="description" content="{{ product.seo_description }}">
    
    <!-- CANONICAL TAG (Required) -->
    <link rel="canonical" href="{{ product.canonical_url }}">
    
    <!-- OPEN GRAPH TAGS (Required) -->
    <meta property="og:title" content="{{ product.name }}">
    <meta property="og:description" content="{{ product.seo_description }}">
    <meta property="og:image" content="{{ product.image_url }}">
    <meta property="og:url" content="{{ product.canonical_url }}">
    <meta property="og:type" content="product">
    
    <!-- STRUCTURED DATA (Required) -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": "{{ product.name }}",
        "description": "{{ product.description }}",
        "image": "{{ product.image_url }}",
        "brand": {
            "@type": "Brand",
            "name": "Salesforce"
        },
        "offers": {
            "@type": "Offer",
            "url": "{{ product.canonical_url }}",
            "priceCurrency": "USD",
            "price": "{{ product.price }}",
            "availability": "https://schema.org/InStock"
        }
    }
    </script>
</head>
<body>
    <!-- HEADING HIERARCHY (Required) -->
    <h1>{{ product.name }}</h1>  <!-- Only ONE H1 per page -->
    
    <div class="product-overview">
        <h2>Overview</h2>  <!-- H2 for major sections -->
        <p>{{ product.overview }}</p>
    </div>
    
    <div class="product-features">
        <h2>Key Features</h2>
        <ul>
            {% for feature in product.features %}
            <li>
                <h3>{{ feature.name }}</h3>  <!-- H3 for subsections -->
                <p>{{ feature.description }}</p>
            </li>
            {% endfor %}
        </ul>
    </div>
    
    <div class="product-specs">
        <h2>Technical Specifications</h2>
        <h3>System Requirements</h3>
        <!-- Content -->
        
        <h3>Integration Options</h3>
        <!-- Content -->
    </div>
</body>
</html>
```

**Acceptance Criteria**:
- [x] Single H1 per page
- [x] Logical heading hierarchy (H1 → H2 → H3)
- [x] No skipped heading levels
- [x] All required meta tags present
- [x] Valid schema markup
- [x] Passes W3C validation
