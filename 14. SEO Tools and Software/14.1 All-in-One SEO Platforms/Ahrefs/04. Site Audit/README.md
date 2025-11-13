
## Site Audit

### What It Does
Crawls your website to find technical SEO issues that could hurt your rankings.

### Key Features

#### 1. **Health Score**
- Overall grade of your site's technical SEO (0-100)

**Real-Life Example**:
```
Your E-commerce Site Audit Results:

Health Score: 72 (Needs improvement)

Issues Found:
- 45 broken links (404 errors)
- 23 pages with duplicate title tags
- 156 pages with slow loading speed
- 12 pages with missing meta descriptions
- 8 pages not indexed by Google
```

#### 2. **Common Issues and Solutions**

**Issue #1: Broken Internal Links**
```
Problem: 
Page: yoursite.com/blog/seo-tips
Links to: yoursite.com/services/seo-audit (404 Error)

Impact:
- Poor user experience
- Wastes link equity
- Signals poor site maintenance to Google

Solution:
1. Update the link to correct URL
2. Or redirect old URL to new page
3. Or remove the broken link
```

**Issue #2: Slow Page Speed**
```
Problem:
Product Page: yoursite.com/products/running-shoes
Load Time: 5.2 seconds (Should be under 3 seconds)

Causes Found:
- Images not optimized (2.5MB hero image)
- No browser caching
- Too many JavaScript files

Solution:
1. Compress images using TinyPNG or WebP format
2. Enable browser caching
3. Minify JavaScript and CSS
4. Use a CDN
```

**Issue #3: Duplicate Content**
```
Problem:
yoursite.com/blog/seo-guide
yoursite.com/blog/seo-guide?source=newsletter

Both URLs have identical content, splitting ranking signals

Solution:
Add canonical tag:
<link rel="canonical" href="https://yoursite.com/blog/seo-guide" />
```

### Practical Use Case: Monthly Site Maintenance

**Scenario**: You're an SEO manager maintaining a 500-page website.

**Monthly Workflow**:

1. **Run Site Audit** (takes 5-10 minutes)
2. **Review Health Score Trend**:
   ```
   January: 78
   February: 75 (↓ 3 points - investigate!)
   March: 73 (↓ 2 points - action needed)
   ```

3. **Prioritize Issues by Impact**:
   ```
   Critical (Fix Immediately):
   - 5 pages with 5xx errors (server issues)
   - 12 pages blocked by robots.txt
   
   High Priority (Fix This Week):
   - 34 broken backlinks
   - 18 pages with duplicate title tags
   
   Medium Priority (Fix This Month):
   - 89 pages missing alt text
   - 45 pages with thin content (<300 words)
   
   Low Priority (Fix When Possible):
   - 156 pages missing meta descriptions
   - 23 internal links with HTTP instead of HTTPS
   ```

4. **Create Action Items**:
   - Assign broken links to content team
   - Send duplicate titles list to web developer
   - Schedule image alt text updates

---
