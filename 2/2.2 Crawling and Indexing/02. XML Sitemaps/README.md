
## 2.2 Crawling and Indexing

---


### XML Sitemaps

XML sitemaps tell search engines which pages exist on your site and how they're organized.

#### What is an XML Sitemap?

A file listing all your important URLs:
```
https://example.com/sitemap.xml
```

**Purpose:**
- 📍 Helps search engines discover all your pages
- 📍 Indicates which pages are most important
- 📍 Shows when pages were last updated
- 📍 Speeds up indexing of new content

#### Basic XML Sitemap Structure

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  
  <!-- Homepage -->
  <url>
    <loc>https://example.com/</loc>
    <lastmod>2025-11-01</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  
  <!-- Category Page -->
  <url>
    <loc>https://example.com/products/</loc>
    <lastmod>2025-10-28</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  
  <!-- Product Page -->
  <url>
    <loc>https://example.com/products/blue-widget/</loc>
    <lastmod>2025-10-25</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  
</urlset>
```

#### Sitemap Elements Explained

| Element | Required | Description | Example |
|---------|----------|-------------|---------|
| `<loc>` | ✅ Yes | Full URL of the page | `https://site.com/page/` |
| `<lastmod>` | ❌ Optional | Last modification date | `2025-11-01` |
| `<changefreq>` | ❌ Optional | How often page changes | `daily`, `weekly`, `monthly` |
| `<priority>` | ❌ Optional | Importance (0.0 to 1.0) | `0.8` |

**Note:** Google mostly ignores `changefreq` and `priority`. Focus on `<loc>` and accurate `<lastmod>`.

#### Sitemap Types

**1. Regular Sitemap**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://example.com/</loc>
  </url>
  <url>
    <loc>https://example.com/about/</loc>
  </url>
</urlset>
```

**2. Sitemap Index (For Large Sites)**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  
  <sitemap>
    <loc>https://example.com/sitemap-posts.xml</loc>
    <lastmod>2025-11-01</lastmod>
  </sitemap>
  
  <sitemap>
    <loc>https://example.com/sitemap-products.xml</loc>
    <lastmod>2025-10-30</lastmod>
  </sitemap>
  
  <sitemap>
    <loc>https://example.com/sitemap-pages.xml</loc>
    <lastmod>2025-10-15</lastmod>
  </sitemap>
  
</sitemapindex>
```

**3. Image Sitemap**
```xml
<url>
  <loc>https://example.com/product/blue-widget/</loc>
  <image:image>
    <image:loc>https://example.com/images/blue-widget.jpg</image:loc>
    <image:caption>Blue Widget Product Photo</image:caption>
    <image:title>Blue Widget</image:title>
  </image:image>
</url>
```

**4. Video Sitemap**
```xml
<url>
  <loc>https://example.com/videos/how-to-guide/</loc>
  <video:video>
    <video:thumbnail_loc>https://example.com/thumbs/video-thumb.jpg</video:thumbnail_loc>
    <video:title>How to Use Our Product</video:title>
    <video:description>Complete guide to using our product</video:description>
    <video:content_loc>https://example.com/video.mp4</video:content_loc>
    <video:duration>600</video:duration>
  </video:video>
</url>
```

#### Sitemap Limits

- **Max URLs per sitemap:** 50,000
- **Max file size:** 50 MB (uncompressed)
- **Solution for large sites:** Use sitemap index

#### Real E-commerce Sitemap Structure

```
sitemap_index.xml
├── sitemap-categories.xml      (50 category pages)
├── sitemap-products-1.xml      (50,000 products)
├── sitemap-products-2.xml      (50,000 products)
├── sitemap-products-3.xml      (20,000 products)
├── sitemap-blog.xml            (500 blog posts)
├── sitemap-pages.xml           (100 static pages)
└── sitemap-images.xml          (100,000 images)
```

#### Generating Sitemaps

**Option 1: WordPress Plugins**

```
Yoast SEO - Automatic sitemap generation
RankMath - Advanced sitemap features
Google XML Sitemaps - Dedicated plugin
```

Access your WordPress sitemap:
```
https://yoursite.com/sitemap_index.xml
https://yoursite.com/post-sitemap.xml
https://yoursite.com/page-sitemap.xml
```

**Option 2: PHP Dynamic Sitemap**

```php
<?php
header('Content-Type: application/xml; charset=utf-8');

echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

// Database connection
$pdo = new PDO('mysql:host=localhost;dbname=website', 'user', 'pass');

// Fetch all published posts
$stmt = $pdo->query("SELECT slug, updated_at FROM posts WHERE status='published' ORDER BY updated_at DESC");

while ($row = $stmt->fetch()) {
    echo '<url>';
    echo '<loc>https://example.com/blog/' . htmlspecialchars($row['slug']) . '/</loc>';
    echo '<lastmod>' . date('Y-m-d', strtotime($row['updated_at'])) . '</lastmod>';
    echo '<changefreq>monthly</changefreq>';
    echo '<priority>0.7</priority>';
    echo '</url>';
}

echo '</urlset>';
?>
```

**Option 3: Python Script**

```python
import xml.etree.ElementTree as ET
from datetime import datetime

# Create sitemap
urlset = ET.Element('urlset')
urlset.set('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9')

# Add URLs
urls = [
    {'loc': 'https://example.com/', 'priority': '1.0'},
    {'loc': 'https://example.com/about/', 'priority': '0.8'},
    {'loc': 'https://example.com/products/', 'priority': '0.9'},
]

for url_data in urls:
    url = ET.SubElement(urlset, 'url')
    loc = ET.SubElement(url, 'loc')
    loc.text = url_data['loc']
    
    lastmod = ET.SubElement(url, 'lastmod')
    lastmod.text = datetime.now().strftime('%Y-%m-%d')
    
    priority = ET.SubElement(url, 'priority')
    priority.text = url_data['priority']

# Write to file
tree = ET.ElementTree(urlset)
tree.write('sitemap.xml', encoding='utf-8', xml_declaration=True)
```

**Option 4: Online Generators**

```
xml-sitemaps.com
screamingfrog.co.uk/seo-spider/
```

#### Submitting Your Sitemap

**Method 1: Google Search Console**
1. Go to "Sitemaps" section
2. Enter sitemap URL: `sitemap.xml`
3. Click "Submit"

**Method 2: Robots.txt**
```
Sitemap: https://example.com/sitemap.xml
```

**Method 3: Ping Google**
```
https://www.google.com/ping?sitemap=https://example.com/sitemap.xml
```

**Method 4: Bing Webmaster Tools**
Same process as Google Search Console

#### Real Case Study: Sitemap Implementation

**Company:** News Website (10,000+ articles)

**Problem:**
- New articles taking 3-7 days to appear in Google
- Competitors getting indexed within hours
- No sitemap in place

**Solution: Dynamic Sitemap with Priority**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  
  <!-- Recent articles (high priority) -->
  <sitemap>
    <loc>https://news.com/sitemap-recent.xml</loc>
    <lastmod>2025-11-03T10:30:00Z</lastmod>
  </sitemap>
  
  <!-- Articles by date -->
  <sitemap>
    <loc>https://news.com/sitemap-2025-11.xml</loc>
    <lastmod>2025-11-01T00:00:00Z</lastmod>
  </sitemap>
  
  <sitemap>
    <loc>https://news.com/sitemap-2025-10.xml</loc>
    <lastmod>2025-10-01T00:00:00Z</lastmod>
  </sitemap>
  
</sitemapindex>
```

**Recent Articles Sitemap (Updated Hourly):**
```xml
<urlset>
  <!-- Articles from last 48 hours -->
  <url>
    <loc>https://news.com/breaking-news-story/</loc>
    <lastmod>2025-11-03T09:15:00Z</lastmod>
    <priority>1.0</priority>
  </url>
  <!-- More recent articles... -->
</urlset>
```

**Automation:**
```python
# Cron job runs every hour
# Updates sitemap-recent.xml with new articles
# Pings Google about the update

import requests

sitemap_url = 'https://news.com/sitemap.xml'
requests.get(f'https://www.google.com/ping?sitemap={sitemap_url}')
```

**Results:**
- ✅ New articles indexed in 2-4 hours (vs 3-7 days)
- ✅ Breaking news appears in Google News within 30 minutes
- ✅ Organic traffic increased 32% in 3 months
- ✅ More articles ranking in top 10
- ✅ Improved crawl rate: 500 → 2,000 pages/day

---
