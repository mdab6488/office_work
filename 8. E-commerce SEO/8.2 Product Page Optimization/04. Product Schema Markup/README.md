
### 🏷️ Product Schema Markup

Schema markup (structured data) helps search engines understand your products and can earn rich snippets in search results.

#### What is Product Schema?

Product schema is code that describes your product's details in a format search engines can easily read.

**Benefits:**
- ⭐ Star ratings in search results
- 💰 Price display in SERPs
- ✅ Stock availability
- 🚚 Shipping information
- 📊 Increased click-through rates (up to 30%)

#### Real-Life Example: Rich Snippets in Google

When you search for "Sony WH-1000XM5," you'll see results with:
- Star rating (4.7 ⭐⭐⭐⭐⭐)
- Number of reviews (3,542 reviews)
- Price ($399.99)
- Stock status (In stock)

This is powered by Product schema markup.

#### Basic Product Schema Example

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "Nike Air Zoom Pegasus 39",
  "image": [
    "https://example.com/photos/nike-pegasus-main.jpg",
    "https://example.com/photos/nike-pegasus-side.jpg",
    "https://example.com/photos/nike-pegasus-top.jpg"
  ],
  "description": "The Nike Air Zoom Pegasus 39 delivers responsive cushioning and smooth transitions mile after mile. Perfect for everyday runs and long-distance training.",
  "sku": "0446310786",
  "mpn": "925872",
  "brand": {
    "@type": "Brand",
    "name": "Nike"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/nike-air-zoom-pegasus-39",
    "priceCurrency": "USD",
    "price": "129.99",
    "priceValidUntil": "2025-12-31",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition",
    "seller": {
      "@type": "Organization",
      "name": "Example Sports Store"
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.6",
    "reviewCount": "1543"
  },
  "review": {
    "@type": "Review",
    "reviewRating": {
      "@type": "Rating",
      "ratingValue": "5",
      "bestRating": "5"
    },
    "author": {
      "@type": "Person",
      "name": "John Marathon"
    },
    "reviewBody": "Best running shoes I've ever owned. The cushioning is perfect for long distances and they're incredibly lightweight."
  }
}
</script>
```

#### Advanced Product Schema: Complete Example

Here's a comprehensive schema from a real product:

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "Apple MacBook Pro 14-inch M3 Pro",
  "image": [
    "https://example.com/macbook-pro-14-m3-front.jpg",
    "https://example.com/macbook-pro-14-m3-side.jpg",
    "https://example.com/macbook-pro-14-m3-open.jpg",
    "https://example.com/macbook-pro-14-m3-display.jpg"
  ],
  "description": "The 14-inch MacBook Pro with M3 Pro chip delivers exceptional performance for developers, creators, and professionals. Features stunning Liquid Retina XDR display, up to 18 hours battery life, and advanced connectivity.",
  "sku": "MRX33LL/A",
  "mpn": "MRX33LL/A",
  "gtin13": "195949041327",
  "brand": {
    "@type": "Brand",
    "name": "Apple",
    "logo": "https://example.com/apple-logo.png"
  },
  "manufacturer": {
    "@type": "Organization",
    "name": "Apple Inc."
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/macbook-pro-14-m3",
    "priceCurrency": "USD",
    "price": "1999.00",
    "priceValidUntil": "2025-12-31",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition",
    "shippingDetails": {
      "@type": "OfferShippingDetails",
      "shippingRate": {
        "@type": "MonetaryAmount",
        "value": "0.00",
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
          "minValue": 0,
          "maxValue": 1,
          "unitCode": "DAY"
        },
        "transitTime": {
          "@type": "QuantitativeValue",
          "minValue": 2,
          "maxValue": 5,
          "unitCode": "DAY"
        }
      }
    },
    "hasMerchantReturnPolicy": {
      "@type": "MerchantReturnPolicy",
      "returnPolicyCategory": "https://schema.org/MerchantReturnFiniteReturnWindow",
      "merchantReturnDays": 30,
      "returnMethod": "https://schema.org/ReturnByMail",
      "returnFees": "https://schema.org/FreeReturn"
    },
    "seller": {
      "@type": "Organization",
      "name": "Example Electronics"
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "reviewCount": "2847",
    "bestRating": "5",
    "worstRating": "1"
  },
  "review": [
    {
      "@type": "Review",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5",
        "bestRating": "5"
      },
      "author": {
        "@type": "Person",
        "name": "Sarah Developer"
      },
      "datePublished": "2024-11-01",
      "reviewBody": "This MacBook Pro is incredibly fast. Compiling large projects that took minutes now takes seconds. The display is gorgeous and battery life is outstanding."
    }
  ],
  "additionalProperty": [
    {
      "@type": "PropertyValue",
      "name": "Processor",
      "value": "Apple M3 Pro chip"
    },
    {
      "@type": "PropertyValue",
      "name": "Memory",
      "value": "18GB Unified Memory"
    },
    {
      "@type": "PropertyValue",
      "name": "Storage",
      "value": "512GB SSD"
    },
    {
      "@type": "PropertyValue",
      "name": "Display",
      "value": "14.2-inch Liquid Retina XDR"
    },
    {
      "@type": "PropertyValue",
      "name": "Weight",
      "value": "3.5 pounds"
    }
  ],
  "color": "Space Black",
  "weight": {
    "@type": "QuantitativeValue",
    "value": "3.5",
    "unitCode": "LBR"
  }
}
</script>
```

#### Product Variants Schema

For products with multiple variants (size, color, etc.):

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Product",
  "name": "Classic Cotton T-Shirt",
  "image": "https://example.com/tshirt-main.jpg",
  "description": "Premium 100% cotton t-shirt in various colors and sizes",
  "brand": {
    "@type": "Brand",
    "name": "ComfortWear"
  },
  "offers": {
    "@type": "AggregateOffer",
    "priceCurrency": "USD",
    "lowPrice": "24.99",
    "highPrice": "29.99",
    "offerCount": "12",
    "offers": [
      {
        "@type": "Offer",
        "sku": "TSHIRT-BLACK-S",
        "price": "24.99",
        "priceCurrency": "USD",
        "availability": "https://schema.org/InStock",
        "url": "https://example.com/tshirt?color=black&size=S",
        "itemOffered": {
          "@type": "Product",
          "name": "Classic Cotton T-Shirt - Black - Small",
          "color": "Black",
          "size": "Small"
        }
      },
      {
        "@type": "Offer",
        "sku": "TSHIRT-BLACK-M",
        "price": "24.99",
        "priceCurrency": "USD",
        "availability": "https://schema.org/InStock",
        "url": "https://example.com/tshirt?color=black&size=M",
        "itemOffered": {
          "@type": "Product",
          "name": "Classic Cotton T-Shirt - Black - Medium",
          "color": "Black",
          "size": "Medium"
        }
      }
    ]
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.5",
    "reviewCount": "567"
  }
}
</script>
```

#### Testing Schema Markup

**1. Google Rich Results Test**
```
URL: https://search.google.com/test/rich-results
→ Paste your URL or code
→ Check for errors and warnings
→ Preview how it appears in search
```

**2. Schema.org Validator**
```
URL: https://validator.schema.org/
→ Validate syntax
→ Check for required properties
```

**3. Common Errors to Avoid**

❌ **Missing Required Fields:**
```json
// Missing price
"offers": {
  "@type": "Offer",
  "availability": "https://schema.org/InStock"
  // Error: price is required!
}
```

❌ **Wrong Data Type:**
```json
// Price should be string or number, not object
"price": {
  "amount": "29.99"  // Wrong!
}

// Correct:
"price": "29.99"  // Right!
```

❌ **Invalid URL Format:**
```json
"availability": "In Stock"  // Wrong!
"availability": "https://schema.org/InStock"  // Right!
```

#### Real-Life Example: Best Buy Schema

Best Buy implements comprehensive schema markup:

**Product Page:** Best Buy's Sony TV listing

```json
{
  "@type": "Product",
  "name": "Sony - 65\" Class BRAVIA XR A80L OLED 4K HDR Google TV",
  "image": [...],
  "offers": {
    "@type": "Offer",
    "price": "1799.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "seller": {
      "@type": "Organization",
      "name": "Best Buy"
    },
    "priceValidUntil": "2025-12-31"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "543"
  },
  // Additional warranty information
  "additionalProperty": [
    {
      "@type": "PropertyValue",
      "name": "Screen Size",
      "value": "65 inches"
    },
    {
      "@type": "PropertyValue",
      "name": "Resolution",
      "value": "4K Ultra HD"
    }
  ]
}
```

**Result in Google Search:**
```
Best Buy: Sony 65" OLED TV
★★★★★ 4.7 (543) · In stock
$1,799.99 · Free shipping
65-inch 4K OLED TV with Google TV. Features stunning picture quality...
```

---
