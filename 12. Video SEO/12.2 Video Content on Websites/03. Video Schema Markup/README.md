
### Video Schema Markup

Schema markup helps search engines understand and display your video content in rich results.

#### What is VideoObject Schema?

JSON-LD structured data that describes video content to search engines.

**Real-Life Benefit:**
Videos with schema markup are eligible for Google's video carousel, rich results, and enhanced search appearance.

---

#### Basic VideoObject Schema

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "How to Build a Wooden Deck - Complete DIY Guide",
  "description": "Learn how to build a beautiful wooden deck from start to finish. This comprehensive tutorial covers planning, materials, tools, and step-by-step construction.",
  "thumbnailUrl": "https://example.com/images/deck-thumb.jpg",
  "uploadDate": "2025-02-15T08:00:00+00:00",
  "duration": "PT15M30S",
  "contentUrl": "https://example.com/videos/deck-building.mp4",
  "embedUrl": "https://example.com/embed/deck-building",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 5643
  }
}
</script>
```

---

#### Advanced VideoObject Schema

**Real-Life Example: Fitness Tutorial**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "30-Minute HIIT Workout | Fat Burning Cardio",
  "description": "High-intensity interval training workout designed to burn fat and build endurance. No equipment needed. Suitable for intermediate to advanced fitness levels.",
  "thumbnailUrl": [
    "https://example.com/images/hiit-thumb-480.jpg",
    "https://example.com/images/hiit-thumb-720.jpg",
    "https://example.com/images/hiit-thumb-1080.jpg"
  ],
  "uploadDate": "2025-01-20T06:00:00+00:00",
  "duration": "PT30M",
  "contentUrl": "https://example.com/videos/hiit-workout.mp4",
  "embedUrl": "https://example.com/player?video=hiit-workout",
  "interactionStatistic": {
    "@type": "InteractionCounter",
    "interactionType": { "@type": "WatchAction" },
    "userInteractionCount": 12500
  },
  "expires": "2026-12-31T23:59:59+00:00",
  "regionsAllowed": "US,CA,GB,AU",
  "author": {
    "@type": "Person",
    "name": "Sarah Johnson",
    "url": "https://example.com/trainer/sarah-johnson"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FitLife Studio",
    "logo": {
      "@type": "ImageObject",
      "url": "https://example.com/logo.png",
      "width": 600,
      "height": 60
    }
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.7",
    "reviewCount": "342",
    "bestRating": "5",
    "worstRating": "1"
  },
  "hasPart": [
    {
      "@type": "Clip",
      "name": "Warm-up",
      "startOffset": 0,
      "endOffset": 180,
      "url": "https://example.com/player?video=hiit-workout&t=0"
    },
    {
      "@type": "Clip",
      "name": "Main Workout",
      "startOffset": 180,
      "endOffset": 1500,
      "url": "https://example.com/player?video=hiit-workout&t=180"
    },
    {
      "@type": "Clip",
      "name": "Cool Down",
      "startOffset": 1500,
      "endOffset": 1800,
      "url": "https://example.com/player?video=hiit-workout&t=1500"
    }
  ]
}
</script>
```

---

#### Schema Properties Explained

**Required Properties:**

```json
{
  "@context": "https://schema.org",      // Always schema.org
  "@type": "VideoObject",                 // Type of content
  "name": "Video Title",                  // Max 100 characters
  "description": "Video description",     // Max 5000 characters
  "thumbnailUrl": "https://...",          // Image URL (min 160x90px)
  "uploadDate": "2025-01-15T08:00:00Z"   // ISO 8601 format
}
```

**Recommended Properties:**

```json
{
  "duration": "PT1H30M",                  // ISO 8601 duration format
  "contentUrl": "https://video.mp4",      // Direct video URL
  "embedUrl": "https://player-url",       // Embeddable player URL
  "interactionStatistic": {...},          // View count
  "expires": "2026-01-01T00:00:00Z"       // When video becomes invalid
}
```

---

#### Duration Format (ISO 8601)

```
Format: PT[hours]H[minutes]M[seconds]S

Examples:
30 seconds      → PT30S
5 minutes       → PT5M
1.5 hours       → PT1H30M
2hr 15min 30s   → PT2H15M30S
```

**Conversion Helper:**

```javascript
// Convert seconds to ISO 8601 duration
function secondsToISO8601(seconds) {
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);
  const secs = seconds % 60;
  
  let duration = 'PT';
  if (hours > 0) duration += hours + 'H';
  if (minutes > 0) duration += minutes + 'M';
  if (secs > 0) duration += secs + 'S';
  
  return duration;
}

console.log(secondsToISO8601(450));  // Output: PT7M30S
```

---

#### Real-Life Examples by Industry

**Example 1: eCommerce Product Video**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "iPhone 15 Pro Unboxing & First Impressions",
  "description": "Unboxing the new iPhone 15 Pro in titanium blue. Hands-on first impressions, camera tests, and comparison with iPhone 14 Pro.",
  "thumbnailUrl": "https://shop.example.com/products/iphone-15-thumb.jpg",
  "uploadDate": "2025-09-20T10:00:00+00:00",
  "duration": "PT8M45S",
  "contentUrl": "https://shop.example.com/videos/iphone-15-unbox.mp4",
  "embedUrl": "https://shop.example.com/player/iphone-15",
  "author": {
    "@type": "Organization",
    "name": "TechReviews Pro"
  },
  "publisher": {
    "@type": "Organization",
    "name": "TechShop",
    "logo": {
      "@type": "ImageObject",
      "url": "https://shop.example.com/logo.png"
    }
  }
}
</script>
```

**Example 2: Educational Tutorial**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Python for Beginners - Variables and Data Types",
  "description": "Learn Python programming basics: variables, strings, integers, floats, and booleans. Includes hands-on examples and exercises.",
  "thumbnailUrl": "https://courses.example.com/python-basics-thumb.jpg",
  "uploadDate": "2025-01-10T09:00:00+00:00",
  "duration": "PT25M",
  "contentUrl": "https://courses.example.com/videos/python-lesson-1.mp4",
  "requiresSubscription": true,
  "educationalLevel": "Beginner",
  "inLanguage": "en",
  "author": {
    "@type": "Person",
    "name": "Dr. Jane Smith",
    "jobTitle": "Computer Science Professor"
  },
  "learningResourceType": "Tutorial"
}
</script>
```

**Example 3: Recipe Video**

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": ["VideoObject", "Recipe"],
  "name": "Classic Homemade Pizza Dough",
  "description": "Learn to make authentic Italian pizza dough from scratch. Perfect texture, easy recipe, and tips for the crispiest crust.",
  "thumbnailUrl": "https://foodblog.example.com/pizza-thumb.jpg",
  "uploadDate": "2025-02-05T14:00:00+00:00",
  "duration": "PT12M",
  "contentUrl": "https://foodblog.example.com/videos/pizza-dough.mp4",
  "recipeYield": "4 pizzas",
  "prepTime": "PT15M",
  "cookTime": "PT12M",
  "totalTime": "PT2H",
  "recipeIngredient": [
    "4 cups all-purpose flour",
    "1.5 cups warm water",
    "2 tsp active dry yeast",
    "2 tbsp olive oil",
    "2 tsp salt",
    "1 tsp sugar"
  ],
  "recipeInstructions": [
    {
      "@type": "HowToStep",
      "text": "Mix warm water, yeast, and sugar. Let sit for 5 minutes."
    },
    {
      "@type": "HowToStep",
      "text": "Add flour, olive oil, and salt. Mix until combined."
    }
  ]
}
</script>
```

---

#### Testing Schema Markup

**Google Rich Results Test:**
```
URL: https://search.google.com/test/rich-results

Steps:
1. Paste your page URL or code
2. Click "Test URL" or "Test Code"
3. Review results
4. Fix any errors or warnings
```

**Schema Validator:**
```
URL: https://validator.schema.org/

Use to:
- Validate JSON-LD syntax
- Check for missing required properties
- Ensure proper formatting
```

---

#### Common Schema Mistakes

```
❌ Missing required properties (name, thumbnailUrl, uploadDate)
❌ Wrong date format (must be ISO 8601)
❌ Incorrect duration format (use PT notation)
❌ Thumbnail URL returns 404
❌ Content URL not accessible
❌ Mixing HTTP and HTTPS URLs
❌ Missing closing braces in JSON
❌ Using single quotes instead of double quotes
❌ Forgetting to escape special characters in text
```

---
