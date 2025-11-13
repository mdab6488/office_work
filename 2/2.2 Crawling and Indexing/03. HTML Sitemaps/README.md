
## 2.2 Crawling and Indexing

---


### HTML Sitemaps

HTML sitemaps are user-facing pages listing all important site pages. Different from XML sitemaps (which are for search engines).

#### Purpose

**For Users:**
- 🔹 Easy navigation when lost
- 🔹 Overview of site structure
- 🔹 Quick access to important pages

**For SEO:**
- 🔹 Additional internal linking
- 🔹 Helps crawlers discover orphaned pages
- 🔹 Distributes PageRank
- 🔹 Shows site organization

#### HTML Sitemap Example

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Site Map | Example Company</title>
    <meta name="description" content="Complete overview of all pages on Example Company website.">
</head>
<body>
    <h1>Site Map</h1>
    <p>Find everything you need on our website.</p>
    
    <section class="sitemap-section">
        <h2>Products</h2>
        <ul>
            <li>
                <a href="/products/category-a/">Category A</a>
                <ul>
                    <li><a href="/products/product-1/">Product 1</a></li>
                    <li><a href="/products/product-2/">Product 2</a></li>
                    <li><a href="/products/product-3/">Product 3</a></li>
                </ul>
            </li>
            <li>
                <a href="/products/category-b/">Category B</a>
                <ul>
                    <li><a href="/products/product-4/">Product 4</a></li>
                    <li><a href="/products/product-5/">Product 5</a></li>
                </ul>
            </li>
        </ul>
    </section>
    
    <section class="sitemap-section">
        <h2>Resources</h2>
        <ul>
            <li><a href="/blog/">Blog</a></li>
            <li><a href="/guides/">Guides</a></li>
            <li><a href="/tutorials/">Tutorials</a></li>
            <li><a href="/faq/">FAQ</a></li>
        </ul>
    </section>
    
    <section class="sitemap-section">
        <h2>Company</h2>
        <ul>
            <li><a href="/about/">About Us</a></li>
            <li><a href="/team/">Our Team</a></li>
            <li><a href="/careers/">Careers</a></li>
            <li><a href="/contact/">Contact</a></li>
        </ul>
    </section>
    
</body>
</html>
```

#### Dynamic HTML Sitemap (WordPress)

```php
<?php
/*
Template Name: HTML Sitemap
*/
get_header();
?>

<div class="sitemap-page">
    <h1>Site Map</h1>
    
    <section>
        <h2>Pages</h2>
        <ul>
            <?php
            wp_list_pages(array(
                'title_li' => '',
                'depth' => 2
            ));
            ?>
        </ul>
    </section>
    
    <section>
        <h2>Blog Posts</h2>
        <?php
        $categories = get_categories();
        foreach ($categories as $category) {
            echo '<h3>' . $category->name . '</h3>';
            echo '<ul>';
            
            $posts = get_posts(array(
                'category' => $category->term_id,
                'numberposts' => 20
            ));
            
            foreach ($posts as $post) {
                echo '<li><a href="' . get_permalink($post->ID) . '">' . $post->post_title . '</a></li>';
            }
            
            echo '</ul>';
        }
        ?>
    </section>
    
    <section>
        <h2>Archives</h2>
        <ul>
            <?php wp_get_archives('type=monthly&limit=12'); ?>
        </ul>
    </section>
    
</div>

<?php get_footer(); ?>
```

#### Real Example: Large E-commerce Site

```html
<!-- https://example.com/sitemap/ -->

<div class="html-sitemap">
    
    <!-- Shop by Category -->
    <section>
        <h2>Shop by Category</h2>
        <div class="columns">
            <div class="column">
                <h3>Electronics</h3>
                <ul>
                    <li><a href="/electronics/laptops/">Laptops</a> (245 products)</li>
                    <li><a href="/electronics/tablets/">Tablets</a> (89 products)</li>
                    <li><a href="/electronics/phones/">Phones</a> (156 products)</li>
                </ul>
            </div>
            <div class="column">
                <h3>Clothing</h3>
                <ul>
                    <li><a href="/clothing/mens/">Men's</a> (523 products)</li>
                    <li><a href="/clothing/womens/">Women's</a> (687 products)</li>
                    <li><a href="/clothing/kids/">Kids'</a> (234 products)</li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- Information -->
    <section>
        <h2>Customer Service</h2>
        <ul>
            <li><a href="/help/">Help Center</a></li>
            <li><a href="/shipping/">Shipping Information</a></li>
            <li><a href="/returns/">Returns & Exchanges</a></li>
            <li><a href="/contact/">Contact Us</a></li>
        </ul>
    </section>
    
</div>
```

**CSS for Visual Organization:**

```css
.html-sitemap {
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px 20px;
}

.sitemap-section {
    margin-bottom: 40px;
    padding: 20px;
    background: #f5f5f5;
    border-radius: 8px;
}

.sitemap-section h2 {
    color: #333;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #0066cc;
}

.sitemap-section ul {
    list-style: none;
    padding: 0;
}

.sitemap-section li {
    margin: 8px 0;
}

.sitemap-section li a {
    color: #0066cc;
    text-decoration: none;
}

.sitemap-section li a:hover {
    text-decoration: underline;
}

.sitemap-section ul ul {
    margin-left: 20px;
    margin-top: 10px;
}

.columns {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}
```

#### When NOT to Include in HTML Sitemap

❌ Don't include:
- Admin pages
- Login/logout pages
- Checkout pages
- Thank you pages
- User profile pages
- Duplicate content
- Low-value pages

#### Real Business Impact

**Case Study: SaaS Company**

**Before HTML Sitemap:**
- 200 feature pages not linked from main navigation
- Google had difficulty discovering all pages
- Orphaned pages (no internal links pointing to them)

**After HTML Sitemap:**
```
Created sitemap at /sitemap/
Added to footer: "Sitemap" link
Organized by:
- Main Features
- Integrations
- Use Cases
- Resources
- Company Info
```

**Results:**
- ✅ Orphaned pages: 45 → 0
- ✅ All 200 pages indexed within 2 weeks
- ✅ Internal linking improved
- ✅ "Sitemap" page became high-authority hub
- ✅ 12% increase in long-tail keyword rankings

---