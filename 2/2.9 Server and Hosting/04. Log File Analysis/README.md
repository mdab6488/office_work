# Technical SEO: Server, Hosting & International Implementation

## Server and Hosting

---

### Log File Analysis

Server logs provide invaluable insights into how search engines crawl your site.

#### What Are Server Logs?

Server logs record every request made to your server, including:
- IP address
- Date and time
- Requested URL
- Status code
- User agent (browser/bot)
- Referrer
- Response size

#### Log File Formats

**Apache Access Log:**
```
192.168.1.100 - - [04/Nov/2025:10:23:45 +0000] "GET /products/shoes HTTP/1.1" 200 2326 "https://google.com" "Mozilla/5.0 (compatible; Googlebot/2.1)"
```

**Nginx Access Log:**
```
66.249.66.1 - - [04/Nov/2025:10:23:45 +0000] "GET /blog/seo-guide HTTP/1.1" 200 5432 "https://google.com/search" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
```

#### Real-Life Analysis Example

**Scenario: E-commerce site experiencing ranking drops**

**Step 1: Extract Googlebot Activity**
```bash
# Extract Googlebot requests from logs
grep "Googlebot" /var/log/nginx/access.log > googlebot.log

# Count requests by status code
grep "Googlebot" /var/log/nginx/access.log | awk '{print $9}' | sort | uniq -c | sort -rn

Results:
  15234 200  # Good
   1842 404  # Problem!
    567 301  # OK
    234 500  # Big problem!
```

**Step 2: Identify Problem URLs**
```bash
# Find all 404s for Googlebot
grep "Googlebot" /var/log/nginx/access.log | grep " 404 " | awk '{print $7}' | sort | uniq -c | sort -rn

Results:
    234 /products/old-category/
    156 /blog/deleted-post
     89 /images/missing.jpg
```

**Step 3: Analyze Crawl Patterns**
```bash
# See which sections Google crawls most
grep "Googlebot" /var/log/nginx/access.log | awk '{print $7}' | cut -d/ -f2 | sort | uniq -c | sort -rn

Results:
   5234 products
   3421 blog
   2145 category
    234 about
```

**Findings:**
```
Problems discovered:
1. 1,842 404 errors wasting crawl budget
2. 234 500 errors preventing indexing
3. /products/old-category/ causing most errors
4. Important pages getting less crawl attention

Actions taken:
1. 301 redirect old category URLs
2. Fix database timeout causing 500 errors
3. Update internal links
4. Improve crawl efficiency
```

#### Real-Life Example: Crawl Budget Optimization

**Scenario: Large news website (1 million pages)**

**Problem:** New articles not being indexed quickly enough

**Analysis:**
```bash
# Analyze crawl frequency
grep "Googlebot" access.log | awk '{print $4}' | cut -d: -f2 | sort | uniq -c

Results showed:
- Google crawling 50,000 pages/day
- 30,000 crawls on archive pages (old content)
- Only 5,000 crawls on new articles
- 15,000 crawls on pagination pages
```

**Optimization Strategy:**
```
1. Robots.txt update:
User-agent: Googlebot
Disallow: /archives/201*  # Old content
Disallow: /*?page=  # Pagination
Allow: /archives/2025  # Current year
Crawl-delay: 0  # No delay for Googlebot

2. XML Sitemap:
- Priority 1.0 for articles < 7 days old
- Priority 0.5 for older content
- Exclude old archives

3. Internal linking:
- Prominently link to latest articles
- Reduce links to old archives
```

**Results After 30 Days:**
```
Crawl distribution changed:
- 35,000 crawls on new articles (up from 5,000)
- 10,000 crawls on archives (down from 30,000)
- 5,000 crawls on pagination (down from 15,000)

SEO Impact:
- New articles indexed within 2 hours (was 24+ hours)
- 67% increase in traffic to recent content
- Improved news rankings
```

#### Using Log Analysis Tools

**1. Screaming Frog Log File Analyzer**
```
Steps:
1. Export server logs
2. Import to Screaming Frog Log Analyzer
3. Filter by Googlebot
4. Analyze:
   - Crawl frequency by URL
   - Response codes
   - Crawl budget waste
   - Pages not being crawled
```

**Real Example Dashboard:**
```
Key Metrics:
- Total Googlebot requests: 145,234
- Unique URLs crawled: 45,678
- Crawl errors: 2,341 (1.6%)
- Wasted crawl budget: 23%
- Average pages/day: 4,841

Action Items:
- Fix 2,341 error URLs
- Block low-value pages in robots.txt
- Prioritize high-value content
```

**2. Custom Python Script**
```python
import re
from collections import Counter

def analyze_googlebot_logs(logfile):
    """Analyze Googlebot crawl patterns"""
    
    googlebot_pattern = r'Googlebot'
    status_codes = []
    urls = []
    
    with open(logfile, 'r') as f:
        for line in f:
            if re.search(googlebot_pattern, line):
                # Extract status code
                status = line.split()[8]
                status_codes.append(status)
                
                # Extract URL
                url = line.split()[6]
                urls.append(url)
    
    # Count status codes
    print("Status Code Distribution:")
    for code, count in Counter(status_codes).most_common():
        print(f"{code}: {count}")
    
    # Most crawled URLs
    print("\nTop 10 Crawled URLs:")
    for url, count in Counter(urls).most_common(10):
        print(f"{url}: {count}")
    
    # Calculate crawl efficiency
    errors = sum(1 for code in status_codes if code.startswith('4') or code.startswith('5'))
    efficiency = (len(status_codes) - errors) / len(status_codes) * 100
    print(f"\nCrawl Efficiency: {efficiency:.2f}%")

# Run analysis
analyze_googlebot_logs('/var/log/nginx/access.log')
```

**Output Example:**
```
Status Code Distribution:
200: 45678
404: 1842
301: 876
500: 234

Top 10 Crawled URLs:
/: 5432
/products/: 3421
/blog/: 2987
/about/: 1543

Crawl Efficiency: 95.34%
```

#### Key Metrics to Monitor

**1. Crawl Rate**
```
Ideal: Stable crawl rate matching content update frequency
Red Flag: Sudden drops may indicate technical issues
```

**2. Status Code Distribution**
```
Healthy Site:
- 200s: > 95%
- 301s: < 3%
- 404s: < 1%
- 500s: < 0.1%
```

**3. Response Time**
```
Extract from logs:
grep "Googlebot" access.log | awk '{print $NF}' | awk '{sum+=$1; count++} END {print sum/count}'

Target: < 200ms average
Warning: > 500ms
Critical: > 1000ms
```

---
