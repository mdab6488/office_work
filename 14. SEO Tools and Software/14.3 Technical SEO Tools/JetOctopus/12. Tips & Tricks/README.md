
## Tips & Tricks

### Tip 1: Smart URL Filtering with Regex

**Problem**: Need to crawl only specific sections efficiently.

**Solution**: Use regex patterns in crawl settings.

```regex
Examples:

Include only product pages:
^https://example\.com/product/

Include multiple sections:
^https://example\.com/(product|category|brand)/

Exclude parameters:
^https://example\.com/[^?]*$

Include pages updated in 2025:
^https://example\.com/blog/2025/
```

### Tip 2: Bulk URL Analysis

**Problem**: Need to audit specific URLs without full site crawl.

**Solution**: Use "List Upload" feature.

```
Steps:
1. Create CSV with URLs (one per line)
2. Upload to JetOctopus
3. Run "List Crawl" instead of site crawl
4. Get results for only those URLs

Use Case:
- Audit 1,000 top landing pages
- Check specific underperforming URLs
- Verify redirects for migration
```

### Tip 3: Custom Extraction Rules

**Problem**: Need to extract custom data not in standard reports.

**Solution**: Configure custom extraction in crawl settings.

```
Example 1: Extract product prices
XPath: //span[@class='price']/text()
Use: Track if products have prices

Example 2: Extract social share counts
XPath: //div[@class='social-shares']/@data-count
Use: Correlate social signals with rankings

Example 3: Extract publication dates
XPath: //time[@class='published']/@datetime
Use: Identify content freshness at scale
```

### Tip 4: Efficient Large Site Crawling

**Problem**: Site with 10 million pages takes too long to crawl fully.

**Solution**: Implement sampling strategy.

```
Strategy 1: Stratified Sampling
- Crawl 100% of critical pages (homepage, categories)
- Crawl 50% sample of products
- Crawl 10% sample of blog posts
- Crawl 5% sample of old archived content

Strategy 2: Rolling Sections
- Week 1: Crawl products A-F
- Week 2: Crawl products G-L
- Week 3: Crawl products M-R
- Week 4: Crawl products S-Z
- Full coverage monthly, manageable weekly crawls

Strategy 3: Priority-Based
- Daily: Critical pages (~10K)
- Weekly: High-priority sections (~100K)
- Monthly: Full site (10M)
```

### Tip 5: Data Export Automation

**Problem**: Need regular reports for stakeholders.

**Solution**: Set up automated exports via API.

```python
# Example Python script
import requests
import schedule

def export_weekly_report():
    api_key = 'your_api_key'
    project_id = 'your_project_id'
    
    # API call to export latest crawl data
    response = requests.get(
        f'https://api.jetoctopus.com/v1/projects/{project_id}/export',
        headers={'Authorization': f'Bearer {api_key}'},
        params={
            'report_type': 'technical_issues',
            'format': 'csv'
        }
    )
    
    # Save to file
    with open('weekly_seo_report.csv', 'wb') as f:
        f.write(response.content)
    
    # Send email to team...

# Schedule weekly
schedule.every().monday.at("09:00").do(export_weekly_report)
```

### Tip 6: Competitive Intelligence

**Problem**: Want to monitor competitor site changes.

**Solution**: Set up competitor crawls.

```
Setup:
1. Add competitor domain as separate project
2. Run weekly crawls
3. Compare crawls to detect:
   - New products/categories added
   - Content updates
   - Technical changes
   - Site structure modifications

Insights:
- Competitor launches new product category
  → Consider expanding your offerings
- Competitor improves page speed significantly
  → Prioritize your performance optimization
- Competitor adds rich snippets
  → Implement structured data
```

### Tip 7: JavaScript Debug Mode

**Problem**: JS rendering issues on specific pages.

**Solution**: Use JS performance debugging.

```
Steps:
1. Go to JS Performance Report
2. Filter problem pages
3. Check "View as Googlebot"
4. Compare HTML vs Rendered version side-by-side
5. Identify blocked resources
6. Check console errors

Common Fixes:
- Unblock critical JS in robots.txt
- Fix CORS issues
- Optimize JS execution time
- Add server-side rendering for critical content
```

### Tip 8: Crawl Budget Calculator

**Problem**: Don't know if your site has crawl budget issues.

**Solution**: Use this formula with JetOctopus data.

```
Formula:
Crawl Budget Efficiency = 
(Important Pages Crawled / Total Crawl Budget) × 100

Data Sources:
- Total Crawl Budget: From Logs (Googlebot hits per day)
- Important Pages Crawled: From Logs + GSC data
- Low-Value Pages Crawled: Calculated

Example:
Total Googlebot hits: 50,000/day
Important pages crawled: 15,000 (30%)
Low-value pages crawled: 35,000 (70%)

Efficiency Score: 30% (Poor)
Goal: >70%

Actions to Improve:
1. Block low-value pages in robots.txt
2. Noindex non-essential pages
3. Fix redirect chains
4. Remove duplicate content
5. Improve site structure
```

### Tip 9: Historical Data Analysis

**Problem**: Want to see long-term trends.

**Solution**: Use compare feature across multiple time periods.

```
Analysis Example:
- Month 1 (Jan): Baseline crawl
- Month 3 (Mar): Compare to baseline
- Month 6 (Jun): Compare to baseline + Month 3
- Month 12 (Dec): Annual review

Metrics to Track:
- Total indexable pages trend
- Technical issues trend
- Page speed trend
- Content quality metrics trend
- Mobile-friendliness improvements

Visualize: Create trend charts for presentations
```

### Tip 10: Emergency Audit Checklist

**Problem**: Site traffic dropped suddenly, need quick diagnosis.

**Solution**: Follow this JetOctopus emergency protocol.

```
Emergency Audit (30-minute protocol):

Minute 0-5: Homepage Check
✓ Crawl status of homepage
✓ Check if homepage is indexable
✓ Verify robots.txt not blocking

Minute 5-10: Indexability Check
✓ Run quick crawl of top 1,000 URLs
✓ Check for mass noindex addition
✓ Verify canonical tags haven't changed

Minute 10-15: Log Analysis
✓ Check Googlebot crawl patterns
✓ Look for sudden 5XX error spike
✓ Verify crawl rate hasn't dropped

Minute 15-20: GSC Integration
✓ Check Index Coverage report
✓ Look for manual actions
✓ Verify no Security Issues

Minute 20-25: Technical Issues
✓ Check for redirect chains
✓ Verify sitemap accessibility
✓ Check for JavaScript errors

Minute 25-30: Report Findings
✓ Document all issues found
✓ Prioritize by severity
✓ Create action plan

Common Emergency Issues:
- Accidental robots.txt block
- Mass noindex from CMS update
- Server issues causing 5XX errors
- Hacked site with malware
- Broken JavaScript after deployment
```

---
