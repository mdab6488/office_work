# On-Page SEO: Image SEO & Internal Linking

A comprehensive guide to mastering Image SEO and Internal Linking strategies with real-world examples and best practices.

---

## 3.8 Internal Linking

Internal linking is one of the most powerful and underutilized SEO strategies. It helps search engines understand your site structure, distributes ranking power, and improves user navigation.


### Anchor Text Optimization

**What It Is:**
The clickable text in a hyperlink that describes the destination page. Search engines use anchor text to understand what the linked page is about.

**Why It Matters:**
- Primary signal for search engines about page content
- Helps rankings for target keywords
- Improves user understanding and click-through
- Affects topical relevance

**Anchor Text Types:**

| Type | Example | Use Case | SEO Value |
|------|---------|----------|-----------|
| **Exact Match** | "running shoes" | High-value keywords | High (use sparingly) |
| **Partial Match** | "best running shoes for beginners" | Variations | High |
| **Branded** | "Nike" | Brand mentions | Medium |
| **Naked URL** | "example.com" | Citations | Low |
| **Generic** | "click here" | CTA buttons | Very Low |
| **Image** | [image alt text] | Visual links | Medium |
| **LSI/Synonym** | "athletic footwear" | Natural variation | High |

**Real-Life Examples:**

**Scenario 1: Blog Post Linking to Product Page**

❌ **Poor Anchor Text:**
```html
<p>We tested several models and found the best option. 
   <a href="/products/nike-pegasus-40">Click here</a> to see it.</p>
```

✅ **Good Anchor Text:**
```html
<p>We tested several models and found the 
   <a href="/products/nike-pegasus-40">Nike Air Zoom Pegasus 40</a> 
   to be the best choice for long-distance running.</p>
```

✅ **Better Anchor Text (with context):**
```html
<p>We tested several models and found the Nike Air Zoom Pegasus 40 
   to be exceptional. Read our complete 
   <a href="/reviews/nike-pegasus-40">Nike Pegasus 40 review</a> 
   to learn why it's perfect for <a href="/guides/marathon-training">marathon training</a>.</p>
```

**Scenario 2: E-commerce Category Linking**

❌ **Poor:**
```html
<a href="/mens-shoes">Click here</a> for shoes.
```

✅ **Good:**
```html
<a href="/mens-shoes">Men's Shoes</a>
```

✅ **Better:**
```html
Shop our collection of <a href="/mens-shoes/running">men's running shoes</a>, 
including <a href="/mens-shoes/running/trail">trail running shoes</a> and 
<a href="/mens-shoes/running/road">road running shoes</a>.
```

**Anchor Text Distribution (Recommended):**

```
Exact Match: 5-15%
Partial Match: 30-40%
Branded: 20-30%
LSI/Synonyms: 20-30%
Generic: <5%
Naked URLs: <5%
```

**Example Distribution for Page Targeting "SEO Services":**

```html
<!-- Exact match (10%) -->
<a href="/seo-services">SEO services</a>

<!-- Partial match (40%) -->
<a href="/seo-services">professional SEO services</a>
<a href="/seo-services">comprehensive SEO services for small business</a>
<a href="/seo-services">affordable SEO services</a>
<a href="/seo-services">enterprise SEO services</a>

<!-- Branded (25%) -->
<a href="/seo-services">Acme Digital SEO</a>
<a href="/seo-services">Acme's SEO solutions</a>

<!-- LSI/Synonyms (20%) -->
<a href="/seo-services">search engine optimization</a>
<a href="/seo-services">organic search marketing</a>

<!-- Generic (5%) -->
<a href="/seo-services">Learn more</a>
```

**Real-World Example: Blog Article with Strategic Internal Links**

```html
<article>
  <h1>Complete Guide to Running Your First Marathon</h1>
  
  <p>Training for a marathon requires dedication, proper 
     <a href="/nutrition/marathon-nutrition-guide">nutrition planning</a>, 
     and the right <a href="/gear/best-marathon-running-shoes">marathon running shoes</a>.</p>
  
  <h2>Creating Your Training Plan</h2>
  <p>A solid <a href="/training/marathon-training-plan">16-week marathon training plan</a> 
     should include a mix of 
     <a href="/training/long-runs">long runs</a>, 
     <a href="/training/speed-work">speed work</a>, and 
     <a href="/training/recovery-runs">recovery runs</a>.</p>
  
  <h2>Essential Gear</h2>
  <p>Beyond shoes, you'll need proper 
     <a href="/gear/running-apparel">running apparel</a>, 
     a reliable <a href="/gear/gps-running-watches">GPS running watch</a>, 
     and <a href="/gear/hydration-solutions">hydration solutions</a> 
     for your <a href="/training/long-runs">long training runs</a>.</p>
  
  <h2>Race Day Strategy</h2>
  <p>Learn about <a href="/racing/marathon-pacing-strategy">pacing strategies</a> 
     and <a href="/racing/race-day-checklist">race day preparation</a> 
     to ensure you have your best performance.</p>
  
  <!-- Related content -->
  <aside class="related-posts">
    <h3>Related Articles</h3>
    <ul>
      <li><a href="/training/half-marathon-training">How to Train for a Half Marathon</a></li>
      <li><a href="/recovery/post-marathon-recovery">Post-Marathon Recovery Guide</a></li>
      <li><a href="/injury-prevention/common-running-injuries">Preventing Common Running Injuries</a></li>
    </ul>
  </aside>
</article>
```

**Anchor Text Best Practices:**

✅ **DO:**
- Use natural, descriptive phrases
- Vary anchor text for same destination
- Include target keywords (when relevant)
- Make links obvious and clickable
- Use context around the link
- Write for humans first, search engines second

❌ **DON'T:**
- Over-optimize with exact match keywords
- Use "click here" or "read more" repeatedly
- Create long anchor text (>8 words)
- Stuff keywords unnaturally
- Use same anchor text for every link
- Link irrelevant words

**Special Cases:**

**Navigation Menus:**
```html
<!-- Use clear, descriptive labels -->
<nav>
  <a href="/services">Services</a>
  <a href="/about">About Us</a>
  <a href="/blog">Blog</a>
  <a href="/contact">Contact</a>
</nav>
```

**Image Links:**
```html
<!-- Use descriptive alt text as anchor -->
<a href="/products/blue-widget">
  <img src="blue-widget.jpg" 
       alt="Blue Widget Premium Edition" />
</a>
```

**Button CTAs:**
```html
<!-- Generic is OK for obvious CTAs -->
<a href="/free-trial" class="button">Start Free Trial</a>
<a href="/demo" class="button">Get Demo</a>
```

---
