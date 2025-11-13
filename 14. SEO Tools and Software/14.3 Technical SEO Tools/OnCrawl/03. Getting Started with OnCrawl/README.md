
## Getting Started with OnCrawl

### Initial Setup Process

#### Step 1: Account Configuration

```
1. Sign up at oncrawl.com
2. Choose your plan based on:
   - Number of pages to crawl
   - Log file size (GB per month)
   - Number of projects needed
   
3. Create your first project:
   Project Name: Main Website
   URL: https://www.example.com
   Crawl Type: Full Site Crawl
```

#### Step 2: Setting Up Your First Crawl

**Basic Crawl Configuration:**

```yaml
Crawl Settings:
  Start URL: https://www.example.com
  Crawl Scope: 
    - Include: www.example.com/*
    - Exclude: /admin/*, /cart/*, /checkout/*
  
  User Agent: Googlebot Desktop
  
  JavaScript Rendering: 
    - Option: Enabled (if site is JS-heavy)
    - Delay: 2 seconds (wait for JS to load)
  
  Crawl Speed:
    - Pages per second: 10
    - Max connections: 2
    
  Crawl Depth: Unlimited
  
  Follow:
    - Internal links: Yes
    - External links: No
    - Redirect chains: Yes (max 5 hops)
```

**Advanced Options:**
```yaml
Custom Headers:
  - Cookie: session=test123 (for crawling behind login)
  - Accept-Language: en-US

Robots.txt:
  - Respect: Yes (recommended for first crawl)
  - Override: Available for testing

URL Parameters:
  - Ignore: utm_*, sessionid, ref
  - Keep: color, size, category

Authentication:
  - Type: Basic Auth / OAuth
  - Credentials: [username/password]
```

#### Step 3: Connecting Log Files

**Log File Setup (Apache/Nginx):**

```bash
# Step 1: Identify your log file location
# Apache: /var/log/apache2/access.log
# Nginx: /var/log/nginx/access.log

# Step 2: Ensure proper log format
# Required fields: IP, Timestamp, URL, User-Agent, Status Code

# Nginx Log Format Example:
log_format oncrawl '$remote_addr - $remote_user [$time_local] '
                   '"$request" $status $body_bytes_sent '
                   '"$http_referer" "$http_user_agent"';

# Step 3: Upload Options
a) Manual Upload (for testing)
   - Download logs from server
   - Upload via OnCrawl interface
   - File formats: .log, .txt, .gz

b) FTP/SFTP Connection (recommended)
   - OnCrawl pulls logs automatically
   - Configure in OnCrawl > Project > Log Analysis > Setup
   
c) S3 Bucket Integration (enterprise)
   - Stream logs to S3
   - OnCrawl reads from S3
   - Real-time or scheduled sync

d) API Integration
   - Push logs via OnCrawl API
   - Custom log processing pipeline
```

**Log File Best Practices:**
```
✓ Rotate logs daily for easier management
✓ Keep minimum 30 days of logs for trend analysis
✓ Compress old logs (.gz) to save space
✓ Filter out static resources (CSS, JS, images) for cleaner data
✓ Separate bot logs from human traffic if possible
✓ Ensure proper timestamp format (ISO 8601)
```

---
