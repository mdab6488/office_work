
### Font Sizes

**Why Font Size Matters for SEO:**
- Google checks if text is readable on mobile
- Poor readability = high bounce rates = lower rankings
- Accessibility is increasingly a ranking factor

#### **Minimum Font Size Standards**

**WCAG 2.1 Guidelines:**
- Body text: minimum 16px (1rem)
- Small text: minimum 14px (acceptable for disclaimers, captions)
- Never go below 12px

**Google's Recommendations:**
- Base font size: 16px
- Line height: 1.5 (24px for 16px text)
- Paragraph width: 50-75 characters per line

#### **Real Font Size Examples**

**❌ Bad Typography:**
```css
body {
  font-size: 12px; /* Too small! */
  line-height: 1.2; /* Too cramped! */
}

h1 {
  font-size: 18px; /* Not enough hierarchy */
}

p {
  font-size: 11px; /* Unreadable */
  color: #999; /* Poor contrast */
}
```

**✅ Good Typography:**
```css
/* Base styles */
html {
  font-size: 16px; /* Base size */
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
  font-size: 1rem; /* 16px */
  line-height: 1.6; /* 25.6px */
  color: #333;
}

/* Type scale - clear hierarchy */
h1 {
  font-size: 2rem; /* 32px */
  line-height: 1.2;
  font-weight: 700;
  margin-bottom: 1rem;
}

h2 {
  font-size: 1.5rem; /* 24px */
  line-height: 1.3;
  font-weight: 600;
  margin-bottom: 0.75rem;
}

h3 {
  font-size: 1.25rem; /* 20px */
  line-height: 1.4;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

p {
  font-size: 1rem; /* 16px */
  line-height: 1.6;
  margin-bottom: 1rem;
}

/* Small text (captions, meta info) */
small, .text-small {
  font-size: 0.875rem; /* 14px - still readable */
  line-height: 1.5;
}

/* Large text for emphasis */
.lead {
  font-size: 1.125rem; /* 18px */
  line-height: 1.7;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  h1 {
    font-size: 1.75rem; /* 28px on mobile */
  }
  
  h2 {
    font-size: 1.375rem; /* 22px on mobile */
  }
}

/* Never shrink body text on mobile */
@media (max-width: 480px) {
  body {
    font-size: 16px; /* Keep at 16px minimum */
  }
}
```

**Real-Life Examples:**

**News Article (Medium.com Style):**
```css
.article {
  max-width: 680px;
  margin: 0 auto;
  padding: 0 20px;
}

.article h1 {
  font-size: 2.5rem; /* 40px */
  line-height: 1.15;
  font-weight: 700;
  margin-bottom: 1rem;
}

.article .subtitle {
  font-size: 1.375rem; /* 22px */
  line-height: 1.5;
  color: #666;
  margin-bottom: 2rem;
}

.article p {
  font-size: 1.125rem; /* 18px */
  line-height: 1.8; /* 32.4px */
  margin-bottom: 1.5rem;
  
  /* Optimal line length */
  max-width: 65ch;
}

.article .author-info {
  font-size: 0.9375rem; /* 15px */
  color: #666;
}
```

**E-commerce Product Page:**
```css
.product-page {
  padding: 20px;
}

.product-title {
  font-size: 1.75rem; /* 28px */
  line-height: 1.3;
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.product-price {
  font-size: 2rem; /* 32px - large for emphasis */
  line-height: 1;
  font-weight: 700;
  color: #e74c3c;
  margin-bottom: 1rem;
}

.product-description {
  font-size: 1rem; /* 16px */
  line-height: 1.6;
  margin-bottom: 1.5rem;
}

.product-specs {
  font-size: 0.9375rem; /* 15px */
  line-height: 1.6;
}

.product-review {
  font-size: 0.9375rem; /* 15px */
  line-height: 1.6;
  padding: 16px;
  background: #f8f8f8;
  border-radius: 8px;
}
```

#### **Line Height (Leading)**

**The Rule:** Line height should be 1.5-1.8x the font size.

```css
/* ❌ Too tight */
p {
  font-size: 16px;
  line-height: 18px; /* Only 1.125x - cramped */
}

/* ✅ Comfortable reading */
p {
  font-size: 16px;
  line-height: 26px; /* 1.625x - perfect */
}

/* ✅ Or use unitless values */
p {
  font-size: 16px;
  line-height: 1.6;
}
```

**Real-Life Impact:**
An online magazine changed line-height from 1.3 to 1.7:
- Average reading time per article: +34%
- Scroll depth: +28%
- Return visitor rate: +19%

#### **Contrast Ratios**

**WCAG Standards:**
- Normal text (16px+): minimum 4.5:1 contrast ratio
- Large text (24px+): minimum 3:1 contrast ratio

**❌ Poor Contrast:**
```css
p {
  color: #999; /* Light gray text */
  background: #fff; /* White background */
  /* Contrast ratio: 2.85:1 - FAILS WCAG */
}
```

**✅ Good Contrast:**
```css
p {
  color: #333; /* Dark gray text */
  background: #fff; /* White background */
  /* Contrast ratio: 12.63:1 - PASSES AAA */
}

/* Or */
p {
  color: #666; /* Medium gray */
  background: #fff;
  /* Contrast ratio: 5.74:1 - PASSES AA */
}
```

---
