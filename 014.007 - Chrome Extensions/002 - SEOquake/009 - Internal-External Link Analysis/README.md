
## Internal/External Link Analysis

### Internal Link Analysis Deep Dive

**What It Reveals**:
- Site structure
- Content relationships
- Link equity distribution
- Navigation patterns
- SEO opportunities

### Real-World Internal Link Example

**Scenario**: Analyzing a blog post's internal links

```
Page: yoursite.com/blog/email-marketing-guide

Internal Links Found: 18 total

Category 1: Related Blog Posts (8 links)
1. /blog/email-subject-lines → "crafting effective subject lines"
2. /blog/email-design-tips → "email design best practices"
3. /blog/list-building → "building your email list"
4. /blog/automation-guide → "email automation strategies"
5. /blog/metrics-tracking → "tracking email metrics"
6. /blog/segmentation → "list segmentation techniques"
7. /blog/ab-testing → "A/B testing emails"
8. /blog/deliverability → "improving deliverability"

Category 2: Service Pages (4 links)
9. /services/email-marketing → "our email marketing services"
10. /services/marketing-automation → "marketing automation"
11. /services/strategy → "digital marketing strategy"
12. /templates/email → "download email templates"

Category 3: Resource Pages (3 links)
13. /resources/tools → "best email marketing tools"
14. /case-studies/email → "email marketing success stories"
15. /guides/beginners → "beginner's guide"

Category 4: Navigation/Other (3 links)
16. /blog → "all blog posts"
17. /contact → "get in touch"
18. / → "homepage"
```

**Analysis**:
```
✅ Good topic clustering (related blog posts linked)
✅ Clear conversion paths (service page links)
✅ Resource depth (guides and templates)
⚠️ Could add more product/service links
⚠️ Missing links to case studies (only 1)
✅ Natural anchor text variety
```

**Optimization Opportunities**:
```
Add Links To:
1. Customer testimonials page
2. Email marketing pricing page
3. Related case studies (need 2-3 more)
4. Comparison pages (email tools comparison)
5. FAQ page about email marketing

Anchor Text Improvements:
- "email marketing services" → "professional email marketing"
- Add keyword variations
- Use more descriptive anchors
```

### Internal Link Pattern Analysis

**Example**: E-commerce Site Structure

```
Homepage Analysis:

Internal Links: 47 total

Distribution:
- Category pages: 12 links (main categories)
- Top products: 8 links (featured products)
- Blog posts: 5 links (recent articles)
- Information pages: 8 links (about, contact, etc.)
- Footer links: 14 links (various)

Link Equity Flow:
Most linked pages (by frequency across site):
1. /shop/coffee-beans (456 internal links) ✅
2. /shop/espresso-machines (389 internal links) ✅
3. /blog/brewing-guide (23 internal links) ⚠️
4. /about (678 internal links) ❌ Too many!

Issues:
- About page receiving too much link equity
- Important product categories underlinked
- Blog content isolated (needs more crosslinking)
```

**Fix Strategy**:
```
1. Reduce About Page Links:
   - Remove from sidebar on all pages
   - Keep in footer and main navigation only
   - Result: ~600 → ~150 links

2. Boost Product Category Links:
   - Add "Related Products" section to blog posts
   - Cross-link between product categories
   - Add "Shop by" sections
   - Target: 600+ links to top categories

3. Improve Blog Internal Linking:
   - Add "Related Articles" to each post
   - Create topic clusters
   - Link from product pages to relevant guides
   - Target: 100+ links per important article
```

### External Link Analysis

**What to Check**:
- Link quality and relevance
- Follow vs nofollow status
- Number of outbound links
- Destination authority
- Broken links

### Real-World External Link Example

**Scenario**: Analyzing article about "Best Project Management Tools"

```
External Links Found: 24

Category 1: Tool Websites (12 links)
1. https://asana.com → "Asana" (nofollow - affiliate)
2. https://monday.com → "Monday.com" (nofollow - affiliate)
3. https://trello.com → "Trello" (follow)
4. https://clickup.com → "ClickUp" (nofollow - affiliate)
... 8 more tool sites

Category 2: Research/Authority Sources (8 links)
13. https://hbr.org/article/project-management → "Harvard Business Review study" (follow) ✅
14. https://pmi.org/research/statistics → "PMI statistics" (follow) ✅
15. https://gartner.com/report/... → "Gartner report" (follow) ✅
16. https://forbes.com/project-management → "Forbes article" (follow) ✅

Category 3: Comparison Sites (2 links)
21. https://g2.com/categories/project-management → "G2 reviews" (nofollow)
22. https://capterra.com/project-management → "Capterra" (nofollow)

Category 4: Other (2 links)
23. http://random-blog.com/pm-tips → "PM tips" (follow) ⚠️
24. https://defunct-tool.com → "Old tool" (follow) ❌ Broken!
```

**Quality Analysis**:
```
✅ Authority sources properly cited (HBR, Gartner, Forbes)
✅ Affiliate links properly nofollowed
⚠️ Link to unknown blog (review quality)
❌ Broken link detected (fix immediately)
⚠️ Consider adding more academic sources

Follow/Nofollow Ratio:
- Follow links: 12 (50%)
- Nofollow links: 12 (50%)
- Balanced (good for natural link profile)
```

**Action Items**:
```
1. Fix broken link #24:
   - Remove or replace with updated tool
   
2. Review link #23:
   - Check domain authority
   - Verify content quality
   - Consider nofollow if low quality
   
3. Add more authoritative sources:
   - Link to academic studies
   - Reference industry reports
   - Cite recent statistics
   
4. Verify affiliate disclosures:
   - Add disclosure statement
   - Ensure all affiliate links nofollowed
   - Comply with FTC guidelines
```

### Link Audit Checklist

**Monthly Link Audit Process**:

```
Step 1: Run SEOquake External Link Analysis
   - Export all external links
   - Check each manually or use tool

Step 2: Check for Broken Links
   ❌ Remove or update broken links
   
Step 3: Verify Follow/Nofollow Status
   - Affiliate links: nofollow
   - Sponsored content: nofollow
   - Authority sources: follow
   - User-generated content: nofollow
   
Step 4: Authority Check
   - High authority (DA 50+): Keep as follow
   - Medium authority (DA 30-50): Case by case
   - Low authority (DA <30): Nofollow or remove
   
Step 5: Relevance Check
   - Does link add value?
   - Is destination still relevant?
   - Is content still live?
   
Step 6: Balance Check
   - Too many outbound links? (max 100 per page)
   - Good internal/external ratio? (aim for 2:1)
   - Natural anchor text distribution?
```
