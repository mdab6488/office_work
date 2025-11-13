# Technical SEO: Server, Hosting & International Implementation

---

## International SEO Technical Implementation



### International Site Structure

#### Complete Implementation Example

**Scenario: Global E-commerce Platform**

**Requirements:**
- Serving: US, UK, Germany, France, Spain
- Products: Same globally but different pricing
- Content: Translated and culturally adapted
- Payment: Local payment methods
- Shipping: Local fulfillment centers

**Chosen Structure: Subdirectories**
```
example.com/en-us/ (US English)
example.com/en-gb/ (UK English)
example.com/de-de/ (German)
example.com/fr-fr/ (French)
example.com/es-es/ (Spanish)
```

**URL Architecture:**
```
Homepage:
example.com/ (detects location, shows selection)
example.com/en-us/
example.com/en-gb/
example.com/de-de/

Category Pages:
example.com/en-us/products/electronics/
example.com/en-gb/products/electronics/
example.com/de-de/produkte/elektronik/

Product Pages:
example.com/en-us/products/electronics/laptop-x1
example.com/en-gb/products/electronics/laptop-x1
example.com/de-de/produkte/elektronik/laptop-x1

Checkout:
example.com/en-us/checkout/
example.com/en-gb/checkout/
example.com/de-de/kasse/

Blog:
example.com/en-us/blog/tech-tips/
example.com/en-gb/blog/tech-tips/
example.com/de-de/blog/tech-tipps/
```

**Complete Hreflang Implementation:**
```html
<!-- US Version: example.com/en-us/products/electronics/laptop-x1 -->
<head>
    <meta charset="UTF-8">
    <html lang="en-US">
    <title>Laptop X1 - $999 | TechShop US</title>
    <meta name="description" content="Buy Laptop X1 for $999 with free shipping in the US.">
    <link rel="canonical" href="https://example.com/en-us/products/electronics/laptop-x1">
    
    <!-- Hreflang tags -->
    <link rel="alternate" hreflang="en-us" href="https://example.com/en-us/products/electronics/laptop-x1" />
    <link rel="alternate" hreflang="en-gb" href="https://example.com/en-gb/products/electronics/laptop-x1" />
    <link rel="alternate" hreflang="de-de" href="https://example.com/de-de/produkte/elektronik/laptop-x1" />
    <link rel="alternate" hreflang="fr-fr" href="https://example.com/fr-fr/produits/electronique/laptop-x1" />
    <link rel="alternate" hreflang="es-es" href="https://example.com/es-es/productos/electronica/laptop-x1" />
    <link rel="alternate" hreflang="x-default" href="https://example.com/en-us/products/electronics/laptop-x1" />
    
    <!-- Schema markup with region-specific data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": "Laptop X1",
        "description": "High-performance laptop with 16GB RAM",
        "image": "https://example.com/images/laptop-x1.jpg",
        "brand": "TechBrand",
        "offers": {
            "@type": "Offer",
            "price": "999",
            "priceCurrency": "USD",
            "availability": "https://schema.org/InStock",
            "seller": {
                "@type": "Organization",
                "name": "TechShop US"
            },
            "shippingDetails": {
                "@type": "OfferShippingDetails",
                "shippingDestination": {
                    "@type": "DefinedRegion",
                    "addressCountry": "US"
                }
            }
        }
    }
    </script>
</head>
```

**Language Selector Component:**
```html
<!-- Language/Region Selector -->
<div class="language-selector">
    <button class="current-language">
        <img src="/flags/us.svg" alt="US Flag">
        <span>United States (English) - USD $</span>
    </button>
    
    <div class="language-dropdown">
        <h3>Select Your Location</h3>
        
        <div class="region-group">
            <h4>Americas</h4>
            <a href="/en-us/">🇺🇸 United States (English) - USD $</a>
            <a href="/es-mx/">🇲🇽 México (Español) - MXN $</a>
            <a href="/pt-br/">🇧🇷 Brasil (Português) - BRL R$</a>
        </div>
        
        <div class="region-group">
            <h4>Europe</h4>
            <a href="/en-gb/">🇬🇧 United Kingdom (English) - GBP £</a>
            <a href="/de-de/">🇩🇪 Deutschland (Deutsch) - EUR €</a>
            <a href="/fr-fr/">🇫🇷 France (Français) - EUR €</a>
            <a href="/es-es/">🇪🇸 España (Español) - EUR €</a>
            <a href="/it-it/">🇮🇹 Italia (Italiano) - EUR €</a>
        </div>
        
        <div class="region-group">
            <h4>Asia Pacific</h4>
            <a href="/ja-jp/">🇯🇵 日本 (日本語) - JPY ¥</a>
            <a href="/zh-cn/">🇨🇳 中国 (简体中文) - CNY ¥</a>
            <a href="/ko-kr/">🇰🇷 한국 (한국어) - KRW ₩</a>
            <a href="/en-au/">🇦🇺 Australia (English) - AUD $</a>
        </div>
    </div>
</div>
```

**Automatic Location Detection (Homepage):**
```javascript
// On homepage only
if (window.location.pathname === '/') {
    // Check if user has previously selected a location
    const savedLocale = localStorage.getItem('userLocale');
    
    if (!savedLocale) {
        // Detect user's location
        fetch('https://ipapi.co/json/')
            .then(response => response.json())
            .then(data => {
                const localeMap = {
                    'US': 'en-us',
                    'GB': 'en-gb',
                    'DE': 'de-de',
                    'FR': 'fr-fr',
                    'ES': 'es-es',
                    'MX': 'es-mx',
                    'BR': 'pt-br',
                    'JP': 'ja-jp',
                    'CN': 'zh-cn'
                };
                
                const suggestedLocale = localeMap[data.country_code];
                
                if (suggestedLocale) {
                    // Show suggestion banner
                    showLocaleSuggestion(suggestedLocale, data.country_name);
                }
            })
            .catch(() => {
                // Fallback to browser language
                const browserLang = navigator.language;
                showDefaultLocation(browserLang);
            });
    } else {
        // Redirect to saved locale
        window.location.href = `/${savedLocale}/`;
    }
}

function showLocaleSuggestion(locale, country) {
    const banner = document.createElement('div');
    banner.className = 'locale-suggestion';
    banner.innerHTML = `
        <p>Shop in ${country}?</p>
        <button onclick="acceptLocale('${locale}')">Yes</button>
        <button onclick="dismissBanner()">Stay on current site</button>
    `;
    document.body.prepend(banner);
}

function acceptLocale(locale) {
    localStorage.setItem('userLocale', locale);
    window.location.href = `/${locale}/`;
}
```

**Nginx Server Configuration:**
```nginx
server {
    listen 443 ssl http2;
    server_name example.com;
    
    root /var/www/html;
    index index.html;
    
    # Root redirect logic
    location = / {
        # Allow search engines
        if ($http_user_agent ~* "googlebot|bingbot|yandex|baiduspider") {
            rewrite ^ /en-us/ break;
        }
        
        # Show location selector for users
        try_files /location-selector.html =404;
    }
    
    # US English
    location /en-us/ {
        add_header Content-Language "en-US" always;
        try_files $uri $uri/ /en-us/index.html;
    }
    
    # UK English
    location /en-gb/ {
        add_header Content-Language "en-GB" always;
        try_files $uri $uri/ /en-gb/index.html;
    }
    
    # German
    location /de-de/ {
        add_header Content-Language "de-DE" always;
        try_files $uri $uri/ /de-de/index.html;
    }
    
    # French
    location /fr-fr/ {
        add_header Content-Language "fr-FR" always;
        try_files $uri $uri/ /fr-fr/index.html;
    }
    
    # Spanish
    location /es-es/ {
        add_header Content-Language "es-ES" always;
        try_files $uri $uri/ /es-es/index.html;
    }
    
    # Legacy URL redirects
    rewrite ^/products/(.*)$ /en-us/products/$1 permanent;
    rewrite ^/blog/(.*)$ /en-us/blog/$1 permanent;
}
```

**XML Sitemap Structure:**
```xml
<!-- Sitemap index -->
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <sitemap>
        <loc>https://example.com/sitemap-en-us.xml</loc>
        <lastmod>2025-11-04T10:00:00+00:00</lastmod>
    </sitemap>
    <sitemap>
        <loc>https://example.com/sitemap-en-gb.xml</loc>
        <lastmod>2025-11-04T10:00:00+00:00</lastmod>
    </sitemap>
    <sitemap>
        <loc>https://example.com/sitemap-de-de.xml</loc>
        <lastmod>2025-11-04T10:00:00+00:00</lastmod>
    </sitemap>
    <sitemap>
        <loc>https://example.com/sitemap-fr-fr.xml</loc>
        <lastmod>2025-11-04T10:00:00+00:00</lastmod>
    </sitemap>
</sitemapindex>
```

**Individual Sitemap (with hreflang):**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
    
    <!-- Product Page Example -->
    <url>
        <loc>https://example.com/en-us/products/electronics/laptop-x1</loc>
        <lastmod>2025-11-04</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.8</priority>
        
        <!-- Hreflang annotations -->
        <xhtml:link rel="alternate" hreflang="en-us" 
                    href="https://example.com/en-us/products/electronics/laptop-x1"/>
        <xhtml:link rel="alternate" hreflang="en-gb" 
                    href="https://example.com/en-gb/products/electronics/laptop-x1"/>
        <xhtml:link rel="alternate" hreflang="de-de" 
                    href="https://example.com/de-de/produkte/elektronik/laptop-x1"/>
        <xhtml:link rel="alternate" hreflang="fr-fr" 
                    href="https://example.com/fr-fr/produits/electronique/laptop-x1"/>
        <xhtml:link rel="alternate" hreflang="es-es" 
                    href="https://example.com/es-es/productos/electronica/laptop-x1"/>
        <xhtml:link rel="alternate" hreflang="x-default" 
                    href="https://example.com/en-us/products/electronics/laptop-x1"/>
    </url>
    
</urlset>
```

#### Content Localization Best Practices

**1. Don't Just Translate - Localize**

❌ **Bad: Direct Translation**
```
US: "Get 20% off your first order!"
German (direct translation): "Erhalten Sie 20% Rabatt auf Ihre erste Bestellung!"
```

✅ **Good: Localized**
```
US: "Get 20% off your first order!"
German (localized): "Jetzt 20% sparen bei Ihrer Erstbestellung!"
(More natural German phrasing)

UK: "Get 20% off your first order!"
(Using "off" is common in UK)

France: "Profitez de -20% sur votre première commande !"
(French typically shows discount as negative percentage)
```

**2. Cultural Adaptation**

```
US Page - Thanksgiving Sale:
"Black Friday Sale - 50% Off Everything!"

UK Page - Different Timing:
"Black Friday Sale - Half Price on All Items!"
(Using "Half Price" is more common in UK)

Germany - Legal Requirements:
"Black Friday Sale - 50% Rabatt auf UVP"
(Must show discount is off recommended retail price - UVP)

France - Different Shopping Culture:
"Soldes Exceptionnels - Jusqu'à -50%"
("Soldes" is the legally defined sales period)
```

**3. Technical Elements to Localize**

```
✓ Currency (USD $ vs GBP £ vs EUR €)
✓ Date format (MM/DD/YYYY vs DD/MM/YYYY)
✓ Time format (12-hour vs 24-hour)
✓ Address formats
✓ Phone number formats
✓ Measurement units (miles vs kilometers)
✓ Legal requirements (terms, privacy policy)
✓ Payment methods (local options)
✓ Shipping information
✓ Tax/VAT display
✓ Return policies
```

**4. SEO Content Differences**

```
Product: Running Shoes

US Keywords:
- running shoes
- sneakers
- athletic footwear
- trainers (less common)

UK Keywords:
- trainers (primary)
- running shoes
- sports shoes
- plimsolls (casual)

Strategy: Different content targeting different keywords
```

---


### Complete Checklist

**International SEO Implementation Checklist:**

**Technical Setup:**
- [ ] Choose URL structure (ccTLDs/subdirectories/subdomains)
- [ ] Implement hreflang tags correctly
- [ ] Set up language-specific XML sitemaps
- [ ] Configure server for different languages
- [ ] Set up CDN for global content delivery
- [ ] Configure appropriate server locations

**Content:**
- [ ] Translate all content (not just pages, but meta data too)
- [ ] Localize currency, dates, measurements
- [ ] Adapt cultural references
- [ ] Research local keywords
- [ ] Create region-specific content where needed
- [ ] Localize images/videos if necessary

**Technical Elements:**
- [ ] HTML lang attribute on all pages
- [ ] Content-Language HTTP headers
- [ ] Canonical tags pointing to correct version
- [ ] Language selector on all pages
- [ ] Proper URL structure throughout

**Google Search Console:**
- [ ] Add all international versions as properties
- [ ] Submit language-specific sitemaps
- [ ] Set geographic targeting (if using ccTLDs/subdomains)
- [ ] Monitor for hreflang errors
- [ ] Check international targeting report

**Ongoing Monitoring:**
- [ ] Track rankings by country
- [ ] Monitor Core Web Vitals by region
- [ ] Check for crawl errors in each version
- [ ] Verify hreflang implementation
- [ ] Analyze traffic by language/region
- [ ] Monitor conversion rates by market

---

## Additional Resources

### Testing Tools
- Google Search Console (International Targeting)
- Screaming Frog SEO Spider (Hreflang validation)
- Ahrefs Hreflang Tag Testing Tool
- GTmetrix (Server performance)
- WebPageTest (Global performance testing)
- SSL Labs (SSL configuration)
- SecurityHeaders.com (Security headers check)

### Documentation
- Google's International Targeting Documentation
- Hreflang Implementation Guide
- ISO 639-1 Language Codes
- ISO 3166-1 Alpha-2 Country Codes

### Monitoring Services
- Uptime Robot (Server monitoring)
- Pingdom (Performance monitoring)
- StatusCake (Global uptime monitoring)
- New Relic (Application performance)

---

## Conclusion