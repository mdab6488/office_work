
## 5. Basic Crawling: Step-by-Step {#basic-crawling}

### Your First Crawl

**Scenario**: Auditing a small business website

**Step 1: Enter URL**
```
1. Launch Screaming Frog
2. Enter: https://www.example.com
3. Press Enter or click "Start"
```

**Step 2: Watch the Crawl**
```
During crawl, you'll see:
- URLs discovered in real-time
- Live metrics updating
- Any errors appearing immediately
```

**Step 3: Wait for Completion**
```
Crawl is complete when:
- "Crawl Finished" message appears
- URLs count stops increasing
- Status bar shows "Ready"
```

**Example Crawl Results**:
```
Site: SmallBusiness.com
Total URLs Crawled: 487
├── HTML Pages: 342
├── Images: 98
├── CSS: 23
├── JavaScript: 18
└── PDF: 6

Status Breakdown:
├── 200 OK: 451
├── 301 Redirects: 28
├── 404 Not Found: 6
└── 500 Server Error: 2
```

### Crawl Configuration Options

**Mode: Spider**
- Default mode
- Crawls like search engine bot
- Follows links on pages
- Best for: Full site audits

**Mode: List**
- Upload list of URLs
- Crawls only specified URLs
- Doesn't follow links
- Best for: Checking specific pages

**Example: List Mode**
```
1. Mode → List
2. Upload → Choose file (CSV, TXT)
3. File format:

https://example.com/page1
https://example.com/page2
https://example.com/page3

4. Start crawl
```

### Crawl Speed Optimization

**Settings for Fast Crawls**:
```
Configuration → Speed
├── Max Threads: 5 (or higher for paid)
├── Max URLs per Second: No limit
└── Delay Between Requests: 0ms
```

**Settings for Server-Friendly Crawls**:
```
Configuration → Speed
├── Max Threads: 1
├── Max URLs per Second: 10
└── Delay Between Requests: 100ms
```

**Real Example: E-commerce Site**
```
Site: OnlineStore.com (50,000 products)

Standard Crawl:
- Threads: 5
- Time: 1 hour 45 minutes

Optimized Crawl:
- Threads: 10
- Memory: 8GB allocated
- Time: 42 minutes
```

---
