
## Core Features

### Feature 1: Instant Metrics Display

**How to Use:**
1. Activate MozBar (click icon or press Alt+M)
2. Navigate to any website
3. Metrics appear instantly in toolbar

**Real-World Example:**

**Scenario:** Evaluating a potential guest posting opportunity

```
Visit: techcrunch.com/article-page

MozBar Display:
┌──────────────────────────────────────┐
│ DA: 93 | PA: 64 | Links: 1.2K        │
└──────────────────────────────────────┘

Analysis:
✓ High DA (93) = Authoritative domain
✓ Good PA (64) = Strong individual page
✓ 1,200+ linking domains = Well-connected
→ Decision: Excellent guest posting opportunity
```

**Example 2:** Vetting a new client's website

```
Visit: client-website.com

MozBar Display:
┌──────────────────────────────────────┐
│ DA: 15 | PA: 12 | Links: 8           │
└──────────────────────────────────────┘

Analysis:
⚠ Low DA (15) = New or weak domain
⚠ Low PA (12) = Minimal page authority
⚠ Only 8 linking domains = Limited backlink profile
→ Decision: Needs aggressive link building campaign
```

### Feature 2: SERP Overlay

**What it Does:**
Displays metrics for all search results directly in Google search results.

**How to Use:**

1. **Activate MozBar**
2. **Search on Google**
   ```
   Example search: "content marketing strategy"
   ```

3. **View Enhanced SERP**
   ```
   MozBar adds metrics under each result:
   
   Result #1: hubspot.com/marketing/content-marketing
   DA: 93 | PA: 58 | Links: 245
   
   Result #2: contentmarketinginstitute.com/guide
   DA: 76 | PA: 62 | Links: 189
   
   Result #3: blog.example.com/content-strategy
   DA: 32 | PA: 28 | Links: 15
   ```

**Real-World Application:**

**Scenario:** Keyword difficulty analysis for "best CRM software"

```
SERP Analysis with MozBar:

Position 1: salesforce.com
DA: 91 | PA: 68 | Links: 2.1K
→ Very strong brand + backlinks

Position 2: hubspot.com
DA: 93 | PA: 65 | Links: 1.8K
→ Major competitor with authority

Position 3: softwareadvice.com
DA: 78 | PA: 54 | Links: 445
→ Review site with solid authority

Position 4: zapier.com/blog
DA: 84 | PA: 51 | Links: 312
→ Strong brand blog

Position 5: pcmag.com/reviews
DA: 88 | PA: 56 | Links: 567
→ Established tech publication

Conclusion:
→ Average DA of top 5: 87
→ Average PA of top 5: 59
→ High competition keyword
→ Need DA 70+ and strong content to compete
```

### Feature 3: Link Analysis

**Access Method:**
- Click "Link Analysis" button in MozBar
- Or click the link count badge

**What You See:**

**All Links Tab:**
```
Displays every link on the page:

Internal Links (Same Domain):
- /about-us          → Followed
- /services          → Followed
- /contact           → Followed
Total Internal: 45

External Links (Other Domains):
- twitter.com/brand  → Followed
- facebook.com/page  → Followed
- partner-site.com   → Nofollow
Total External: 12
```

**Real-World Example:**

**Scenario:** Analyzing a competitor's link building strategy

```
Visit: competitor.com/top-performing-blog-post

Link Analysis Shows:

External Followed Links (Outbound):
1. authoritative-study.edu   → DA: 87 (Strong citation)
2. industry-research.org     → DA: 72 (Quality source)
3. news-article.com          → DA: 65 (Recent news)
4. partner-brand.com         → DA: 58 (Reciprocal link?)

External Nofollow Links:
5. affiliate-product.com     → DA: 45 (Affiliate link)
6. sponsor-brand.com         → DA: 52 (Sponsored content)

Insights:
→ Links to high-authority educational/research sites
→ Uses nofollow for commercial relationships
→ Proper link attribution strategy
→ Opportunity: Create similar quality content with citations
```

**Internal Link Analysis Example:**

```
Analyzing: your-site.com/blog/seo-guide

Internal Links Found: 23

Most Linked Pages:
- /services/seo (7 links)      → High priority page
- /contact (5 links)           → Conversion focus
- /blog/related-post (4 links) → Content cluster
- /tools/keyword-tool (3 links)→ Resource page

Analysis:
→ Good internal linking to services
→ Building topic clusters
→ Clear conversion path
→ Recommendation: Add more contextual links between related posts
```

### Feature 4: Page Elements

**How to Access:**
1. Click MozBar icon
2. Select "Page Elements" from dropdown

**What You Get:**

**General Attributes:**
```
Title Tag: "Complete SEO Guide 2025 | YourBrand"
- Length: 42 characters ✓
- Includes keyword ✓
- Brand included ✓

Meta Description: "Learn modern SEO techniques..."
- Length: 156 characters ✓
- Compelling copy ✓
- CTA included ✓

Canonical URL: https://yoursite.com/seo-guide
- Self-referential ✓
- HTTPS ✓

Meta Robots: index, follow
- Indexable ✓
```

**HTTP Headers:**
```
Status Code: 200 OK
Content-Type: text/html; charset=UTF-8
Server: nginx
X-Robots-Tag: none
Cache-Control: max-age=3600
```

**Real-World Application:**

**Scenario:** Auditing a page for SEO issues

```
Visit: client-site.com/product-page

Page Elements Analysis:

❌ Title Tag: "Product Page - Home"
   Issue: Generic, no keywords, 23 chars (too short)
   Fix: "Best Organic Coffee Beans | Premium Roasts | BrandName"

❌ Meta Description: Missing
   Issue: Google will auto-generate
   Fix: Write compelling 155-char description

⚠ Canonical: https://client-site.com/product-page?ref=email
   Issue: URL parameters in canonical
   Fix: Use clean URL without parameters

✓ Meta Robots: index, follow (Good)

❌ HTTP Header X-Robots-Tag: noindex
   CRITICAL: Header contradicts meta tag!
   Fix: Remove X-Robots-Tag header

Action Items:
1. Rewrite title tag with target keywords
2. Add meta description
3. Fix canonical URL
4. Remove conflicting noindex header
```

### Feature 5: Markup Analysis

**Schema.org Structured Data:**
```
Detects:
- Article schema
- Product schema
- Review schema
- Organization schema
- Breadcrumb schema
- FAQ schema
- How-to schema
```

**Real Example:**

```
Visit: recipe-blog.com/chocolate-cake

Markup Found:

✓ Recipe Schema
  - Name: "Ultimate Chocolate Cake"
  - prepTime: PT20M
  - cookTime: PT35M
  - recipeYield: 12 servings
  - aggregateRating: 4.8/5

✓ Breadcrumb Schema
  Home > Recipes > Desserts > Chocolate Cake

✓ Organization Schema
  - Name: Recipe Blog
  - Logo: URL present
  - Social profiles: 3 found

Result: Rich snippets eligible ✓
```

**Missing Markup Example:**

```
Visit: competitor-recipe.com/cake-recipe

Markup Analysis:

❌ No Recipe Schema
❌ No Rating/Review Schema
⚠ Basic Article Schema only

Opportunity:
→ Your recipe site has advantage
→ Competitor missing rich snippet eligibility
→ You'll show cooking time, ratings in SERP
→ Higher CTR potential
```

### Feature 6: Keyword Highlighting

**How to Use:**

1. **Activate Keyword Highlight**
   - Click MozBar
   - Click "Highlight Keywords"
   - Enter target keywords

2. **Enter Keywords**
   ```
   Example keywords: "content marketing, SEO, blog strategy"
   ```

3. **View Highlighted Results**
   - Each keyword gets a different color
   - See keyword density at a glance
   - Identify keyword placement

**Real-World Example:**

**Scenario:** Analyzing a competitor's keyword usage

```
Target Keyword: "email marketing software"
Secondary Keywords: "automation", "campaigns", "subscribers"

Visit: competitor.com/email-marketing-guide

Highlight Results:

Header: "email marketing software" (2x) - Purple
First paragraph: "email marketing software" (1x) - Purple
Subheading: "automation" (3x) - Yellow
Body content: "campaigns" (5x) - Green
Throughout: "subscribers" (4x) - Blue

Analysis:
→ Primary keyword in header ✓
→ Primary keyword density: ~1.2% ✓
→ Secondary keywords well-distributed ✓
→ Natural placement (not stuffing) ✓

Your Strategy:
→ Match or exceed keyword optimization
→ Ensure natural language flow
→ Target similar keyword density
```

**Content Gap Example:**

```
Your Article: blog-post-draft.html
Competitor: top-ranking-article.com

Highlight: "conversion rate optimization"

Your article: 2 mentions
Competitor: 12 mentions (in context)

Gap Identified:
→ Need more comprehensive CRO coverage
→ Add section on CRO best practices
→ Include CRO tools discussion
→ Add CRO case studies
```
