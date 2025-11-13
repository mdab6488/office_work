# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.8 Internal Linking

Internal linking is one of the most powerful and underutilized SEO strategies. It helps search engines understand your site structure, distributes ranking power, and improves user navigation.


### Link Equity Distribution

**What It Is:**
Also known as "link juice," link equity is the value and authority passed from one page to another through internal links. Strategic distribution ensures important pages receive maximum ranking power.

**Why It Matters:**
- Determines which pages Google prioritizes
- Influences ranking potential
- Helps new content get indexed faster
- Maximizes overall site authority

**How Link Equity Flows:**

```
Homepage (Authority: 100)
    ↓ (passes ~85% per link)
Category Page (receives ~85)
    ↓ (passes ~72% per link)
Product Page (receives ~72)
```

**Link Equity Factors:**

1. **Source Page Authority**: Higher authority = more equity to pass
2. **Number of Links**: Equity divided among all links on page
3. **Link Position**: Links higher on page may pass more equity
4. **Relevance**: Topically relevant links carry more weight
5. **Follow vs. Nofollow**: Nofollow links pass zero equity

**Mathematical Example:**

```
Page A has authority of 100
Page A has 10 outgoing links
Each link passes: 100 ÷ 10 = 10 points of equity

If Page A has 100 links:
Each link passes: 100 ÷ 100 = 1 point of equity
```

**Real-Life Strategy: E-commerce Site**

**Homepage Link Equity Distribution:**

```
Homepage Authority: 100 points
Total Links: 50

Priority Distribution:
├── Main Navigation (7 links × 5 points) = 35 points
│   ├── Best Sellers → 5 points
│   ├── New Arrivals → 5 points
│   ├── Men's Shoes → 5 points
│   ├── Women's Shoes → 5 points
│   ├── Sale → 5 points
│   ├── Blog → 5 points
│   └── About → 5 points
│
├── Featured Products (10 links × 3 points) = 30 points
│
├── Footer Links (20 links × 1 point) = 20 points
│
└── Misc Links (13 links × 1.15 points) = 15 points
```

**Strategic Linking Model:**

**Tier 1: Money Pages (Maximum Equity)**
```
Homepage
    ↓ (multiple strong links)
Category Pages
    ↓ (multiple strong links)
Top Product/Service Pages
```

**Tier 2: Supporting Content (Medium Equity)**
```
Category Pages
    ↓
Subcategory Pages
    ↓
Individual Products/Posts
```

**Tier 3: Utility Pages (Minimal Equity)**
```
Footer
    ↓
Legal Pages (Privacy, Terms)
Help/FAQ
```

**Real-World Example: SaaS Company**

```
Homepage (100 points)
│
├─ Pricing Page (20 points) ← High commercial intent
├─ Features Page (20 points) ← Important for SEO
├─ Blog Hub (15 points) ← Content marketing
├─ About Page (10 points) ← Branding
├─ Contact (10 points) ← Conversions
├─ Help Center (10 points) ← Support
└─ Footer Pages (15 points total) ← Legal/utility

Features Page (20 points received)
│
├─ Feature A (5 points) ← Core offering
├─ Feature B (5 points) ← Core offering
├─ Feature C (3 points)
├─ Feature D (3 points)
├─ Integrations (2 points)
└─ API Docs (2 points)
```

**Optimization Strategies:**

**Strategy 1: Link from High Authority Pages**

```html
<!-- Homepage linking to important product -->
<section class="hero">
  <h1>Premium Running Shoes</h1>
  <p>Discover our <a href="/products/ultra-runner-pro">Ultra Runner Pro</a>, 
     designed for serious athletes.</p>
</section>

<!-- Sidebar on high-traffic blog posts -->
<aside class="popular-products">
  <h3>Top Products</h3>
  <a href="/products/ultra-runner-pro">Ultra Runner Pro</a>
  <a href="/products/trail-blazer-max">Trail Blazer Max</a>
</aside>
```

**Strategy 2: Reduce Links on High Authority Pages**

❌ **Before: 100 links on homepage**
```
Each link receives: 100 ÷ 100 = 1 point
```

✅ **After: 40 strategic links on homepage**
```
Each link receives: 100 ÷ 40 = 2.5 points
(150% more equity per link!)
```

**Strategy 3: Hub Page Architecture**

```
                [Pillar: Running Guide]
                   (Authority: 85)
                   /      |      \
                  /       |       \
                 /        |        \
    [Training] [Nutrition] [Gear] [Injury Prevention]
     (21 pts)   (21 pts)  (21 pts)    (21 pts)
        |          |         |            |
   [8 articles] [8 articles] [8 articles] [8 articles]
```

**Link Equity Maximization Checklist:**

```
✅ Most internal links point to high-value pages
✅ High authority pages link to target pages
✅ Remove unnecessary links from important pages
✅ Eliminate or nofollow low-value pages
✅ Create hub pages to distribute equity
✅ Use breadcrumbs for clean hierarchy
✅ Consolidate thin content pages
✅ Fix broken internal links immediately
```

**Common Mistakes:**

❌ **Mistake 1: Equal Distribution**
```
Every page links to every other page
Result: No pages get priority
```

❌ **Mistake 2: Footer Bloat**
```
100+ footer links on every page
Result: Dilutes equity from all pages
```

❌ **Mistake 3: Orphan High-Value Pages**
```
Important product page with only 1 internal link
Result: Page doesn't rank despite good content
```

**Optimal Distribution Example:**

```html
<!DOCTYPE html>
<html>
<head>
  <title>Running Shoe Store</title>
</head>
<body>
  
  <!-- Primary navigation: 7 strategic links -->
  <nav class="main-nav">
    <a href="/running-shoes">Running Shoes</a>
    <a href="/training-shoes">Training Shoes</a>
    <a href="/sale">Sale</a>
    <a href="/blog">Blog</a>
    <a href="/about">About</a>
    <a href="/contact">Contact</a>
  </nav>
  
  <!-- Hero: 2 high-value links -->
  <section class="hero">
    <h1>Premium Athletic Footwear</h1>
    <a href="/products/ultra-runner-pro" class="cta">Shop Ultra Runner Pro</a>
    <a href="/sale" class="cta-secondary">View Sale Items</a>
  </section>
  
  <!-- Featured products: 6 strategic links -->
  <section class="featured">
    <h2>Best Sellers</h2>
    <!-- 6 top products -->
  </section>
  
  <!-- Content area: 5-8 contextual links -->
  <section class="content">
    <!-- Relevant internal links in content -->
  </section>
  
  <!-- Minimal footer: 8 necessary links -->
  <footer>
    <a href="/shipping">Shipping</a>
    <a href="/returns">Returns</a>
    <a href="/privacy">Privacy</a>
    <a href="/terms">Terms</a>
    <a href="/sitemap">Sitemap</a>
    <a href="/careers">Careers</a>
    <!-- Social links (nofollow) -->
  </footer>
  
  <!-- Total: ~30 internal links (optimal) -->
  
</body>
</html>
```

**Measuring Link Equity:**

Use SEO tools to analyze:
- **Screaming Frog**: Internal link count per page
- **Ahrefs**: Internal PageRank
- **Moz**: Page Authority distribution
- **Google Search Console**: Index coverage

---
