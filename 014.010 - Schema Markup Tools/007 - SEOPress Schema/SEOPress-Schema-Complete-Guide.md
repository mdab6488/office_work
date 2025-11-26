# SEOPress Schema Markup - Complete Technical Guide

## Table of Contents
1. [Overview](#overview)
2. [Core Features](#core-features)
3. [Installation & Setup](#installation--setup)
4. [Schema Types & Templates](#schema-types--templates)
5. [Implementation Methods](#implementation-methods)
6. [Real-Life Examples](#real-life-examples)
7. [Advanced Configurations](#advanced-configurations)
8. [Dynamic Schema Implementation](#dynamic-schema-implementation)
9. [SEO Impact & Benefits](#seo-impact--benefits)
10. [Troubleshooting & Validation](#troubleshooting--validation)
11. [Best Practices](#best-practices)
12. [Performance Optimization](#performance-optimization)

---

## Overview

### What is SEOPress Schema?

SEOPress Schema is a comprehensive structured data implementation module within the SEOPress WordPress plugin that enables automated and manual schema markup generation. It translates your content into machine-readable JSON-LD format that search engines use to create rich results.

### Why Schema Markup Matters

- **Enhanced SERP Visibility**: Rich snippets, knowledge panels, and featured snippets
- **CTR Improvement**: Visual elements in search results increase click-through rates by 30-40%
- **Voice Search Optimization**: Structured data helps voice assistants understand content
- **Google Discovery**: Better content categorization for Google Discover feed
- **E-commerce Advantage**: Product schema enables price drops, availability, and review stars

### Technical Architecture

SEOPress Schema uses:
- **JSON-LD Format**: Recommended by Google (not Microdata or RDFa)
- **Dynamic Variables**: Automatically pulls from WordPress data
- **Conditional Logic**: Schema types adapt based on content type
- **Global & Local Scopes**: Organization-wide and page-specific schemas

---

## Core Features

### 1. Automatic Schema Generation

```
Post Types Supported:
├── Posts → Article Schema
├── Pages → WebPage Schema
├── Products → Product/Offer Schema
├── Custom Post Types → Customizable
└── Archives → CollectionPage Schema
```

### 2. Manual Schema Builder

- **Visual Editor**: No code required for basic implementation
- **Custom Fields Mapping**: Connect ACF, Metabox, Pods fields to schema properties
- **Template System**: Reusable schema configurations
- **Multi-schema Support**: Add multiple schema types per page

### 3. Supported Schema Types (30+)

#### Content Schemas
- Article (NewsArticle, BlogPosting)
- WebPage
- FAQ
- HowTo
- Review
- Video
- Event
- Course

#### Business Schemas
- LocalBusiness (with 150+ sub-types)
- Organization
- Person
- Product
- Offer
- Service

#### Technical Schemas
- BreadcrumbList
- SiteNavigationElement
- SearchAction
- Website

---

## Installation & Setup

### Initial Configuration

**Step 1: Enable Schema Module**
```
WordPress Dashboard → SEOPress → PRO Features
└── Enable "Structured Data Types (JSON-LD)"
```

**Step 2: Global Schema Setup**
```
SEOPress → PRO → Schemas
└── Add Organization Schema (Required)
    ├── Organization Name
    ├── Logo URL (Recommended: 600x60px - 1200x120px)
    ├── Contact Information
    ├── Social Profile URLs
    └── Knowledge Graph Type
```

**Step 3: Default Schema Configuration**
```
SEOPress → PRO → Schemas → Automatic Schemas
└── Configure default schemas for:
    ├── Posts (Article Schema)
    ├── Pages (WebPage Schema)
    ├── Homepage (Website Schema)
    └── Products (if WooCommerce active)
```

---

## Schema Types & Templates

### Article Schema - Deep Dive

**Automatic Implementation:**
SEOPress auto-generates Article schema for blog posts using:

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "%%post_title%%",
  "description": "%%post_excerpt%%",
  "image": "%%post_thumbnail_url%%",
  "datePublished": "%%post_date%%",
  "dateModified": "%%post_modified_date%%",
  "author": {
    "@type": "Person",
    "name": "%%post_author%%"
  },
  "publisher": {
    "@type": "Organization",
    "name": "%%sitename%%",
    "logo": {
      "@type": "ImageObject",
      "url": "%%site_logo%%"
    }
  },
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "%%post_url%%"
  }
}
```

**Dynamic Variables Available:**
- `%%post_title%%` - Post title
- `%%post_excerpt%%` - Post excerpt
- `%%post_content%%` - Full post content
- `%%post_thumbnail_url%%` - Featured image URL
- `%%post_date%%` - Publication date (ISO 8601)
- `%%post_modified_date%%` - Last modified date
- `%%post_author%%` - Author display name
- `%%post_url%%` - Permalink
- `%%sitename%%` - Site name from WordPress settings

### LocalBusiness Schema - Complete Setup

**Manual Configuration Required:**

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Your Business Name",
  "image": "https://example.com/business-image.jpg",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Main Street",
    "addressLocality": "City Name",
    "addressRegion": "State",
    "postalCode": "12345",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "40.7128",
    "longitude": "-74.0060"
  },
  "url": "https://example.com",
  "telephone": "+1-555-555-5555",
  "priceRange": "$$",
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      "opens": "09:00",
      "closes": "18:00"
    }
  ]
}
```

**Sub-types Available (150+):**
- Restaurant, Cafe, FastFoodRestaurant
- MedicalClinic, Dentist, Hospital
- LegalService, Attorney
- AutomotiveBusiness, AutoRepair
- BeautySalon, HairSalon, TattooParlor
- RealEstateAgent, MovingCompany

### Product Schema (WooCommerce Integration)

**Automatic Features:**
```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "%%wc_product_name%%",
  "image": "%%wc_product_image%%",
  "description": "%%wc_product_short_desc%%",
  "sku": "%%wc_product_sku%%",
  "brand": {
    "@type": "Brand",
    "name": "%%wc_product_brand%%"
  },
  "offers": {
    "@type": "Offer",
    "url": "%%wc_product_url%%",
    "priceCurrency": "%%wc_currency%%",
    "price": "%%wc_product_price%%",
    "availability": "%%wc_stock_status%%",
    "priceValidUntil": "%%wc_sale_end_date%%"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "%%wc_average_rating%%",
    "reviewCount": "%%wc_review_count%%"
  }
}
```

### FAQ Schema - User Experience Booster

**Implementation Strategy:**

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How do I install SEOPress?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Navigate to WordPress Dashboard → Plugins → Add New, search for 'SEOPress', click Install, then Activate."
      }
    },
    {
      "@type": "Question",
      "name": "Does SEOPress work with WooCommerce?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes, SEOPress has native WooCommerce integration with automatic product schema generation."
      }
    }
  ]
}
```

**Pro Tip:** Google shows up to 2 FAQ results per page in rich snippets.

### HowTo Schema - Tutorial Content

**Use Case:** Step-by-step guides, tutorials, recipes

```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "How to Optimize Images for SEO",
  "description": "Complete guide to image optimization",
  "image": "https://example.com/tutorial-image.jpg",
  "totalTime": "PT30M",
  "estimatedCost": {
    "@type": "MonetaryAmount",
    "currency": "USD",
    "value": "0"
  },
  "tool": [
    {
      "@type": "HowToTool",
      "name": "Image compression software"
    }
  ],
  "step": [
    {
      "@type": "HowToStep",
      "name": "Resize Image",
      "text": "Resize your image to appropriate dimensions",
      "image": "https://example.com/step1.jpg",
      "url": "https://example.com/guide#step1"
    },
    {
      "@type": "HowToStep",
      "name": "Compress Image",
      "text": "Use compression tools to reduce file size",
      "image": "https://example.com/step2.jpg",
      "url": "https://example.com/guide#step2"
    }
  ]
}
```

### Video Schema - YouTube Integration

```json
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "%%video_title%%",
  "description": "%%video_description%%",
  "thumbnailUrl": "%%video_thumbnail%%",
  "uploadDate": "%%video_date%%",
  "duration": "PT8M30S",
  "contentUrl": "%%video_url%%",
  "embedUrl": "%%video_embed_url%%",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 5647018
  }
}
```

---

## Implementation Methods

### Method 1: Automatic Schemas (Recommended for Standard Content)

**Configuration Path:**
```
SEOPress → PRO → Schemas → Automatic Schemas
```

**Setup Process:**

1. **Enable Post Type Schemas**
   - Posts → Article Schema (Auto-enabled)
   - Pages → WebPage Schema (Auto-enabled)
   - Products → Product Schema (If WooCommerce)

2. **Configure Default Values**
   ```
   Article Schema Settings:
   ├── Article Type: BlogPosting (default) or NewsArticle
   ├── Author: Use post author (recommended)
   ├── Publisher: Site organization
   ├── Image: Featured image (fallback: site logo)
   └── Date Modified: Auto-update on content changes
   ```

3. **Test Implementation**
   - Publish/update a post
   - View source code
   - Look for `<script type="application/ld+json">` in `<head>`

**Automatic Schema Priority:**
```
Individual Page Schema > Post Type Default > Global Schema
```

### Method 2: Manual Schema Builder (Advanced Control)

**Use Cases:**
- Custom schema types not auto-generated
- Complex nested schemas
- Multiple schemas per page
- Dynamic content from custom fields

**Implementation Steps:**

**Step 1: Create New Schema**
```
SEOPress → PRO → Schemas → Add New Schema
```

**Step 2: Select Schema Type**
- Choose from 30+ predefined templates
- Or use Custom JSON-LD for unsupported types

**Step 3: Configure Schema Properties**

Example: Event Schema
```
SEOPress Manual Schema Builder:
├── Schema Type: Event
├── Name: %%custom_field_event_name%%
├── Start Date: %%custom_field_event_start%%
├── End Date: %%custom_field_event_end%%
├── Location:
│   ├── Type: Place
│   ├── Name: %%custom_field_venue_name%%
│   └── Address: %%custom_field_venue_address%%
├── Organizer:
│   ├── Type: Organization
│   └── Name: %%sitename%%
└── Offers:
    ├── Price: %%custom_field_ticket_price%%
    ├── Currency: USD
    └── Availability: %%custom_field_ticket_status%%
```

**Step 4: Set Display Conditions**
```
Display Rules:
├── Post Types: [Select: Events]
├── Taxonomies: All categories
├── Specific Posts: [Optional]
└── User Roles: All users
```

### Method 3: Custom JSON-LD (Maximum Flexibility)

**When to Use:**
- Unsupported schema types
- Complex nested structures
- Third-party integrations
- Dynamic data from external APIs

**Implementation:**

```php
// In your theme's functions.php or custom plugin

function custom_recipe_schema() {
    if (is_singular('recipe')) {
        $recipe_data = array(
            '@context' => 'https://schema.org',
            '@type' => 'Recipe',
            'name' => get_the_title(),
            'image' => get_the_post_thumbnail_url(get_the_ID(), 'full'),
            'author' => array(
                '@type' => 'Person',
                'name' => get_the_author()
            ),
            'datePublished' => get_the_date('c'),
            'description' => get_the_excerpt(),
            'recipeYield' => get_post_meta(get_the_ID(), 'recipe_servings', true),
            'prepTime' => 'PT' . get_post_meta(get_the_ID(), 'prep_time', true) . 'M',
            'cookTime' => 'PT' . get_post_meta(get_the_ID(), 'cook_time', true) . 'M',
            'totalTime' => 'PT' . get_post_meta(get_the_ID(), 'total_time', true) . 'M',
            'recipeIngredient' => explode("\n", get_post_meta(get_the_ID(), 'ingredients', true)),
            'recipeInstructions' => array_map(function($step, $index) {
                return array(
                    '@type' => 'HowToStep',
                    'position' => $index + 1,
                    'text' => $step
                );
            }, explode("\n", get_post_meta(get_the_ID(), 'instructions', true)), array_keys(explode("\n", get_post_meta(get_the_ID(), 'instructions', true)))),
            'nutrition' => array(
                '@type' => 'NutritionInformation',
                'calories' => get_post_meta(get_the_ID(), 'calories', true) . ' calories'
            )
        );
        
        echo '<script type="application/ld+json">' . wp_json_encode($recipe_data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT) . '</script>';
    }
}
add_action('wp_head', 'custom_recipe_schema');
```

---

## Real-Life Examples

### Example 1: E-commerce Product Page (Complete Setup)

**Scenario:** Online electronics store selling smartphones

**Schema Implementation:**

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Samsung Galaxy S23 Ultra 5G",
  "image": [
    "https://example.com/images/galaxy-s23-ultra-front.jpg",
    "https://example.com/images/galaxy-s23-ultra-back.jpg",
    "https://example.com/images/galaxy-s23-ultra-side.jpg"
  ],
  "description": "Experience the ultimate flagship smartphone with 200MP camera, S Pen integration, and powerful Snapdragon 8 Gen 2 processor.",
  "sku": "SM-S918UZKAXAA",
  "mpn": "SM-S918U",
  "brand": {
    "@type": "Brand",
    "name": "Samsung"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/product/galaxy-s23-ultra",
    "priceCurrency": "USD",
    "price": "1199.99",
    "priceValidUntil": "2025-12-31",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition",
    "seller": {
      "@type": "Organization",
      "name": "TechStore"
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "1523"
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
        "name": "John Smith"
      },
      "datePublished": "2024-03-15",
      "reviewBody": "Best smartphone I've ever owned. Camera quality is exceptional."
    }
  ]
}
```

**SEOPress Configuration:**
```
SEOPress → PRO → Schemas → WooCommerce Product
├── Enable Product Schema: ✓
├── Include Reviews: ✓ (Auto-pull from WooCommerce)
├── Brand Field: Custom Field: _product_brand
├── SKU: Auto (from WooCommerce)
└── Images: Featured + Gallery images
```

**Result:** Rich snippet with price, availability, ratings, and image carousel

---

### Example 2: Local Service Business (Dental Clinic)

**Scenario:** Multi-location dental practice

**Homepage Schema:**

```json
{
  "@context": "https://schema.org",
  "@type": "Dentist",
  "name": "Bright Smile Dental Clinic",
  "image": "https://brightsmile.com/logo.png",
  "url": "https://brightsmile.com",
  "telephone": "+1-555-DENTAL-1",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "456 Healthcare Plaza",
    "addressLocality": "Los Angeles",
    "addressRegion": "CA",
    "postalCode": "90001",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "34.0522",
    "longitude": "-118.2437"
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday"],
      "opens": "08:00",
      "closes": "18:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": "Friday",
      "opens": "08:00",
      "closes": "15:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": "Saturday",
      "opens": "09:00",
      "closes": "13:00"
    }
  ],
  "sameAs": [
    "https://facebook.com/brightsmile",
    "https://instagram.com/brightsmile",
    "https://twitter.com/brightsmile"
  ],
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Dental Services",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "General Dentistry",
          "description": "Comprehensive dental care including cleanings, fillings, and preventive care"
        }
      },
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Cosmetic Dentistry",
          "description": "Teeth whitening, veneers, and smile makeovers"
        }
      }
    ]
  }
}
```

**Service Pages Schema:**

```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "serviceType": "Teeth Whitening",
  "provider": {
    "@type": "Dentist",
    "name": "Bright Smile Dental Clinic"
  },
  "areaServed": {
    "@type": "City",
    "name": "Los Angeles"
  },
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Teeth Whitening Options",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "In-Office Whitening",
          "description": "Professional-grade whitening completed in one visit"
        },
        "price": "500",
        "priceCurrency": "USD"
      }
    ]
  }
}
```

**SEOPress Setup:**
```
Location 1 (Main Schema):
SEOPress → PRO → Schemas → Add Manual Schema
├── Type: Dentist
├── Name: Bright Smile Dental Clinic
├── Address: Manual entry
├── Coordinates: Use Google Maps API
└── Display: Homepage only

Service Pages (Template):
├── Type: Service
├── Service Type: %%page_title%%
├── Provider: Reference main LocalBusiness
└── Display: Service category pages
```

---

### Example 3: Content Publishing Site (News/Blog)

**Scenario:** Technology news website with multiple article types

**NewsArticle Schema:**

```json
{
  "@context": "https://schema.org",
  "@type": "NewsArticle",
  "headline": "Apple Announces Revolutionary AI Features in iOS 18",
  "alternativeHeadline": "iOS 18 Brings On-Device AI Processing",
  "image": {
    "@type": "ImageObject",
    "url": "https://technews.com/apple-ios18.jpg",
    "height": 675,
    "width": 1200
  },
  "datePublished": "2025-06-10T09:00:00+00:00",
  "dateModified": "2025-06-10T14:30:00+00:00",
  "author": {
    "@type": "Person",
    "name": "Sarah Johnson",
    "url": "https://technews.com/author/sarah-johnson",
    "jobTitle": "Senior Technology Reporter",
    "image": "https://technews.com/authors/sarah-johnson.jpg"
  },
  "publisher": {
    "@type": "Organization",
    "name": "TechNews Daily",
    "logo": {
      "@type": "ImageObject",
      "url": "https://technews.com/logo-amp.png",
      "width": 600,
      "height": 60
    }
  },
  "description": "Apple unveils groundbreaking AI capabilities that process data entirely on-device, marking a significant shift in mobile AI technology.",
  "articleBody": "[Full article text here]",
  "articleSection": "Technology",
  "wordCount": 1250,
  "keywords": ["Apple", "iOS 18", "Artificial Intelligence", "Privacy", "On-Device Processing"],
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://technews.com/apple-ios18-ai-features"
  },
  "speakable": {
    "@type": "SpeakableSpecification",
    "cssSelector": [".article-headline", ".article-summary"]
  }
}
```

**Breadcrumb Schema (Auto-Generated):**

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://technews.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Technology",
      "item": "https://technews.com/category/technology"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Apple iOS 18 AI Features",
      "item": "https://technews.com/apple-ios18-ai-features"
    }
  ]
}
```

**SEOPress Configuration:**
```
Automatic Article Schema:
SEOPress → PRO → Schemas → Automatic
├── Post Type: Posts
├── Schema Type: NewsArticle (for news sites) or BlogPosting
├── Author Schema: Enable individual author pages
├── Publisher Logo: 600x60px minimum
├── Article Section: Auto-map to category
└── Word Count: Auto-calculate

Breadcrumbs:
SEOPress → Appearance → Breadcrumbs
├── Enable Breadcrumbs: ✓
├── Home Text: "Home"
├── Taxonomy Priority: Category > Tag
└── Separator: " / "
```

---

### Example 4: Educational Platform (Online Courses)

**Scenario:** E-learning platform with courses and instructors

**Course Schema:**

```json
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": "Complete Digital Marketing Masterclass 2025",
  "description": "Master SEO, PPC, Social Media Marketing, and Analytics with 40+ hours of comprehensive training",
  "provider": {
    "@type": "Organization",
    "name": "Digital Marketing Academy",
    "sameAs": "https://dma-academy.com"
  },
  "image": "https://dma-academy.com/courses/digital-marketing-cover.jpg",
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "ratingCount": "3420"
  },
  "offers": {
    "@type": "Offer",
    "category": "Paid",
    "price": "199.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "https://dma-academy.com/courses/digital-marketing",
    "validFrom": "2025-01-01"
  },
  "hasCourseInstance": {
    "@type": "CourseInstance",
    "courseMode": "Online",
    "courseWorkload": "PT40H",
    "instructor": {
      "@type": "Person",
      "name": "Michael Chen",
      "description": "15+ years in digital marketing",
      "image": "https://dma-academy.com/instructors/michael-chen.jpg"
    }
  },
  "educationalLevel": "Beginner to Advanced",
  "coursePrerequisites": "Basic computer skills and internet access",
  "isAccessibleForFree": false,
  "hasPart": [
    {
      "@type": "Course",
      "name": "SEO Fundamentals",
      "description": "Complete guide to search engine optimization"
    },
    {
      "@type": "Course",
      "name": "Google Ads Mastery",
      "description": "PPC advertising from basics to advanced"
    }
  ]
}
```

**Person Schema (Instructor Page):**

```json
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Michael Chen",
  "image": "https://dma-academy.com/instructors/michael-chen.jpg",
  "jobTitle": "Senior Digital Marketing Instructor",
  "worksFor": {
    "@type": "Organization",
    "name": "Digital Marketing Academy"
  },
  "description": "Certified digital marketing expert with 15+ years of experience",
  "sameAs": [
    "https://linkedin.com/in/michaelchen",
    "https://twitter.com/michaelchenDM"
  ],
  "knowsAbout": [
    "SEO",
    "PPC Advertising",
    "Social Media Marketing",
    "Google Analytics"
  ],
  "alumniOf": {
    "@type": "Organization",
    "name": "Stanford University"
  }
}
```

**SEOPress Setup:**
```
Course CPT Schema:
├── Create Manual Schema
├── Type: Course
├── Dynamic Fields:
│   ├── Name: %%post_title%%
│   ├── Description: %%post_excerpt%%
│   ├── Price: %%custom_field_course_price%%
│   ├── Duration: %%custom_field_course_duration%%
│   └── Instructor: %%custom_field_course_instructor%%
└── Display: Course post type only

Instructor Author Pages:
├── Type: Person
├── Map custom fields for bio, social links
└── Display: Author archives
```

---

### Example 5: Recipe Blog with Rich Media

**Scenario:** Food blog with detailed recipe instructions

**Recipe Schema (Complete):**

```json
{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Classic Homemade Lasagna",
  "image": [
    "https://foodblog.com/lasagna-main.jpg",
    "https://foodblog.com/lasagna-slice.jpg",
    "https://foodblog.com/lasagna-ingredients.jpg"
  ],
  "author": {
    "@type": "Person",
    "name": "Chef Maria Rodriguez"
  },
  "datePublished": "2025-03-20",
  "description": "Traditional Italian lasagna with rich meat sauce, creamy bechamel, and layers of perfectly cooked pasta",
  "prepTime": "PT45M",
  "cookTime": "PT1H30M",
  "totalTime": "PT2H15M",
  "keywords": "lasagna, Italian food, pasta, comfort food",
  "recipeYield": "8 servings",
  "recipeCategory": "Main Course",
  "recipeCuisine": "Italian",
  "nutrition": {
    "@type": "NutritionInformation",
    "calories": "450 calories",
    "carbohydrateContent": "35 g",
    "proteinContent": "28 g",
    "fatContent": "22 g",
    "saturatedFatContent": "10 g",
    "cholesterolContent": "85 mg",
    "sodiumContent": "820 mg",
    "fiberContent": "3 g"
  },
  "recipeIngredient": [
    "1 lb ground beef",
    "1 lb ground pork",
    "1 onion, diced",
    "4 cloves garlic, minced",
    "28 oz crushed tomatoes",
    "6 oz tomato paste",
    "1/2 cup red wine",
    "2 tbsp Italian herbs",
    "1 lb lasagna noodles",
    "15 oz ricotta cheese",
    "2 cups mozzarella cheese, shredded",
    "1 cup Parmesan cheese, grated",
    "2 eggs",
    "Salt and pepper to taste"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "name": "Prepare Meat Sauce",
      "text": "Brown ground beef and pork in a large pot. Add onions and garlic, cook until softened. Stir in tomatoes, tomato paste, wine, and herbs. Simmer for 45 minutes.",
      "url": "https://foodblog.com/lasagna#step1",
      "image": "https://foodblog.com/lasagna-step1.jpg"
    },
    {
      "@type": "HowToStep",
      "name": "Cook Pasta",
      "text": "Cook lasagna noodles according to package directions until al dente. Drain and set aside.",
      "url": "https://foodblog.com/lasagna#step2"
    },
    {
      "@type": "HowToStep",
      "name": "Mix Cheese Filling",
      "text": "Combine ricotta cheese, 1 cup mozzarella, 1/2 cup Parmesan, and eggs in a bowl. Season with salt and pepper.",
      "url": "https://foodblog.com/lasagna#step3"
    },
    {
      "@type": "HowToStep",
      "name": "Assemble Lasagna",
      "text": "Spread 1 cup meat sauce in 9x13 pan. Layer noodles, cheese mixture, meat sauce. Repeat 3 times. Top with remaining mozzarella and Parmesan.",
      "url": "https://foodblog.com/lasagna#step4",
      "image": "https://foodblog.com/lasagna-step4.jpg"
    },
    {
      "@type": "HowToStep",
      "name": "Bake",
      "text": "Cover with foil and bake at 375°F for 45 minutes. Remove foil, bake 15 more minutes until golden. Let rest 15 minutes before serving.",
      "url": "https://foodblog.com/lasagna#step5"
    }
  ],
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "ratingCount": "523"
  },
  "video": {
    "@type": "VideoObject",
    "name": "How to Make Perfect Lasagna",
    "description": "Step-by-step video guide",
    "thumbnailUrl": "https://foodblog.com/lasagna-video-thumb.jpg",
    "contentUrl": "https://foodblog.com/lasagna-video.mp4",
    "embedUrl": "https://youtube.com/embed/ABC123",
    "uploadDate": "2025-03-20",
    "duration": "PT8M32S"
  }
}
```

**SEOPress Configuration:**
```
Recipe Schema Setup:
├── Use Manual Schema Builder
├── Map custom fields from recipe plugin
│   ├── WP Recipe Maker
│   ├── Tasty Recipes
│   └── Or custom ACF fields
├── Time Format: ISO 8601 (PT[hours]H[minutes]M)
├── Images: Multiple images for better rich results
└── Video: Optional but highly recommended
```

---

## Advanced Configurations

### Custom Field Mapping (ACF Integration)

**Scenario:** Product pages with Advanced Custom Fields

**SEOPress Dynamic Variables:**

```
Custom Field Syntax:
%%_custom_field_name%%    → Post meta
%%term_custom_field%%     → Taxonomy meta
%%author_custom_field%%   → Author meta
%%option_custom_field%%   → Options page
```

**Example: Real Estate Property**

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "@id": "%%post_url%%#product",
  "name": "%%post_title%%",
  "description": "%%_acf_property_description%%",
  "image": "%%_acf_property_gallery%%",
  "offers": {
    "@type": "Offer",
    "price": "%%_acf_property_price%%",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "seller": {
      "@type": "RealEstateAgent",
      "name": "%%_acf_listing_agent%%"
    }
  },
  "additionalProperty": [
    {
      "@type": "PropertyValue",
      "name": "Bedrooms",
      "value": "%%_acf_bedrooms%%"
    },
    {
      "@type": "PropertyValue",
      "name": "Bathrooms",
      "value": "%%_acf_bathrooms%%"
    },
    {
      "@type": "PropertyValue",
      "name": "Square Footage",
      "value": "%%_acf_square_feet%%"
    }
  ]
}
```

### Conditional Schema Display

**Use Case:** Different schemas for different user types or conditions

**PHP Implementation:**

```php
function conditional_schema_display() {
    // E-commerce: Show Product schema only for in-stock items
    if (is_product() && get_post_meta(get_the_ID(), '_stock_status', true) === 'instock') {
        // Schema displays
    }
    
    // Membership: Show Course schema only for members
    if (is_singular('course') && current_user_can('subscriber')) {
        // Full course schema
    }
    
    // Seasonal: Event schema during event period
    $event_date = get_post_meta(get_the_ID(), 'event_date', true);
    if (strtotime($event_date) > time()) {
        // Active event schema
    }
}
add_action('wp_head', 'conditional_schema_display', 1);
```

### Multi-Language Schema (WPML/Polylang)

**Implementation Strategy:**

```
SEOPress Configuration:
├── Create schema per language
├── Use language-specific custom fields
├── Duplicate schemas with translations
└── Hreflang integration (automatic)

Dynamic Variables:
%%post_title%%         → Auto-translates
%%post_excerpt%%       → Auto-translates
%%custom_field_name%%  → Use language suffix: _en, _es, _fr
```

**Example:**

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "%%post_title%%",
  "description": "%%post_excerpt%%",
  "inLanguage": "%%post_language%%",
  "author": {
    "@type": "Person",
    "name": "%%_author_name_%%post_language%%%%"
  }
}
```

### Schema Nesting & References

**Complex Schema Relationships:**

```json
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "@id": "https://example.com/#organization",
      "name": "Company Name",
      "logo": {
        "@type": "ImageObject",
        "@id": "https://example.com/#logo",
        "url": "https://example.com/logo.png"
      }
    },
    {
      "@type": "WebSite",
      "@id": "https://example.com/#website",
      "url": "https://example.com",
      "name": "Website Name",
      "publisher": {
        "@id": "https://example.com/#organization"
      },
      "potentialAction": {
        "@type": "SearchAction",
        "target": {
          "@type": "EntryPoint",
          "urlTemplate": "https://example.com/?s={search_term_string}"
        },
        "query-input": "required name=search_term_string"
      }
    },
    {
      "@type": "WebPage",
      "@id": "%%post_url%%#webpage",
      "url": "%%post_url%%",
      "name": "%%post_title%%",
      "isPartOf": {
        "@id": "https://example.com/#website"
      },
      "datePublished": "%%post_date%%",
      "dateModified": "%%post_modified_date%%"
    },
    {
      "@type": "Article",
      "@id": "%%post_url%%#article",
      "headline": "%%post_title%%",
      "mainEntityOfPage": {
        "@id": "%%post_url%%#webpage"
      },
      "author": {
        "@id": "%%author_url%%#person"
      },
      "publisher": {
        "@id": "https://example.com/#organization"
      }
    }
  ]
}
```

**Benefits:**
- Reduced code duplication
- Better entity relationships
- Enhanced knowledge graph connections
- Cleaner JSON-LD structure

---

## Dynamic Schema Implementation

### WooCommerce Advanced Integration

**Variable Products:**

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "%%wc_product_name%%",
  "offers": {
    "@type": "AggregateOffer",
    "lowPrice": "%%wc_min_price%%",
    "highPrice": "%%wc_max_price%%",
    "priceCurrency": "%%wc_currency%%",
    "offerCount": "%%wc_variation_count%%",
    "offers": [
      {
        "@type": "Offer",
        "name": "Size: Small",
        "price": "29.99",
        "availability": "https://schema.org/InStock"
      },
      {
        "@type": "Offer",
        "name": "Size: Medium",
        "price": "29.99",
        "availability": "https://schema.org/InStock"
      }
    ]
  }
}
```

**Product Bundles:**

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Home Office Starter Bundle",
  "isRelatedTo": [
    {
      "@type": "Product",
      "name": "Ergonomic Desk Chair",
      "offers": {
        "@type": "Offer",
        "price": "299.99"
      }
    },
    {
      "@type": "Product",
      "name": "Standing Desk",
      "offers": {
        "@type": "Offer",
        "price": "599.99"
      }
    }
  ],
  "offers": {
    "@type": "Offer",
    "price": "799.99",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock"
  }
}
```

### Dynamic Event Schema

**Recurring Events:**

```php
// Custom function for recurring events
function generate_event_schema_series() {
    $event_dates = get_post_meta(get_the_ID(), 'event_dates_array', true);
    
    $schema = array(
        '@context' => 'https://schema.org',
        '@type' => 'EventSeries',
        'name' => get_the_title(),
        'organizer' => array(
            '@type' => 'Organization',
            'name' => get_bloginfo('name')
        ),
        'subEvent' => array()
    );
    
    foreach ($event_dates as $date) {
        $schema['subEvent'][] = array(
            '@type' => 'Event',
            'name' => get_the_title(),
            'startDate' => $date['start'],
            'endDate' => $date['end'],
            'location' => array(
                '@type' => 'Place',
                'name' => get_post_meta(get_the_ID(), 'venue_name', true),
                'address' => get_post_meta(get_the_ID(), 'venue_address', true)
            )
        );
    }
    
    echo '<script type="application/ld+json">' . wp_json_encode($schema) . '</script>';
}
```

### REST API Schema Distribution

**Headless WordPress Setup:**

```php
// Add schema to REST API response
add_action('rest_api_init', function() {
    register_rest_field('post', 'schema_markup', array(
        'get_callback' => function($object) {
            return json_decode(seopress_get_schema_markup($object['id']), true);
        },
        'schema' => null,
    ));
});

// Frontend implementation (Next.js example)
// pages/blog/[slug].js
export async function getStaticProps({ params }) {
  const res = await fetch(`https://yoursite.com/wp-json/wp/v2/posts?slug=${params.slug}`)
  const post = await res.json()
  
  return {
    props: {
      post: post[0],
      schema: post[0].schema_markup
    }
  }
}

// Add schema to Next.js head
<Head>
  <script
    type="application/ld+json"
    dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
  />
</Head>
```

---

## SEO Impact & Benefits

### Measurable Improvements

**Click-Through Rate (CTR) Increases:**

| Schema Type | Average CTR Increase | Source |
|------------|---------------------|---------|
| Product (with reviews) | +35% | Google Studies |
| FAQ Rich Snippets | +42% | Search Engine Journal |
| Recipe Rich Results | +30% | Food Blogger Coalition |
| Local Business | +25% | BrightLocal |
| Event Listings | +38% | Eventbrite Research |

### Rich Results Eligibility

**Google Rich Results Types:**

1. **Featured Snippets**
   - FAQ schema → Position 0
   - HowTo schema → Step-by-step display
   - Article schema → Top stories carousel

2. **Knowledge Panels**
   - Organization schema → Brand panel
   - Person schema → People also ask
   - LocalBusiness → Map pack integration

3. **Product Rich Results**
   - Price display in SERP
   - Availability status
   - Review stars
   - Image carousel

4. **Video Carousels**
   - VideoObject schema
   - Timestamp navigation
   - Key moments display

### Voice Search Optimization

**Schema's Role in Voice Answers:**

```
Voice Query: "What are the ingredients for lasagna?"
Schema Impact: Recipe schema → Direct answer
Result: Google Assistant reads ingredients list

Voice Query: "Italian restaurants near me open now"
Schema Impact: LocalBusiness + OpeningHours
Result: Google Maps integration with availability
```

### Google Discover Feed

**Schema Requirements for Discover:**

```json
{
  "@type": "Article",
  "headline": "[Must be present]",
  "image": {
    "@type": "ImageObject",
    "url": "[High-quality, 1200x1200px minimum]",
    "width": 1200,
    "height": 1200
  },
  "datePublished": "[Recent content preferred]",
  "author": "[Must include]",
  "publisher": {
    "logo": "[600x60px minimum]"
  }
}
```

**Impact:** Proper schema increases Discover impressions by 60-80%

---

## Troubleshooting & Validation

### Validation Tools

**1. Google Rich Results Test**
```
URL: https://search.google.com/test/rich-results
Purpose: Validate specific page schema
Usage: Enter URL or code snippet
```

**2. Schema Markup Validator**
```
URL: https://validator.schema.org
Purpose: Check JSON-LD syntax
Usage: Paste schema code or URL
```

**3. Google Search Console**
```
Path: Search Console → Enhancements
Check:
├── Product markup issues
├── Recipe rich result errors
├── FAQ page errors
└── Video structured data problems
```

### Common Errors & Fixes

**Error 1: Missing Required Field**
```
Error: "The property 'image' is missing"
Fix: Add featured image or specify default
```

SEOPress Solution:
```
SEOPress → PRO → Schemas → Article Settings
└── Default Image: Upload fallback image (1200x675px)
```

**Error 2: Invalid Date Format**
```
Error: "Invalid value for datePublished"
Current: "March 15, 2025"
Required: "2025-03-15T09:00:00+00:00"
```

Fix: SEOPress auto-formats dates, but check custom fields use ISO 8601

**Error 3: Price Without Currency**
```
Error: "Missing priceCurrency"
```

Fix:
```json
"offers": {
  "price": "99.99",
  "priceCurrency": "USD"  ← Required
}
```

**Error 4: Duplicate Schema**
```
Warning: "Multiple schemas of same type detected"
```

Check:
- Theme adding schema
- Other plugins (Yoast, Rank Math)
- Custom code conflicts

Solution:
```php
// Disable conflicting schema
remove_action('wp_head', 'other_plugin_schema');
```

**Error 5: Logo Dimensions**
```
Error: "Logo dimensions not in acceptable range"
Required: 112px height minimum, 600px recommended
```

Fix: Upload new logo meeting specifications

### Testing Workflow

**Pre-Launch Checklist:**

```
□ Test in Rich Results Tool
□ Validate JSON-LD syntax
□ Check mobile rendering
□ Verify all dynamic variables populate
□ Test conditional logic
□ Validate custom field mapping
□ Check for duplicate schemas
□ Verify image dimensions
□ Test multiple post types
□ Check archive pages
```

**Post-Launch Monitoring:**

```
Week 1-2: Daily GSC checks
Week 3-4: Monitor rich result appearance
Month 2: Analyze CTR improvements
Month 3: Assess ranking changes
Quarterly: Full schema audit
```

---

## Best Practices

### Schema Selection Strategy

**Decision Matrix:**

| Content Type | Primary Schema | Secondary Schema | Priority |
|-------------|---------------|------------------|----------|
| Blog Posts | Article/BlogPosting | Breadcrumb | High |
| Product Pages | Product | Review, Offer | Critical |
| Service Pages | Service | LocalBusiness | High |
| FAQ Pages | FAQPage | - | Medium |
| Contact Page | LocalBusiness | ContactPoint | High |
| About Page | Organization/Person | - | Medium |
| Homepage | Website | Organization, SearchAction | Critical |
| Video Content | VideoObject | Article | High |
| Events | Event | Place, Offer | High |
| Recipes | Recipe | Video, Review | High |

### Organization Schema (Foundation)

**Critical First Step:**

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Your Company Name",
  "url": "https://yoursite.com",
  "logo": {
    "@type": "ImageObject",
    "url": "https://yoursite.com/logo.png",
    "width": 600,
    "height": 60
  },
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "+1-555-555-5555",
    "contactType": "Customer Service",
    "areaServed": "US",
    "availableLanguage": ["English"]
  },
  "sameAs": [
    "https://facebook.com/yourcompany",
    "https://twitter.com/yourcompany",
    "https://linkedin.com/company/yourcompany",
    "https://instagram.com/yourcompany"
  ]
}
```

**Why It Matters:**
- Knowledge graph foundation
- Referenced by all other schemas
- Establishes brand identity
- Required for many rich results

### Image Optimization for Schema

**Requirements by Schema Type:**

| Schema Type | Min. Size | Recommended | Aspect Ratio |
|------------|-----------|-------------|-------------|
| Article | 696x392px | 1200x675px | 16:9 |
| Product | 640x640px | 1200x1200px | 1:1 |
| Recipe | 720x540px | 1200x900px | 4:3 |
| Logo | 112px height | 600x60px | 10:1 |
| Organization Logo | 112x112px | 512x512px | 1:1 |
| Video Thumbnail | 480x360px | 1280x720px | 16:9 |

**SEOPress Auto-Handling:**
- Featured images automatically used
- Falls back to first content image
- Can specify default image per post type

### Performance Considerations

**Schema Impact on Page Speed:**

✅ **Minimal Impact:**
- JSON-LD in `<head>`: 2-5KB average
- No render-blocking
- Parsed asynchronously by search engines

**Optimization Tips:**

1. **Consolidate Schemas:**
```json
// Instead of separate scripts
{
  "@context": "https://schema.org",
  "@graph": [
    { Article schema },
    { Breadcrumb schema },
    { Organization schema }
  ]
}
```

2. **Avoid Redundancy:**
- Don't duplicate Organization schema across pages
- Use @id references instead
- Single WebSite schema for entire site

3. **Lazy Load Non-Critical Schema:**
```php
// Load Event schema only on event pages
if (is_singular('event')) {
    // Add schema
}
```

### Common Mistakes to Avoid

**1. Over-Optimization**
```
❌ Adding irrelevant schema types
❌ Keyword stuffing in descriptions
❌ Using schema for non-existent features
✅ Only use schemas that match actual content
```

**2. Incomplete Implementation**
```
❌ Missing required properties
❌ Empty dynamic variables
❌ Broken image URLs
✅ Test every schema thoroughly
```

**3. Manual Errors in JSON**
```
❌ Invalid JSON syntax (missing commas, brackets)
❌ Incorrect property names
❌ Wrong data types (string vs number)
✅ Always validate before deploying
```

**4. Ignoring Updates**
```
❌ Using deprecated schema types
❌ Outdated property names
❌ Not following Google's guidelines
✅ Review Schema.org quarterly
✅ Monitor GSC for issues
```

### Schema Maintenance Schedule

**Monthly:**
- Review GSC enhancement reports
- Check for new errors/warnings
- Update any broken image URLs
- Verify dynamic fields still populate

**Quarterly:**
- Audit all schema implementations
- Check for Schema.org updates
- Test new content types
- Review rich result performance

**Annually:**
- Complete schema strategy review
- Update Organization/LocalBusiness info
- Refresh product/service schemas
- Implement new schema types

---

## Performance Optimization

### Caching Strategies

**Schema Caching:**

```php
// Cache generated schema for 24 hours
function cached_product_schema($product_id) {
    $cache_key = 'product_schema_' . $product_id;
    $schema = wp_cache_get($cache_key);
    
    if (false === $schema) {
        $schema = generate_product_schema($product_id);
        wp_cache_set($cache_key, $schema, '', DAY_IN_SECONDS);
    }
    
    return $schema;
}
```

**SEOPress Built-in Caching:**
- Automatic schema caching enabled
- Clears on post update
- Manual cache clear: SEOPress → Tools → Clear Cache

### Database Optimization

**Custom Field Queries:**

```php
// Optimize multiple custom field retrieval
function optimized_schema_data($post_id) {
    // Single query for all meta
    $meta = get_post_meta($post_id);
    
    return array(
        'price' => $meta['_price'][0] ?? '',
        'sku' => $meta['_sku'][0] ?? '',
        'stock' => $meta['_stock_status'][0] ?? ''
    );
}
```

### CDN & Static Schema

**For High-Traffic Sites:**

```php
// Generate static schema file for caching
function generate_static_organization_schema() {
    $schema = array(/* organization schema */);
    $json = wp_json_encode($schema, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
    file_put_contents(ABSPATH . 'organization-schema.json', $json);
}

// Enqueue from CDN
function enqueue_organization_schema() {
    $schema_url = get_site_url() . '/organization-schema.json';
    echo '<script type="application/ld+json" src="' . $schema_url . '"></script>';
}
```

---

## Advanced Use Cases

### Multi-Site Network Implementation

**Network-Wide Organization Schema:**

```php
// In network-activated plugin or mu-plugin
function network_organization_schema() {
    $current_site = get_current_blog_id();
    $org_data = get_network_option($current_site, 'network_org_schema');
    
    if ($org_data) {
        echo '<script type="application/ld+json">' . $org_data . '</script>';
    }
}
add_action('wp_head', 'network_organization_schema', 1);
```

### AMP Integration

**SEOPress AMP Compatibility:**

```
Automatic AMP Schema:
├── SEOPress detects AMP plugin
├── Adjusts schema for AMP validation
├── Uses AMP-compatible image URLs
└── Strips non-AMP JavaScript
```

**Manual AMP Schema Adjustment:**

```php
function amp_compatible_schema($schema) {
    if (function_exists('is_amp_endpoint') && is_amp_endpoint()) {
        // Remove video autoplay
        unset($schema['video']['autoplay']);
        
        // Ensure images are AMP URLs
        if (isset($schema['image'])) {
            $schema['image'] = amp_get_permalink($schema['image']);
        }
    }
    return $schema;
}
add_filter('seopress_schemas_json', 'amp_compatible_schema');
```

### JavaScript Framework Integration

**React/Vue SPA Schema Injection:**

```javascript
// React example - pages/_app.js
import Head from 'next/head'

function MyApp({ Component, pageProps, schemaData }) {
  return (
    <>
      <Head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(schemaData)
          }}
        />
      </Head>
      <Component {...pageProps} />
    </>
  )
}

export async function getInitialProps(appContext) {
  // Fetch schema from WordPress REST API
  const schemaRes = await fetch('https://yoursite.com/wp-json/seopress/v1/schema')
  const schemaData = await schemaRes.json()
  
  return { schemaData }
}
```

---

## Competitive Analysis

### Schema Gap Analysis

**Competitor Schema Audit:**

```
Tools:
1. View page source → Search for "application/ld+json"
2. SEOPress built-in analyzer (PRO feature)
3. Schema.org validator with competitor URL

Check:
├── Schema types used
├── Properties included
├── Missing opportunities
└── Implementation quality
```

**Common Competitor Advantages:**

| Schema Feature | Competitive Benefit | Implementation Priority |
|---------------|--------------------|-----------------------|
| Product Reviews | +30-40% CTR | Critical |
| FAQ Rich Results | Position 0 potential | High |
| Video Thumbnails | Visual prominence | High |
| Event Schema | Calendar integration | Medium |
| Recipe Ratings | Featured recipes | High |
| Local Hours | "Open now" badge | Critical (Local) |

---

## Future-Proofing

### Emerging Schema Types

**Recent Additions (2024-2025):**

1. **DiscussionForumPosting** - For community content
2. **VirtualLocation** - Hybrid events
3. **EducationalOccupationalCredential** - Certifications
4. **HealthTopicContent** - Medical information
5. **Claim/ClaimReview** - Fact-checking

### AI & Schema Integration

**Preparing for AI Overviews:**

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "speakable": {
    "@type": "SpeakableSpecification",
    "cssSelector": [".article-headline", ".key-points", ".conclusion"]
  },
  "abstract": "Concise summary optimized for AI extraction"
}
```

**Voice Search Optimization:**
- Natural language descriptions
- Question-answer format for FAQ
- Conversational property values

### Google SGE (Search Generative Experience)

**Schema's Role:**

```
Traditional Search: Schema → Rich snippets
SGE: Schema → AI training data → Generative answers

Optimization:
├── Comprehensive property completion
├── Linked data connections (@id references)
├── Explicit relationship definitions
└── Authoritative source indicators
```

---

## Resources & Documentation

### Official Documentation

- **Schema.org**: https://schema.org
- **Google Search Central**: https://developers.google.com/search/docs/appearance/structured-data
- **SEOPress Documentation**: https://www.seopress.org/support/guides/
- **JSON-LD Playground**: https://json-ld.org/playground/

### Testing Tools

1. **Rich Results Test**: https://search.google.com/test/rich-results
2. **Schema Validator**: https://validator.schema.org
3. **Google Search Console**: Enhancement reports
4. **SEOPress Pro Analyzer**: Built-in validation

### Community & Support

- **SEOPress Support**: https://www.seopress.org/support/
- **WordPress Forums**: Schema.org tag
- **Stack Overflow**: JSON-LD questions
- **Schema.org Community**: W3C mailing list

---

## Conclusion

SEOPress Schema provides enterprise-level structured data capabilities within WordPress, enabling:

✅ **Automated Implementation** - Reduce manual schema coding
✅ **Rich Result Eligibility** - Maximize SERP feature opportunities  
✅ **Performance** - Lightweight JSON-LD with minimal overhead
✅ **Flexibility** - From auto-generation to custom implementations
✅ **Scalability** - Handles sites from blogs to large e-commerce

**Next Steps:**

1. Install SEOPress PRO
2. Configure Organization schema (foundation)
3. Enable automatic schemas for content types
4. Implement manual schemas for special pages
5. Validate with Rich Results Test
6. Monitor in Search Console
7. Iterate based on performance data

**Key Takeaway:** Schema markup is not optional—it's essential for modern SEO. SEOPress makes implementation accessible while maintaining the flexibility needed for complex scenarios.

---

*Last Updated: November 2025*  
*SEOPress Version: 7.x+*  
*Compatibility: WordPress 6.0+*
