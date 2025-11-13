
## OnCrawl vs Competitors

### Feature Comparison

```
┌──────────────────────┬──────────┬──────────┬──────────┬──────────┐
│ Feature              │ OnCrawl  │ Screaming│ Sitebulb │ DeepCrawl│
│                      │          │   Frog   │          │          │
├──────────────────────┼──────────┼──────────┼──────────┼──────────┤
│ Website Crawling     │    ✓     │    ✓     │    ✓     │    ✓     │
│ Log File Analysis    │   ✓✓✓    │    ✗     │    ✗     │    ✓     │
│ JavaScript Rendering │    ✓     │    ✓     │    ✓     │    ✓     │
│ Unlimited Crawls     │    ✓     │    ✓     │    ✗     │    ✗     │
│ API Access           │   ✓✓✓    │    ✗     │    ✓     │    ✓     │
│ Data Studio          │   ✓✓✓    │    ✗     │    ✗     │    ✗     │
│ Real-time Monitoring │    ✓     │    ✗     │    ✗     │    ✓     │
│ Custom Segmentation  │   ✓✓✓    │    ✓     │    ✓     │    ✓     │
│ Scheduled Crawls     │    ✓     │    ✓     │    ✓     │    ✓     │
│ Compare Crawls       │    ✓     │    ✓     │    ✓     │    ✓     │
│ Cloud-based          │    ✓     │    ✗     │    ✗     │    ✓     │
│ Desktop App          │    ✗     │    ✓     │    ✓     │    ✗     │
│ Enterprise Scale     │   ✓✓✓    │    ✓     │    ✓     │    ✓     │
└──────────────────────┴──────────┴──────────┴──────────┴──────────┘

✓ = Supported
✓✓✓ = Best in class
✗ = Not supported
```

### Pricing Comparison (Approximate)

```
OnCrawl:
├── Starter: $49/month (100K URLs)
├── Growth: $149/month (500K URLs)
├── Business: $499/month (2M URLs)
└── Enterprise: Custom (Unlimited)

Screaming Frog:
├── Free: $0 (500 URLs limit)
├── Paid: $259/year (Unlimited URLs)
└── Enterprise: Not available

Sitebulb:
├── Lite: $45/month (1 project)
├── Pro: $120/month (5 projects)
└── Business: $290/month (10 projects)

DeepCrawl (Now Lumar):
├── Starter: $299/month
├── Professional: $799/month
└── Enterprise: Custom pricing

Value Analysis:
- OnCrawl: Best for log analysis and enterprise scale
- Screaming Frog: Best for budget-conscious or one-time audits
- Sitebulb: Best for agencies with multiple clients
- DeepCrawl: Best for enterprise with high compliance needs
```

### When to Choose OnCrawl

**Choose OnCrawl When:**
1. You need log file analysis (this is OnCrawl's killer feature)
2. Site has 100K+ pages
3. You have crawl budget issues
4. Need API integration for automation
5. Want custom Data Studio dashboards
6. Managing multiple large enterprise sites
7. Technical SEO is a core competency
8. You have access to server logs

**Choose Alternatives When:**
1. Site has < 10K pages (Screaming Frog)
2. Need desktop software (Screaming Frog or Sitebulb)
3. One-time audit vs. ongoing monitoring (Screaming Frog)
4. Don't have server log access (any crawler)
5. Limited budget (Screaming Frog Free)
6. Need more visual reports (Sitebulb)
```

---

## Best Practices

### 1. Crawl Configuration Best Practices

```
Do's:
✓ Start with slow crawl speed (5 pages/sec) and increase gradually
✓ Respect robots.txt on first crawl to understand restrictions
✓ Use JavaScript rendering only if site requires it (slower)
✓ Set up proper segmentation before first crawl
✓ Create crawl schedules that match content update frequency
✓ Use custom user agents to test different bot experiences
✓ Exclude admin, cart, and checkout URLs from crawl
✓ Set reasonable depth limits for very large sites
✓ Configure proper URL parameter handling
✓ Use authentication for members-only content testing

Don'ts:
✗ Don't crawl at max speed initially (can trigger server alarms)
✗ Don't crawl production site during peak traffic hours
✗ Don't ignore robots.txt without good reason
✗ Don't enable JS rendering for purely static sites (waste resources)
✗ Don't crawl entire site if you only need specific sections
✗ Don't forget to exclude sensitive URLs (user accounts, private data)
✗ Don't crawl competitor sites (ethical and legal issues)
✗ Don't run multiple full crawls simultaneously (resource waste)
```

### 2. Log File Analysis Best Practices

```
Collection:
✓ Collect minimum 30 days of logs for trend analysis
✓ Rotate logs daily for easier processing
✓ Compress historical logs (.gz format)
✓ Filter out static resources before upload (CSS, JS, images)
✓ Ensure proper timestamp format (ISO 8601)
✓ Keep logs for at least 90 days for year-over-year comparison
✓ Set up automated log shipping to OnCrawl (FTP/S3)

Analysis:
✓ Establish baseline metrics before making changes
✓ Look for patterns in crawl timing (day/hour heatmaps)
✓ Identify crawl budget waste (404s, redirects)
✓ Track crawl budget trends over time
✓ Correlate log data with crawl data for full picture
✓ Monitor different bot behaviors (Google vs. Bing)
✓ Set up alerts for crawl anomalies

Common Mistakes:
✗ Uploading logs with incomplete data
✗ Including CDN logs (wrong server)
✗ Not filtering bot traffic properly
✗ Analyzing too short a time period (< 7 days)
✗ Ignoring crawl timing patterns
✗ Not verifying real vs. fake bot IPs
```

### 3. Segmentation Strategy

```
Effective Segmentation Approach:

Level 1: Technical Segments (Auto-created)
- HTTP status codes (200, 301, 404, etc.)
- Content type (HTML, PDF, images)
- Crawl depth (1-click, 2-click, etc.)
- Response time ranges

Level 2: Page Type Segments (Manual Setup)
- Homepage
- Main navigation pages
- Category/listing pages
- Product/article detail pages
- Utility pages (search, sitemap, etc.)
- Legal pages (terms, privacy, etc.)

Level 3: Business Logic Segments (Custom)
- High-priority products/content
- Revenue-generating pages
- New content (< 30 days)
- Seasonal content
- Archived content
- Conversion pages

Level 4: Performance Segments (Hybrid)
- High-traffic pages (>1000 visits/month)
- Low-traffic pages (<100 visits/month)
- No-traffic pages (0 visits)
- High-converting pages
- High bounce rate pages

Example for E-commerce:
/
├── Homepage (1 URL)
├── Main Categories (10-20 URLs)
├── Subcategories (50-200 URLs)
├── Active Products - High Priority (1,000-5,000 URLs)
├── Active Products - Standard (10,000-50,000 URLs)
├── Active Products - Long Tail (50,000+ URLs)
├── Out of Stock - Temporary (1,000-5,000 URLs)
├── Out of Stock - Permanent (5,000-10,000 URLs)
├── Blog - Recent (0-90 days) (50-200 URLs)
├── Blog - Archive (90+ days) (500-2,000 URLs)
├── Info Pages (50-100 URLs)
└── Support/FAQ (100-500 URLs)

Analysis Goals:
- Ensure high-priority segments get adequate crawl budget
- Identify underperforming segments
- Optimize crawl budget allocation
- Track indexation by segment
- Monitor technical issues by segment
```

### 4. Ongoing Monitoring Strategy

```
Daily Checks (5 minutes):
- Quick dashboard review
- Check alert emails
- Verify crawl jobs running
- Review critical errors

Weekly Reviews (30 minutes):
- Compare week-over-week metrics
- Analyze new 404s
- Review orphan page changes
- Check crawl budget trends
- Identify new technical issues
- Monitor indexation changes

Monthly Deep Dives (2-3 hours):
- Full crawl comparison (month vs. month)
- Segmentation performance review
- Content audit (thin content, duplicates)
- Link structure analysis
- Performance optimization opportunities
- Strategic planning based on findings

Quarterly Strategic Reviews (4-6 hours):
- Year-over-year comparisons
- Major site architecture evaluation
- Crawl budget optimization strategy
- Integration with business goals
- ROI analysis of SEO efforts
- Tool stack evaluation

After Major Changes (Immediate):
- Site launches/migrations
- Redesigns
- URL structure changes
- Robots.txt modifications
- Sitemap updates
- Server moves
- CDN implementations
```

### 5. Integration with SEO Workflow

```
OnCrawl in SEO Stack:

1. Discovery Phase:
   OnCrawl → Identifies technical issues
   ↓
   Prioritization → Based on impact analysis
   ↓
   Ticket Creation → Jira/Asana with OnCrawl data

2. Content Planning:
   OnCrawl Log Analysis → Shows what Google crawls most
   ↓
   Content Calendar → Prioritize high-crawl sections
   ↓
   Publishing → Time posts for peak crawl times

3. Technical SEO:
   OnCrawl Crawl → Finds broken links, orphans
   ↓
   Development Sprint → Fix issues
   ↓
   OnCrawl Verification → Confirm fixes

4. Performance Tracking:
   OnCrawl Metrics →
   Google Search Console →
   Google Analytics →
   Business KPIs →
   Comprehensive Reporting

5. Competitive Analysis:
   OnCrawl Log Analysis → Track competitor bot activity
   ↓
   Market Intelligence → Understand competitor tactics
   ↓
   Strategy Adjustment → Stay ahead

Integration Points:
- OnCrawl → Google Data Studio → Executive Reports
- OnCrawl API → Custom Dashboard → Real-time Monitoring
- OnCrawl Alerts → Slack → Immediate Team Notification
- OnCrawl Data → BigQuery → Advanced Analytics
- OnCrawl Findings → Project Management → Task Tracking
```

---

## Troubleshooting Common Issues

### Issue #1: Crawl Taking Too Long

**Symptoms:**
- Crawl running for days
- Estimated completion time keeps increasing
- Server struggling under load

**Diagnosis:**
```
1. Check current crawl settings:
   - Pages per second
   - Concurrent connections
   - JavaScript rendering enabled?
   - Following external links?

2. Check server response:
   - Average response time
   - Any timeout errors?
   - Server load during crawl

3. Check site structure:
   - Infinite pagination?
   - Parameter-based duplicate URLs?
   - Redirect loops?
```

**Solutions:**
```
Quick Fixes:
1. Reduce crawl speed: 10 pages/sec → 5 pages/sec
2. Reduce concurrent connections: 5 → 2
3. Disable JS rendering if not needed
4. Set crawl depth limit: e.g., max 5 clicks from homepage
5. Improve URL filtering: exclude parameters, duplicates
6. Schedule crawl during low-traffic hours

Long-term Fixes:
1. Optimize server performance
2. Implement better URL canonicalization
3. Fix pagination structure
4. Use incremental crawls for large sites
5. Set up CDN to handle crawler traffic
```

### Issue #2: Log Files Not Processing

**Symptoms:**
- Uploaded logs not appearing in OnCrawl
- "Processing" status stuck
- Error messages in log upload

**Diagnosis:**
```
1. Check log format:
   - Does it match OnCrawl requirements?
   - Are all required fields present?
   - Character encoding correct (UTF-8)?

2. Check log content:
   - Are there actual bot requests?
   - Date range within expected period?
   - File size within limits?

3. Check connection:
   - FTP/SFTP credentials correct?
   - Firewall blocking connection?
   - File permissions correct?
```

**Solutions:**
```
Format Issues:
1. Ensure log format includes:
   - IP address
   - Timestamp
   - Request URL
   - HTTP status code
   - User agent
   - Response size

2. Use supported formats:
   - Apache Combined Log Format
   - Nginx default format
   - IIS W3C format
   - Custom (configure in OnCrawl)

Example Nginx Config:
log_format oncrawl '$remote_addr - $remote_user [$time_local] '
                   '"$request" $status $body_bytes_sent '
                   '"$http_referer" "$http_user_agent"';

access_log /var/log/nginx/access.log oncrawl;

Connection Issues:
1. Test FTP connection manually
2. Check firewall rules
3. Verify OnCrawl IP whitelist
4. Ensure proper file permissions (644)

Processing Issues:
1. Split large files (< 2GB each recommended)
2. Compress files (.gz) before upload
3. Remove corrupted lines
4. Filter out non-HTML requests before upload
```

### Issue #3: Inaccurate Crawl Data

**Symptoms:**
- Missing pages you know exist
- Wrong status codes
- Inconsistent results

**Diagnosis:**
```
1. Check robots.txt compliance:
   - Is OnCrawl respecting robots.txt?
   - Are pages blocked unintentionally?

2. Check JavaScript requirements:
   - Are pages JS-dependent?
   - Is JS rendering enabled?

3. Check URL parameters:
   - Are parameters creating duplicates?
   - Are important parameters being ignored?

4. Check authentication:
   - Is content behind login?
   - Are cookies needed?
```

**Solutions:**
```
Robots.txt Issues:
1. Review robots.txt rules
2. Temporarily override robots.txt in OnCrawl for testing
3. Fix overly restrictive robots.txt rules

JavaScript Issues:
1. Enable JavaScript rendering
2. Increase render timeout (default: 2 seconds)
3. Test pages manually with JS disabled

URL Parameter Issues:
1. Configure parameter handling:
   - Specify which to ignore
   - Which to keep
   - Which to track separately

2. Example configuration:
   Ignore: sessionid, utm_*, ref, fbclid
   Keep: page, color, size, category
   Track: ?id=* (track each ID separately)

Authentication Issues:
1. Provide login credentials
2. Add session cookies
3. Set up proper headers
4. Use IP whitelisting if available
```

### Issue #4: Crawl Budget Not Improving

**Symptoms:**
- Made changes but crawl budget unchanged
- Google still crawling wrong pages
- No improvement in indexation

**Diagnosis:**
```
Timeline Check:
- How long since changes made?
- SEO changes take 2-4 weeks minimum to show impact

Verification:
- Are changes actually live?
- Check robots.txt is served correctly
- Verify sitemap updates reflected
- Confirm internal link changes deployed

Monitoring:
- Compare 30-day pre/post periods
- Look for gradual trends, not instant changes
- Check if Google discovered changes (GSC)
```

**Solutions:**
```
If No Change After 4 Weeks:
1. Verify implementation:
   - Robots.txt changes live
   - Sitemap updates submitted
   - Internal link changes deployed
   - Meta robots tags correct

2. Increase signal strength:
   - More aggressive robots.txt blocking
   - Stronger internal linking signals
   - Submit URLs via IndexNow
   - Request re-crawling in GSC

3. Check for conflicting signals:
   - Sitemap includes blocked URLs
   - Internal links to noindex pages
   - Mixed canonical signals
   - Redirect chains

4. Consider alternative approaches:
   - Use noindex instead of robots.txt
   - Implement 410 (Gone) for removed content
   - Use URL parameters in GSC
   - Aggressive pagination controls

Timeline Expectations:
- Week 1-2: Google discovers changes
- Week 2-4: Crawl patterns start shifting
- Week 4-8: Clear trend emerges
- Week 8-12: Optimization stabilizes
```

### Issue #5: Conflicting Data Between Tools

**Symptoms:**
- OnCrawl shows different numbers than GSC
- Crawl data doesn't match log data
- Multiple tools showing different page counts

**Explanation:**
```
Why Data Differs:

OnCrawl Crawl Data:
- Shows what COULD be crawled
- Follows links from your site
- Can access everything technically reachable
- Reflects your site's internal structure

OnCrawl Log Data:
- Shows what Google ACTUALLY crawled
- Real Googlebot behavior
- Includes direct hits (not via links)
- Reflects Google's priorities

Google Search Console:
- Shows what's INDEXED
- Subset of what's crawled
- Reflects Google's quality filters
- May include discovered but not crawled pages

Google Analytics:
- Shows what got TRAFFIC
- Only pages that were visited
- Subset of indexed pages
- User behavior, not bot behavior

Example:
Site Stats from Different Sources:
- OnCrawl Crawl: 100,000 pages (technically crawlable)
- OnCrawl Logs: 75,000 pages (Google crawled)
- GSC Index: 65,000 pages (Google indexed)
- GA: 45,000 pages (received traffic)

This is NORMAL and EXPECTED!
```

**How to Use Each:**
```
OnCrawl Crawl Data:
Purpose: Technical health and potential
Use for: Finding issues, audit, planning
Action: Fix technical problems

OnCrawl Log Data:
Purpose: Understanding Google's behavior
Use for: Crawl budget optimization
Action: Influence crawl priorities

Google Search Console:
Purpose: Index status and search performance
Use for: Monitoring Google's decisions
Action: Improve content quality

Google Analytics:
Purpose: User engagement
Use for: Business decisions
Action: Improve UX and content

Integration Strategy:
1. OnCrawl Crawl → Find all potential pages
2. OnCrawl Logs → See what Google prioritizes
3. GSC → Verify indexation
4. GA → Track business impact

Red Flags:
🚨 OnCrawl crawls way more than logs show
   → Crawlability issues or low priority content
   
🚨 Logs show crawling but GSC shows low indexation
   → Quality/duplicate content issues
   
🚨 High indexation but low GA traffic
   → Pages ranked poorly or irrelevant queries
```

---

## Conclusion

OnCrawl is a powerful enterprise SEO platform that excels at:
- Large-scale technical SEO audits
- Log file analysis and crawl budget optimization
- Combining crawl data with actual search engine behavior
- API-driven automation
- Custom reporting via Data Studio

**Key Takeaways:**

1. **Log File Analysis is OnCrawl's Superpower**: No other tool combines crawl data with log analysis as seamlessly.

2. **Best for Enterprise**: If you have 100K+ pages and access to server logs, OnCrawl provides unmatched insights.

3. **Data-Driven Decisions**: OnCrawl helps you understand not just what's wrong, but what's most important to fix.

4. **Crawl Budget Optimization**: Essential for large sites where crawl budget is a limiting factor.

5. **Integration Mindset**: OnCrawl works best when integrated into your broader SEO workflow and toolset.

**Next Steps:**

1. **Start Trial**: Most plans offer 14-day free trial
2. **Run First Crawl**: Start with default settings
3. **Connect Logs**: Set up log file integration
4. **Learn the Interface**: Explore dashboards and reports
5. **Create Segments**: Set up meaningful page segmentations
6. **Set Alerts**: Configure notifications for critical issues
7. **Build Dashboards**: Create Data Studio reports
8. **Automate**: Use API for recurring tasks
9. **Optimize**: Use insights to improve crawl efficiency
10. **Monitor**: Establish ongoing monitoring routines

**Resources:**

- OnCrawl Documentation: https://docs.oncrawl.com/
- OnCrawl Academy: Training courses and certifications
- OnCrawl Blog: Case studies and best practices
- Support: support@oncrawl.com
- API Documentation: https://developer.oncrawl.com/

---

*Last Updated: November 2025*
*Guide Version: 2.0*
*OnCrawl Version Referenced: 3.x*
