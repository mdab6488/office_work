
## 14. Common Issues & Solutions {#troubleshooting}

### Issue #1: Screaming Frog Crashes or Runs Slow

**Symptoms**:
- Freezes during crawl
- "Out of memory" errors
- Very slow crawling (< 1 URL/sec)

**Solutions**:

**A. Increase Memory Allocation**
```
Windows:
1. Right-click shortcut → Properties
2. Target: "C:\...\ScreamingFrogSEOSpider.exe" -Xmx4096m
3. Save and restart

Mac:
Edit: ScreamingFrogSEOSpider.app/Contents/Info.plist
Add: <string>-Xmx4096m</string>

Linux:
Edit launcher: export _JAVA_OPTIONS="-Xmx4096m"
```

**B. Enable Database Mode**
```
System → Database Storage
✓ Enable database storage

Benefits:
- Lower RAM usage
- Can crawl larger sites
- Data persists between sessions
```

**C. Reduce Crawl Scope**
```
Options:
1. Limit crawl depth (5 instead of 10)
2. Exclude unnecessary file types
3. Crawl in sections (by folder)
4. Use sitemap mode instead of spider mode
```

**D. Update Java**
```
Check version: java -version
Should be: Java 8 or higher

Update:
Download latest from java.com
Restart Screaming Frog
```

### Issue #2: JavaScript Content Not Rendering

**Problem**: Can't see content loaded by JavaScript

**Solution**:

```
Configuration → Spider → Rendering
✓ Enable JavaScript Rendering

Settings:
├── Wait Time: 5 seconds (adjust as needed)
├── ✓ Wait for JavaScript events
└── Rendering Engine: Chromium

Note: This significantly slows crawl speed

Alternative for huge sites:
- Render only specific sections
- Use "List" mode with critical URLs
- Enable rendering just for those
```

**Verification**:
```
1. View → Source Code (shows raw HTML)
2. View → Rendered Page (shows JS-rendered content)
3. Compare both views

If content only in Rendered Page:
- Google can see it (if JS rendering is enabled)
- Screaming Frog sees it (with rendering enabled)
```

### Issue #3: Can't Crawl Entire Site

**Problem**: Crawl stops early, missing pages

**Common Causes**:

**A. Robots.txt Blocking**
```
Check:
Configuration → Robots.txt
View current robots.txt

Solution:
Configuration → Spider → Robots.txt
☐ Respect Robots.txt (for auditing purposes only!)

Warning: Only ignore for sites you own/have permission
```

**B. Nofollow Links**
```
Issue: Important pages only linked via nofollow

Check:
Configuration → Spider → Advanced
☐ Respect Nofollow (temporarily, for audit)

Find nofollow links:
Response Codes → Filter → check for missing pages
```

**C. JavaScript-Only Navigation**
```
Issue: Links only in JavaScript

Solution:
1. Enable JavaScript rendering (see Issue #2)
2. Or use sitemap crawl mode
```

**D. Infinite Crawl Protection**
```
Issue: Hitting max URL limit

Solution:
Configuration → Limits
- Increase "Max URLs to Crawl"
- Or use Database mode for unlimited
```

**E. Authentication Required**
```
Issue: Pages behind login

Solution:
Configuration → Authentication
- Enter username/password for Basic Auth
- Or manually add cookies for session-based auth
```

### Issue #4: Inaccurate Word Count

**Problem**: Word count doesn't match what you see

**Causes**:

**A. Including HTML Tags**
```
Solution:
Configuration → Content
✓ Exclude HTML from word count

This counts only visible text
```

**B. JavaScript Content**
```
Issue: Content loaded via JS not counted

Solution:
Enable JavaScript rendering
Recount will include rendered content
```

**C. Hidden Content**
```
Issue: Counting display:none content

Check:
- Is CSS being processed?
- Are hidden elements included in count?

Screaming Frog counts DOM content, even if hidden
This matches how search engines may view it
```

### Issue #5: Duplicate URLs Appearing

**Problem**: Same page appearing multiple times

**Causes & Solutions**:

**A. URL Parameters**
```
Example:
/product
/product?
/product?param=
/product?tracking=123

Solution:
Configuration → Spider → Advanced
✓ Remove URL Parameters

Or specify parameters to ignore:
- tracking
- utm_*
- fbclid
```

**B. Trailing Slashes**
```
Example:
/about
/about/

Solution:
Configuration → Spider → Advanced
✓ Normalise Trailing Slashes
```

**C. Case Sensitivity**
```
Example:
/Products
/products

Solution:
Configuration → Spider → Advanced
✓ Lowercase URLs (for Windows/Apache servers)

Note: Don't use for case-sensitive servers (Linux/Nginx)
```

**D. Protocol Variations**
```
Example:
http://example.com/page
https://example.com/page

Solution:
Implement proper canonical tags or redirects
Not a Screaming Frog issue - server configuration
```

### Issue #6: Export Files Too Large

**Problem**: CSV files are huge, crash Excel

**Solutions**:

**A. Filter Before Export**
```
Instead of exporting all 100,000 URLs:
1. Apply filters (e.g., only 200 status)
2. Select specific columns needed
3. Export filtered view
```

**B. Use Database Queries**
```
Enable database mode
Query database directly with SQL
Extract only needed data
```

**C. Split Exports**
```
Export by sections:
- By folder (/blog/, /products/, etc.)
- By status code
- By content type

Analyze separately, combine findings
```

**D. Use Google Sheets**
```
Handles large files better than Excel
- 5 million cell limit (vs Excel's 1M rows)
- Cloud processing
- Easier collaboration
```

### Issue #7: Crawl Taking Forever

**Problem**: Crawl hasn't finished after hours

**Solutions**:

**A. Increase Threads**
```
Configuration → Speed
Max Threads: 5 (paid version: up to 100)

Caution: Don't overwhelm target server
```

**B. Reduce Depth**
```
Configuration → Limits
Max Crawl Depth: 5 (instead of 10)

Most important pages are within 3-4 clicks
```

**C. Exclude Unnecessary Files**
```
Configuration → Include/Exclude

Exclude:
- Image files (if not analyzing images)
- PDFs (if not needed)
- Large video files
- Archive files
```

**D. Use Sitemap Mode**
```
Mode → List
Upload sitemap.xml

Crawls only URLs in sitemap
Much faster than full spider
```

**E. Crawl in Sections**
```
Instead of full site:
Crawl: example.com/blog/
Then: example.com/products/
Then: example.com/services/

Combine results after
```

---
