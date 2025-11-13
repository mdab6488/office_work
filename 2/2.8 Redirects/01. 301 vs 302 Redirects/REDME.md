# Complete Guide to Canonicalization and Redirects

## 2.8 Redirects

---


### What are Redirects?

Redirects automatically send users and search engines from one URL to another. They're essential for maintaining SEO value when URLs change.

---

### 301 vs 302 Redirects

#### 301 Redirect: Moved Permanently

**What it means:** "This page has permanently moved. Update your bookmarks."

**When to use:**
- Permanent domain changes
- URL structure changes
- Discontinued products/pages
- Consolidating duplicate content
- HTTPS migration

**SEO Impact:**
- Passes 90-99% of link equity (PageRank)
- Old URL is deindexed (eventually)
- New URL inherits ranking signals

#### Real-Life Example 1: Company Rebrand

**Scenario:** "Blue Ocean Marketing" rebrands to "Wave Digital"

```
Old domain: https://www.blueoceanmarketing.com
New domain: https://www.wavedigital.com
```

**Implementation (.htaccess):**
```apache
RewriteEngine On
RewriteCond %{HTTP_HOST} ^blueoceanmarketing\.com [NC,OR]
RewriteCond %{HTTP_HOST} ^www\.blueoceanmarketing\.com [NC]
RewriteRule ^(.*)$ https://www.wavedigital.com/$1 [R=301,L]
```

**Results after 3 months:**
- 95% of traffic transferred
- Rankings maintained for most keywords
- All old URLs showing new domain in search results

#### Real-Life Example 2: E-commerce URL Restructure

**Scenario:** Improving URL structure for better SEO

```
Old structure:
https://shop.com/product.php?id=123

New structure:
https://shop.com/products/wireless-headphones
```

**Implementation (PHP):**
```php
<?php
// In product.php
$product_id = $_GET['id'];
$product = get_product($product_id);
$new_url = 'https://shop.com/products/' . $product['slug'];

header("HTTP/1.1 301 Moved Permanently");
header("Location: " . $new_url);
exit();
?>
```

**Mapping file for 10,000 products:**
```csv
old_url,new_url
/product.php?id=123,/products/wireless-headphones
/product.php?id=456,/products/laptop-stand
/product.php?id=789,/products/usb-c-cable
```

#### 302 Redirect: Moved Temporarily

**What it means:** "This page is temporarily at a different location. Don't update bookmarks."

**When to use:**
- A/B testing different URLs
- Temporary promotions
- Site maintenance
- Geo-location redirects (sometimes)
- Testing new page designs

**SEO Impact:**
- Does NOT pass link equity
- Original URL stays indexed
- Temporary solution only

#### Real-Life Example 3: Seasonal Campaign

**Scenario:** Black Friday sale redirect

```
During Nov 20-30:
https://shop.com/deals → 302 redirect → https://shop.com/black-friday-2025

After Nov 30:
https://shop.com/deals → shows regular deals page
```

**Implementation (JavaScript for flexibility):**
```javascript
// Check if within campaign dates
const now = new Date();
const campaignStart = new Date('2025-11-20');
const campaignEnd = new Date('2025-11-30');

if (now >= campaignStart && now <= campaignEnd) {
    window.location.replace('https://shop.com/black-friday-2025');
}
```

**Why 302, not 301?**
- The redirect is temporary
- After Black Friday, /deals should show regular content
- We don't want search engines to replace /deals with /black-friday-2025

#### Real-Life Example 4: A/B Testing

**Scenario:** Testing two product page layouts

```
Control: https://shop.com/product/laptop
Variant: https://shop.com/product/laptop-v2
```

**Implementation:**
```python
# Flask example
from flask import redirect, request
import random

@app.route('/product/laptop')
def product_page():
    # 50% split test
    if random.random() < 0.5:
        return redirect('/product/laptop-v2', code=302)
    else:
        return render_template('product.html')
```

**Why 302?**
- Test is temporary (2-4 weeks)
- Both URLs have same content
- Don't want search engines confused

#### Comparison Table

| Feature | 301 Permanent | 302 Temporary |
|---------|---------------|---------------|
| **Duration** | Forever | Short-term |
| **Link equity** | Yes (~95%) | No |
| **Browser cache** | Cached indefinitely | Not cached long |
| **Original URL** | Eventually deindexed | Stays indexed |
| **Use for** | Site migrations, permanent changes | A/B tests, maintenance, promotions |

