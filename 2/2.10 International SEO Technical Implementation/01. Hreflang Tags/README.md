# Technical SEO: Server, Hosting & International Implementation

---

## International SEO Technical Implementation


### Hreflang Tags

Hreflang tags tell search engines which language and regional version of a page to serve to users in different locations.

#### Why Hreflang Matters

**Problem Without Hreflang:**
```
Scenario: Company with US and UK sites

US Site: example.com/products/sneakers
UK Site: example.co.uk/products/trainers

Without hreflang:
- UK users see US version in search results
- Currency shown in USD instead of GBP
- Shipping info incorrect
- Poor user experience
- High bounce rate
```

**Solution With Hreflang:**
```
UK user searches "buy trainers"
Google shows: example.co.uk/products/trainers
- Correct currency (GBP)
- UK shipping info
- Proper terminology
- Better conversion rate
```

#### Hreflang Tag Format

```html
<link rel="alternate" hreflang="LANGUAGE-REGION" href="URL" />
```

**Components:**
- `hreflang`: Language code (ISO 639-1) + optional region code (ISO 3166-1 Alpha 2)
- `href`: URL of the alternate version
- `x-default`: Fallback for unmatched languages

#### Real-Life Implementation Example

**Scenario: Global E-commerce Site**

**Pages:**
- English (US): example.com/products/laptop
- English (UK): example.co.uk/products/laptop
- Spanish (Spain): example.es/productos/portatil
- Spanish (Mexico): example.com/mx/productos/laptop
- French (France): example.fr/produits/ordinateur-portable
- German (Germany): example.de/produkte/laptop
- Default (fallback): example.com/products/laptop

**HTML Implementation:**
```html
<head>
    <!-- Self-reference -->
    <link rel="alternate" hreflang="en-us" href="https://example.com/products/laptop" />
    
    <!-- English variants -->
    <link rel="alternate" hreflang="en-gb" href="https://example.co.uk/products/laptop" />
    
    <!-- Spanish variants -->
    <link rel="alternate" hreflang="es-es" href="https://example.es/productos/portatil" />
    <link rel="alternate" hreflang="es-mx" href="https://example.com/mx/productos/laptop" />
    
    <!-- Other languages -->
    <link rel="alternate" hreflang="fr-fr" href="https://example.fr/produits/ordinateur-portable" />
    <link rel="alternate" hreflang="de-de" href="https://example.de/produkte/laptop" />
    
    <!-- Default fallback -->
    <link rel="alternate" hreflang="x-default" href="https://example.com/products/laptop" />
</head>
```

**Important Rules:**
1. **Bidirectional:** Each page must reference itself and all alternates
2. **Self-referencing:** Must include itself in the hreflang annotations
3. **Consistent:** Same annotations across all language versions
4. **X-default:** Should point to your default/main version

#### Common Hreflang Mistakes

**❌ Mistake 1: Missing Self-Reference**
```html
<!-- WRONG - Missing self-reference on US page -->
<link rel="alternate" hreflang="en-gb" href="https://example.co.uk/" />
<link rel="alternate" hreflang="fr-fr" href="https://example.fr/" />

<!-- CORRECT - Includes self-reference -->
<link rel="alternate" hreflang="en-us" href="https://example.com/" />
<link rel="alternate" hreflang="en-gb" href="https://example.co.uk/" />
<link rel="alternate" hreflang="fr-fr" href="https://example.fr/" />
```

**❌ Mistake 2: Not Reciprocal**
```html
<!-- US page has UK alternate -->
<link rel="alternate" hreflang="en-gb" href="https://example.co.uk/" />

<!-- BUT UK page is missing US alternate - WRONG! -->
<!-- UK page must also have: -->
<link rel="alternate" hreflang="en-us" href="https://example.com/" />
```

**❌ Mistake 3: Wrong Language Codes**
```html
<!-- WRONG - Using country codes instead of language codes -->
<link rel="alternate" hreflang="uk" href="https://example.co.uk/" />
<link rel="alternate" hreflang="usa" href="https://example.com/" />

<!-- CORRECT -->
<link rel="alternate" hreflang="en-gb" href="https://example.co.uk/" />
<link rel="alternate" hreflang="en-us" href="https://example.com/" />
```

**❌ Mistake 4: Incorrect X-Default**
```html
<!-- WRONG - x-default pointing to specific language -->
<link rel="alternate" hreflang="x-default" href="https://example.fr/" />

<!-- CORRECT - x-default should be your main/fallback version -->
<link rel="alternate" hreflang="x-default" href="https://example.com/" />
```

#### Hreflang Implementation Methods

**Method 1: HTML Link Elements (Recommended)**
```html
<head>
    <link rel="alternate" hreflang="en-us" href="https://example.com/page" />
    <link rel="alternate" hreflang="en-gb" href="https://example.co.uk/page" />
</head>
```

**Pros:**
- ✅ Easy to implement
- ✅ Visible in page source
- ✅ Easy to debug

**Cons:**
- ❌ Increases page size
- ❌ Must be on every page

---

**Method 2: HTTP Headers**
```
Link: <https://example.com/document.pdf>; rel="alternate"; hreflang="en-us",
      <https://example.de/document.pdf>; rel="alternate"; hreflang="de-de"
```

**Pros:**
- ✅ Works for non-HTML files (PDFs, etc.)
- ✅ Doesn't affect page size

**Cons:**
- ❌ Harder to implement
- ❌ Harder to debug

**Implementation Example:**
```nginx
# Nginx configuration
location /documents/ {
    add_header Link '<https://example.com/doc.pdf>; rel="alternate"; hreflang="en-us"' always;
    add_header Link '<https://example.de/doc.pdf>; rel="alternate"; hreflang="de-de"' always;
}
```

---

**Method 3: XML Sitemap**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <url>
        <loc>https://example.com/products/laptop</loc>
        <xhtml:link rel="alternate" hreflang="en-us" href="https://example.com/products/laptop"/>
        <xhtml:link rel="alternate" hreflang="en-gb" href="https://example.co.uk/products/laptop"/>
        <xhtml:link rel="alternate" hreflang="es-es" href="https://example.es/productos/portatil"/>
        <xhtml:link rel="alternate" hreflang="fr-fr" href="https://example.fr/produits/ordinateur-portable"/>
        <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/products/laptop"/>
    </url>
    
    <url>
        <loc>https://example.co.uk/products/laptop</loc>
        <xhtml:link rel="alternate" hreflang="en-us" href="https://example.com/products/laptop"/>
        <xhtml:link rel="alternate" hreflang="en-gb" href="https://example.co.uk/products/laptop"/>
        <xhtml:link rel="alternate" hreflang="es-es" href="https://example.es/productos/portatil"/>
        <xhtml:link rel="alternate" hreflang="fr-fr" href="https://example.fr/produits/ordinateur-portable"/>
        <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/products/laptop"/>
    </url>
</urlset>
```

**Pros:**
- ✅ Centralized management
- ✅ Doesn't increase page size
- ✅ Good for large sites

**Cons:**
- ❌ More complex to maintain
- ❌ Not visible in page source

---

#### Language-Only vs Language-Region

**Language Only:**
```html
<!-- Spanish for all Spanish speakers -->
<link rel="alternate" hreflang="es" href="https://example.com/es/" />
```

**Language + Region:**
```html
<!-- Spanish for Spain -->
<link rel="alternate" hreflang="es-es" href="https://example.es/" />
<!-- Spanish for Mexico -->
<link rel="alternate" hreflang="es-mx" href="https://example.com/mx/" />
```

**When to Use:**
- Use language-only when content is same for all regions
- Use language-region when content differs by region (currency, spelling, terminology)

**Real-Life Example:**
```
Company: International retail brand

English Content Differences:
- US: "shopping cart", "$", "mm/dd/yyyy", "zip code"
- UK: "shopping basket", "£", "dd/mm/yyyy", "postcode"
- AU: "shopping trolley", "$", "dd/mm/yyyy", "postcode"

Solution: Use language-region tags
en-us, en-gb, en-au (not just "en")
```

#### Validation and Testing

**1. Google Search Console**
```
Steps:
1. Go to Google Search Console
2. Navigate to "International Targeting"
3. Check "Language" tab for hreflang errors

Common errors reported:
- Missing return tags
- Incorrect language codes
- Conflicting tags
- Non-reciprocal annotations
```

**2. Hreflang Testing Tools**
```
Tools:
- Ahrefs Hreflang Tag Testing Tool
- Merkle's Hreflang Tag Testing Tool
- Screaming Frog SEO Spider
- Google Search Console

Manual Check:
curl -I https://example.com | grep -i "link"
```

**3. Screaming Frog Audit**
```
Steps:
1. Open Screaming Frog
2. Crawl your site
3. Check "Hreflang" tab
4. Look for errors:
   - Missing return links
   - Incorrect codes
   - Non-200 status codes
```

---
