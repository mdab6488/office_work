
## 13. Best Practices {#best-practices}

### Crawl Configuration Best Practices

**1. Respectful Crawling**
```
For Production Sites:
Configuration → Speed
├── Max Threads: 1-2
├── Delay Between Requests: 500-1000ms
└── Max URLs/Second: 10

Reasoning:
- Doesn't overload server
- Mimics normal traffic
- Polite to site owner
- Avoids triggering security measures
```

**2. Memory Allocation**
```
Small Sites (<10k pages):
- Default RAM: 2GB

Medium Sites (10-100k pages):
- Allocated RAM: 4-8GB

Large Sites (>100k pages):
- Allocated RAM: 8-16GB
- Consider database mode

Command Line:
-Xmx8192m (for 8GB)
```

**3. Crawl Depth**
```
Typical Settings:
Max Crawl Depth: 10
Max Folder Depth: 10

Exception (Huge Sites):
- Limit depth to 5-6
- Crawl in sections
- Use sitemap crawl mode

Avoid:
- Infinite depth (can get lost in filters/params)
```

**4. Excluded URL Patterns**
```
Configuration → Include/Exclude

Common Exclusions:
/admin/
/wp-admin/
/cart/
/checkout/
/search?
/print/
*.pdf (if not analyzing PDFs)
*/page/[2-9]* (pagination beyond page 2)

Reasoning: Focus on important pages
```

### Analysis Best Practices

**1. Prioritization Framework**
```
High Priority (Fix Immediately):
├── 5xx errors (server issues)
├── 404s with high inlinks
├── Redirect chains on important pages
├── Missing canonicals on duplicate content
└── Indexable pages with noindex

Medium Priority (Fix This Sprint):
├── Duplicate titles on key pages
├── Missing meta descriptions
├── Multiple H1s
├── Broken images
└── Thin content (<300 words) on important pages

Low Priority (Backlog):
├── Minor title optimization
├── Image alt text on decorative images
├── Long meta descriptions (not truncated)
└── Technical debt on low-traffic pages
```

**2. Regular Monitoring Schedule**
```
Weekly:
- Quick crawl of key sections
- Check for new 404s
- Monitor status code changes

Monthly:
- Full site crawl
- Technical SEO report
- Content audit updates

Quarterly:
- Comprehensive audit
- Competitive analysis
- Strategy review

After Major Changes:
- Site redesign
- CMS migration
- URL structure changes
- New feature launches
```

**3. Documentation**
```
For Every Audit:
1. Date of crawl
2. Configuration used
3. Issues found
4. Recommended fixes
5. Actions taken
6. Results tracked

Template:
---
Audit Date: 2024-06-15
Site: example.com
Crawl Settings: Standard (all content, JS enabled)

Critical Issues: 8
High Priority: 34
Medium Priority: 156
Low Priority: 287

Top Issue: 1,234 pages with duplicate titles

Actions:
- Implemented dynamic title template
- Fixed redirect chains
- Updated canonical tags

Follow-up: 2024-07-15
---
```

### Export & Reporting Best Practices

**1. Meaningful File Names**
```
Good:
example-com_full-crawl_2024-06-15_internal-all.csv
example-com_404-analysis_2024-06-15.xlsx

Bad:
export.csv
screaming_frog_data.csv
internal_all.csv (ambiguous)
```

**2. Version Control**
```
Save crawls with versions:
/audits/
  /2024-06/
    /2024-06-15_before-fixes/
    /2024-06-22_after-fixes/
  /2024-07/
    /2024-07-15_monthly-audit/

Benefits:
- Track progress
- Compare before/after
- Reference historical data
```

**3. Custom Report Templates**
```
Create reusable exports:
Bulk Export → Custom → Save Configuration

Templates:
1. Executive Summary
   - Status code breakdown
   - Critical issues only
   - High-level metrics

2. Developer Report
   - Technical errors
   - Redirect chains
   - Canonical issues

3. Content Team Report
   - Duplicate titles
   - Missing descriptions
   - Thin content
   - H1 issues
```

### Team Collaboration Best Practices

**1. Sharing Findings**
```
Create Dashboards:
- Google Sheets with key metrics
- Regular screenshots of trends
- Shared drive for full exports

Stakeholder Communication:
- Exec: High-level impact (traffic, conversions)
- Dev: Technical specs (status codes, redirects)
- Content: Editorial issues (titles, meta, content)
- Marketing: Opportunities (optimization wins)
```

**2. Issue Tracking**
```
Use Project Management Tools:

Jira/Asana/Trello:
- Create ticket for each issue category
- Assign to responsible team member
- Track progress
- Link to Screaming Frog exports

Example Ticket:
---
Title: Fix 247 duplicate product titles
Priority: High
Assignee: Content Team
Due: 2 weeks
Evidence: [Link to export]
Impact: Improved indexation, better CTR
---
```

**3. Knowledge Sharing**
```
Internal Wiki/Documentation:
- How to run audits
- How to interpret results
- Common issues and fixes
- Best practices

Training Sessions:
- Monthly Screaming Frog review
- Share interesting findings
- Demonstrate new features
```

---
