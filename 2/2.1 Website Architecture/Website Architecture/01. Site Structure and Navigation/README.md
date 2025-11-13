## 2.1 Website Architecture

---

### Site Structure and Navigation

Your site structure determines how easily search engines and users can find content. A well-organized site structure improves crawling efficiency and user experience.

#### The Pyramid Structure (Best Practice)

```
                    [Homepage]
                        |
        ┌───────────────┼───────────────┐
        |               |               |
   [Category 1]    [Category 2]    [Category 3]
        |               |               |
    ┌───┴───┐       ┌───┴───┐       ┌───┴───┐
    |       |       |       |       |       |
  [Sub 1] [Sub 2] [Sub 3] [Sub 4] [Sub 5] [Sub 6]
    |       |       |       |       |       |
   [Pages] [Pages] [Pages] [Pages] [Pages] [Pages]
```

**Key Principles:**
- ✅ Maximum 3-4 clicks from homepage to any page
- ✅ Logical hierarchy
- ✅ Clear categories
- ❌ Avoid deep nesting (6+ levels)

#### Real-Life Example: E-commerce Site

**❌ Bad Structure:**
```
Homepage → Products → Clothing → Men → Shirts → Casual → Blue → Size Medium → Brand X
(9 clicks deep!)
```

**✅ Good Structure:**
```
Homepage → Men's Casual Shirts → Product Page
(3 clicks total)
```

#### Real Website Example: Amazon

```
amazon.com/                              (Homepage - Level 0)
├── /electronics/                        (Category - Level 1)
│   ├── /computers-tablets/              (Subcategory - Level 2)
│   │   ├── /laptops/                    (Product Type - Level 3)
│   │   │   └── /product/B08N5LNQCX      (Product - Level 4)
│   │   └── /tablets/
│   └── /cell-phones-accessories/
├── /books/
└── /home-kitchen/
```

**Why This Works:**
- Clear hierarchy
- Descriptive categories
- Easy for crawlers to understand
- Users find products quickly

#### Implementation Code Example

**HTML Navigation Menu:**

```html
<nav aria-label="Main Navigation">
  <ul class="main-menu">
    <li><a href="/">Home</a></li>
    <li>
      <a href="/electronics/">Electronics</a>
      <ul class="dropdown">
        <li><a href="/electronics/laptops/">Laptops</a></li>
        <li><a href="/electronics/tablets/">Tablets</a></li>
        <li><a href="/electronics/phones/">Phones</a></li>
      </ul>
    </li>
    <li>
      <a href="/clothing/">Clothing</a>
      <ul class="dropdown">
        <li><a href="/clothing/mens/">Men's</a></li>
        <li><a href="/clothing/womens/">Women's</a></li>
        <li><a href="/clothing/kids/">Kids</a></li>
      </ul>
    </li>
  </ul>
</nav>
```

#### Real Business Impact

**Case Study: SaaS Company Restructure**

**Before:**
```
Website had 7 levels deep structure
Homepage → Products → Software → Business → Enterprise → Tools → CRM → Feature Page
Average crawl depth: 6 clicks
```

**Problems:**
- Google only crawled 60% of pages
- Important pages had low crawl priority
- Internal PageRank diluted
- Users complained about navigation

**After Restructure:**
```
Flattened to 3 levels
Homepage → CRM Software → Feature Page
Average crawl depth: 2-3 clicks
```

**Results:**
- ✅ 95% of pages crawled within a week
- ✅ Organic traffic increased 45%
- ✅ Bounce rate decreased from 68% to 42%
- ✅ Time on site increased 2.3 minutes

---