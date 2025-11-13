
## Core Functionality

### 1. Running a Full Site Crawl

**Real-World Example: E-commerce Site Audit**

**Scenario:** You manage an e-commerce site with 150,000 product pages and need to identify why organic traffic dropped 25% last month.

**Step-by-Step Process:**

#### Configuration:
```yaml
Project: "E-commerce Store"
Start URL: https://www.yourstore.com
Crawl Type: Full Site Crawl
Crawl Limit: 200,000 pages
User Agent: Googlebot Desktop
JavaScript: Enabled
Rendering Wait Time: 3 seconds
```

#### Crawl Results Analysis:

**1. Indexability Report**
```
Total Pages Crawled: 187,432
Indexable Pages: 142,567 (76%)
Non-Indexable Pages: 44,865 (24%)

Non-Indexable Breakdown:
- Blocked by robots.txt: 12,345 pages
- Noindex tag: 28,920 pages
- Canonical to other URL: 3,600 pages
```

**Key Finding:** 28,920 product pages have noindex tags, explaining the traffic drop.

**Root Cause:** Development team accidentally deployed code that added noindex to all "out of stock" products.

**2. Site Structure Report**
```
Average Crawl Depth: 4.2 clicks from homepage
Pages at Depth 1: 234 pages
Pages at Depth 2: 2,456 pages
Pages at Depth 3: 18,903 pages
Pages at Depth 4: 87,234 pages
Pages at Depth 5+: 78,605 pages
```

**Key Finding:** 78,605 important product pages are buried too deep (5+ clicks).

**Solution:** Implement better internal linking, add category filters to reduce depth.

**3. Response Code Analysis**
```
200 OK: 142,567 pages (76%)
301 Redirects: 15,234 pages (8%)
302 Redirects: 1,243 pages (0.7%)
404 Not Found: 8,945 pages (4.8%)
500 Server Errors: 234 pages (0.1%)
```

**Key Finding:** 8,945 pages returning 404 errors with internal links pointing to them.

**Solution:** Either restore these pages or update internal links to remove 404s.

### 2. List Crawl for Specific URLs

**Real-World Example: Product Launch Audit**

**Scenario:** Your team launched 500 new product pages last week. You need to verify they're all optimized correctly.

**Process:**

#### Step 1: Prepare URL List
```csv
https://www.yourstore.com/new-product-1
https://www.yourstore.com/new-product-2
https://www.yourstore.com/new-product-3
...
(500 URLs total)
```

#### Step 2: Upload to Lumar
```
1. Create New Crawl
2. Select "List Crawl"
3. Upload CSV file
4. Enable "Crawl depth 1" to check linked pages
5. Start Crawl
```

#### Step 3: Analyze Results
```
Issues Found:
- 45 pages missing meta descriptions
- 23 pages with duplicate title tags
- 67 pages missing H1 tags
- 12 pages with broken images
- 89 pages not linked from sitemap
```

**Action Items:**
1. Update meta descriptions for 45 pages
2. Make title tags unique for 23 pages
3. Add H1 tags to 67 pages
4. Fix broken image URLs on 12 pages
5. Add 89 URLs to XML sitemap

### 3. Comparative Crawl Analysis

**Real-World Example: Website Migration**

**Scenario:** You migrated your website to a new CMS. You need to ensure nothing broke during migration.

**Process:**

#### Step 1: Baseline Crawl (Before Migration)
```
Crawl Date: January 15, 2025
Pages Crawled: 45,678
Indexable Pages: 43,234
Average Page Speed: 2.3s
```

#### Step 2: Post-Migration Crawl
```
Crawl Date: January 22, 2025
Pages Crawled: 47,123
Indexable Pages: 41,567
Average Page Speed: 1.8s
```

#### Step 3: Comparison Report
```
Changes Detected:

New Pages: 3,456
Removed Pages: 2,011
Changed Status Codes: 1,667
New 404 Errors: 892
Improved Page Speed: +21.7%
Lost Indexability: 1,667 pages

Critical Issues:
- 892 pages now returning 404 (were 200 before)
- 775 pages now have noindex (didn't before)
- 234 pages lost canonical tags
```

**Critical Action:**
Immediately restore 892 pages returning 404s and remove noindex from 775 pages.

### 4. Sitemap Analysis

**Real-World Example: XML Sitemap Optimization**

**Scenario:** Your XML sitemap contains 100,000 URLs, but only 60% are getting indexed by Google.

**Process:**

#### Step 1: Sitemap Crawl
```
1. Enter Sitemap URL: https://www.example.com/sitemap.xml
2. Select "Sitemap Crawl"
3. Enable "Cross-check with site crawl"
4. Start Crawl
```

#### Step 2: Analysis Results
```
Sitemap URLs: 100,000
URLs Crawled Successfully: 94,567
URLs Not Found (404): 5,433

Sitemap Quality Issues:
- 12,345 URLs blocked by robots.txt
- 8,976 URLs with noindex tags
- 6,543 redirect chains (301→301→301)
- 3,210 URLs not linked from site
- 2,109 duplicate URLs (different parameters)
- 1,234 URLs beyond crawl depth 5
```

**Optimization Actions:**

1. **Remove Blocked URLs (12,345):**
   - Remove robots.txt blocked URLs from sitemap
   
2. **Remove Noindex Pages (8,976):**
   - Don't include noindexed pages in sitemap
   
3. **Fix Redirects (6,543):**
   - Update sitemap with final destination URLs
   
4. **Improve Internal Linking (3,210):**
   - Add internal links to orphan pages
   
5. **Consolidate Parameters (2,109):**
   - Use canonical tags for parameter variations
   - Only include canonical version in sitemap

**Expected Outcome:**
- Reduced sitemap from 100,000 to 67,000 quality URLs
- Improved indexation rate from 60% to 92%
- Better crawl budget utilization

---
