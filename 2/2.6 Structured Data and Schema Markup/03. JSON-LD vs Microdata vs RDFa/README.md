# Technical SEO: HTTPS Security & Structured Data Guide

## 2.6 Structured Data and Schema Markup

---


### JSON-LD vs Microdata vs RDFa

There are three main formats for implementing structured data. **Google recommends JSON-LD.**

**1. JSON-LD (Recommended)**

JavaScript Object Notation for Linked Data - standalone code block, easiest to implement and maintain.

**Advantages:**
- Doesn't clutter HTML
- Easy to generate dynamically
- Can be added anywhere in HTML
- Google's preferred format

```html
<!DOCTYPE html>
<html>
<head>
    <title>Best Pizza in Chicago - Tony's Pizza</title>
    <!-- JSON-LD in head -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Restaurant",
      "name": "Tony's Pizza",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "123 Main Street",
        "addressLocality": "Chicago",
        "addressRegion": "IL",
        "postalCode": "60601",
        "addressCountry": "US"
      },
      "telephone": "+1-312-555-1234",
      "servesCuisine": "Italian",
      "priceRange": "$$",
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "4.7",
        "reviewCount": "324"
      }
    }
    </script>
</head>
<body>
    <h1>Welcome to Tony's Pizza</h1>
    <!-- Your regular HTML content -->
</body>
</html>
```

**2. Microdata**

Nested directly within HTML elements using attributes.

**Advantages:**
- Data lives with content
- Visible to users and search engines

**Disadvantages:**
- Clutters HTML
- Harder to maintain
- Can be removed if HTML changes

```html
<!-- Microdata Example -->
<div itemscope itemtype="https://schema.org/Restaurant">
    <h1 itemprop="name">Tony's Pizza</h1>
    <div itemprop="address" itemscope itemtype="https://schema.org/PostalAddress">
        <span itemprop="streetAddress">123 Main Street</span>,
        <span itemprop="addressLocality">Chicago</span>,
        <span itemprop="addressRegion">IL</span>
        <span itemprop="postalCode">60601</span>
    </div>
    <span itemprop="telephone">312-555-1234</span>
    <div itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
        Rating: <span itemprop="ratingValue">4.7</span> stars
        (<span itemprop="reviewCount">324</span> reviews)
    </div>
</div>
```

**3. RDFa (Resource Description Framework in Attributes)**

Similar to Microdata but uses different attributes.

**Advantages:**
- Supports multiple vocabularies

**Disadvantages:**
- Most complex
- Less commonly used

```html
<!-- RDFa Example -->
<div vocab="https://schema.org/" typeof="Restaurant">
    <h1 property="name">Tony's Pizza</h1>
    <div property="address" typeof="PostalAddress">
        <span property="streetAddress">123 Main Street</span>,
        <span property="addressLocality">Chicago</span>,
        <span property="addressRegion">IL</span>
        <span property="postalCode">60601</span>
    </div>
    <span property="telephone">312-555-1234</span>
</div>
```

**Comparison Table:**

| Feature | JSON-LD | Microdata | RDFa |
|---------|---------|-----------|------|
| **Google Preference** | ✅ Recommended | ✓ Supported | ✓ Supported |
| **Ease of Implementation** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| **Maintenance** | Easy | Moderate | Difficult |
| **HTML Clutter** | None | Moderate | Moderate |
| **Dynamic Generation** | Easy | Moderate | Moderate |
| **Separation of Concerns** | ✅ Yes | ❌ No | ❌ No |

**Recommendation: Use JSON-LD** for 99% of cases.
