# Technical SEO: HTTPS Security & Structured Data Guide

## 2.6 Structured Data and Schema Markup

---



### Knowledge Graph

**What is the Knowledge Graph?**

The Knowledge Graph is Google's database of entities (people, places, things) and their relationships. When you search for a known entity, Google may display a Knowledge Panel with summarized information.

**Real-Life Examples:**

**Person Knowledge Panel (searching "Elon Musk"):**
```
┌─────────────────────────────┐
│  Elon Musk                  │
│  [Photo]                    │
│  CEO of Tesla, SpaceX       │
│  Born: June 28, 1971        │
│  Net worth: $XXX billion    │
│  Spouse: ...                │
│  Children: ...              │
│  Education: ...             │
│                             │
│  [Social Media Links]       │
│  Twitter | Instagram        │
└─────────────────────────────┘
```

**Organization Knowledge Panel (searching "Anthropic"):**
```
┌─────────────────────────────┐
│  Anthropic                  │
│  [Logo]                     │
│  Artificial Intelligence    │
│  Founded: 2021              │
│  Founders: ...              │
│  CEO: Dario Amodei          │
│  Headquarters: SF, CA       │
│                             │
│  [Website Link]             │
│  [Social Profiles]          │
└─────────────────────────────┘
```

**How to Get into the Knowledge Graph:**

**1. Create a Wikipedia Page**
- Most authoritative source for Knowledge Graph
- Requires notability and reliable sources
- Example: Most Fortune 500 companies have Wikipedia pages

**2. Claim Your Google Business Profile**
- For local businesses
- Free listing on Google Maps
```
https://business.google.com
```

**3. Implement Organization Schema**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "TechCorp Solutions",
  "url": "https://www.techcorp.com",
  "logo": "https://www.techcorp.com/logo.png",
  "description": "Leading software development company",
  "foundingDate": "2015",
  "founders": [
    {
      "@type": "Person",
      "name": "Jane Smith"
    },
    {
      "@type": "Person",
      "name": "John Doe"
    }
  ],
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Tech Street",
    "addressLocality": "San Francisco",
    "addressRegion": "CA",
    "postalCode": "94102",
    "addressCountry": "US"
  },
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "+1-415-555-1234",
    "contactType": "Customer Service"
  },
  "sameAs": [
    "https://www.facebook.com/techcorp",
    "https://www.twitter.com/techcorp",
    "https://www.linkedin.com/company/techcorp",
    "https://www.instagram.com/techcorp"
  ]
}
</script>
```

**4. Build Brand Mentions**
- Get mentioned on authoritative sites
- Ensure NAP (Name, Address, Phone) consistency across the web
- Build citations in industry directories

**5. Maintain Active Social Profiles**
- Verified accounts on major platforms
- Consistent branding across platforms
- Regular posting

**6. Implement Person Schema (for individuals)**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Dr. Sarah Johnson",
  "url": "https://www.drsarahjohnson.com",
  "image": "https://www.drsarahjohnson.com/profile.jpg",
  "jobTitle": "Chief Medical Officer",
  "worksFor": {
    "@type": "Organization",
    "name": "HealthTech Inc."
  },
  "alumniOf": {
    "@type": "EducationalOrganization",
    "name": "Harvard Medical School"
  },
  "sameAs": [
    "https://www.linkedin.com/in/drsarahjohnson",
    "https://twitter.com/drsarahjohnson",
    "https://scholar.google.com/citations?user=..."
  ],
  "description": "Board-certified cardiologist with 15+ years of experience"
}
</script>
```

**Real-Life Success Story:**

**Neil Patel (Marketing Expert)**
- Implemented Person schema on his website
- Built consistent presence across Wikipedia, LinkedIn, Twitter
- Published 1000+ articles on authoritative sites
- Result: Knowledge Panel appears for searches of his name
- Panel shows: Photo, bio, social links, recent posts

---

### FAQ Schema

**What is FAQ Schema?**

FAQ (Frequently Asked Questions) schema markup displays your Q&A directly in search results as expandable dropdowns, giving you massive visibility.

**Real-Life Visual Example:**

```
Your Site - FAQ Page
https://yoursite.com/faq

❓ How long does shipping take? ▼
   We offer free 2-day shipping on orders over $50...

❓ What is your return policy? ▼
   
❓ Do you ship internationally? ▼
```

**Implementation:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How long does shipping take?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>We offer multiple shipping options:</p><ul><li>Standard Shipping: 5-7 business days (Free on orders $50+)</li><li>Express Shipping: 2-3 business days ($9.99)</li><li>Overnight Shipping: Next business day ($24.99)</li></ul><p>Orders are processed within 24 hours of purchase.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "What is your return policy?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>We accept returns within 30 days of purchase. Items must be unused and in original packaging. Refunds are processed within 5-7 business days. Return shipping is free for defective items, otherwise customer pays return shipping.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Do you ship internationally?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Yes! We ship to over 50 countries worldwide. International shipping costs are calculated at checkout based on destination and package weight. Delivery time: 10-21 business days. Note: Customs fees may apply.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "How do I track my order?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Once your order ships, you'll receive a tracking number via email. You can track your package by:</p><ol><li>Clicking the tracking link in your shipping confirmation email</li><li>Visiting our Track Order page and entering your order number</li><li>Logging into your account and viewing order history</li></ol>"
      }
    }
  ]
}
</script>
```

**HTML Content (should match schema):**

```html
<div class="faq-section">
    <h1>Frequently Asked Questions</h1>
    
    <div class="faq-item">
        <h2>How long does shipping take?</h2>
        <p>We offer multiple shipping options:</p>
        <ul>
            <li>Standard Shipping: 5-7 business days (Free on orders $50+)</li>
            <li>Express Shipping: 2-3 business days ($9.99)</li>
            <li>Overnight Shipping: Next business day ($24.99)</li>
        </ul>
        <p>Orders are processed within 24 hours of purchase.</p>
    </div>
    
    <div class="faq-item">
        <h2>What is your return policy?</h2>
        <p>We accept returns within 30 days of purchase...</p>
    </div>
    
    <!-- More FAQ items -->
</div>
```

**Google's Requirements:**

1. **Minimum 2 questions** (no maximum)
2. **Full answer** must be in schema (not just first sentence)
3. **One question per answer** (no multiple Q's for one A)
4. **No advertising** or promotional content
5. **Questions asked by users**, not business talking about itself
6. **Visible on page** (schema must match visible content)

**What NOT to do:**

```html
<!-- BAD: Advertisement disguised as FAQ -->
{
  "@type": "Question",
  "name": "Where can I buy the best pizza?",
  "acceptedAnswer": {
    "@type": "Answer",
    "text": "At Tony's Pizza! Visit us today!"
  }
}

<!-- BAD: Not a user question -->
{
  "@type": "Question",
  "name": "We are the best company",
  "acceptedAnswer": {
    "@type": "Answer",
    "text": "Because we have great service"
  }
}
```

**Real-Life Case Study:**

**REI (Outdoor Gear Retailer)**
- Added FAQ schema to product pages and help center
- Questions: "What's the warranty?" "How to choose tent size?" etc.
- Result: 35% increase in CTR for FAQ-enabled pages
- Appeared in 89% of relevant voice searches

**Best Practices:**

1. Focus on genuine customer questions
2. Provide complete, helpful answers (100-300 words each)
3. Use natural language
4. Update answers seasonally if needed
5. Monitor Search Console for FAQ impressions

---

### Product Schema

**What is Product Schema?**

Product schema provides structured data about products you sell, enabling rich snippets with price, availability, ratings, and more in search results.

**Full Product Schema Example:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Apple iPhone 15 Pro Max",
  "image": [
    "https://example.com/photos/iphone-front.jpg",
    "https://example.com/photos/iphone-back.jpg",
    "https://example.com/photos/iphone-side.jpg"
  ],
  "description": "The iPhone 15 Pro Max features a titanium design, A17 Pro chip, advanced camera system with 5x optical zoom, and all-day battery life.",
  "sku": "IPHONE15PM-256-BLUE",
  "mpn": "MPTW3LL/A",
  "brand": {
    "@type": "Brand",
    "name": "Apple"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/iphone-15-pro-max",
    "priceCurrency": "USD",
    "price": "1199.00",
    "priceValidUntil": "2025-12-31",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition",
    "seller": {
      "@type": "Organization",
      "name": "TechStore"
    },
    "shippingDetails": {
      "@type": "OfferShippingDetails",
      "shippingRate": {
        "@type": "MonetaryAmount",
        "value": "0",
        "currency": "USD"
      },
      "shippingDestination": {
        "@type": "DefinedRegion",
        "addressCountry": "US"
      },
      "deliveryTime": {
        "@type": "ShippingDeliveryTime",
        "handlingTime": {
          "@type": "QuantitativeValue",
          "minValue": "1",
          "maxValue": "2",
          "unitCode": "DAY"
        },
        "transitTime": {
          "@type": "QuantitativeValue",
          "minValue": "2",
          "maxValue": "5",
          "unitCode": "DAY"
        }
      }
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "reviewCount": "1247",
    "bestRating": "5",
    "worstRating": "1"
  },
  "review": [
    {
      "@type": "Review",
      "author": {
        "@type": "Person",
        "name": "John Smith"
      },
      "datePublished": "2024-10-15",
      "reviewBody": "The best iPhone yet! The camera quality is incredible and the battery lasts all day. The titanium build feels premium.",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5",
        "bestRating": "5",
        "worstRating": "1"
      }
    },
    {
      "@type": "Review",
      "author": {
        "@type": "Person",
        "name": "Emily Johnson"
      },
      "datePublished": "2024-10-20",
      "reviewBody": "Great phone but expensive. The 5x zoom is amazing for photography. Worth the upgrade if you're coming from an older model.",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "4",
        "bestRating": "5",
        "worstRating": "1"
      }
    }
  ]
}
</script>
```

**Product Availability Options:**

```javascript
// Common availability values
"https://schema.org/InStock"           // Available now
"https://schema.org/OutOfStock"        // Not available
"https://schema.org/PreOrder"          // Available for pre-order
"https://schema.org/BackOrder"         // Temporarily out of stock
"https://schema.org/Discontinued"      // No longer available
"https://schema.org/LimitedAvailability" // Low stock
"https://schema.org/OnlineOnly"        // Online purchases only
"https://schema.org/SoldOut"           // Sold out
```

**Product Condition Options:**

```javascript
"https://schema.org/NewCondition"            // Brand new
"https://schema.org/RefurbishedCondition"    // Refurbished
"https://schema.org/UsedCondition"           // Pre-owned
"https://schema.org/DamagedCondition"        // Damaged/As-is
```

**Product Variants Example (Multiple Sizes/Colors):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Nike Air Max Running Shoes",
  "image": "https://example.com/nike-air-max.jpg",
  "description": "Comfortable running shoes with Air Max cushioning",
  "brand": {
    "@type": "Brand",
    "name": "Nike"
  },
  "offers": {
    "@type": "AggregateOffer",
    "priceCurrency": "USD",
    "lowPrice": "89.99",
    "highPrice": "129.99",
    "offerCount": "15",
    "offers": [
      {
        "@type": "Offer",
        "price": "89.99",
        "availability": "https://schema.org/InStock",
        "sku": "NIKE-AM-8-BLACK",
        "itemOffered": {
          "@type": "Product",
          "name": "Nike Air Max - Size 8 - Black",
          "color": "Black",
          "size": "8"
        }
      },
      {
        "@type": "Offer",
        "price": "89.99",
        "availability": "https://schema.org/InStock",
        "sku": "NIKE-AM-9-BLACK",
        "itemOffered": {
          "@type": "Product",
          "name": "Nike Air Max - Size 9 - Black",
          "color": "Black",
          "size": "9"
        }
      },
      {
        "@type": "Offer",
        "price": "94.99",
        "availability": "https://schema.org/InStock",
        "sku": "NIKE-AM-8-WHITE",
        "itemOffered": {
          "@type": "Product",
          "name": "Nike Air Max - Size 8 - White",
          "color": "White",
          "size": "8"
        }
      }
    ]
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.6",
    "reviewCount": "892"
  }
}
</script>
```

**Real-Life E-commerce Example (Best Buy):**

Best Buy's product pages include comprehensive Product schema showing:
- Product name and images
- Current price and sale price
- In-stock availability by store location
- 4.5-star rating with 3,456 reviews
- Free shipping badge
- Delivery estimate

**Result:** Rich snippet displays in Google with:
```
Best Buy: iPhone 15 Pro Max
⭐⭐⭐⭐⭐ 4.8 (1,247 reviews)
$1,199.00 | In stock
✓ Free 2-day shipping
```

**Common Mistakes to Avoid:**

1. **Marking up unavailable products**
   ```javascript
   // Don't do this if product is discontinued
   "offers": {
     "availability": "https://schema.org/InStock" // ❌ Wrong
   }
   ```

2. **Fake or manipulated reviews**
   - Only include genuine customer reviews
   - Google can penalize for fake reviews

3. **Missing required properties**
   - name, image, and offers are REQUIRED
   - Missing these = no rich snippet

4. **Incorrect price format**
   ```javascript
   "price": "$29.99"  // ❌ Wrong - include currency symbol
   "price": "29.99"   // ✅ Correct
   "priceCurrency": "USD"  // ✅ Currency specified separately
   ```

---

### Review Schema

**What is Review Schema?**

Review schema displays star ratings and review counts in search results, building trust and increasing CTR by 15-35%.

**Individual Review Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Review",
  "itemReviewed": {
    "@type": "Product",
    "name": "Samsung Galaxy S24 Ultra",
    "image": "https://example.com/galaxy-s24.jpg",
    "brand": {
      "@type": "Brand",
      "name": "Samsung"
    }
  },
  "author": {
    "@type": "Person",
    "name": "Michael Chen"
  },
  "reviewRating": {
    "@type": "Rating",
    "ratingValue": "5",
    "bestRating": "5",
    "worstRating": "1"
  },
  "datePublished": "2024-10-28",
  "reviewBody": "Absolutely amazing phone! The camera quality in low light is incredible. The S Pen is more useful than I expected for taking notes and screenshots. Battery easily lasts a full day with heavy use. The 200MP camera produces stunning photos. Highly recommend for power users!",
  "publisher": {
    "@type": "Organization",
    "name": "TechReviews",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  }
}
</script>
```

**Aggregate Rating (Multiple Reviews Combined):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Instant Pot Duo 7-in-1",
  "image": "https://example.com/instant-pot.jpg",
  "description": "Multi-functional electric pressure cooker",
  "brand": {
    "@type": "Brand",
    "name": "Instant Pot"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "bestRating": "5",
    "worstRating": "1",
    "ratingCount": "15847",
    "reviewCount": "12456"
  },
  "offers": {
    "@type": "Offer",
    "price": "79.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock"
  }
}
</script>
```

**Review of a Service/Business:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Review",
  "itemReviewed": {
    "@type": "LocalBusiness",
    "name": "Joe's Auto Repair",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "456 Main St",
      "addressLocality": "Portland",
      "addressRegion": "OR",
      "postalCode": "97201"
    },
    "telephone": "+1-503-555-7890",
    "priceRange": "$$"
  },
  "author": {
    "@type": "Person",
    "name": "Sarah Williams"
  },
  "reviewRating": {
    "@type": "Rating",
    "ratingValue": "5",
    "bestRating": "5"
  },
  "datePublished": "2024-11-01",
  "reviewBody": "Excellent service! They diagnosed my brake issue quickly and had it fixed the same day. Fair pricing and honest mechanics. They even washed my car! Will definitely return for future repairs."
}
</script>
```

**Recipe Review Example:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Perfect Chocolate Chip Cookies",
  "image": "https://example.com/cookies.jpg",
  "author": {
    "@type": "Person",
    "name": "Chef Maria"
  },
  "datePublished": "2024-01-15",
  "description": "Crispy on the outside, chewy on the inside chocolate chip cookies",
  "prepTime": "PT15M",
  "cookTime": "PT12M",
  "totalTime": "PT27M",
  "recipeYield": "24 cookies",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "ratingCount": "2891"
  },
  "review": [
    {
      "@type": "Review",
      "author": {
        "@type": "Person",
        "name": "Jennifer"
      },
      "datePublished": "2024-10-20",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5"
      },
      "reviewBody": "Best cookie recipe ever! Made them for a bake sale and they sold out in 10 minutes. The secret is the brown butter!"
    }
  ],
  "recipeIngredient": [
    "2 cups all-purpose flour",
    "1 tsp baking soda",
    "1 cup butter, browned",
    "3/4 cup granulated sugar",
    "3/4 cup brown sugar",
    "2 large eggs",
    "2 cups chocolate chips"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Brown the butter in a saucepan over medium heat until golden and fragrant. Let cool."
    },
    {
      "@type": "HowToStep",
      "text": "Mix flour and baking soda in a bowl."
    },
    {
      "@type": "HowToStep",
      "text": "Cream together browned butter and sugars. Add eggs one at a time."
    },
    {
      "@type": "HowToStep",
      "text": "Fold in flour mixture and chocolate chips."
    },
    {
      "@type": "HowToStep",
      "text": "Bake at 375°F for 10-12 minutes until edges are golden."
    }
  ]
}
</script>
```

**Google's Review Schema Requirements:**

1. **Must be genuine reviews** from real customers
2. **No self-reviews** (business owner reviewing own business)
3. **Rating scale** must be consistent (e.g., 1-5 stars)
4. **Review date** required
5. **Author information** required
6. **Review text** should be substantive (not just "Great!")
7. **No incentivized reviews** (paid reviews violate guidelines)

**Real-Life Case Study: Trustpilot**

Trustpilot implements review schema for 500,000+ businesses:
- Average rating displayed in search results
- Review count shown (e.g., "Based on 1,234 reviews")
- Star rating appears for 92% of their indexed pages
- Result: 40% higher CTR compared to results without stars

**Common Implementation with WordPress:**

```php
// WordPress - Display reviews with schema
function display_product_reviews($product_id) {
    $reviews = get_reviews($product_id);
    $avg_rating = calculate_average_rating($reviews);
    $review_count = count($reviews);
    
    $schema = [
        "@context" => "https://schema.org",
        "@type" => "Product",
        "name" => get_product_name($product_id),
        "aggregateRating" => [
            "@type" => "AggregateRating",
            "ratingValue" => $avg_rating,
            "reviewCount" => $review_count,
            "bestRating" => "5",
            "worstRating" => "1"
        ]
    ];
    
    echo '<script type="application/ld+json">' . 
         json_encode($schema, JSON_UNESCAPED_SLASHES) . 
         '</script>';
}
```

---

### Local Business Schema

**What is Local Business Schema?**

Local Business schema helps brick-and-mortar businesses appear in local search results with enhanced information like hours, location, ratings, and more.

**Complete Local Business Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Restaurant",
  "name": "Bella Vista Italian Restaurant",
  "image": [
    "https://example.com/restaurant-exterior.jpg",
    "https://example.com/dining-room.jpg",
    "https://example.com/signature-dish.jpg"
  ],
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "789 Culinary Avenue",
    "addressLocality": "San Francisco",
    "addressRegion": "CA",
    "postalCode": "94102",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "37.7749",
    "longitude": "-122.4194"
  },
  "url": "https://www.bellavistarestaurant.com",
  "telephone": "+1-415-555-8888",
  "email": "info@bellavistarestaurant.com",
  "priceRange": "$$$",
  "servesCuisine": "Italian",
  "acceptsReservations": "True",
  "menu": "https://www.bellavistarestaurant.com/menu",
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday"
      ],
      "opens": "11:00",
      "closes": "22:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": [
        "Friday",
        "Saturday"
      ],
      "opens": "11:00",
      "closes": "23:30"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": "Sunday",
      "opens": "10:00",
      "closes": "21:00"
    }
  ],
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.6",
    "reviewCount": "487"
  },
  "paymentAccepted": "Cash, Credit Card, Debit Card",
  "currenciesAccepted": "USD",
  "hasMap": "https://goo.gl/maps/abcd1234",
  "sameAs": [
    "https://www.facebook.com/bellavistarestaurant",
    "https://www.instagram.com/bellavistarestaurant",
    "https://www.yelp.com/biz/bella-vista-restaurant"
  ]
}
</script>
```

**Different Local Business Types:**

```javascript
// Common @type values for specific businesses
"@type": "Restaurant"           // Restaurants
"@type": "Dentist"              // Dental practices
"@type": "Attorney"             // Law firms
"@type": "RealEstateAgent"      // Real estate agencies
"@type": "AutoRepair"           // Auto repair shops
"@type": "HealthAndBeautyBusiness" // Salons, spas
"@type": "Store"                // Retail stores
"@type": "Hotel"                // Hotels
"@type": "GasStation"           // Gas stations
"@type": "BankOrCreditUnion"    // Banks
```

**Multiple Locations (Chain Business):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Starbucks Coffee Company",
  "url": "https://www.starbucks.com",
  "logo": "https://www.starbucks.com/logo.png",
  "location": [
    {
      "@type": "CoffeeShop",
      "name": "Starbucks - Downtown SF",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "1 Market Street",
        "addressLocality": "San Francisco",
        "addressRegion": "CA",
        "postalCode": "94105"
      },
      "telephone": "+1-415-555-0001",
      "openingHours": "Mo-Fr 06:00-20:00, Sa-Su 07:00-19:00"
    },
    {
      "@type": "CoffeeShop",
      "name": "Starbucks - Union Square",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "333 Post Street",
        "addressLocality": "San Francisco",
        "addressRegion": "CA",
        "postalCode": "94108"
      },
      "telephone": "+1-415-555-0002",
      "openingHours": "Mo-Su 06:00-21:00"
    }
  ]
}
</script>
```

**Service Area Business (No Physical Location):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "HomeAndConstructionBusiness",
  "name": "Precision Plumbing Services",
  "description": "Emergency and residential plumbing services",
  "url": "https://www.precisionplumbing.com",
  "telephone": "+1-555-PLUMBER",
  "email": "service@precisionplumbing.com",
  "priceRange": "$$",
  "areaServed": [
    {
      "@type": "City",
      "name": "Los Angeles"
    },
    {
      "@type": "City",
      "name": "Santa Monica"
    },
    {
      "@type": "City",
      "name": "Beverly Hills"
    }
  ],
  "serviceArea": {
    "@type": "GeoCircle",
    "geoMidpoint": {
      "@type": "GeoCoordinates",
      "latitude": "34.0522",
      "longitude": "-118.2437"
    },
    "geoRadius": "25 miles"
  },
  "availableChannel": {
    "@type": "ServiceChannel",
    "availableLanguage": ["English", "Spanish"],
    "servicePhone": {
      "@type": "ContactPoint",
      "telephone": "+1-555-PLUMBER",
      "contactType": "Customer Service",
      "availableLanguage": ["English", "Spanish"]
    }
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ],
      "opens": "00:00",
      "closes": "23:59"
    }
  ],
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Plumbing Services",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Emergency Plumbing",
          "description": "24/7 emergency plumbing repair"
        }
      },
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Drain Cleaning",
          "description": "Professional drain cleaning services"
        }
      }
    ]
  }
}
</script>
```

**Real-Life Success Story:**

**Papa John's Pizza**
- Implemented Local Business schema for 2,500+ locations
- Included menu links, hours, phone numbers, delivery areas
- Result:
  - 22% increase in "near me" search visibility
  - 18% increase in phone calls from Google search
  - Featured in Google Maps local pack 65% more often

**Best Practices:**

1. **NAP Consistency**: Name, Address, Phone must match across:
   - Google Business Profile
   - Website
   - Social media
   - Online directories

2. **Use Specific Business Type**: Don't use generic "LocalBusiness"
   ```javascript
   "@type": "Dentist"  // ✅ Specific
   "@type": "LocalBusiness"  // ❌ Too generic
   ```

3. **Include Opening Hours**: Essential for appearing in "open now" searches

4. **Add Social Profiles**: Include all verified social media URLs in `sameAs`

5. **Update Special Hours**: Holiday hours, temporary closures
   ```javascript
   {
     "@type": "OpeningHoursSpecification",
     "validFrom": "2025-12-24",
     "validThrough": "2025-12-25",
     "opens": "00:00",
     "closes": "00:00" // Closed
   }
   ```

---

### Article Schema

**What is Article Schema?**

Article schema helps news sites, blogs, and content publishers get rich results showing publish date, author, and potentially appearing in Google News, Top Stories carousel, or with article rich results.

**Complete Article Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "10 Revolutionary AI Tools That Will Transform Your Workflow in 2025",
  "alternativeHeadline": "AI Tools 2025: Complete Guide to Productivity Enhancement",
  "image": [
    "https://example.com/article-featured-image-1x1.jpg",
    "https://example.com/article-featured-image-4x3.jpg",
    "https://example.com/article-featured-image-16x9.jpg"
  ],
  "author": {
    "@type": "Person",
    "name": "Sarah Johnson",
    "url": "https://example.com/author/sarah-johnson",
    "jobTitle": "Senior Tech Writer",
    "sameAs": [
      "https://twitter.com/sarahjtech",
      "https://linkedin.com/in/sarahjohnson"
    ]
  },
  "publisher": {
    "@type": "Organization",
    "name": "TechInsights",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo-600x60.png",
      "width": 600,
      "height": 60
    }
  },
  "datePublished": "2024-11-01T08:00:00+00:00",
  "dateModified": "2024-11-02T14:30:00+00:00",
  "description": "Discover the top AI tools revolutionizing productivity in 2025. From content creation to data analysis, learn how these tools can save you 10+ hours per week.",
  "articleBody": "The AI revolution is here, and it's transforming how we work... [full article text]",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://example.com/ai-tools-2025"
  },
  "wordCount": 2847,
  "keywords": "AI tools, productivity, automation, 2025 technology",
  "articleSection": "Technology",
  "inLanguage": "en-US",
  "isAccessibleForFree": "True",
  "hasPart": {
    "@type": "WebPageElement",
    "isAccessibleForFree": "False",
    "cssSelector": ".premium-content"
  }
}
</script>
```

**Article Types:**

```javascript
// Different article types for different content
"@type": "NewsArticle"        // News and journalism
"@type": "BlogPosting"         // Blog posts
"@type": "ScholarlyArticle"    // Academic papers
"@type": "TechArticle"         // Technical documentation
"@type": "Report"              // Research reports
"@type": "OpinionPiece"        // Opinion editorials
```

**NewsArticle Schema (with Live Blog):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "NewsArticle",
  "headline": "Breaking: Major Earthquake Strikes California Coast",
  "image": "https://example.com/earthquake-news.jpg",
  "datePublished": "2025-11-03T10:15:00-08:00",
  "dateModified": "2025-11-03T11:45:00-08:00",
  "author": {
    "@type": "Person",
    "name": "Alex Rivera",
    "jobTitle": "Breaking News Reporter"
  },
  "publisher": {
    "@type": "Organization",
    "name": "National News Network",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  },
  "description": "A magnitude 6.5 earthquake struck off the California coast at 10:12 AM PT. Updates as they develop.",
  "articleSection": "Breaking News",
  "liveBlogUpdate": [
    {
      "@type": "BlogPosting",
      "headline": "Update 11:45 AM: No tsunami warning issued",
      "datePublished": "2025-11-03T11:45:00-08:00",
      "articleBody": "NOAA confirms no tsunami risk for the West Coast..."
    },
    {
      "@type": "BlogPosting",
      "headline": "Update 11:15 AM: Emergency services responding",
      "datePublished": "2025-11-03T11:15:00-08:00",
      "articleBody": "Local emergency services are assessing damage..."
    }
  ],
  "about": {
    "@type": "Event",
    "name": "California Earthquake",
    "startDate": "2025-11-03T10:12:00-08:00",
    "location": {
      "@type": "Place",
      "name": "Pacific Coast, California"
    }
  }
}
</script>
```

**BlogPosting with Series:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "Python for Beginners: Part 3 - Functions and Modules",
  "image": "https://example.com/python-tutorial-part3.jpg",
  "author": {
    "@type": "Person",
    "name": "David Kim",
    "url": "https://example.com/author/david-kim"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Code Academy Blog",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  },
  "datePublished": "2024-10-15",
  "dateModified": "2024-10-20",
  "description": "Learn how to create reusable functions and organize code with modules in Python. Part 3 of our beginner series.",
  "articleBody": "In this tutorial, we'll explore Python functions...",
  "mainEntityOfPage": "https://example.com/python-tutorial-part-3",
  "isPartOf": {
    "@type": "CreativeWorkSeries",
    "name": "Python for Beginners Series",
    "url": "https://example.com/python-tutorial-series"
  },
  "position": "3",
  "hasPart": [
    {
      "@type": "WebPageElement",
      "name": "Defining Functions",
      "url": "https://example.com/python-tutorial-part-3#functions"
    },
    {
      "@type": "WebPageElement",
      "name": "Function Parameters",
      "url": "https://example.com/python-tutorial-part-3#parameters"
    },
    {
      "@type": "WebPageElement",
      "name": "Importing Modules",
      "url": "https://example.com/python-tutorial-part-3#modules"
    }
  ],
  "comment": {
    "@type": "Comment",
    "text": "Great tutorial! The examples really helped clarify functions for me.",
    "author": {
      "@type": "Person",
      "name": "Jessica L."
    },
    "dateCreated": "2024-10-16"
  }
}
</script>
```

**Paywalled Content Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "NewsArticle",
  "headline": "Exclusive Investigation: Inside the Tech Industry",
  "image": "https://example.com/investigation.jpg",
  "author": {
    "@type": "Person",
    "name": "Investigative Team"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Premium News Outlet",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  },
  "datePublished": "2024-11-01",
  "description": "An in-depth look at emerging trends in tech...",
  "isAccessibleForFree": "False",
  "hasPart": [
    {
      "@type": "WebPageElement",
      "isAccessibleForFree": "True",
      "cssSelector": ".free-preview"
    },
    {
      "@type": "WebPageElement",
      "isAccessibleForFree": "False",
      "cssSelector": ".premium-content"
    }
  ]
}
</script>
```

**Required Properties:**

| Property | Description | Example |
|----------|-------------|---------|
| headline | Article title | "10 AI Tools for 2025" |
| image | Featured image(s) | URL to image |
| author | Author info | Person or Organization |
| publisher | Publishing organization | Organization with logo |
| datePublished | Publication date | ISO 8601 format |

**Google's Image Requirements:**

```javascript
// Multiple image sizes recommended
"image": [
  "https://example.com/article-1x1.jpg",    // 1:1 ratio
  "https://example.com/article-4x3.jpg",    // 4:3 ratio
  "https://example.com/article-16x9.jpg"    // 16:9 ratio (recommended)
]

// Minimum dimensions: 1200px wide
// Supported formats: JPG, PNG, WebP
```

**Real-Life Example: The New York Times**

NYT implements comprehensive Article schema:
- NewsArticle type for breaking news
- Author profiles with social links
- Multiple image sizes optimized for Google News
- Live blog updates for developing stories
- Result: Appears in Top Stories carousel 78% of the time for relevant queries

**Benefits:**

1. **Google News Eligibility**: Required for news publishers
2. **Top Stories Carousel**: Potential for prominent placement
3. **Author Recognition**: Links content to author profiles
4. **Rich Results**: Shows publish date, author, and images
5. **AMP Compatibility**: Works with Accelerated Mobile Pages

---

### Breadcrumb Schema

**What is Breadcrumb Schema?**

Breadcrumb schema displays the page's location in the site hierarchy directly in search results, helping users understand page context and site structure.

**Visual Example in Search Results:**

```
https://example.com › products › electronics › laptops › gaming
Gaming Laptops - Best Performance PCs | Example Store
```

**Complete Breadcrumb Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://example.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Products",
      "item": "https://example.com/products"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Electronics",
      "item": "https://example.com/products/electronics"
    },
    {
      "@type": "ListItem",
      "position": 4,
      "name": "Laptops",
      "item": "https://example.com/products/electronics/laptops"
    },
    {
      "@type": "ListItem",
      "position": 5,
      "name": "Gaming Laptops",
      "item": "https://example.com/products/electronics/laptops/gaming"
    }
  ]
}
</script>
```

**Matching HTML Breadcrumbs:**

```html
<!-- Visual breadcrumbs for users -->
<nav aria-label="Breadcrumb">
  <ol class="breadcrumb">
    <li><a href="/">Home</a></li>
    <li><a href="/products">Products</a></li>
    <li><a href="/products/electronics">Electronics</a></li>
    <li><a href="/products/electronics/laptops">Laptops</a></li>
    <li class="active">Gaming Laptops</li>
  </ol>
</nav>

<!-- Schema markup (above) -->
```

**Blog Category Breadcrumbs:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://blog.example.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "SEO Tips",
      "item": "https://blog.example.com/category/seo-tips"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Technical SEO",
      "item": "https://blog.example.com/category/seo-tips/technical-seo"
    },
    {
      "@type": "ListItem",
      "position": 4,
      "name": "Complete Guide to Schema Markup",
      "item": "https://blog.example.com/complete-guide-to-schema-markup"
    }
  ]
}
</script>
```

**E-commerce Product Breadcrumbs:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://shop.example.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Men's Clothing",
      "item": "https://shop.example.com/mens"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Shoes",
      "item": "https://shop.example.com/mens/shoes"
    },
    {
      "@type": "ListItem",
      "position": 4,
      "name": "Running Shoes",
      "item": "https://shop.example.com/mens/shoes/running"
    },
    {
      "@type": "ListItem",
      "position": 5,
      "name": "Nike Air Zoom Pegasus 40",
      "item": "https://shop.example.com/mens/shoes/running/nike-air-zoom-pegasus-40"
    }
  ]
}
</script>
```

**Common Mistakes:**

```javascript
// ❌ WRONG: Missing position
{
  "@type": "ListItem",
  "name": "Products",
  "item": "https://example.com/products"
}

// ❌ WRONG: Positions not sequential
{
  "@type": "ListItem",
  "position": 1,
  "name": "Home"
},
{
  "@type": "ListItem",
  "position": 5,  // Should be 2
  "name": "Products"
}

// ❌ WRONG: Missing last item URL
{
  "@type": "ListItem",
  "position": 3,
  "name": "Gaming Laptops"
  // Missing "item" property
}

// ✅ CORRECT: All items have position and URL
{
  "@type": "ListItem",
  "position": 3,
  "name": "Gaming Laptops",
  "item": "https://example.com/products/electronics/laptops/gaming"
}
```

**Dynamic Breadcrumbs (JavaScript Example):**

```javascript
// Generate breadcrumb schema dynamically
function generateBreadcrumbSchema() {
  const path = window.location.pathname.split('/').filter(p => p);
  const breadcrumbs = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": []
  };
  
  let currentPath = window.location.origin;
  
  // Add home
  breadcrumbs.itemListElement.push({
    "@type": "ListItem",
    "position": 1,
    "name": "Home",
    "item": currentPath
  });
  
  // Add path segments
  path.forEach((segment, index) => {
    currentPath += `/${segment}`;
    breadcrumbs.itemListElement.push({
      "@type": "ListItem",
      "position": index + 2,
      "name": formatSegmentName(segment),
      "item": currentPath
    });
  });
  
  return breadcrumbs;
}

function formatSegmentName(segment) {
  return segment
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

// Insert into page
const schema = document.createElement('script');
schema.type = 'application/ld+json';
schema.text = JSON.stringify(generateBreadcrumbSchema());
document.head.appendChild(schema);
```

**WordPress Implementation:**

```php
// WordPress - Generate breadcrumb schema
function generate_breadcrumb_schema() {
    if (is_front_page()) return;
    
    $breadcrumbs = [
        "@context" => "https://schema.org",
        "@type" => "BreadcrumbList",
        "itemListElement" => []
    ];
    
    $position = 1;
    
    // Home
    $breadcrumbs["itemListElement"][] = [
        "@type" => "ListItem",
        "position" => $position++,
        "name" => "Home",
        "item" => home_url()
    ];
    
    // Category (if applicable)
    if (is_single() && get_post_type() === 'post') {
        $categories = get_the_category();
        if (!empty($categories)) {
            $breadcrumbs["itemListElement"][] = [
                "@type" => "ListItem",
                "position" => $position++,
                "name" => $categories[0]->name,
                "item" => get_category_link($categories[0]->term_id)
            ];
        }
    }
    
    // Current page
    $breadcrumbs["itemListElement"][] = [
        "@type" => "ListItem",
        "position" => $position,
        "name" => get_the_title(),
        "item" => get_permalink()
    ];
    
    echo '<script type="application/ld+json">' . 
         json_encode($breadcrumbs, JSON_UNESCAPED_SLASHES) . 
         '</script>';
}

add_action('wp_head', 'generate_breadcrumb_schema');
```

**Real-Life Example: Amazon**

Amazon uses breadcrumb schema extensively:
```
Amazon.com › Electronics › Computers › Laptops › Gaming Laptops
```

Benefits they see:
- Clearer search result presentation
- Higher CTR (users understand page context)
- Better site architecture understanding by Google

**Best Practices:**

1. **Start with Homepage**: Position 1 should always be home
2. **Sequential Positions**: No gaps (1, 2, 3, not 1, 3, 5)
3. **Include All Levels**: Don't skip intermediate categories
4. **Match Visual Breadcrumbs**: Schema should match what users see
5. **Use Full URLs**: Include complete URLs with https://
6. **Keep Names Short**: Concise, descriptive names (not full page titles)

---

### Video Schema

**What is Video Schema?**

Video schema makes your video content eligible for video rich results, video carousels, and the Google Video search. It can significantly increase video visibility and watch time.

**Complete Video Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "How to Make Perfect Chocolate Chip Cookies",
  "description": "Learn the secret to making bakery-quality chocolate chip cookies at home. This 10-minute tutorial covers ingredient selection, mixing techniques, and baking tips for perfectly crispy on the outside, chewy on the inside cookies.",
  "thumbnailUrl": [
    "https://example.com/video-thumbnail-480x360.jpg",
    "https://example.com/video-thumbnail-960x720.jpg",
    "https://example.com/video-thumbnail-1920x1080.jpg"
  ],
  "uploadDate": "2024-10-15T08:00:00+00:00",
  "duration": "PT10M32S",
  "contentUrl": "https://example.com/videos/chocolate-chip-cookies.mp4",
  "embedUrl": "https://example.com/embed/chocolate-chip-cookies",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 15847
  },
  "publisher": {
    "@type": "Organization",
    "name": "Baking Basics",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  },
  "author": {
    "@type": "Person",
    "name": "Chef Maria Rodriguez",
    "url": "https://example.com/chef-maria"
  },
  "expires": "2026-10-15T00:00:00+00:00",
  "hasPart": [
    {
      "@type": "Clip",
      "name": "Choosing Ingredients",
      "startOffset": 15,
      "endOffset": 120,
      "url": "https://example.com/videos/cookies.mp4#t=15,120"
    },
    {
      "@type": "Clip",
      "name": "Mixing the Dough",
      "startOffset": 120,
      "endOffset": 300,
      "url": "https://example.com/videos/cookies.mp4#t=120,300"
    },
    {
      "@type": "Clip",
      "name": "Baking Tips",
      "startOffset": 300,
      "endOffset": 632,
      "url": "https://example.com/videos/cookies.mp4#t=300,632"
    }
  ],
  "publication": [
    {
      "@type": "BroadcastEvent",
      "isLiveBroadcast": false,
      "startDate": "2024-10-15T08:00:00+00:00",
      "endDate": "2024-10-15T08:15:00+00:00"
    }
  ],
  "regionsAllowed": "US,CA,GB,AU"
}
</script>
```

**Live Stream Video Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Live: SpaceX Rocket Launch Coverage",
  "description": "Watch live coverage of the SpaceX Falcon 9 launch carrying satellites to orbit",
  "thumbnailUrl": "https://example.com/live-stream-thumb.jpg",
  "uploadDate": "2025-11-03T14:00:00+00:00",
  "contentUrl": "https://example.com/live/spacex-launch.m3u8",
  "embedUrl": "https://example.com/embed/live-spacex",
  "publication": {
    "@type": "BroadcastEvent",
    "isLiveBroadcast": true,
    "startDate": "2025-11-03T14:00:00+00:00",
    "endDate": "2025-11-03T16:00:00+00:00"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Space News Network",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  }
}
</script>
```

**Video Playlist Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Complete Python Tutorial Series",
  "description": "Learn Python from beginner to advanced with this comprehensive video series",
  "numberOfItems": 15,
  "itemListElement": [
    {
      "@type": "VideoObject",
      "position": 1,
      "name": "Python Basics: Variables and Data Types",
      "url": "https://example.com/python-tutorial-1",
      "thumbnailUrl": "https://example.com/python-1-thumb.jpg",
      "duration": "PT12M45S",
      "uploadDate": "2024-09-01",
      "contentUrl": "https://example.com/videos/python-1.mp4"
    },
    {
      "@type": "VideoObject",
      "position": 2,
      "name": "Python Basics: Control Flow",
      "url": "https://example.com/python-tutorial-2",
      "thumbnailUrl": "https://example.com/python-2-thumb.jpg",
      "duration": "PT15M20S",
      "uploadDate": "2024-09-08",
      "contentUrl": "https://example.com/videos/python-2.mp4"
    }
  ]
}
</script>
```

**Video with Transcript:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "SEO Best Practices 2025",
  "description": "Complete guide to modern SEO techniques",
  "thumbnailUrl": "https://example.com/seo-video-thumb.jpg",
  "uploadDate": "2024-11-01",
  "duration": "PT25M15S",
  "contentUrl": "https://example.com/videos/seo-2025.mp4",
  "transcript": "Welcome to our SEO guide for 2025. In this video, we'll cover the latest techniques... [full transcript]"
}
</script>
```

**Duration Format (ISO 8601):**

```javascript
// Duration examples
"PT1M30S"     // 1 minute, 30 seconds
"PT10M"       // 10 minutes
"PT1H30M"     // 1 hour, 30 minutes
"PT2H15M30S"  // 2 hours, 15 minutes, 30 seconds

// Formula: PT[hours]H[minutes]M[seconds]S
```

**Thumbnail Requirements:**

```javascript
"thumbnailUrl": [
  "https://example.com/thumb-1920x1080.jpg",  // 16:9 (recommended)
  "https://example.com/thumb-1280x720.jpg",   // HD
  "https://example.com/thumb-640x360.jpg"     // SD
]

// Requirements:
// - Minimum 60x30px
// - Maximum 1920px
// - Supported formats: JPG, PNG, WebP
// - Must be publicly accessible
```

**YouTube Video on Your Website:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Product Review: XYZ Smartphone",
  "description": "In-depth review of the latest XYZ smartphone",
  "thumbnailUrl": "https://i.ytimg.com/vi/VIDEO_ID/maxresdefault.jpg",
  "uploadDate": "2024-10-28",
  "duration": "PT15M20S",
  "contentUrl": "https://www.youtube.com/watch?v=VIDEO_ID",
  "embedUrl": "https://www.youtube.com/embed/VIDEO_ID",
  "publisher": {
    "@type": "Organization",
    "name": "Tech Reviews Channel",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png"
    }
  }
}
</script>

<!-- Embedded video player -->
<iframe width="560" height="315" 
  src="https://www.youtube.com/embed/VIDEO_ID" 
  frameborder="0" allowfullscreen>
</iframe>
```

**Video Chapters/Segments (Seek to Feature):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Complete Web Development Course",
  "description": "Full stack web development from scratch",
  "thumbnailUrl": "https://example.com/course-thumb.jpg",
  "uploadDate": "2024-08-15",
  "duration": "PT3H45M20S",
  "contentUrl": "https://example.com/videos/webdev-course.mp4",
  "hasPart": [
    {
      "@type": "Clip",
      "name": "Introduction to HTML",
      "startOffset": 0,
      "endOffset": 900,
      "url": "https://example.com/videos/webdev-course.mp4#t=0,900"
    },
    {
      "@type": "Clip",
      "name": "CSS Styling Basics",
      "startOffset": 900,
      "endOffset": 2100,
      "url": "https://example.com/videos/webdev-course.mp4#t=900,2100"
    },
    {
      "@type": "Clip",
      "name": "JavaScript Fundamentals",
      "startOffset": 2100,
      "endOffset": 4200,
      "url": "https://example.com/videos/webdev-course.mp4#t=2100,4200"
    },
    {
      "@type": "Clip",
      "name": "Building Your First Website",
      "startOffset": 4200,
      "endOffset": 6300,
      "url": "https://example.com/videos/webdev-course.mp4#t=4200,6300"
    }
  ]
}
</script>
```

**Real-Life Case Study: Tasty (BuzzFeed)**

Tasty implemented Video schema for 10,000+ recipe videos:
- Added detailed descriptions, cooking times, ingredients
- Included key moments/chapters (prep, cooking, serving)
- Result:
  - 45% increase in video views from Google search
  - Videos appear in "How to" search results
  - Featured in video carousels for recipe searches
  - 28% increase in overall organic traffic

**Google's Video Requirements:**

1. **Video must be publicly accessible** (no login required)
2. **Thumbnail must load without JavaScript**
3. **Include structured data on page with video**
4. **Video must be prominently featured** on the page
5. **Use high-quality thumbnails** (1920x1080 recommended)
6. **Provide accurate duration**
7. **Include upload date**

**Common Mistakes:**

```javascript
// ❌ WRONG: Relative URL
"contentUrl": "/videos/my-video.mp4"

// ✅ CORRECT: Full URL
"contentUrl": "https://example.com/videos/my-video.mp4"

// ❌ WRONG: Invalid duration format
"duration": "10:30"

// ✅ CORRECT: ISO 8601 format
"duration": "PT10M30S"

// ❌ WRONG: Missing publisher
{
  "@type": "VideoObject",
  "name": "My Video"
  // Missing publisher info
}

// ✅ CORRECT: Includes publisher
{
  "@type": "VideoObject",
  "name": "My Video",
  "publisher": {
    "@type": "Organization",
    "name": "My Channel",
    "logo": {...}
  }
}
```

---

### Event Schema

**What is Event Schema?**

Event schema helps concerts, conferences, webinars, and other events appear in Google's event search results and Google Calendar integration.

**Complete Event Schema:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "TechCon 2025: Future of AI Conference",
  "description": "Join industry leaders for 3 days of workshops, keynotes, and networking focused on artificial intelligence and machine learning. Learn from top experts, discover cutting-edge research, and connect with innovators.",
  "image": [
    "https://example.com/techcon-banner-1x1.jpg",
    "https://example.com/techcon-banner-4x3.jpg",
    "https://example.com/techcon-banner-16x9.jpg"
  ],
  "startDate": "2025-06-15T09:00:00-07:00",
  "endDate": "2025-06-17T18:00:00-07:00",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "location": {
    "@type": "Place",
    "name": "San Francisco Convention Center",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "747 Howard Street",
      "addressLocality": "San Francisco",
      "addressRegion": "CA",
      "postalCode": "94103",
      "addressCountry": "US"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": "37.7842",
      "longitude": "-122.4016"
    }
  },
  "organizer": {
    "@type": "Organization",
    "name": "Tech Events Inc.",
    "url": "https://www.techevents.com",
    "logo": "https://www.techevents.com/logo.png",
    "contactPoint": {
      "@type": "ContactPoint",
      "telephone": "+1-415-555-1234",
      "contactType": "Customer Service",
      "email": "info@techevents.com"
    }
  },
  "offers": [
    {
      "@type": "Offer",
      "name": "General Admission",
      "price": "299.00",
      "priceCurrency": "USD",
      "availability": "https://schema.org/InStock",
      "validFrom": "2024-12-01T00:00:00-08:00",
      "url": "https://example.com/tickets/general",
      "category": "Primary"
    },
    {
      "@type": "Offer",
      "name": "VIP Pass",
      "price": "599.00",
      "priceCurrency": "USD",
      "availability": "https://schema.org/LimitedAvailability",
      "validFrom": "2024-12-01T00:00:00-08:00",
      "url": "https://example.com/tickets/vip",
      "category": "Primary"
    },
    {
      "@type": "Offer",
      "name": "Student Discount",
      "price": "149.00",
      "priceCurrency": "USD",
      "availability": "https://schema.org/InStock",
      "validFrom": "2024-12-01T00:00:00-08:00",
      "url": "https://example.com/tickets/student",
      "eligibleCustomerType": "https://schema.org/Student"
    }
  ],
  "performer": [
    {
      "@type": "Person",
      "name": "Dr. Jane Smith",
      "description": "AI Research Lead at TechCorp",
      "image": "https://example.com/speakers/jane-smith.jpg"
    },
    {
      "@type": "Person",
      "name": "Prof. Michael Chen",
      "description": "Stanford AI Lab Director",
      "image": "https://example.com/speakers/michael-chen.jpg"
    }
  ],
  "subEvent": [
    {
      "@type": "Event",
      "name": "Opening Keynote: The Future of AGI",
      "startDate": "2025-06-15T09:00:00-07:00",
      "endDate": "2025-06-15T10:30:00-07:00",
      "performer": {
        "@type": "Person",
        "name": "Dr. Jane Smith"
      }
    },
    {
      "@type": "Event",
      "name": "Workshop: Building Ethical AI Systems",
      "startDate": "2025-06-15T14:00:00-07:00",
      "endDate": "2025-06-15T17:00:00-07:00",
      "performer": {
        "@type": "Person",
        "name": "Prof. Michael Chen"
      }
    }
  ],
  "review": {
    "@type": "Review",
    "reviewRating": {
      "@type": "Rating",
      "ratingValue": "4.8",
      "bestRating": "5"
    },
    "author": {
      "@type": "Person",
      "name": "TechCon Attendee 2024"
    },
    "reviewBody": "Incredible conference! Met amazing people and learned cutting-edge AI techniques."
  },
  "typicalAgeRange": "18+"
}
</script>
```

**Virtual Event (Online):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "SEO Masterclass: Rank #1 in 2025",
  "description": "Live online workshop teaching advanced SEO techniques",
  "image": "https://example.com/seo-webinar.jpg",
  "startDate": "2025-12-10T10:00:00-08:00",
  "endDate": "2025-12-10T12:00:00-08:00",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OnlineEventAttendanceMode",
  "location": {
    "@type": "VirtualLocation",
    "url": "https://example.com/webinar/seo-masterclass"
  },
  "organizer": {
    "@type": "Organization",
    "name": "SEO Academy",
    "url": "https://www.seoacademy.com"
  },
  "offers": {
    "@type": "Offer",
    "price": "49.00",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "https://example.com/register/seo-masterclass",
    "validFrom": "2024-11-01T00:00:00-08:00"
  },
  "performer": {
    "@type": "Person",
    "name": "Neil Patel",
    "description": "SEO Expert and Digital Marketer"
  }
}
</script>
```

**Hybrid Event (In-person + Virtual):**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "Global Marketing Summit 2025",
  "description": "Annual marketing conference with in-person and virtual attendance options",
  "image": "https://example.com/summit.jpg",
  "startDate": "2025-09-20T08:00:00-05:00",
  "endDate": "2025-09-22T17:00:00-05:00",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/MixedEventAttendanceMode",
  "location": [
    {
      "@type": "Place",
      "name": "Chicago Convention Center",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "2301 S King Drive",
        "addressLocality": "Chicago",
        "addressRegion": "IL",
        "postalCode": "60616",
        "addressCountry": "US"
      }
    },
    {
      "@type": "VirtualLocation",
      "url": "https://example.com/virtual/marketing-summit"
    }
  ],
  "organizer": {
    "@type": "Organization",
    "name": "Marketing Association"
  },
  "offers": [
    {
      "@type": "Offer",
      "name": "In-Person Ticket",
      "price": "499.00",
      "priceCurrency": "USD",
      "availability": "https://schema.org/InStock",
      "url": "https://example.com/tickets/in-person"
    },
    {
      "@type": "Offer",
      "name": "Virtual Ticket",
      "price": "199.00",
      "priceCurrency": "USD",
      "availability": "https://schema.org/InStock",
      "url": "https://example.com/tickets/virtual"
    }
  ]
}
</script>
```

**Free Event:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "Community Cleanup Day",
  "description": "Join us for a community park cleanup event. All ages welcome!",
  "image": "https://example.com/cleanup.jpg",
  "startDate": "2025-04-15T09:00:00-07:00",
  "endDate": "2025-04-15T13:00:00-07:00",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "location": {
    "@type": "Place",
    "name": "Central Park",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "1234 Park Avenue",
      "addressLocality": "Portland",
      "addressRegion": "OR",
      "postalCode": "97201",
      "addressCountry": "US"
    }
  },
  "organizer": {
    "@type": "Organization",
    "name": "Green Portland Initiative"
  },
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "https://example.com/events/cleanup-registration"
  },
  "isAccessibleForFree": true
}
</script>
```

**Concert/Music Event:**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "MusicEvent",
  "name": "Taylor Swift - The Eras Tour",
  "description": "Taylor Swift performs hits spanning her entire career",
  "image": "https://example.com/eras-tour.jpg",
  "startDate": "2025-08-15T19:00:00-07:00",
  "endDate": "2025-08-15T23:00:00-07:00",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "location": {
    "@type": "Place",
    "name": "SoFi Stadium",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "1001 Stadium Drive",
      "addressLocality": "Inglewood",
      "addressRegion": "CA",
      "postalCode": "90301",
      "addressCountry": "US"
    }
  },
  "performer": {
    "@type": "MusicGroup",
    "name": "Taylor Swift",
    "sameAs": [
      "https://www.taylorswift.com",
      "https://www.instagram.com/taylorswift"
    ]
  },
  "offers": {
    "@type": "AggregateOffer",
    "lowPrice": "79.00",
    "highPrice": "499.00",
    "priceCurrency": "USD",
    "availability": "https://schema.org/SoldOut",
    "url": "https://example.com/tickets/taylor-swift"
  }
}
</script>
```

**Event Status Options:**

```javascript
// Event status values
"https://schema.org/EventScheduled"     // Event is happening as planned
"https://schema.org/EventPostponed"     // Event delayed to future date
"https://schema.org/EventCancelled"     // Event cancelled
"https://schema.org/EventRescheduled"   // Event moved to new date
"https://schema.org/EventMovedOnline"   // Changed to virtual event
```

**Event Attendance Mode:**

```javascript
// Attendance mode options
"https://schema.org/OfflineEventAttendanceMode"  // In-person only
"https://schema.org/OnlineEventAttendanceMode"   // Virtual only
"https://schema.org/MixedEventAttendanceMode"    // Hybrid (both options)
```

**Real-Life Example: Eventbrite**

Eventbrite implements Event schema for millions of events:
- Shows dates, times, locations in search results
- Displays ticket prices and availability
- Integrates with Google Calendar
- Result: 40% of ticket sales come from organic search

**Best Practices:**

1. **Use precise dates/times** with timezone
2. **Include ticket pricing** (even if free)
3. **Add location details** (exact address + coordinates)
4. **Update event status** if cancelled/postponed
5. **Use high-quality event images** (16:9 ratio)
6. **Include organizer contact info**

---

## Testing and Validation

**Essential Tools:**

**1. Google Rich Results Test**
```
https://search.google.com/test/rich-results
```
- Test any URL or code snippet
- Shows if eligible for rich results
- Identifies errors and warnings

**2. Schema Markup Validator**
```
https://validator.schema.org/
```
- Validates JSON-LD, Microdata, RDFa
- Shows detailed error messages
- Official Schema.org tool

**3. Google Search Console**
- View rich result status for your entire site
- Monitor errors and warnings
- Track rich result impressions and clicks

**Common Errors and Fixes:**

```javascript
// Error: Missing required field
// Fix: Add all required properties
{
  "@type": "Product",
  "name": "Widget",  // ✅ Required
  "image": "...",    // ✅ Required
  "offers": {...}    // ✅ Required
}

// Error: Invalid date format
// Wrong: "2024-11-03"
// Correct: "2024-11-03T10:00:00-08:00"

// Error: Invalid URL
// Wrong: "www.example.com"
// Correct: "https://www.example.com"

// Error: Price must be a number
// Wrong: "price": "$29.99"
// Correct: "price": "29.99", "priceCurrency": "USD"
```

---

## Summary

**Key Takeaways:**

1. **HTTPS is mandatory** - SSL certificates are a ranking signal and build trust
2. **Security headers protect** users and improve site security
3. **Structured data helps** search engines understand your content
4. **JSON-LD is preferred** - Easiest to implement and maintain
5. **Rich snippets increase CTR** by 15-35% on average
6. **Test everything** - Use Google's validation tools
7. **Keep schema updated** - When content changes, update schema
8. **Follow guidelines** - Violations can result in manual penalties

**Implementation Priority:**

1. **Week 1**: Migrate to HTTPS, configure security headers
2. **Week 2**: Add Organization/LocalBusiness schema
3. **Week 3**: Implement Article/BlogPosting for content
4. **Week 4**: Add Product schema (if e-commerce)
5. **Week 5**: Implement FAQ and Breadcrumb schema
6. **Week 6**: Add Review and Rating schema
7. **Ongoing**: Monitor Search Console, fix errors, test new schema types

**Resources:**

- Schema.org Documentation: https://schema.org/docs/documents.html
- Google Search Central: https://developers.google.com/search/docs/appearance/structured-data
- JSON-LD Playground: https://json-ld.org/playground/
- Let's Encrypt (Free SSL): https://letsencrypt.org/

---

## Additional Examples

**Multi-page Implementation Strategy:**

```
Homepage:
├── Organization Schema
├── WebSite Schema (with Sitelinks Search Box)
└── Logo Schema

Product Pages:
├── Product Schema
├── Breadcrumb Schema
├── Review/AggregateRating Schema
└── FAQ Schema (if applicable)

Blog Posts:
├── Article Schema
├── Breadcrumb Schema
├── Author (Person) Schema
└── Organization (Publisher) Schema

Local Business:
├── LocalBusiness Schema
├── GeoCoordinates
├── Opening Hours
└── AggregateRating Schema

Event Pages:
├── Event Schema
├── Organization (Organizer) Schema
└── Offer Schema (tickets)
```

This comprehensive guide covers everything you need to master HTTPS security and structured data for SEO. Implement these techniques to improve your search visibility, security, and user trust!
