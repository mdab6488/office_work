
## Best Practices

### 1. Crawl Configuration Best Practices

**Choose the Right Crawl Type:**

```yaml
Full Site Crawl:
  Use when: Initial audit, major changes, quarterly reviews
  Pros: Complete picture of site
  Cons: Slower, uses more crawl quota
  Frequency: Monthly or quarterly

List Crawl:
  Use when: New page launches, specific page audits
  Pros: Fast, targeted, efficient
  Cons: Doesn't discover link issues
  Frequency: As needed

Sitemap Crawl:
  Use when: Validating sitemap quality
  Pros: Checks what you're submitting to search engines
  Cons: Doesn't find pages not in sitemap
  Frequency: After sitemap updates

Comparative Crawl:
  Use when: Migrations, major deployments, template changes
  Pros: Identifies exactly what changed
  Cons: Requires two crawls to compare
  Frequency: Before/after major changes
```

**Optimize Crawl Settings:**

```yaml
# For JavaScript-heavy sites
JavaScript Rendering: Enabled
Wait Time: 3-5 seconds
Network Idle: 2 seconds

# For large sites (500K+ pages)
Crawl Rate: Maximum
Crawl Limit: Unlimited or realistic cap
Scheduling: Off-peak hours (2-6 AM)

# For staging environments
Respect Robots.txt: No
User Agent: Custom (staging-bot)
Basic Auth: Enabled with credentials

# For international sites
Follow Hreflang: Yes
Language Detection: Enabled
Crawl all hreflang versions: Yes
```

### 2. Segmentation Best Practices

**Strategic Segmentation:**

```yaml
Segments to Create:

By Template:
  - Homepage
  - Category Pages
  - Product Pages
  - Blog Posts
  - Landing Pages
  - Help/Support Pages

By Business Value:
  - High Revenue Pages (top 10%)
  - Medium Revenue Pages
  - Low Revenue Pages
  - Non-revenue Pages

By Performance:
  - Top Performers (high traffic/rankings)
  - Moderate Performers
  - Underperformers
  - New Pages (< 90 days)

By Technical State:
  - Optimized Pages
  - Pages with Known Issues
  - Legacy Pages
  - Redirect Pages

Rules Example:
  High Revenue Products:
    - URL contains "/product/"
    - AND Custom extraction "revenue" > $10,000
    - AND Traffic > 1,000 sessions/month
```

### 3. Alert Configuration Best Practices

**Priority-Based Alerting:**

```yaml
CRITICAL Alerts (Immediate Action):
  - Indexability drop > 10%
  - Robots.txt blocks entire site
  - SSL certificate expires < 7 days
  - Site-wide server errors (500s)
  - Security issues detected

HIGH Priority Alerts (Action within 24h):
  - Indexability drop 5-10%
  - New 404 errors > 100 pages
  - Page speed degradation > 20%
  - Duplicate content increase > 15%
  - Structured data errors > 500

MEDIUM Priority (Action within 1 week):
  - Minor indexability changes (2-5%)
  - New 404 errors 20-100 pages
  - Page speed degradation 10-20%
  - Missing meta descriptions > 50
  - Image optimization opportunities

LOW Priority (Review in monthly meeting):
  - Cosmetic issues
  - Minor optimization opportunities
  - Enhancement suggestions
  - Best practice recommendations
```

**Alert Recipient Strategy:**
```yaml
Critical Issues:
  - CTO/VP Engineering
  - SEO Director
  - On-call DevOps

High Priority:
  - SEO Manager
  - Development Team Lead
  - Product Manager

Medium Priority:
  - SEO Specialist
  - Frontend Developers
  - Content Team Lead

Low Priority:
  - SEO Team (general)
  - Weekly report digest
```

### 4. Crawl Scheduling Best Practices

**Optimal Schedule:**

```yaml
Enterprise E-commerce (500K+ pages):
  Full Crawl: Weekly (Sunday 2 AM)
  Quick Crawl: Daily (top 10K pages at 3 AM)
  Post-Deployment: Immediate (after each release)
  
News/Media Site:
  Full Crawl: Daily (2 AM)
  New Content: Every 6 hours
  Breaking News: On-demand (API trigger)
  
B2B SaaS:
  Full Crawl: Bi-weekly (alternating Sundays)
  Marketing Pages: Weekly (Monday 2 AM)
  Documentation: After updates only
  
Small Business (< 10K pages):
  Full Crawl: Monthly (first Sunday)
  Quick Check: Weekly (specific pages)
  Post-Update: As needed
```

**Considerations:**
- Run during low-traffic hours
- Avoid high-load periods (deployments, backups)
- Coordinate with development releases
- Consider time zones for international teams
- Balance thoroughness vs. server load

### 5. Data Integration Best Practices

**Connect All Available Data Sources:**

```yaml
Required Integrations:
  ✓ Google Analytics 4
  ✓ Google Search Console
  ✓ Google PageSpeed Insights

Recommended Integrations:
  ✓ Server Log Files
  ✓ Adobe Analytics (if used)
  ✓ CMS Platform
  ✓ CDN Analytics

Advanced Integrations:
  ✓ Data Studio/Looker
  ✓ BigQuery
  ✓ Custom APIs
  ✓ Business Intelligence tools
```

**Benefits of Integration:**
```
DeepCrawl + Search Console:
  → See which crawled pages are actually indexed
  → Identify crawl vs. indexation gaps
  → Validate sitemap coverage

DeepCrawl + Analytics:
  → Prioritize fixes by traffic impact
  → Identify high-value pages with issues
  → Measure fix impact on traffic

DeepCrawl + PageSpeed:
  → Comprehensive performance data
  → Core Web Vitals tracking
  → Mobile vs. desktop comparison

DeepCrawl + Log Files:
  → Actual bot behavior vs. intended crawl
  → Crawl budget optimization
  → Identify server-side issues
```

### 6. Reporting Best Practices

**Stakeholder-Specific Reports:**

**Executive Report:**
```
Focus:
- High-level metrics only
- Traffic/revenue impact
- Critical issues count
- Month-over-month trends

Format:
- 1-page summary
- Visual charts/graphs
- Red/yellow/green status
- Key action items only

Example Metrics:
- "Organic traffic: +15% vs. last month"
- "Critical issues: Down from 234 to 67 (-71%)"
- "Estimated revenue impact: +$45K/month"
```

**Developer Report:**
```
Focus:
- Technical implementation details
- Specific URLs with issues
- Code examples and fixes
- Priority-ranked action items

Format:
- Detailed technical document
- Code snippets included
- Spreadsheet with URLs
- Testing criteria

Example Issues:
- "1,234 pages missing viewport meta tag"
- "Code to implement: <meta name='viewport' content='width=device-width'>"
- "Test: Validate on staging before production"
```

**Content Team Report:**
```
Focus:
- Content quality issues
- SEO optimization opportunities
- Missing/duplicate metadata
- Thin content pages

Format:
- Spreadsheet with URLs
- Guidelines and examples
- Priority by traffic/value
- Content templates

Example Issues:
- "567 pages with thin content (<300 words)"
- "345 missing meta descriptions"
- "Template: [Product Name] - [Benefit] | Brand Name"
```

### 7. Continuous Monitoring Best Practices

**Establish Baselines:**

```yaml
Initial Audit Metrics (Baseline):
  Total Pages: 45,678
  Indexable Pages: 42,345 (92.7%)
  Average Page Speed: 2.4s
  Core Web Vitals Pass Rate: 67%
  Critical Issues: 234
  High Priority Issues: 1,567
  Medium Priority Issues: 8,945

Track These Over Time:
  - Indexability rate
  - Technical error count by type
  - Page speed trends
  - New issues introduced
  - Issues resolved
  - Time to resolution
```

**Monthly Review Checklist:**

```
☑ Review crawl trends (3-month rolling)
☑ Analyze new issues vs. resolved
☑ Check integration data accuracy
☑ Review alert effectiveness
☑ Update segmentation if needed
☑ Assess team response times
☑ Calculate SEO health score
☑ Report to stakeholders
☑ Plan next month's priorities
☑ Update documentation
```

---
