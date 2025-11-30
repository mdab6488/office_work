
### Local Voice Search

58% of consumers use voice search to find local business information.

**Local Voice Search Queries:**

```
Common patterns:
- "Where is the nearest [business type]?"
- "What [business type] is open now?"
- "Find [business type] near me"
- "How late is [business name] open?"
- "What's the phone number for [business name]?"
- "Get directions to [business name]"
```

**Local Voice SEO Checklist:**

#### 1. Google Business Profile Optimization

```markdown
✓ Complete EVERY field:
  - Business name (exactly as it appears offline)
  - Category (be specific: "Italian Restaurant" not "Restaurant")
  - Address (verified)
  - Phone number (local area code)
  - Website URL
  - Business hours (including holiday hours)
  - Services/Products
  - Attributes (wheelchair accessible, outdoor seating, etc.)
  
✓ Add Photos:
  - Logo
  - Cover photo
  - Interior shots
  - Exterior/storefront
  - Products/menu items
  - Team members
  - Upload at least 10-20 photos
  
✓ Collect Reviews:
  - Aim for 5+ reviews per month
  - Respond to ALL reviews (positive and negative)
  - Include keywords naturally in responses
  
✓ Post Regular Updates:
  - Weekly posts about offers, events, news
  - COVID updates (if relevant)
  - Holiday hours
```

#### 2. Local Schema Markup

**Example: Restaurant Schema**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Restaurant",
  "name": "Bella Notte Italian Restaurant",
  "image": "https://example.com/images/restaurant.jpg",
  "@id": "https://bellanotte.com",
  "url": "https://bellanotte.com",
  "telephone": "+1-512-555-1234",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Main Street",
    "addressLocality": "Austin",
    "addressRegion": "TX",
    "postalCode": "78701",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 30.2672,
    "longitude": -97.7431
  },
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
      "closes": "23:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": "Sunday",
      "opens": "12:00",
      "closes": "21:00"
    }
  ],
  "servesCuisine": "Italian",
  "acceptsReservations": "True",
  "menu": "https://bellanotte.com/menu"
}
</script>
```

#### 3. Location Pages

**Multi-Location Business Example:**

```markdown
# Plumbing Services in Downtown Austin

## Emergency Plumber in Downtown Austin, TX

Need a plumber in downtown Austin? We provide fast, reliable plumbing 
services to residents and businesses in the 78701 area. Our licensed 
plumbers serve neighborhoods including Rainey Street, Warehouse District, 
and West Campus.

### Our Downtown Austin Service Area

We proudly serve:
- Rainey Street District
- 2nd Street District  
- Warehouse District
- West Campus
- University of Texas Area
- Capitol Complex Area

### What Our Downtown Austin Customers Say

"When our office building had a pipe burst on a Sunday, they arrived 
within an hour. Fantastic service in the heart of downtown!" 
- Sarah M., 2nd Street

### Contact Our Downtown Austin Team

📍 Office: 456 Congress Avenue, Austin, TX 78701
📞 Phone: (512) 555-1234
🕐 Hours: 24/7 Emergency Service
🚗 Service Area: 5-mile radius from downtown Austin

### Common Plumbing Issues in Downtown Austin

Downtown Austin's older buildings often experience:
- **Cast iron pipe corrosion** - Many downtown buildings built in the 1950s-70s
- **Hard water buildup** - Austin's mineral-rich water
- **Commercial grease trap issues** - For restaurants and cafes
- **Slab leak detection** - Common in concrete foundation buildings
```

**Why This Works for Voice Search:**
- Natural, conversational language
- Includes neighborhood names (helps with "near me" searches)
- Addresses local concerns (hard water specific to Austin)
- Clear contact information
- Answers "is there a plumber in downtown Austin?"

