
### 8.3.2 Internal Linking from Categories

Internal linking from category pages distributes link equity (PageRank) throughout your site and helps search engines discover and understand page relationships.

#### Strategic Internal Linking Framework

**1. Hierarchical Linking Structure**

```
Homepage
    ↓
Category: Women's Shoes
    ↓
Subcategory: Running Shoes
    ↓
Product: Nike Air Zoom Pegasus 40
```

**Real-World Example - Amazon's Linking Strategy:**

```html
<!-- Category Page: Women's Athletic Shoes -->
<nav class="subcategories">
  <h2>Shop by Activity</h2>
  <ul>
    <li><a href="/womens-running-shoes">Running</a> (3,421 items)</li>
    <li><a href="/womens-training-shoes">Training & Gym</a> (1,892 items)</li>
    <li><a href="/womens-walking-shoes">Walking</a> (2,156 items)</li>
    <li><a href="/womens-hiking-shoes">Hiking</a> (987 items)</li>
  </ul>
</nav>

<!-- Related Categories -->
<aside class="related-categories">
  <h3>Related Categories</h3>
  <ul>
    <li><a href="/womens-athletic-clothing">Women's Activewear</a></li>
    <li><a href="/running-accessories">Running Accessories</a></li>
    <li><a href="/fitness-trackers">Fitness Trackers</a></li>
  </ul>
</aside>

<!-- Popular Collections -->
<section class="collections">
  <h3>Popular Collections</h3>
  <div class="collection-links">
    <a href="/best-sellers/womens-running">Best-Selling Running Shoes</a>
    <a href="/new-arrivals/womens-athletic">New Athletic Shoes</a>
    <a href="/eco-friendly/womens-shoes">Sustainable Athletic Shoes</a>
  </div>
</section>
```

**2. Types of Internal Links from Categories**

**A. Navigational Links**
- Breadcrumb navigation
- Subcategory links
- Filter/facet links

**B. Contextual Links**
- Within category descriptions
- From buying guides
- From comparison content

**C. Promotional Links**
- Featured collections
- Seasonal campaigns
- Sale categories

**Real-Life Example - REI Category Page:**

```html
<!-- Within Category Description -->
<div class="category-content">
  <p>Choosing the right <a href="/camping-gear">camping gear</a> starts 
  with understanding your <a href="/camping-guides/tent-buying-guide">tent 
  needs</a>. Our collection ranges from lightweight 
  <a href="/backpacking-tents">backpacking tents</a> (under 3 lbs) to 
  spacious <a href="/family-camping-tents">family camping tents</a> 
  (8+ person capacity).</p>
  
  <p>Consider pairing your tent with essential 
  <a href="/sleeping-bags">sleeping bags</a> and 
  <a href="/sleeping-pads">sleeping pads</a> for a complete sleep system. 
  Check our <a href="/camping-checklist">camping checklist</a> to ensure 
  you don't forget anything.</p>
</div>

<!-- Filter Links (with proper canonicalization) -->
<div class="filters">
  <h3>Shop by Price</h3>
  <ul>
    <li><a href="/tents?price=under-100">Under $100</a></li>
    <li><a href="/tents?price=100-200">$100 - $200</a></li>
    <li><a href="/tents?price=200-400">$200 - $400</a></li>
    <li><a href="/tents?price=over-400">$400+</a></li>
  </ul>
</div>
```

**3. Internal Linking Best Practices**

✅ **Do:**
- Use descriptive anchor text ("lightweight backpacking tents" not "click here")
- Link to related categories that add value
- Maintain a logical hierarchy
- Limit to 100-150 internal links per category page
- Use "rel=nofollow" for filter URLs that create duplicate content

❌ **Don't:**
- Over-optimize anchor text (exact match repeatedly)
- Create link farms with unrelated categories
- Use JavaScript-only links (search engines need crawlable links)
- Link to every product individually from category pages

**4. Priority Link Placement**

```html
<!-- High Priority: Above the Fold -->
<nav class="category-nav">
  <a href="/mens-clothing">Men's</a>
  <a href="/womens-clothing">Women's</a>
  <a href="/kids-clothing">Kids</a>
</nav>

<!-- Medium Priority: Sidebar/Faceted Navigation -->
<aside class="facets">
  <!-- These pass less link equity but aid discovery -->
</aside>

<!-- Lower Priority: Footer Links -->
<footer>
  <!-- Sitewide links, less category-specific value -->
</footer>
```

---
