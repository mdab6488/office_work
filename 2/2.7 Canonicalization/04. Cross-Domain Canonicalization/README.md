# Complete Guide to Canonicalization and Redirects

---

## 2.7 Canonicalization


### Cross-Domain Canonicalization

#### Definition
Pointing canonical tags from one domain to another, indicating that content on Domain A is a copy of Domain B.

#### Real-Life Examples

**Example 1: Syndicated Content**

**Scenario:** A tech blogger writes an article that gets republished on Medium.

Original article:
```
https://www.techblogger.com/ai-trends-2025
```

Syndicated on Medium:
```
https://medium.com/@techblogger/ai-trends-2025
```

**Solution on Medium:**
```html
<link rel="canonical" href="https://www.techblogger.com/ai-trends-2025" />
```

This tells Google:
- The original source is techblogger.com
- Credit SEO value to the original
- Medium version won't compete in search results

**Example 2: Multi-Country Websites**

**Scenario:** A company has regional websites with some identical content.

```
Main site: https://www.globalshop.com
UK site: https://www.globalshop.co.uk
Australian site: https://www.globalshop.com.au
```

Some product pages are identical (global products). For example, a universal phone charger:

```html
<!-- On UK and AU sites for identical products -->
<link rel="canonical" href="https://www.globalshop.com/products/universal-charger" />

<!-- For localized products, use hreflang instead -->
<link rel="alternate" hreflang="en-us" href="https://www.globalshop.com/products/local-product" />
<link rel="alternate" hreflang="en-gb" href="https://www.globalshop.co.uk/products/local-product" />
<link rel="alternate" hreflang="en-au" href="https://www.globalshop.com.au/products/local-product" />
```

**Example 3: Press Releases**

**Scenario:** A startup publishes a press release on their site and on PR distribution services.

```
Original: https://www.startup.com/press/series-a-funding
Copy 1: https://www.prnewswire.com/startup-series-a-funding
Copy 2: https://www.businesswire.com/startup-series-a
Copy 3: https://techcrunch.com/startup-raises-10m
```

**Solution:**
- On PR distribution sites: Add canonical to original
- TechCrunch (independent coverage): No canonical (unique perspective)

#### Warning Signs

❌ **Don't use cross-domain canonicals when:**
- You want both sites to rank
- Content is genuinely different
- You don't control the other domain
- You're trying to steal SEO value (Google may ignore it)
