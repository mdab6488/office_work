
## 2.2 Crawling and Indexing

---

### Robots.txt File

The robots.txt file tells search engine crawlers which pages or sections of your site they can or cannot crawl.

#### What is Robots.txt?

A text file located at the root of your website:
```
https://example.com/robots.txt
```

**Important:** Robots.txt controls **crawling**, not **indexing**. 
- Disallowed pages can still appear in search results if linked from elsewhere
- To prevent indexing, use `<meta name="robots" content="noindex">`

#### Basic Syntax

```
User-agent: [bot name]
Disallow: [path]
Allow: [path]
Sitemap: [sitemap URL]
```

#### Real Examples

**❌ BAD Robots.txt (Blocks Everything):**

```
User-agent: *
Disallow: /

# This blocks ALL search engines from your entire site!
# Your site will disappear from Google!
```

**✅ GOOD Basic Robots.txt:**

```
# Allow all bots to crawl everything (default)
User-agent: *
Disallow:

# Specify sitemap location
Sitemap: https://example.com/sitemap.xml
```

**✅ Comprehensive Robots.txt Example:**

```
# Block all bots from admin area
User-agent: *
Disallow: /admin/
Disallow: /login/
Disallow: /cart/
Disallow: /checkout/
Disallow: /my-account/
Disallow: /wp-admin/
Disallow: /private/

# Block search and filter parameters
Disallow: /*?s=
Disallow: /*?sort=
Disallow: /*?filter=
Disallow: /*?page=
Disallow: /*?sessionid=

# Block specific file types
Disallow: /*.pdf$
Disallow: /*.doc$
Disallow: /*.xls$

# Allow CSS and JS (important for rendering)
Allow: /*.css$
Allow: /*.js$

# Block specific bots (bad bots)
User-agent: SemrushBot
Disallow: /

User-agent: AhrefsBot  
Disallow: /

# Google-specific directives
User-agent: Googlebot
Disallow: /admin/
Allow: /admin/public/

User-agent: Googlebot-Image
Disallow: /private-photos/

# Sitemap location
Sitemap: https://example.com/sitemap.xml
Sitemap: https://example.com/sitemap-products.xml
Sitemap: https://example.com/sitemap-blog.xml

# Crawl delay for aggressive bots
User-agent: *
Crawl-delay: 10
```

#### E-commerce Robots.txt Example

```
User-agent: *

# Allow important pages
Allow: /

# Block duplicate content
Disallow: /*?sort=
Disallow: /*?order=
Disallow: /*?color=
Disallow: /*?size=
Disallow: /*&

# Block user-specific pages
Disallow: /cart/
Disallow: /checkout/
Disallow: /my-account/
Disallow: /wishlist/
Disallow: /compare/

# Block search results
Disallow: /search?
Disallow: /catalogsearch/

# Block printer-friendly pages
Disallow: /*/print/

# Allow CSS/JS for proper rendering
Allow: /*.css
Allow: /*.js
Allow: /*.png
Allow: /*.jpg
Allow: /*.gif

# Sitemaps
Sitemap: https://store.com/sitemap.xml
Sitemap: https://store.com/product-sitemap.xml
Sitemap: https://store.com/category-sitemap.xml
```

#### WordPress Robots.txt Example

```
User-agent: *

# Allow homepage and content
Allow: /

# Block WordPress technical directories
Disallow: /wp-admin/
Disallow: /wp-includes/
Disallow: /wp-content/plugins/
Disallow: /wp-content/cache/
Disallow: /wp-content/themes/

# Allow theme images and assets
Allow: /wp-content/uploads/
Allow: /wp-content/themes/*.css
Allow: /wp-content/themes/*.js

# Block WordPress parameters
Disallow: /*?replytocom=
Disallow: /*?s=
Disallow: /feed/
Disallow: /comments/feed/
Disallow: /trackback/

# Block tag and date archives (potential thin content)
Disallow: /tag/
Disallow: /author/
Disallow: /*/page/

# Sitemaps
Sitemap: https://blog.com/sitemap_index.xml
```

#### Testing Your Robots.txt

**Google Search Console:**
1. Go to "Crawl" → "robots.txt Tester"
2. Test specific URLs
3. See if they're blocked or allowed

**Command Line Test:**
```bash
curl https://yoursite.com/robots.txt
```

**Check if Google sees it:**
```
https://www.google.com/robots.txt  (Google's own robots.txt)
```

#### Common Mistakes

**❌ MISTAKE #1: Blocking CSS/JS**
```
User-agent: *
Disallow: /*.css
Disallow: /*.js

# This prevents Google from rendering your page properly!
# Google can't see if your site is mobile-friendly!
```

**❌ MISTAKE #2: Blocking Pages You Want Indexed**
```
Disallow: /blog/

# Your entire blog becomes invisible to search engines!
```

**❌ MISTAKE #3: Using Robots.txt for Sensitive Content**
```
Disallow: /secret-data/

# This tells hackers where your sensitive data is!
# Use proper authentication instead!
```

**❌ MISTAKE #4: Syntax Errors**
```
User-agent * 
Dissallow: /admin/

# Missing colon after User-agent
# Typo: "Dissallow" instead of "Disallow"
```

#### Real Case Study: Robots.txt Disaster

**Company:** Travel Blog

**The Mistake:**
```
# Developer accidentally deployed this:
User-agent: *
Disallow: /

# Meant to block staging site, deployed to production!
```

**Impact:**
- 📉 Within 2 weeks: Traffic dropped 90%
- 📉 All pages removed from Google index
- 📉 Lost $50K/month in affiliate revenue
- 📉 Rankings reset (lost years of SEO work)

**Recovery:**
```
# Fixed robots.txt:
User-agent: *
Allow: /

Sitemap: https://travelblog.com/sitemap.xml
```

**Recovery Timeline:**
- Week 1: Fixed robots.txt, requested re-crawl
- Week 2-4: Pages slowly re-indexed (30% recovered)
- Month 2-3: 60% traffic recovered
- Month 4-6: 85% traffic recovered
- **Full recovery: 9 months**

**Lesson:** Always test robots.txt changes carefully!

#### Advanced: Virtual Robots.txt

For dynamic sites, generate robots.txt programmatically:

**PHP Example:**
```php
<?php
// Dynamic robots.txt
header('Content-Type: text/plain');

echo "User-agent: *\n";

// Block development/staging
if ($_SERVER['HTTP_HOST'] == 'dev.example.com') {
    echo "Disallow: /\n";
    exit;
}

// Production rules
echo "Disallow: /admin/\n";
echo "Disallow: /cart/\n";

// Dynamic sitemap based on site structure
echo "Sitemap: https://" . $_SERVER['HTTP_HOST'] . "/sitemap.xml\n";
?>
```

---
