
#### Hreflang Implementation

Hreflang is a technical signal that tells search engines which language/region version of a page to show in search results.

**Basic Syntax:**

```html
<link rel="alternate" hreflang="language-REGION" href="URL" />
```

**Component Breakdown:**
- `language`: ISO 639-1 code (en, es, fr, de, ja)
- `REGION`: ISO 3166-1 Alpha 2 code (US, GB, FR, DE, JP)
- `x-default`: Fallback for unmatched languages

---

**Real-Life Example: Nike Product Page**

```html
<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta charset="UTF-8">
  <title>Nike Air Max 270 - Nike.com</title>
  
  <!-- Hreflang tags -->
  <link rel="alternate" hreflang="en-US" href="https://www.nike.com/us/t/air-max-270" />
  <link rel="alternate" hreflang="en-GB" href="https://www.nike.com/gb/t/air-max-270" />
  <link rel="alternate" hreflang="en-CA" href="https://www.nike.com/ca/t/air-max-270" />
  <link rel="alternate" hreflang="fr-CA" href="https://www.nike.com/ca/fr/t/air-max-270" />
  <link rel="alternate" hreflang="de-DE" href="https://www.nike.com/de/t/air-max-270" />
  <link rel="alternate" hreflang="fr-FR" href="https://www.nike.com/fr/t/air-max-270" />
  <link rel="alternate" hreflang="es-ES" href="https://www.nike.com/es/t/air-max-270" />
  <link rel="alternate" hreflang="ja-JP" href="https://www.nike.com/jp/t/air-max-270" />
  <link rel="alternate" hreflang="x-default" href="https://www.nike.com/t/air-max-270" />
</head>
<body>
  <!-- Content -->
</body>
</html>
```

**Key Rules:**

1. **Self-referencing**: Each page must include itself
2. **Bidirectional**: If Page A points to Page B, Page B must point to Page A
3. **Canonical + Hreflang**: Use together, not instead of each other

---

**Common Hreflang Patterns:**

**Pattern 1: Language Only (No Region)**

Use when the same language version serves multiple regions:

```html
<!-- Generic Spanish for all Spanish-speaking countries -->
<link rel="alternate" hreflang="es" href="https://example.com/es/" />

<!-- Generic English for all English-speaking countries -->
<link rel="alternate" hreflang="en" href="https://example.com/en/" />

<!-- Generic French for all French-speaking countries -->
<link rel="alternate" hreflang="fr" href="https://example.com/fr/" />
```

**Pattern 2: Region-Specific Same Language**

Use when content differs by region even with same language:

```html
<!-- English for different regions -->
<link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
<link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
<link rel="alternate" hreflang="en-AU" href="https://example.com/au/" />
<link rel="alternate" hreflang="en-CA" href="https://example.com/ca/" />

<!-- Why? Different spelling, currency, products, regulations -->
```

**Real-Life Example: Amazon**

```markdown
# Same Language, Different Regions

amazon.com (US)
- Price: $29.99
- Shipping: "FREE with Prime"
- Spelling: "Color"

amazon.co.uk (UK)
- Price: £24.99
- Shipping: "FREE over £25"
- Spelling: "Colour"

amazon.com.au (Australia)
- Price: AU$42.99
- Shipping: "FREE with Prime"
- Spelling: "Colour"
```

**Pattern 3: Multiple Languages per Region**

Use for multilingual countries:

```html
<!-- Canada: English and French -->
<link rel="alternate" hreflang="en-CA" href="https://example.com/ca/en/" />
<link rel="alternate" hreflang="fr-CA" href="https://example.com/ca/fr/" />

<!-- Switzerland: German, French, Italian -->
<link rel="alternate" hreflang="de-CH" href="https://example.com/ch/de/" />
<link rel="alternate" hreflang="fr-CH" href="https://example.com/ch/fr/" />
<link rel="alternate" hreflang="it-CH" href="https://example.com/ch/it/" />

<!-- Belgium: Dutch, French, German -->
<link rel="alternate" hreflang="nl-BE" href="https://example.com/be/nl/" />
<link rel="alternate" hreflang="fr-BE" href="https://example.com/be/fr/" />
<link rel="alternate" hreflang="de-BE" href="https://example.com/be/de/" />
```

---

**X-Default Implementation**

The `x-default` serves as a fallback for users whose language/region doesn't match any hreflang tag.

**Example Scenario:**

```html
<!-- User from Brazil (pt-BR) visits, but you only have Spanish -->
<link rel="alternate" hreflang="en-US" href="https://shop.com/us/" />
<link rel="alternate" hreflang="es-MX" href="https://shop.com/mx/" />
<link rel="alternate" hreflang="de-DE" href="https://shop.com/de/" />
<link rel="alternate" hreflang="x-default" href="https://shop.com/" />

<!-- Google shows: https://shop.com/ (x-default) with language selector -->
```

**Best Practice for x-default:**

```html
<!-- Option 1: Generic English version -->
<link rel="alternate" hreflang="x-default" href="https://example.com/" />

<!-- Option 2: Language selector page -->
<link rel="alternate" hreflang="x-default" href="https://example.com/select-country/" />

<!-- Option 3: Primary market (if dominant) -->
<link rel="alternate" hreflang="x-default" href="https://example.com/us/" />
```

---

**Hreflang Implementation Methods**

**Method 1: HTML Link Elements (Most Common)**

```html
<head>
  <link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
  <link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
  <link rel="alternate" hreflang="x-default" href="https://example.com/" />
</head>
```

**Pros:**
- Easy to implement
- Works for all page types
- Easy to verify

**Cons:**
- Can bloat HTML head (if many versions)
- Must be on every page

---

**Method 2: HTTP Headers (For PDFs, Files)**

```http
Link: <https://example.com/files/whitepaper-en.pdf>; rel="alternate"; hreflang="en",
      <https://example.com/files/whitepaper-de.pdf>; rel="alternate"; hreflang="de",
      <https://example.com/files/whitepaper-es.pdf>; rel="alternate"; hreflang="es",
      <https://example.com/files/whitepaper-en.pdf>; rel="alternate"; hreflang="x-default"
```

**Use Case:**
- Non-HTML files (PDFs, images, etc.)
- Dynamic content without HTML head

**Implementation (Apache .htaccess):**

```apache
<FilesMatch "whitepaper-en\.pdf">
  Header add Link '<https://example.com/files/whitepaper-en.pdf>; rel="alternate"; hreflang="en"'
  Header add Link '<https://example.com/files/whitepaper-de.pdf>; rel="alternate"; hreflang="de"'
  Header add Link '<https://example.com/files/whitepaper-en.pdf>; rel="alternate"; hreflang="x-default"'
</FilesMatch>
```

---

**Method 3: XML Sitemap (For Large Sites)**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
  
  <!-- US Version -->
  <url>
    <loc>https://example.com/us/product</loc>
    <xhtml:link rel="alternate" hreflang="en-US" href="https://example.com/us/product" />
    <xhtml:link rel="alternate" hreflang="en-GB" href="https://example.com/uk/product" />
    <xhtml:link rel="alternate" hreflang="de-DE" href="https://example.com/de/product" />
    <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/product" />
  </url>
  
  <!-- UK Version -->
  <url>
    <loc>https://example.com/uk/product</loc>
    <xhtml:link rel="alternate" hreflang="en-US" href="https://example.com/us/product" />
    <xhtml:link rel="alternate" hreflang="en-GB" href="https://example.com/uk/product" />
    <xhtml:link rel="alternate" hreflang="de-DE" href="https://example.com/de/product" />
    <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/product" />
  </url>
  
  <!-- German Version -->
  <url>
    <loc>https://example.com/de/product</loc>
    <xhtml:link rel="alternate" hreflang="en-US" href="https://example.com/us/product" />
    <xhtml:link rel="alternate" hreflang="en-GB" href="https://example.com/uk/product" />
    <xhtml:link rel="alternate" hreflang="de-DE" href="https://example.com/de/product" />
    <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/product" />
  </url>
  
</urlset>
```

**Pros:**
- Cleaner HTML
- Better for large sites (100+ pages × 10+ languages = 1000+ hreflang tags per page!)
- Easier to manage centrally

**Cons:**
- Harder to debug
- Less transparent
- Requires sitemap submission

---

**Dynamic Hreflang Generation**

For CMS or large sites, generate hreflang dynamically:

**Example (PHP):**

```php
<?php
// Configuration
$languages = [
    'en-US' => '/us/',
    'en-GB' => '/uk/',
    'de-DE' => '/de/',
    'fr-FR' => '/fr/',
    'es-ES' => '/es/'
];

$currentPage = 'products/shoes'; // Current page path
$baseUrl = 'https://example.com';

// Generate hreflang tags
foreach ($languages as $hreflang => $path) {
    echo '<link rel="alternate" hreflang="' . $hreflang . '" ';
    echo 'href="' . $baseUrl . $path . $currentPage . '" />' . "\n";
}

// Add x-default
echo '<link rel="alternate" hreflang="x-default" ';
echo 'href="' . $baseUrl . '/' . $currentPage . '" />' . "\n";
?>
```

**Example (WordPress):**

```php
// In functions.php
function add_hreflang_tags() {
    if (is_singular()) {
        $post_id = get_the_ID();
        $languages = [
            'en-US' => 'https://example.com/us/',
            'en-GB' => 'https://example.com/uk/',
            'de-DE' => 'https://example.com/de/'
        ];
        
        foreach ($languages as $hreflang => $base_url) {
            $translated_url = get_translated_url($post_id, $hreflang);
            if ($translated_url) {
                echo '<link rel="alternate" hreflang="' . esc_attr($hreflang) . '" href="' . esc_url($translated_url) . '" />' . "\n";
            }
        }
    }
}
add_action('wp_head', 'add_hreflang_tags');
```

---

**Common Hreflang Mistakes & Fixes**

**Mistake 1: Missing Self-Reference**

```html
<!-- WRONG -->
<head>
  <title>US Version</title>
  <!-- Missing en-US self-reference! -->
  <link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
  <link rel="alternate" hreflang="de-DE" href="https://example.com/de/" />
</head>

<!-- CORRECT -->
<head>
  <title>US Version</title>
  <link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
  <link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
  <link rel="alternate" hreflang="de-DE" href="https://example.com/de/" />
</head>
```

**Mistake 2: Not Bidirectional**

```html
<!-- WRONG: US page points to UK, but UK doesn't point back to US -->

<!-- US Page -->
<link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
<link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />

<!-- UK Page -->
<link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
<!-- Missing reference to US! -->

<!-- CORRECT: Both pages have complete references -->

<!-- US Page -->
<link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
<link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />

<!-- UK Page -->
<link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
<link rel="alternate" hreflang="en-GB" href="https://example.com/uk/" />
```

**Mistake 3: Using Language Names Instead of Codes**

```html
<!-- WRONG -->
<link rel="alternate" hreflang="english" href="https://example.com/en/" />
<link rel="alternate" hreflang="spanish" href="https://example.com/es/" />

<!-- CORRECT -->
<link rel="alternate" hreflang="en" href="https://example.com/en/" />
<link rel="alternate" hreflang="es" href="https://example.com/es/" />
```

**Mistake 4: Mixing Canonical and Hreflang Incorrectly**

```html
<!-- WRONG: Canonical pointing to different language -->
<link rel="canonical" href="https://example.com/us/" />
<link rel="alternate" hreflang="de-DE" href="https://example.com/de/" />

<!-- CORRECT: Canonical points to self -->
<link rel="canonical" href="https://example.com/de/" />
<link rel="alternate" hreflang="en-US" href="https://example.com/us/" />
<link rel="alternate" hreflang="de-DE" href="https://example.com/de/" />
```

---
