
## Integration with Other Tools

### 1. Google Search Console Integration

**Setup Process:**
```
1. Navigate to: Integrations > Google Search Console
2. Click "Connect Search Console"
3. Authorize DeepCrawl access
4. Select properties to connect
5. Choose data to import:
   ☑ Index Coverage Issues
   ☑ Performance Data
   ☑ Mobile Usability
   ☑ Core Web Vitals
   ☑ Security Issues
```

**Benefits:**
```
Combined Insights:
- See crawl issues alongside indexation status
- Identify pages crawled but not indexed
- Compare sitemap submissions with actual crawls
- Validate fix impact on Search Console metrics

Example Use Case:
DeepCrawl shows: 45,678 indexable pages
Search Console shows: 32,456 indexed pages
Gap: 13,222 pages (28.9%)

Investigation reveals:
- 8,234 pages too deep (depth 5+)
- 3,456 pages low quality (thin content)
- 1,532 pages no external/strong internal links
```

### 2. Google Analytics Integration

**Setup Process:**
```
1. Navigate to: Integrations > Google Analytics
2. Click "Connect Analytics"
3. Select GA4 Property
4. Choose metrics to import:
   ☑ Sessions
   ☑ Users
   ☑ Bounce Rate
   ☑ Conversion Rate
   ☑ Revenue (if e-commerce)
5. Set attribution window: 30 days
```

**Use Cases:**

**Prioritize Fixes by Traffic Impact:**
```
Pages with Issues, Sorted by Traffic:

High Traffic + Critical Issues (FIX FIRST):
1. /product/bestseller/ - 50K sessions/month - Missing H1
2. /category/shoes/ - 45K sessions/month - Slow load (4.5s)
3. /blog/popular-post/ - 30K sessions/month - Duplicate title

Low Traffic + Critical Issues (FIX LATER):
87. /old-product/ - 23 sessions/month - Missing H1
88. /archive/2015/ - 12 sessions/month - Slow load
```

**Calculate Revenue Impact:**
```sql
SELECT 
    page_url,
    sessions,
    revenue,
    issue_type,
    estimated_improvement,
    (revenue * estimated_improvement) as projected_revenue_gain
FROM crawl_data
JOIN analytics_data
WHERE issue_severity = 'HIGH'
ORDER BY projected_revenue_gain DESC;

Results:
1. /product/crm/ - $45,000/month revenue - Missing structured data
   Estimated gain: +15% = $6,750/month
   
2. /pricing/ - $38,000/month revenue - Slow load (3.8s)
   Estimated gain: +20% = $7,600/month
```

### 3. Server Log File Integration

**Setup Process:**
```
1. Export server logs (Apache/Nginx/IIS)
2. Upload to DeepCrawl:
   - Format: Combined Log Format
   - Size: Up to 10GB
   - Date range: Last 30 days recommended
3. Configure filters:
   - Bot type: Googlebot, Bingbot, etc.
   - Response codes: All or specific
   - User segments: Bots vs. users
```

**Analysis Capabilities:**

**Crawl Budget Analysis:**
```
Log File Insights:

Googlebot Activity (30 days):
- Total requests: 2,847,392
- Unique URLs: 156,734
- Average requests/day: 94,913

URL Category Breakdown:
1. Faceted navigation: 847,392 (29.8%) ← WASTE
2. Parameter variations: 623,145 (21.9%) ← WASTE
3. Pagination: 412,567 (14.5%) ← MODERATE WASTE
4. Product pages: 287,456 (10.1%) ← GOOD
5. Category pages: 198,234 (7.0%) ← GOOD

Action: Reduce bot access to faceted/parameter URLs by 80%
Expected: Free up 1.2M requests/month for valuable content
```

**Bot Error Detection:**
```
Errors Encountered by Googlebot:

500 Server Errors: 12,345 requests (0.43%)
- Peak times: 2-4 AM (during backup)
- Affected URLs: /api/* endpoints
- Action: Optimize backup schedule

404 Not Found: 45,678 requests (1.60%)
- Top 404s:
  1. /old-blog-slug/ - 8,945 requests
  2. /discontinued-product/ - 6,543 requests
- Action: Implement 301 redirects

503 Service Unavailable: 3,456 requests (0.12%)
- Cause: Rate limiting too aggressive
- Action: Whitelist verified bots
```

### 4. Content Management System Integration

**WordPress Integration:**

```php
// DeepCrawl WordPress Plugin Configuration
add_action('init', function() {
    // Trigger crawl after content publish
    add_action('publish_post', 'deepcrawl_trigger_url_crawl');
    add_action('publish_page', 'deepcrawl_trigger_url_crawl');
    
    // Custom crawl triggers
    add_action('woocommerce_product_publish', 'deepcrawl_trigger_url_crawl');
});

function deepcrawl_trigger_url_crawl($post_id) {
    $url = get_permalink($post_id);
    
    // API call to DeepCrawl
    $response = wp_remote_post('https://api.lumar.io/v2/crawls', [
        'headers' => [
            'Authorization' => 'Bearer ' . DEEPCRAWL_API_KEY,
            'Content-Type' => 'application/json'
        ],
        'body' => json_encode([
            'urls' => [$url],
            'crawl_type' => 'list'
        ])
    ]);
}
```

**Shopify Integration:**

```javascript
// Shopify webhook for product updates
{
  "webhook": {
    "topic": "products/create",
    "address": "https://your-middleware.com/deepcrawl-trigger",
    "format": "json"
  }
}

// Middleware endpoint
app.post('/deepcrawl-trigger', async (req, res) => {
  const product = req.body;
  const productUrl = `https://yourstore.com/products/${product.handle}`;
  
  // Trigger DeepCrawl list crawl
  await axios.post('https://api.lumar.io/v2/crawls', {
    urls: [productUrl],
    crawl_type: 'list'
  }, {
    headers: {
      'Authorization': `Bearer ${DEEPCRAWL_API_KEY}`
    }
  });
  
  res.status(200).send('Crawl triggered');
});
```

### 5. Data Visualization Tools

**Google Data Studio / Looker:**

```sql
-- BigQuery query for Data Studio
SELECT 
    crawl_date,
    COUNT(*) as total_pages,
    SUM(CASE WHEN indexable = true THEN 1 ELSE 0 END) as indexable_pages,
    ROUND(SUM(CASE WHEN indexable = true THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) as indexability_rate,
    AVG(page_speed_lcp) as avg_lcp,
    SUM(CASE WHEN status_code = '404' THEN 1 ELSE 0 END) as total_404s,
    SUM(CASE WHEN status_code = '500' THEN 1 ELSE 0 END) as total_500s
FROM 
    `project.dataset.deepcrawl_data`
GROUP BY 
    crawl_date
ORDER BY 
    crawl_date DESC;
```

**Dashboard Metrics:**
```
Executive Dashboard:
- Total Indexable Pages (trend line)
- SEO Health Score (0-100)
- Critical Issues Count (red/yellow/green)
- Organic Traffic Correlation
- Estimated Revenue Impact

Technical Dashboard:
- Indexability by Segment
- Response Code Distribution
- Page Speed Metrics (LCP, FID, CLS)
- JavaScript Rendering Success Rate
- Crawl Depth Distribution

Content Dashboard:
- Pages Missing Meta Descriptions
- Duplicate Title Count
- Thin Content Pages (<300 words)
- Image Optimization Opportunities
- Internal Linking Opportunities
```

### 6. Slack Integration

**Setup:**
```
1. Go to: Integrations > Slack
2. Click "Add to Slack"
3. Select channel: #seo-alerts
4. Configure notifications:
   ☑ Crawl complete
   ☑ Critical issues detected
   ☑ Weekly summary
   ☑ Custom alerts
```

**Notification Examples:**
```
🚨 CRITICAL: Indexability dropped by 15%
Project: Main Website
Pages affected: 6,789
Previous: 45,234 indexable
Current: 38,445 indexable
View Report: https://app.lumar.io/reports/12345

✅ Crawl Complete: Main Website
Pages: 52,341
Duration: 2h 34m
Issues: 234 critical, 1,567 high
Indexability: 96.2% (+1.2%)
View Report: https://app.lumar.io/reports/12346

📊 Weekly Summary: SEO Health
Indexable Pages: 45,234 (96.2%, +1.2%)
Critical Issues: 234 (-23 from last week)
Page Speed: 1.8s avg (-0.3s)
Top Issue: 234 pages missing H1 tags
```

---
