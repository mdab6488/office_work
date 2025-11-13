
## Best Practices

### Best Practice 1: Crawl Frequency

**Recommended Schedule:**

```
Small Sites (<10K pages):
- Monthly full crawls
- Weekly priority section crawls

Medium Sites (10K-100K pages):
- Weekly full crawls
- Daily crawls of critical sections (homepage, top categories)

Large Sites (100K-1M pages):
- Weekly full crawls
- Daily crawls of new content sections
- Continuous log monitoring

Enterprise Sites (1M+ pages):
- Bi-weekly full crawls
- Daily priority sections
- Real-time log analysis
- Scheduled alerts
```

### Best Practice 2: Segmentation Strategy

**Create Meaningful Segments:**

```
Segment 1: E-commerce Product Pages
Regex: /product/|/p/
Purpose: Monitor product page health

Segment 2: Blog Content
Regex: /blog/|/article/
Purpose: Track content performance

Segment 3: Category Pages
Regex: /category/|/c/
Purpose: Monitor navigation structure

Segment 4: User-Generated Content
Regex: /review/|/question/
Purpose: Separate UGC quality metrics

Segment 5: Seasonal Content
Regex: /(sale|holiday|christmas|black-friday)/
Purpose: Track campaign pages
```

### Best Practice 3: Log Analysis Configuration

**Optimal Setup:**

```
Log Collection:
- Configure automatic log upload (FTP/SFTP)
- Set up daily log rotation
- Ensure server captures bot user-agents

Log Retention:
- Keep 90 days of logs minimum
- Store 12 months for year-over-year analysis
- Archive older logs if needed

Monitoring Frequency:
- Check Bot Dynamics report weekly
- Review crawl budget monthly
- Investigate anomalies immediately
```

### Best Practice 4: Alert Configuration

**Essential Alerts:**

```
Critical (Immediate Response):
✓ Homepage returning errors
✓ Robots.txt accidentally blocking entire site
✓ Major 5XX error spike
✓ XML sitemap inaccessible

High Priority (Same Day):
✓ >1,000 new 404 errors
✓ Duplicate title spike >500
✓ Core Web Vitals degradation >20%
✓ Indexability issues affecting >5% of pages

Medium Priority (Weekly Review):
✓ Slow page speed trends
✓ Internal linking issues
✓ Minor canonical problems
✓ Image optimization opportunities
```

### Best Practice 5: Reporting Strategy

**Monthly SEO Health Report Template:**

```
1. Executive Summary
   - Overall site health score: X/100
   - Key wins this month
   - Critical issues resolved
   - Priority actions for next month

2. Crawl Data Overview
   - Total pages crawled: X
   - Pages with issues: X (X%)
   - Top 3 issue types
   - Trend vs. last month

3. Log Analysis Insights
   - Googlebot crawl frequency: X pages/day
   - Crawl budget efficiency: X%
   - Top crawled sections
   - Crawl waste identified

4. GSC Performance
   - Total impressions: X (+/- X%)
   - Total clicks: X (+/- X%)
   - Average CTR: X%
   - Average position: X

5. Technical Issues Fixed
   - 404 errors resolved: X
   - Duplicate content reduced: X%
   - Page speed improvements: X pages
   - Mobile issues fixed: X

6. Next Month Priorities
   - Priority 1: [Action with expected impact]
   - Priority 2: [Action with expected impact]
   - Priority 3: [Action with expected impact]
```

### Best Practice 6: Team Collaboration

**Workflow Setup:**

```
Role: SEO Manager
Access: Full admin access
Responsibilities:
- Configure crawls
- Review reports
- Set priorities
- Manage integrations

Role: Content Team
Access: View-only with export rights
Responsibilities:
- Review content issues
- Export duplicate content reports
- Monitor new content indexing

Role: Development Team
Access: View technical reports
Responsibilities:
- Receive technical issue alerts
- Access error logs
- Implement fixes

Role: Client/Stakeholder
Access: View-only dashboards
Responsibilities:
- Review monthly reports
- Track progress
- Approve budget
```

---
