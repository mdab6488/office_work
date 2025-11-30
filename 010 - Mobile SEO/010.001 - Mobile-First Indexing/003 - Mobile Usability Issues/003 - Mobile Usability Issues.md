
### Mobile Usability Issues

**What Are Mobile Usability Issues?**

These are problems that make your site difficult or frustrating to use on mobile devices. Google tracks these issues in Search Console and they can negatively impact rankings.

#### 1. **Text Too Small to Read**

**❌ Problem Example:**
```css
body {
  font-size: 10px; /* Too small! */
}

p {
  font-size: 12px; /* Still too small! */
}
```

**✅ Solution:**
```css
body {
  font-size: 16px; /* Base font size */
  line-height: 1.6; /* Comfortable reading */
}

p {
  font-size: 16px;
}

h1 {
  font-size: 28px;
}

h2 {
  font-size: 24px;
}

/* Responsive scaling */
@media (max-width: 768px) {
  body {
    font-size: 16px; /* Never go below 16px */
  }
}
```

**Real-Life Impact:**
A news website used 11px font size on mobile. Users had to pinch-zoom to read articles, causing:
- 65% bounce rate on mobile
- Average session duration: 18 seconds
- After increasing to 16px: Bounce rate dropped to 42%, session duration increased to 2 minutes 30 seconds

#### 2. **Clickable Elements Too Close Together**

**❌ Problem Example:**
```html
<style>
  .button-group button {
    padding: 5px 8px; /* Too small! */
    margin: 2px; /* Too close! */
  }
</style>

<div class="button-group">
  <button>Add to Cart</button>
  <button>Wishlist</button>
  <button>Compare</button>
</div>
```

**✅ Solution:**
```html
<style>
  .button-group {
    display: flex;
    flex-direction: column;
    gap: 16px; /* Plenty of space */
  }
  
  .button-group button {
    min-height: 48px; /* Apple's recommended touch target */
    padding: 12px 24px;
    font-size: 16px;
    width: 100%;
  }
  
  /* Or horizontal with proper spacing */
  @media (min-width: 480px) {
    .button-group {
      flex-direction: row;
      gap: 16px;
    }
    
    .button-group button {
      width: auto;
      min-width: 120px;
    }
  }
</style>

<div class="button-group">
  <button>Add to Cart</button>
  <button>Wishlist</button>
  <button>Compare</button>
</div>
```

**Touch Target Guidelines:**
- Minimum: 48x48 pixels (Apple & Google recommendation)
- Optimal: 48x48 pixels with 8px spacing between elements
- Critical actions (Buy Now): 56x56 pixels or larger

**Real-Life Example:**
An airline booking site had flight selection checkboxes with 32x32px touch targets, spaced 4px apart. User testing showed:
- 23% of users accidentally selected wrong flights
- 15% gave up and used desktop instead
- After fixing: Conversion rate increased 18%, mobile bookings up 31%

#### 3. **Content Wider Than Screen**

**❌ Problem Example:**
```html
<style>
  .product-table {
    width: 1200px; /* Fixed width causes horizontal scroll */
  }
  
  .hero-image {
    width: 1920px; /* Wider than mobile screens */
  }
</style>

<table class="product-table">
  <!-- Users have to scroll horizontally to see all columns -->
</table>
```

**✅ Solution:**
```html
<style>
  /* Responsive table */
  .product-table {
    width: 100%;
    max-width: 100%;
    overflow-x: auto; /* Allow scrolling if necessary */
  }
  
  /* Or convert to cards on mobile */
  @media (max-width: 768px) {
    .product-table {
      display: block;
    }
    
    .product-table tr {
      display: flex;
      flex-direction: column;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      padding: 15px;
    }
  }
  
  /* Responsive images */
  .hero-image {
    width: 100%;
    height: auto;
    max-width: 100%;
  }
</style>
```

**Real-Life Scenario:**
A restaurant menu website used a fixed-width layout (980px) on mobile. Users had to:
- Pinch and zoom to read menu items
- Scroll horizontally to see prices
- 78% bounced within 5 seconds

After implementing responsive design:
- Bounce rate: 78% → 34%
- Mobile orders increased 124%
- Google Search Console showed 0 mobile usability errors

#### 4. **Missing Viewport Meta Tag**

**❌ Without Viewport:**
```html
<head>
  <title>My Website</title>
  <!-- Missing viewport tag! -->
</head>
```

Result: Page loads at 980px width and users see a zoomed-out version

**✅ With Proper Viewport:**
```html
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <title>My Website</title>
</head>
```

#### 5. **Interstitials and Popups**

**❌ Bad Example:**
```html
<!-- Full-page popup that appears immediately on mobile -->
<div class="mobile-popup" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 9999;">
  <h2>Subscribe to Newsletter!</h2>
  <form>...</form>
  <button class="tiny-close" style="font-size: 10px;">×</button>
</div>
```

**✅ Good Example:**
```html
<!-- Banner that doesn't obstruct content -->
<div class="newsletter-banner" style="position: fixed; bottom: 0; left: 0; width: 100%; height: 80px; z-index: 100;">
  <p>Join our newsletter</p>
  <button style="min-height: 48px; min-width: 48px;">×</button>
</div>

<!-- Or delay popup by 30 seconds and make it easy to dismiss -->
```

**Real-Life Impact:**
A blog used full-screen popups that appeared after 3 seconds on mobile:
- Google penalized the site for intrusive interstitials
- Organic traffic dropped 40% in 2 months
- After removing: Traffic recovered to previous levels in 6 weeks
