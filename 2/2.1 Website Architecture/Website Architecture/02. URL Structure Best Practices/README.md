## 2.1 Website Architecture

---


### URL Structure Best Practices

URLs are like addresses for your web pages. Good URLs help both users and search engines understand page content.

#### URL Best Practices Checklist

✅ **Use Descriptive Keywords**
✅ **Keep It Short and Simple**
✅ **Use Hyphens (not underscores)**
✅ **Use Lowercase Letters**
✅ **Avoid Parameters When Possible**
✅ **Use HTTPS (Secure)**
✅ **Consistent Structure**

#### Real-Life Examples

**❌ BAD URL Examples:**

```
https://example.com/page.php?id=12345&category=23&sort=asc
❌ Issues: Parameters, unclear content, not user-friendly

https://example.com/Product_Category_SubCategory_Item_123_Blue
❌ Issues: Underscores, too long, mixed case

https://example.com/index.php?page=articles&id=45&action=view
❌ Issues: Multiple parameters, database ID showing

https://EXAMPLE.COM/Blog/2023/This_Is_MY_ARTICLE/
❌ Issues: Mixed case, underscores, inconsistent

https://example.com/a/b/c/d/e/f/g/h/product.html
❌ Issues: Too deep, meaningless structure
```

**✅ GOOD URL Examples:**

```
https://example.com/mens-running-shoes/
✅ Clear, descriptive, keyword-rich

https://example.com/blog/technical-seo-guide/
✅ Shows hierarchy, easy to read

https://example.com/products/iphone-15-pro-max/
✅ Descriptive, includes product name

https://example.com/support/how-to-reset-password/
✅ Indicates section and content clearly

https://example.com/chicago/pizza-delivery/
✅ Location-based, descriptive
```

#### Real E-commerce URL Structure

**Example: Online Shoe Store**

```
https://shoeshop.com/
├── /mens-shoes/                          ← Category page
│   ├── /mens-running-shoes/              ← Subcategory
│   │   └── /nike-air-zoom-pegasus-40/    ← Product
│   ├── /mens-casual-shoes/
│   └── /mens-boots/
├── /womens-shoes/
│   ├── /womens-heels/
│   └── /womens-sneakers/
│       └── /adidas-ultraboost-23/
└── /kids-shoes/
```

**Why This Works:**
- Users understand where they are
- Keywords in URL help SEO
- Easy to share and remember
- Search engines understand hierarchy

#### URL Parameters: When and How

**Static URLs (Preferred):**
```
https://store.com/mens-blue-jeans/
```

**Dynamic URLs with Parameters:**
```
https://store.com/products?category=jeans&color=blue&size=32&sort=price
```

**When Parameters Are Necessary:**

1. **Filtering/Sorting:** E-commerce sites
2. **Tracking:** Campaign parameters
3. **Pagination:** Page numbers
4. **Search Results:** Query strings

**How to Handle Parameters (robots.txt):**

```
# Tell Google to ignore certain parameters
User-agent: Googlebot
Disallow: /*?sort=
Disallow: /*?sessionid=
Disallow: /*?ref=
```

**Or Use Google Search Console:**
- Configure URL Parameters
- Tell Google which parameters to ignore

#### Real-Life Case Study: URL Restructure

**Company:** Online Fashion Retailer

**Old URL Structure:**
```
https://fashionstore.com/product.php?id=12345
https://fashionstore.com/cat?category_id=women&sub=dresses&p=2
```

**New URL Structure:**
```
https://fashionstore.com/womens-dresses/floral-summer-dress/
https://fashionstore.com/womens-dresses/?page=2
```

**Implementation:**
```apache
# .htaccess 301 Redirect
RewriteEngine On
RewriteRule ^product\.php?id=12345$ /womens-dresses/floral-summer-dress/ [R=301,L]
```

**Results After 6 Months:**
- ✅ Organic traffic: +35%
- ✅ Click-through rate from SERP: +28% (URLs more clickable)
- ✅ Bounce rate: -15%
- ✅ Pages indexed: Increased from 3,500 to 8,200

---
