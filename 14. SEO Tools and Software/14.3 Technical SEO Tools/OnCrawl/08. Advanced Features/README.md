
## Advanced Features

### 1. API Access

OnCrawl provides full API access for automation and integration.

**API Use Cases:**

```python
# Example: Automated Daily Crawl Report

import requests
import json
from datetime import datetime

ONCRAWL_API_KEY = "your_api_key_here"
PROJECT_ID = "12345"

headers = {
    "Authorization": f"Bearer {ONCRAWL_API_KEY}",
    "Content-Type": "application/json"
}

# Launch a new crawl
def launch_crawl():
    url = f"https://api.oncrawl.com/v3/projects/{PROJECT_ID}/crawls"
    
    payload = {
        "name": f"Daily Crawl - {datetime.now().strftime('%Y-%m-%d')}",
        "config_id": "default_config",
        "start_now": True
    }
    
    response = requests.post(url, headers=headers, json=payload)
    return response.json()['crawl_id']

# Get crawl status
def get_crawl_status(crawl_id):
    url = f"https://api.oncrawl.com/v3/projects/{PROJECT_ID}/crawls/{crawl_id}"
    response = requests.get(url, headers=headers)
    return response.json()

# Get crawl summary
def get_crawl_summary(crawl_id):
    url = f"https://api.oncrawl.com/v3/projects/{PROJECT_ID}/crawls/{crawl_id}/summary"
    response = requests.get(url, headers=headers)
    data = response.json()
    
    return {
        "total_pages": data['total_urls'],
        "status_200": data['status_codes']['200'],
        "status_404": data['status_codes']['404'],
        "avg_depth": data['average_depth'],
        "orphan_pages": data['orphan_count']
    }

# Compare with previous crawl
def compare_crawls(current_crawl_id, previous_crawl_id):
    url = f"https://api.oncrawl.com/v3/projects/{PROJECT_ID}/compare"
    
    payload = {
        "crawl_a": previous_crawl_id,
        "crawl_b": current_crawl_id
    }
    
    response = requests.post(url, headers=headers, json=payload)
    return response.json()

# Export data to CSV
def export_to_csv(crawl_id, segment="all"):
    url = f"https://api.oncrawl.com/v3/projects/{PROJECT_ID}/crawls/{crawl_id}/export"
    
    payload = {
        "format": "csv",
        "segment": segment,
        "fields": ["url", "status_code", "title", "depth", "internal_links_in"]
    }
    
    response = requests.post(url, headers=headers, json=payload)
    return response.json()['download_url']

# Main automation workflow
def daily_crawl_workflow():
    print("Launching daily crawl...")
    crawl_id = launch_crawl()
    
    # Wait for crawl to complete (implement proper polling)
    import time
    while True:
        status = get_crawl_status(crawl_id)
        if status['state'] == 'completed':
            break
        elif status['state'] == 'failed':
            raise Exception("Crawl failed!")
        time.sleep(60)  # Check every minute
    
    print("Crawl completed. Generating report...")
    summary = get_crawl_summary(crawl_id)
    
    # Alert if critical issues
    if summary['status_404'] > 1000:
        send_alert(f"High 404 count: {summary['status_404']}")
    
    if summary['orphan_pages'] > 500:
        send_alert(f"High orphan pages: {summary['orphan_pages']}")
    
    print("Exporting data...")
    csv_url = export_to_csv(crawl_id, segment="products")
    
    return summary

if __name__ == "__main__":
    daily_crawl_workflow()
```

### 2. Custom Segmentation Rules

Create advanced segments using regex and complex logic.

**Example: Advanced Product Segmentation**

```javascript
// E-commerce site with complex product structure

Segmentation Rules:

1. New Products (Last 30 Days):
   Rule: URL contains /product/ AND last_modified < 30 days
   Regex: ^/product/[^/]+$
   Additional Filter: metadata.created_date > today-30d
   
2. High-Value Products:
   Rule: URL in /product/ AND 
         (traffic > 1000/month OR revenue > $5000/month)
   
3. Seasonal Products:
   Rule: URL matches seasonal patterns
   Regex: .*(christmas|halloween|easter|summer|winter).*
   
4. Bundle Products:
   Rule: URL contains /bundle/ OR title contains "bundle|pack|set"
   
5. Clearance/Sale:
   Rule: URL contains /sale/ OR /clearance/ OR 
         price_tag shows discount > 30%

6. Product Variants:
   Rule: URL pattern /product/[base-product]-[variant]
   Regex: ^/product/([^/]+)-(red|blue|green|small|medium|large)$
   
7. Out of Stock:
   Rule: Page contains "out of stock" text AND 
         no "notify me" button
         
8. Premium Products:
   Rule: price > $500 OR category = "luxury"

Usage:
- Monitor each segment's crawl rate
- Optimize crawl budget by segment
- Track indexation by product type
- Identify underperforming segments
```

### 3. Alert System Configuration

Set up automated alerts for critical issues.

**Alert Examples:**

```yaml
Alert Configuration:

1. Crawl Budget Alert:
   Trigger: Daily Google crawls drops > 20%
   Action:
     - Email: tech-seo@company.com
     - Slack: #seo-alerts channel
     - Priority: High
   
2. 404 Spike Alert:
   Trigger: 404 errors increase > 50% vs. 7-day average
   Threshold: Minimum 100 new 404s
   Action:
     - Email: dev-team@company.com, seo-team@company.com
     - Create Jira ticket
     - Priority: Critical
   
3. Orphan Page Alert:
   Trigger: Orphan page count > 5% of total pages
   Action:
     - Email: seo-team@company.com
     - Weekly report
     - Priority: Medium
   
4. Crawl Speed Degradation:
   Trigger: Average response time > 2 seconds
   Threshold: Affecting > 1000 pages
   Action:
     - Email: devops@company.com
     - PagerDuty notification
     - Priority: High
   
5. Index Coverage Drop:
   Trigger: Indexed pages (GSC) drops > 10%
   Action:
     - Email: all SEO stakeholders
     - Emergency meeting scheduled
     - Priority: Critical

6. Competitor Crawl Surge:
   Trigger: Competitor bot traffic increases > 200%
   Note: Potential scraping attempt
   Action:
     - Email: security@company.com
     - Enable rate limiting
     - Priority: High

7. Robots.txt Change:
   Trigger: Robots.txt file modified
   Action:
     - Email: seo-team@company.com
     - Capture diff of changes
     - Priority: Critical
     - Require approval before crawl

8. XML Sitemap Errors:
   Trigger: Sitemap contains > 5% 404s or redirects
   Action:
     - Email: seo-team@company.com
     - Auto-generate clean sitemap
     - Priority: Medium
```

### 4. Competitor Monitoring

While not OnCrawl's primary feature, you can monitor competitor bot activity in your logs.

```
Use Case: Competitive Intelligence

Log Analysis Shows:
- Competitor's crawler IP: 192.0.2.45
- Crawling frequency: 2,000 pages/day
- Sections targeted: /products/, /pricing/
- User-agent: "CompetitorBot/1.0"

Insights:
1. They're monitoring your product catalog
2. Checking pricing changes daily
3. Analyzing new product launches

Response Options:
A. Allow (if you want visibility)
B. Rate limit (slow them down without blocking)
C. Block (complete prevention)
D. Honeypot (feed false data)

Strategy Selection:
For most cases: Option B (rate limit)
- Limits competitive intelligence
- Doesn't trigger suspicion
- Maintains SEO ecosystem health
```

### 5. Change Detection and Monitoring

Track changes over time and identify patterns.

```
Change Detection Features:

1. URL Status Changes:
   Example Report:
   
   New 404s This Week:
   - /product/discontinued-widget (was 200)
   - /blog/old-post-2020 (was 301)
   - /category/seasonal-summer (was 200)
   
   New 200s This Week:
   - /product/new-launch-item (was 404)
   - /blog/updated-guide-2025 (was 301)

2. Redirect Chain Changes:
   Before: /old-url → /new-url → /current-url (2 hops)
   After: /old-url → /current-url (1 hop)
   Impact: +33% crawl efficiency

3. Content Changes:
   Detected Changes:
   - Title modified: 450 pages
   - Meta description added: 1,200 pages
   - Word count increased: 890 pages
   - H1 changed: 234 pages
   
   Impact on Crawling:
   - Pages with content updates crawled 3.2x more frequently
   - Title changes triggered re-crawl within 48 hours

4. Link Structure Changes:
   - Internal links added: 2,450
   - Internal links removed: 890
   - New orphan pages: 120
   - Recovered orphan pages: 340
   
5. Technical Changes:
   - Average load time: 1.2s → 0.8s (improved)
   - Mobile-friendly pages: 98% → 99.5%
   - Structured data errors: 340 → 12 (fixed)
```

---
