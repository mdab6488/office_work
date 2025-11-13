
### Viewport Configuration

**What is the Viewport?**

The viewport is the visible area of a webpage. On mobile, proper viewport configuration is essential for responsive design and mobile SEO.

#### **The Essential Viewport Meta Tag**

**❌ Without Viewport (Before 2010):**
```html
<head>
  <title>My Website</title>
  <!-- No viewport tag -->
</head>
```

Result:
- Page renders at 980px width (desktop width)
- Content appears tiny and zoomed out
- Users must pinch and zoom to read anything
- Google flags as "not mobile-friendly"

**✅ Standard Viewport Configuration:**
```html
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
</head>
```

**Breaking Down the Tag:**

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

- `width=device-width`: Page width matches device width (375px on iPhone, 411px on Pixel, etc.)
- `initial-scale=1.0`: No zoom when page loads (1:1 ratio)

#### **Advanced Viewport Options**

**Full Viewport Control:**
```html
<meta name="viewport" content="
  width=device-width,
  initial-scale=1.0,
  maximum-scale=5.0,
  minimum-scale=1.0,
  user-scalable=yes
">
```

**What Each Property Does:**

| Property | Recommended Value | Purpose |
|----------|------------------|---------|
| `width` | `device-width` | Matches screen width |
| `initial-scale` | `1.0` | Starting zoom level |
| `maximum-scale` | `5.0` | Maximum zoom allowed |
| `minimum-scale` | `1.0` | Minimum zoom allowed |
| `user-scalable` | `yes` | Allow pinch-to-zoom |

**⚠️ WARNING - Don't Disable Zoom:**
```html
<!-- ❌ BAD - Fails WCAG accessibility -->
<meta name="viewport" content="
  width=device-width,
  initial-scale=1.0,
  maximum-scale=1.0,
  user-scalable=no
">
```

Why this is bad:
- Prevents users with vision impairments from zooming
- Fails WCAG 2.1 accessibility guidelines
- May result in penalties from Google
- Frustrates users who need to enlarge text

**✅ Always Allow Zoom:**
```html
<meta name="viewport" content="
  width=device-width,
  initial-scale=1.0,
  maximum-scale=5.0,
  user-scalable=yes
">
```

#### **Real-Life Viewport Examples**

**Example 1: Basic Blog**
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Awesome Blog</title>
  
  <style>
    body {
      margin: 0;
      padding: 20px;
      font-family: Arial, sans-serif;
      font-size: 16px;
      line-height: 1.6;
    }
    
    img {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
  <h1>Article Title</h1>
  <p>Content adapts perfectly to any screen width...</p>
</body>
</html>
```

**Example 2: E-commerce Product Grid**
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Store</title>
  
  <style>
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 20px;
      padding: 20px;
    }
    
    .product-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
    }
    
    .product-card img {
      width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
  <div class="product-grid">
    <div class="product-card">
      <img src="product1.jpg" alt="Product 1">
      <h3>Product Name</h3>
      <p>$29.99</p>
    </div>
    <!-- More products -->
  </div>
</body>
</html>
```

#### **Viewport and CSS Media Queries**

The viewport meta tag works hand-in-hand with CSS media queries:

```css
/* Mobile first approach */
.container {
  width: 100%;
  padding: 20px;
}

/* Tablet */
@media (min-width: 768px) {
  .container {
    max-width: 720px;
    margin: 0 auto;
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .container {
    max-width: 960px;
  }
}

/* Large desktop */
@media (min-width: 1280px) {
  .container {
    max-width: 1140px;
  }
}
```

#### **Safe Areas for Notched Devices**

Modern devices (iPhone X+) have notches and rounded corners. Use safe areas:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">

<style>
  body {
    /* Respect safe areas */
    padding-left: env(safe-area-inset-left);
    padding-right: env(safe-area-inset-right);
    padding-top: env(safe-area-inset-top);
    padding-bottom: env(safe-area-inset-bottom);
  }
  
  /* Fixed header accounting for notch */
  header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    padding-top: calc(20px + env(safe-area-inset-top));
    background: white;
  }
</style>
```

#### **Common Viewport Mistakes**

**❌ Mistake 1: Fixed Width**
```html
<meta name="viewport" content="width=1024">
<!-- Sets width to 1024px regardless of device -->
```

**❌ Mistake 2: Disabling Zoom**
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<!-- Accessibility violation -->
```

**❌ Mistake 3: Missing Viewport Tag**
```html
<head>
  <title>My Site</title>
  <!-- Forgot viewport tag entirely -->
</head>
```

**❌ Mistake 4: Using Pixels Instead of Responsive Units**
```css
.container {
  width: 1200px; /* Breaks on mobile */
}

/* ✅ Should be: */
.container {
  width: 100%;
  max-width: 1200px;
}
```

#### **Testing Viewport Configuration**

**Google Search Console:**
1. Go to "Mobile Usability" report
2. Look for errors like:
   - "Viewport not set to device-width"
   - "Content wider than screen"
   - "Text too small to read"

**Chrome DevTools:**
```javascript
// Check viewport dimensions
console.log('Viewport width:', window.innerWidth);
console.log('Viewport height:', window.innerHeight);
console.log('Device pixel ratio:', window.devicePixelRatio);

// Check if page is mobile-optimized
const viewport = document.querySelector('meta[name="viewport"]');
console.log('Viewport tag:', viewport ? viewport.content : 'MISSING!');
```

**Manual Testing:**
1. Open site on real mobile devices
2. Try different orientations (portrait/landscape)
3. Test on various screen sizes (iPhone SE, iPhone Pro Max, Android tablets)
4. Verify no horizontal scrolling
5. Ensure all text is readable without zooming

---
