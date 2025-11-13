
## 6. Understanding Crawl Data {#understanding-data}

### Response Code Analysis

**200 OK - Success**
```
Meaning: Page loaded successfully
Action: Generally good, but check:
├── Are these the pages you want indexed?
├── Do they have proper titles/descriptions?
└── Is content quality sufficient?
```

**301 Moved Permanently - Redirects**
```
Real Example:
Old URL: example.com/product-a
New URL: example.com/products/product-a
Status: 301

Issues to Check:
├── Redirect chains (A→B→C): Should be A→C
├── Internal links pointing to redirects
└── Slow load times from multiple redirects

Fix: Update internal links to point directly to final destination
```

**302 Found - Temporary Redirects**
```
Common Mistake:
Moving from:     example.com/old-page
Temporarily to:  example.com/new-page
Using:           302 redirect

Problem: Google may not pass link equity
Solution: Change to 301 if permanent move
```

**404 Not Found - Missing Pages**
```
Real Scenario: Blog post deleted

URL: example.com/blog/post-from-2015
Status: 404
Inlinks: 15 internal pages

Impact:
├── Broken user experience
├── Lost link equity
├── Crawl budget waste

Solutions:
1. Restore the page if valuable
2. 301 redirect to similar content
3. Create 410 (Gone) if intentionally removed
4. Fix internal links pointing to it
```

**500 Internal Server Error**
```
Example Issue: Database connection problem

URL: example.com/products/shoes
Status: 500
Discovery: Intermittent during crawl

Investigation:
1. Check server logs
2. Test during different times
3. Monitor server resources
4. Check database connections

Quick Fix: Add to retry queue in Screaming Frog
```

### Indexability Status

**Indexable Pages**
```
Criteria:
✓ Status 200
✓ No noindex tag
✓ No canonical to different URL
✓ No blocked in robots.txt
✓ Crawlable content type

Example:
URL: example.com/services
Status Code: 200
Indexability: Indexable
Meta Robots: index, follow
```

**Non-Indexable - Noindex**
```
Common Use Case: Thank you pages

URL: example.com/thank-you
Meta Robots: noindex, follow
Purpose: Keep out of search results
Found in: <meta name="robots" content="noindex">

Check: Is this intentional?
```

**Non-Indexable - Canonicalised**
```
Duplicate Content Management:

Page A: example.com/product?color=red
Canonical: example.com/product
Status: 200 but non-indexable

Page B: example.com/product?color=blue
Canonical: example.com/product
Status: 200 but non-indexable

Master Page: example.com/product
Canonical: self-referencing
Status: Indexable
```

**Non-Indexable - Robots.txt**
```
Robots.txt entry:
User-agent: *
Disallow: /admin/

Result in Screaming Frog:
URL: example.com/admin/dashboard
Indexability: Blocked by Robots.txt
Note: Can still be indexed if linked externally!
```

### Title Tag Analysis

**Optimal Title Tag**
```
URL: example.com/blue-widgets
Title: Blue Widgets | Best Quality | BrandName
Length: 52 characters
Pixel Width: 512px

✓ Under 60 characters
✓ Under 600 pixels
✓ Contains target keyword
✓ Includes branding
✓ Compelling and descriptive
```

**Common Title Issues**

**1. Missing Titles**
```
URL: example.com/about
Title: [Empty]

Impact:
- Google creates title from content
- Lost opportunity for optimization
- Poor CTR in SERPs

Fix: Add unique, descriptive title
```

**2. Duplicate Titles**
```
Example from Real Audit:

example.com/product-1 → Title: "Products | Shop"
example.com/product-2 → Title: "Products | Shop"
example.com/product-3 → Title: "Products | Shop"

Found: 487 pages with duplicate titles

Solution:
Dynamic title template:
"{Product Name} | {Category} | Brand"
```

**3. Too Long Titles**
```
Bad Example:
Title: "Buy Premium High-Quality Blue Widgets Online - Free Shipping - Best Prices - Guaranteed Quality - Shop Now at WidgetStore"
Length: 134 characters
Pixel Width: 1,245px

Google displays:
"Buy Premium High-Quality Blue Widgets Online - Free Shi..."

Fix:
"Blue Widgets - Premium Quality | Free Shipping | WidgetStore"
Length: 63 characters
```

### Meta Description Analysis

**Perfect Meta Description**
```
URL: example.com/seo-services
Meta Description: "Expert SEO services to boost your organic traffic. We offer technical audits, content optimization, and link building. Get a free consultation today!"
Length: 159 characters

✓ 150-160 characters
✓ Contains call-to-action
✓ Includes target keywords naturally
✓ Describes page content accurately
```

**Common Meta Description Issues**

**1. Missing Descriptions**
```
URL: example.com/contact
Meta Description: [Empty]

Impact:
- Google pulls random content
- May not be compelling
- Lower CTR potential

Fix: Write unique description for each important page
```

**2. Duplicate Meta Descriptions**
```
Real E-commerce Example:

500 product pages with:
"Shop our amazing products at great prices with fast shipping"

Result:
- Google may ignore them
- Poor differentiation in SERPs
- Lost opportunity for unique selling points

Solution:
Dynamic template:
"Buy {Product Name} - {Key Feature} - {Price} - Free Shipping on orders over $50"
```

### Heading Structure Analysis

**Proper Heading Hierarchy**
```
URL: example.com/blog/seo-guide

H1: "Complete SEO Guide for Beginners"          [1 instance]
├── H2: "What is SEO?"                          [1 instance]
│   ├── H3: "On-Page SEO"
│   └── H3: "Off-Page SEO"
├── H2: "Why SEO Matters"                       [1 instance]
└── H2: "Getting Started with SEO"              [1 instance]
    ├── H3: "Keyword Research"
    └── H3: "Content Creation"

✓ Single H1
✓ Logical hierarchy
✓ Descriptive headings
✓ Keyword-rich but natural
```

**Common Heading Issues**

**1. Multiple H1s**
```
Problem Page: example.com/services

H1: "Our Services"
H1: "Why Choose Us"
H1: "Contact Today"

Issue: Dilutes topic focus

Fix: 
H1: "Our Services"        [Main topic]
H2: "Why Choose Us"       [Subsection]
H2: "Contact Today"       [Subsection]
```

**2. Missing H1**
```
URL: example.com/about
H1: [None]
First heading: H2: "About Our Company"

Impact:
- Unclear page topic
- Missed optimization opportunity

Fix: Add H1 that matches page topic and title
```

**3. Skipped Heading Levels**
```
Bad Structure:

H1: "Main Topic"
H4: "Subsection"  ← Skips H2 and H3

Fix:

H1: "Main Topic"
H2: "Subsection"
```

---
