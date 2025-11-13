# Technical SEO: HTTPS Security & Structured Data Guide

## 2.6 Structured Data and Schema Markup

---


### Schema.org Vocabulary

**What is Schema.org?**

Schema.org is a collaborative project between Google, Microsoft, Yahoo, and Yandex that provides a universal vocabulary for structured data. It defines hundreds of item types and properties.

**Schema.org Hierarchy:**

```
Thing (Root type)
├── CreativeWork
│   ├── Article
│   │   ├── NewsArticle
│   │   ├── BlogPosting
│   │   └── ScholarlyArticle
│   ├── Book
│   ├── Movie
│   ├── MusicRecording
│   └── VideoObject
├── Event
│   ├── BusinessEvent
│   ├── MusicEvent
│   └── SportsEvent
├── Organization
│   ├── Corporation
│   ├── LocalBusiness
│   │   ├── Restaurant
│   │   ├── Store
│   │   └── FoodEstablishment
│   └── EducationalOrganization
├── Person
├── Place
│   ├── LocalBusiness
│   └── Residence
└── Product
    ├── IndividualProduct
    └── ProductModel
```

**Common Schema Types:**

| Schema Type | Use Case | Example |
|-------------|----------|---------|
| Article | Blog posts, news | "10 SEO Tips" blog post |
| Product | E-commerce items | iPhone 15 Pro product page |
| LocalBusiness | Physical stores | Restaurant, Dental office |
| Event | Concerts, webinars | "SEO Conference 2025" |
| Recipe | Cooking instructions | "Chocolate Chip Cookies" |
| Review | Product/service reviews | 4.5-star restaurant review |
| VideoObject | Video content | YouTube video on your site |
| FAQPage | Q&A content | Support page with FAQs |
| Organization | Company info | About Us page |
| Person | Individual profiles | Author bio page |

**Schema Properties:**

```json
// Every schema type has specific properties
{
  "@type": "Product",
  "name": "Product name (required)",
  "image": "Image URL (required)",
  "description": "Product description (required)",
  "brand": "Brand name (recommended)",
  "offers": {
    "@type": "Offer",
    "price": "29.99 (recommended)",
    "priceCurrency": "USD (recommended)"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.5 (optional)",
    "reviewCount": "128 (optional)"
  }
}
```
