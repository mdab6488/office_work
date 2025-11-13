
## 11. Custom Extraction {#custom-extraction}

### XPath Extraction Examples

**What is XPath?**
XPath is a query language for selecting nodes from HTML/XML documents.

**Basic XPath Syntax**:
```
//tagname                    → All elements with tagname
//tagname[@attribute='value'] → Elements with specific attribute
//tagname/text()             → Text content
//tagname/@attribute         → Attribute value
```

**Example 1: Extract Product SKUs**

**HTML Structure**:
```html
<div class="product">
  <span class="sku">SKU: ABC-123</span>
  <h2>Product Name</h2>
  <p class="price">$29.99</p>
</div>
```

**Screaming Frog Custom Extraction**:
```
Configuration → Custom → Extraction

Name: Product SKU
Type: XPath
XPath: //span[@class='sku']/text()

Result:
URL | Product SKU
/product-1 | SKU: ABC-123
/product-2 | SKU: DEF-456
/product-3 | SKU: GHI-789
```

**Example 2: Extract Meta Keywords** (if used)

**XPath**:
```
//meta[@name='keywords']/@content

Result:
URL | Keywords
/page-1 | seo, marketing, tools
/page-2 | widgets, blue, buy
```

**Example 3: Extract Breadcrumb Structure**

**HTML**:
```html
<nav class="breadcrumb">
  <a href="/">Home</a> > 
  <a href="/category">Category</a> > 
  <span>Product</span>
</nav>
```

**XPath**:
```
//nav[@class='breadcrumb']//text()

Result: Home > Category > Product
```

### CSS Selector Extraction Examples

**What are CSS Selectors?**
Similar to XPath, but uses CSS syntax familiar to web developers.

**Basic CSS Selector Syntax**:
```
tagname                → All elements with tagname
.classname             → Elements with class
#idname                → Element with ID
tagname[attribute]     → Elements with attribute
tagname::attr(href)    → Extract attribute value
```

**Example 1: Extract Canonical URLs**

**CSS Selector**:
```
Configuration → Custom → Extraction

Name: Canonical URL
Type: CSS Path
Selector: link[rel='canonical']::attr(href)

Result:
URL | Canonical URL
/page-1 | https://example.com/page-1
/page-2?param=value | https://example.com/page-2
```

**Example 2: Extract Call-to-Action Buttons**

**HTML**:
```html
<button class="cta-primary">Buy Now</button>
```

**CSS Selector**:
```
.cta-primary::text

Result:
URL | CTA Text
/product-1 | Buy Now
/product-2 | Add to Cart
/product-3 | Request Quote
```

**Example 3: Extract Publish Dates**

**HTML**:
```html
<time datetime="2024-01-15">January 15, 2024</time>
```

**CSS Selector**:
```
time::attr(datetime)

Result:
URL | Publish Date
/blog/post-1 | 2024-01-15
/blog/post-2 | 2024-02-20
/blog/post-3 | [Missing] ⚠️
```

### Regular Expression (Regex) Extraction

**Example 1: Extract Phone Numbers**

**Regex Pattern**:
```
Configuration → Custom → Extraction

Name: Phone Numbers
Type: Regex
Pattern: \d{3}[-.]?\d{3}[-.]?\d{4}

Matches:
- 555-123-4567
- 555.123.4567
- 5551234567
```

**Example 2: Extract Email Addresses**

**Regex**:
```
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}

Result:
URL | Email
/contact | support@example.com
/about | info@example.com
/team | [No email found]
```

**Example 3: Extract Prices**

**Regex**:
```
\$[\d,]+\.?\d{0,2}

Matches:
- $29.99
- $1,234.56
- $50
```

### Real-World Custom Extraction Use Case

**Scenario**: Auditing 1,000 blog posts for optimization

**Extractors Setup**:

```
1. Author Name
   XPath: //meta[@name='author']/@content

2. Publish Date
   CSS: time::attr(datetime)

3. Category
   XPath: //span[@class='category']/text()

4. Read Time
   Regex: \d+\s+min read

5. Social Shares
   XPath: //span[@class='share-count']/text()

6. Featured Image Alt Text
   CSS: .featured-image img::attr(alt)

7. Word Count
   (Built-in Screaming Frog metric)

8. Primary CTA
   CSS: .primary-cta::text
```

**Export & Analysis**:
```
Results in Excel:

URL | Author | Date | Category | Read Time | Shares | Alt Text | Words | CTA
---
/blog/post-1 | John | 2024-01-15 | SEO | 8 min | 234 | Image | 1,847 | "Download Guide"
/blog/post-2 | [Missing] ⚠️ | 2024-02-20 | Marketing | 12 min | 567 | [Missing] ⚠️ | 2,456 | "Start Free Trial"
/blog/post-3 | Jane | 2023-08-10 | [Missing] ⚠️ | 5 min | 45 | Image | 892 | [None] ⚠️

Issues Identified:
1. 23 posts missing author
2. 89 posts missing alt text
3. 45 posts missing category
4. 67 posts missing CTA
5. 123 posts < 1,000 words

Action Plan created based on data
```

---
