# Complete Guide to Canonicalization and Redirects

---

## 2.7 Canonicalization


**4. URL Parameters**
```
https://shop.com/shoes
https://shop.com/shoes?sort=price
https://shop.com/shoes?page=1
```

#### Real-Life Example: E-commerce Category Pages

**Scenario:** An online electronics store has duplicate content issues:

```
Original URL:
https://www.electronics.com/laptops

Duplicate URLs:
https://electronics.com/laptops              (missing www)
http://www.electronics.com/laptops           (http instead of https)
https://www.electronics.com/laptops?         (trailing question mark)
https://www.electronics.com/laptops/         (trailing slash)
https://www.electronics.com/laptops?utm_source=email  (tracking parameter)
```

**Solution Strategy:**

1. **Choose Preferred Domain:** `https://www.electronics.com`

2. **Set up 301 redirects:**
```apache
# .htaccess example
RewriteEngine On

# Redirect HTTP to HTTPS
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}/$1 [R=301,L]

# Redirect non-www to www
RewriteCond %{HTTP_HOST} !^www\.
RewriteRule ^(.*)$ https://www.%{HTTP_HOST}/$1 [R=301,L]

# Remove trailing slashes
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)/$ /$1 [R=301,L]
```

3. **Add canonical tag:**
```html
<link rel="canonical" href="https://www.electronics.com/laptops" />
```

4. **Configure Google Search Console:**
- Set preferred domain to `https://www.electronics.com`

#### Impact of Duplicate Content

**Real Example: Fashion Blog Case Study**

Before fixing duplicates:
- 500 pages on the site
- Google indexed 2,300 URLs (4.6x inflation)
- Organic traffic: 10,000 visits/month
- Ranking position for main keyword: #15

After implementing canonical tags and redirects:
- Google indexed: 520 URLs (clean)
- Organic traffic: 24,000 visits/month (+140%)
- Ranking position for main keyword: #3
- Crawl budget improved, allowing faster indexing of new content

---

### URL Parameters

#### Types of URL Parameters

**1. Passive Parameters (No Content Change)**
```
https://store.com/shoes?utm_source=facebook
https://store.com/shoes?sessionid=xyz123
https://store.com/shoes?ref=newsletter
```
These should canonicalize to the base URL.

**2. Active Parameters (Content Change)**
```
https://store.com/shoes?color=red
https://store.com/shoes?sort=price_low
https://store.com/shoes?page=2
```
These may need different handling.

#### Real-Life Example: Online Course Platform

**Scenario:** An online learning platform with complex URLs

```
Base URL: https://learn.com/course/python-basics

Parameter variations:
https://learn.com/course/python-basics?enrolled=true
https://learn.com/course/python-basics?preview=true
https://learn.com/course/python-basics?discount=SAVE20
https://learn.com/course/python-basics?source=email&campaign=summer
```

**Solution in Google Search Console:**

1. **Configure URL Parameters:**
   - `enrolled`: No URLs - Doesn't change content (user-specific)
   - `preview`: Representative URL - Shows subset of content
   - `discount`: No URLs - Doesn't change content (tracking)
   - `source`: No URLs - Tracking parameter
   - `campaign`: No URLs - Tracking parameter

2. **Add canonical tags:**
```html
<!-- On all parameter variations -->
<link rel="canonical" href="https://learn.com/course/python-basics" />
```

3. **robots.txt handling (optional):**
```
User-agent: *
Disallow: /*?enrolled=*
Disallow: /*?preview=*
Disallow: /*?discount=*
Disallow: /*?source=*
```

#### Sorting and Filtering Parameters

**E-commerce Real Example:**

```
Main category: https://shop.com/laptops

Filtered URLs:
https://shop.com/laptops?brand=dell
https://shop.com/laptops?brand=hp
https://shop.com/laptops?price=500-1000

Sorted URLs:
https://shop.com/laptops?sort=price_asc
https://shop.com/laptops?sort=newest
```

**Decision Matrix:**

| Parameter | Should Index? | Action |
|-----------|---------------|---------|
| `?brand=dell` | YES | Let index, no canonical (unique content) |
| `?sort=price_asc` | NO | Canonical to base URL (same products, different order) |
| `?page=2` | MAYBE | Use `rel="next"/"prev"` or canonical to view-all |
| `?utm_source=fb` | NO | Canonical to base URL (tracking only) |
