# Complete Guide to Header Tags & URL Optimization

## 3.6 URL Optimization

URLs are a critical ranking factor and user experience element. A well-optimized URL tells both users and search engines exactly what the page is about.



### Hyphens vs Underscores

This is a crucial technical SEO detail that many people get wrong. Google treats hyphens and underscores differently.

#### The Rule:

**✅ USE HYPHENS (-)** to separate words
**❌ DON'T USE UNDERSCORES (_)**

#### Why This Matters:

**Hyphens** are treated as **space separators**:
```
https://example.com/best-running-shoes
Google reads: "best running shoes" ✅
```

**Underscores** are treated as **word joiners**:
```
https://example.com/best_running_shoes
Google reads: "bestrunningshoes" ❌
```

#### Real-Life Impact:

**Searching for "running shoes":**

```
✅ https://store.com/running-shoes
   - Google recognizes: "running" + "shoes"
   - Can rank for: "running shoes", "running shoe", "shoes for running"

❌ https://store.com/running_shoes
   - Google recognizes: "runningshoes" (one word)
   - Won't rank well for "running shoes"
```

#### Comparison Examples:

**E-commerce Product:**
```
✅ Correct:
https://shop.com/mens-winter-jackets
https://shop.com/product/leather-messenger-bag

❌ Wrong:
https://shop.com/mens_winter_jackets
https://shop.com/product/leather_messenger_bag
```

**Blog Post:**
```
✅ Correct:
https://blog.com/social-media-marketing-tips
https://blog.com/email-marketing-best-practices

❌ Wrong:
https://blog.com/social_media_marketing_tips
https://blog.com/email_marketing_best_practices
```

**Service Page:**
```
✅ Correct:
https://agency.com/web-design-services
https://agency.com/pay-per-click-management

❌ Wrong:
https://agency.com/web_design_services
https://agency.com/pay_per_click_management
```

#### Other Separators:

**Plus Signs (+):**
```
❌ https://site.com/best+coffee+shops
(Treated as space in some systems but not standard)

✅ https://site.com/best-coffee-shops
```

**Spaces:**
```
❌ https://site.com/best coffee shops
(Will be encoded as %20, creating ugly URLs)
Result: https://site.com/best%20coffee%20shops

✅ https://site.com/best-coffee-shops
```

**Periods:**
```
❌ https://site.com/best.coffee.shops
(Confusing and not SEO-friendly)

✅ https://site.com/best-coffee-shops
```

#### Historical Note:

In the early 2000s, underscores were acceptable, but Google officially clarified in 2016 that hyphens are the standard. If you have an old website with underscores, it's worth considering redirecting to hyphenated URLs.

**Migration Example:**
```
Old URL: https://site.com/product_category_name
New URL: https://site.com/product-category-name
Action: Implement 301 redirect
```

---
