# Check My Links - Complete Guide & Documentation

## Table of Contents
1. [Overview](#overview)
2. [Installation](#installation)
3. [Core Features](#core-features)
4. [How It Works (Technical)](#how-it-works-technical)
5. [User Interface Breakdown](#user-interface-breakdown)
6. [Real-Life Use Cases](#real-life-use-cases)
7. [Link Status Codes Explained](#link-status-codes-explained)
8. [Best Practices](#best-practices)
9. [Advanced Techniques](#advanced-techniques)
10. [Troubleshooting](#troubleshooting)
11. [Limitations & Workarounds](#limitations--workarounds)
12. [Integration with SEO Workflows](#integration-with-seo-workflows)
13. [Alternatives & Comparisons](#alternatives--comparisons)

---

## Overview

**Check My Links** is a free Chrome extension developed by Paul Livingstone that crawls through web pages to identify broken links (404s, 500s, and other HTTP errors). It's an essential tool for:

- **SEO Professionals**: Broken links harm user experience and can impact search rankings
- **Content Managers**: Maintaining content quality and user trust
- **Web Developers**: Quick QA before deployment
- **Digital Marketers**: Ensuring campaign landing pages are error-free

**Key Value Proposition**: 
Unlike full website crawlers (Screaming Frog, Sitebulb), Check My Links analyzes individual pages instantly without requiring desktop software or site-wide crawls.

---

## Installation

### Method 1: Chrome Web Store (Recommended)
1. Visit the [Chrome Web Store](https://chrome.google.com/webstore)
2. Search for "Check My Links"
3. Click "Add to Chrome"
4. Confirm by clicking "Add extension"
5. The extension icon appears in your browser toolbar

### Method 2: Manual Installation (Developer Mode)
```bash
# For testing custom versions or forks
1. Download the extension source code
2. Open chrome://extensions/
3. Enable "Developer mode" (top-right toggle)
4. Click "Load unpacked"
5. Select the extension folder
```

### Verification
After installation, you should see a small chain link icon (🔗) in your Chrome toolbar.

---

## Core Features

### 1. **One-Click Link Validation**
Scans all links on the current page with a single click.

### 2. **Color-Coded Results**
- **Green**: Valid links (200 OK)
- **Red**: Broken links (404, 500, etc.)
- **Yellow/Orange**: Redirects (301, 302)
- **Gray**: Unchecked or skipped links

### 3. **Real-Time Statistics**
Displays count of:
- Total links found
- Valid links
- Redirects
- Warnings
- Invalid/broken links

### 4. **Visual Page Highlighting**
Links are highlighted directly on the page based on their status.

### 5. **Queue Processing**
Checks links sequentially to avoid overwhelming servers or triggering rate limits.

---

## How It Works (Technical)

### Link Discovery Process
```javascript
// Simplified representation of the extension's logic
1. Extension scans DOM for <a> tags with href attributes
2. Extracts all URLs (internal and external)
3. Filters out:
   - JavaScript links (href="javascript:...")
   - Mailto links (href="mailto:...")
   - Telephone links (href="tel:...")
   - Hash/anchor links (#section)
4. Creates a queue of URLs to check
```

### HTTP Request Mechanism
```javascript
// The extension uses XMLHttpRequest or Fetch API
For each URL:
  - Sends HTTP HEAD request (lightweight, faster than GET)
  - Captures response status code
  - If HEAD fails, tries GET request
  - Records timing and status
  - Updates UI with color coding
```

### Status Code Interpretation
```javascript
// Status code handling logic
200-299: Success (Green)
300-399: Redirects (Yellow/Orange)
400-499: Client errors (Red) - includes 404
500-599: Server errors (Red)
Timeout/Network Error: Invalid (Red)
```

---

## User Interface Breakdown

### Extension Popup
When you click the extension icon:

```
┌─────────────────────────────────────┐
│  Check My Links                     │
├─────────────────────────────────────┤
│                                     │
│  [Check Links]  Button              │
│                                     │
│  Statistics:                        │
│  ✓ Valid: 45                        │
│  ↻ Redirects: 3                     │
│  ⚠ Warnings: 2                      │
│  ✗ Invalid: 5                       │
│  Total: 55                          │
│                                     │
│  [Stop Checking] [Clear]            │
└─────────────────────────────────────┘
```

### On-Page Visualization
Links are highlighted directly on the webpage:

```html
<!-- Example of how links appear after checking -->
<a href="valid-page.html" style="background-color: #90EE90;">Valid Link</a>
<a href="broken-page.html" style="background-color: #FF6B6B;">Broken Link</a>
<a href="redirect.html" style="background-color: #FFD700;">Redirect</a>
```

---

## Real-Life Use Cases

### Use Case 1: Blog Post Quality Audit
**Scenario**: You've published a blog post with 50+ external references and want to ensure no broken links.

**Workflow**:
1. Open your published blog post
2. Click Check My Links extension
3. Click "Check Links"
4. Wait 10-30 seconds for analysis
5. Review red-highlighted broken links
6. Fix or remove broken references
7. Re-check to verify

**Real Example**:
```
Original Post: "Top 100 SEO Tools in 2024"
- Total links: 103
- Broken links found: 7
  - tool-xyz.com/pricing (404) - Company shut down
  - oldtoolname.io (404) - Domain expired
  - blog.example.com/post-123 (404) - Content removed
```

**Action**: Replace broken links with archive.org versions or remove references.

---

### Use Case 2: Competitor Content Analysis
**Scenario**: Analyzing a competitor's resource page for outdated content opportunities.

**Workflow**:
1. Navigate to competitor's resource page
2. Run Check My Links
3. Document broken links (take screenshots)
4. Create superior content with working alternatives
5. Reach out to sites linking to competitor's broken resources

**Real Example**:
```
Competitor: "Ultimate Marketing Tools List"
Found: 15 broken tool links
Opportunity: Create updated list with current tools
Outreach Angle: "Hey, noticed you link to [competitor's outdated list]. 
We've created an updated version with working links..."
```

---

### Use Case 3: Website Migration Validation
**Scenario**: After migrating website to new domain/platform, verify all internal links work.

**Workflow**:
1. Check high-traffic pages first
2. Run Check My Links on each key page
3. Document any redirect chains or broken links
4. Fix issues in CMS/code
5. Re-validate

**Real Example**:
```
Migration: oldsite.com → newsite.com
Tested Pages: 
- Homepage: 45 links - 2 broken (old blog URLs)
- Services Page: 23 links - 1 redirect (should be direct)
- Resources: 67 links - 8 broken (PDF moved locations)

Fix: Update links to new structure, implement proper 301 redirects
```

---

### Use Case 4: Client Audit Report
**Scenario**: Creating link health report for client website.

**Workflow**:
1. Sample 10-20 important pages
2. Run Check My Links on each
3. Export/screenshot results
4. Create summary report
5. Prioritize fixes by page importance

**Real Example**:
```
Client: E-commerce Site
Pages Audited: 15 key pages
Total Links Checked: 847
Issues Found:
- 23 broken product links (discontinued items)
- 12 broken blog references
- 5 broken footer links (old social profiles)
- 8 redirect chains

Business Impact: 
- Product 404s causing lost sales
- Broken blog links hurting SEO authority
Priority: Fix product links first (revenue impact)
```

---

### Use Case 5: Content Freshness Check
**Scenario**: Quarterly content audit to maintain content quality.

**Workflow**:
1. Pull list of top 50 blog posts (by traffic)
2. Check each for broken links monthly
3. Track link health over time
4. Update content with new resources
5. Republish with updated date

**Real Example**:
```
Q1 2024 Audit: "Advanced Google Analytics Guide" (2022)
- Original: 34 links, 0 broken
- Current: 34 links, 9 broken (26% decay rate)
- Issues:
  - 4 tutorial links (GA4 migration changes)
  - 3 tool links (deprecated features)
  - 2 official Google docs (URL restructure)

Action: Update guide with current GA4 links, republish as "Updated 2024"
Result: Traffic recovered 40% within 2 weeks
```

---

## Link Status Codes Explained

### Success Codes (Green)
| Code | Meaning | Action Required |
|------|---------|-----------------|
| 200 | OK - Page exists | None |
| 201 | Created | None |
| 202 | Accepted | None |
| 204 | No Content | Verify intentional |

### Redirect Codes (Yellow/Orange)
| Code | Meaning | Action Required |
|------|---------|-----------------|
| 301 | Permanent Redirect | Update link to final destination |
| 302 | Temporary Redirect | Monitor, may need update |
| 303 | See Other | Check if appropriate |
| 307 | Temporary Redirect | Monitor |
| 308 | Permanent Redirect | Update link to final destination |

**Why Fix Redirects?**
```
Problem: yoursite.com → oldpage.html → 301 → newpage.html
Impact: 
- Slower page load (extra HTTP request)
- Slight SEO dilution (link equity loss)
- Poor user experience

Solution: Link directly to newpage.html
```

---

### Client Error Codes (Red)
| Code | Meaning | Common Cause | Fix |
|------|---------|--------------|-----|
| 400 | Bad Request | Malformed URL | Check URL syntax |
| 401 | Unauthorized | Login required | Note or remove |
| 403 | Forbidden | Access denied | Check permissions |
| 404 | Not Found | Page deleted/moved | Update or remove |
| 410 | Gone | Intentionally removed | Remove link |

### Server Error Codes (Red)
| Code | Meaning | Action |
|------|---------|--------|
| 500 | Internal Server Error | Wait & recheck |
| 502 | Bad Gateway | Temporary, recheck |
| 503 | Service Unavailable | Temporary, recheck |
| 504 | Gateway Timeout | Recheck later |

**Important**: Server errors (5xx) may be temporary. Recheck before removing links.

---

## Best Practices

### 1. Check Before Publishing
```
Content Creation Workflow:
1. Write content with links
2. Preview in staging
3. Run Check My Links
4. Fix any issues
5. Publish
6. Re-check live version
```

### 2. Schedule Regular Audits
```
Audit Frequency Recommendations:
- Homepage: Weekly
- Key landing pages: Bi-weekly  
- Blog posts: Monthly
- Resources/tools pages: Bi-weekly
- Old content (2+ years): Quarterly
```

### 3. Prioritize by Page Value
```
Priority Matrix:
High Traffic + Broken Links = URGENT
High Traffic + Working Links = Monitor
Low Traffic + Broken Links = Scheduled Fix
Low Traffic + Working Links = Annual Check
```

### 4. Document Findings
```
Create a Tracking Sheet:
| Date | Page URL | Total Links | Broken | Fixed | Notes |
|------|----------|-------------|--------|-------|-------|
| 2024-11-01 | /blog/seo-guide | 45 | 3 | 3 | Updated tool links |
```

### 5. Combine with Other Tools
```
Comprehensive Link Audit Stack:
1. Check My Links - Individual page checks
2. Google Search Console - Site-wide 404 reports
3. Screaming Frog - Full site crawl (monthly)
4. Ahrefs/SEMrush - Backlink health monitoring
```

---

## Advanced Techniques

### Technique 1: Bulk Page Checking with Automation
While Check My Links doesn't have bulk features, you can automate:

```javascript
// Example: Puppeteer script to automate Check My Links
const puppeteer = require('puppeteer');

async function checkMultiplePages(urls) {
  const browser = await puppeteer.launch({
    headless: false,
    args: [
      '--disable-extensions-except=/path/to/checkmylinks',
      '--load-extension=/path/to/checkmylinks'
    ]
  });
  
  for (const url of urls) {
    const page = await browser.newPage();
    await page.goto(url);
    
    // Trigger extension (manual interaction needed)
    // Or extract link data from page
    await page.waitForTimeout(5000);
    
    // Screenshot results
    await page.screenshot({ 
      path: `check-${url.replace(/[^a-z0-9]/gi, '_')}.png` 
    });
  }
  
  await browser.close();
}
```

### Technique 2: Export Results (Workaround)
Check My Links doesn't have built-in export, but you can:

```javascript
// Run in browser console after checking links
function exportResults() {
  const results = {
    valid: [],
    broken: [],
    redirects: []
  };
  
  document.querySelectorAll('a').forEach(link => {
    const bgColor = window.getComputedStyle(link).backgroundColor;
    const href = link.href;
    
    if (bgColor.includes('144, 238, 144')) {
      results.valid.push(href);
    } else if (bgColor.includes('255, 107, 107')) {
      results.broken.push(href);
    } else if (bgColor.includes('255, 215, 0')) {
      results.redirects.push(href);
    }
  });
  
  console.log(JSON.stringify(results, null, 2));
  return results;
}

// Copy to clipboard
copy(exportResults());
```

### Technique 3: Integration with Content Management
```python
# Python script: Check links before CMS publication
import subprocess
import json

def pre_publish_check(page_url):
    """
    Integrate with CMS workflow
    """
    # Use headless Chrome with Check My Links
    result = check_links(page_url)
    
    if result['broken'] > 0:
        send_slack_notification(
            f"⚠️ {result['broken']} broken links found on {page_url}"
        )
        return False  # Block publication
    
    return True  # Allow publication
```

### Technique 4: Historical Link Health Tracking
```sql
-- Database schema for tracking link health over time
CREATE TABLE link_health_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_url VARCHAR(500),
    check_date DATE,
    total_links INT,
    valid_links INT,
    broken_links INT,
    redirects INT,
    link_details JSON
);

-- Query to track link decay
SELECT 
    page_url,
    check_date,
    broken_links,
    (broken_links * 100.0 / total_links) as broken_percentage
FROM link_health_history
WHERE page_url = 'https://example.com/important-page'
ORDER BY check_date DESC;
```

---

## Troubleshooting

### Issue 1: Extension Not Working
**Symptoms**: Click extension, nothing happens

**Solutions**:
```
1. Check extension is enabled:
   - Go to chrome://extensions/
   - Ensure Check My Links is toggled ON

2. Refresh the page:
   - Press F5 or Ctrl+R
   - Try extension again

3. Check for conflicts:
   - Disable other link-checking extensions
   - Disable ad blockers temporarily

4. Reinstall extension:
   - Remove from Chrome
   - Clear browser cache
   - Reinstall from Chrome Web Store
```

### Issue 2: False Positives (Working Links Marked as Broken)
**Symptoms**: Links work when clicked, but marked red

**Causes & Solutions**:
```
Cause 1: CORS Restrictions
- Some sites block HEAD requests from extensions
- Solution: Manually verify, note in documentation

Cause 2: Authentication Required
- Link requires login (401/403)
- Solution: Normal behavior, document protected links

Cause 3: Rate Limiting
- Too many requests to same domain
- Solution: Check fewer links at once, wait between checks

Cause 4: JavaScript-Required Content
- Page loads via JavaScript, extension can't see
- Solution: Manually verify, consider alternative tools
```

### Issue 3: Slow Performance
**Symptoms**: Taking too long to check links

**Solutions**:
```
1. Check internet connection speed
2. Reduce number of tabs open
3. Clear browser cache
4. Check pages with fewer links first
5. Consider server response time (not extension issue)

Performance Expectations:
- 10 links: 2-5 seconds
- 50 links: 10-20 seconds
- 100 links: 30-60 seconds
- 500+ links: 2-5 minutes
```

### Issue 4: Links Not Highlighted
**Symptoms**: Statistics show issues, but page not highlighted

**Solutions**:
```
1. Scroll through entire page (lazy-loaded content)
2. Check browser zoom (100% recommended)
3. Check for CSS conflicts with page styles
4. Try on different page to verify extension works
5. Check browser console for JavaScript errors
```

---

## Limitations & Workarounds

### Limitation 1: No Batch Processing
**Limitation**: Can only check one page at a time

**Workarounds**:
```
Option A: Browser tabs method
1. Open 5-10 pages in separate tabs
2. Run Check My Links on each tab
3. Switch between tabs to review results

Option B: Use complementary tools
- Google Search Console: Site-wide broken links
- Screaming Frog: Crawl entire site
- Online tools: W3C Link Checker (for small sites)
```

### Limitation 2: No Reporting/Export
**Limitation**: Results can't be saved or exported

**Workarounds**:
```
Option A: Manual documentation
- Screenshot results
- Copy-paste statistics to spreadsheet
- Use browser console export script (see Advanced Techniques)

Option B: Browser automation
- Use Puppeteer/Selenium to automate and capture
- Build custom reporting on top
```

### Limitation 3: Limited to Current Page
**Limitation**: Doesn't follow links to check destination pages

**Workarounds**:
```
Option A: Manual deep checking
1. Check main page
2. Click into subpages
3. Check each subpage separately

Option B: Combine with crawler
- Screaming Frog: Full site crawl
- Xenu Link Sleuth: Free desktop crawler
- Online tools: Dead Link Checker websites
```

### Limitation 4: No JavaScript Link Detection
**Limitation**: May miss links loaded dynamically

**Workarounds**:
```
Option A: Scroll and wait
- Scroll through entire page
- Wait for lazy-loaded content
- Then run Check My Links

Option B: Check rendered HTML
- Use browser DevTools to see all links
- Verify against Check My Links results
```

### Limitation 5: No Historical Data
**Limitation**: Can't track changes over time

**Workaround**:
```
Build your own tracking:

1. Manual spreadsheet:
Date | Page | Total | Broken | Notes
2024-11-01 | /blog/post | 45 | 3 | Fixed old tool links

2. Automated logging:
- Use browser automation scripts
- Store results in database
- Create trend reports
```

---

## Integration with SEO Workflows

### Weekly SEO Checklist Integration
```
Monday: Content Creation
- Draft new blog post
- Add relevant links
- Run Check My Links before publishing

Wednesday: Site Maintenance  
- Check top 10 landing pages
- Review Google Search Console for 404s
- Fix any broken links found

Friday: Content Audit
- Review 5 old blog posts
- Check external link health
- Update or remove broken references
```

### Pre-Publication Workflow
```
Content QA Checklist:
☐ Grammar check (Grammarly)
☐ SEO optimization (Yoast/RankMath)
☐ Image optimization (TinyPNG)
☐ Link validation (Check My Links) ← HERE
☐ Mobile responsiveness check
☐ Page speed test
☐ Internal linking review
☐ Meta description check
☐ Publish
```

### Monthly Reporting Integration
```
SEO Monthly Report Sections:
1. Traffic & Rankings
2. Technical Health
   - Broken Links Status ← Include Check My Links data
     * Pages checked: 50
     * Total links: 2,347
     * Broken links fixed: 23
     * Link health score: 98.5%
3. Content Performance
4. Backlink Profile
5. Recommendations
```

---

## Alternatives & Comparisons

### Tool Comparison Matrix

| Feature | Check My Links | Broken Link Checker | W3C Link Checker | Screaming Frog |
|---------|---------------|---------------------|------------------|----------------|
| **Type** | Browser Ext. | Browser Ext. | Web Tool | Desktop App |
| **Price** | Free | Free | Free | Free/£149/yr |
| **Speed** | Fast | Medium | Slow | Fast |
| **Batch Check** | No | Limited | Limited | Yes |
| **Export** | No | Limited | Yes | Yes |
| **Crawl Site** | No | No | Limited | Yes |
| **JavaScript** | Basic | Basic | No | Advanced |
| **Best For** | Quick checks | Quick checks | Small sites | Full audits |

### When to Use Each Tool

**Check My Links**: 
```
✓ Quick single-page validation
✓ Before publishing content
✓ Spot-checking competitor pages
✓ Client demos (visual feedback)
✗ Site-wide audits
✗ Automated reporting
```

**Screaming Frog**:
```
✓ Complete site audits
✓ Detailed reporting
✓ Large websites (1000+ pages)
✓ Technical SEO audits
✗ Quick checks
✗ No browser extension
```

**Google Search Console**:
```
✓ Historical broken link data
✓ Mobile usability issues
✓ Free for all sites
✓ Google's perspective
✗ Limited to indexed pages
✗ Delayed reporting
```

**Online Link Checkers** (deadlinkchecker.com, etc.):
```
✓ No installation needed
✓ Basic reporting
✓ Small sites
✗ Slow processing
✗ Limited features
✗ Privacy concerns
```

---

## Keyboard Shortcuts & Tips

### Chrome Extension Shortcuts
```
No default shortcuts, but you can set custom:
1. Go to chrome://extensions/shortcuts
2. Find Check My Links
3. Set custom shortcut (e.g., Ctrl+Shift+L)
```

### Workflow Tips
```
Tip 1: Open in New Window
- Open audit page in dedicated window
- Easier to manage multiple checks

Tip 2: Use Split Screen
- Check My Links results on left
- CMS/editor on right for quick fixes

Tip 3: Browser Bookmarklet
Create bookmarklet for quick access:
javascript:(function(){/* trigger extension */})();

Tip 4: Combine with DevTools
- Check My Links for link status
- Network tab for detailed HTTP info
- Console for JavaScript errors
```

---

## FAQ Section

### Q: Does Check My Links affect my site's analytics?
**A**: No, it only checks links by sending HTTP HEAD requests. These don't trigger JavaScript tracking codes or register as page views.

### Q: Will it get me blocked by websites?
**A**: Unlikely for normal use (checking 50-100 links), but excessive checking of external sites could trigger rate limits. Be respectful.

### Q: Can it check password-protected pages?
**A**: Only if you're logged in. The extension uses your current browser session/cookies.

### Q: Does it work on single-page applications (React/Vue)?
**A**: Partially. It checks links present in the DOM, but may miss dynamically loaded content.

### Q: Can I check links in PDFs?
**A**: No, only HTML pages. Use desktop PDF tools for PDF link checking.

### Q: How accurate is it compared to enterprise tools?
**A**: Very accurate for basic link validation. Enterprise tools offer more features (reporting, automation) but similar accuracy.

### Q: Does it check images/CSS/JavaScript files?
**A**: No, only href links in anchor tags. Use other tools for resource validation.

### Q: Can I use it for competitor research?
**A**: Yes, ethically. Check public pages, don't overload their servers, respect robots.txt.

---

## Changelog & Updates

### Version History
```
v1.4.0 (Latest)
- Improved performance for large pages
- Better handling of CORS issues
- Updated UI design

v1.3.0
- Added statistics display
- Improved redirect detection
- Bug fixes

v1.2.0
- Initial Chrome Web Store release
- Core link checking functionality
```

---

## Resources & Further Learning

### Official Resources
- Chrome Web Store Page: https://chrome.google.com/webstore (search "Check My Links")
- Developer GitHub: Check for official repository
- Support: Use Chrome Web Store support section

### Complementary Tools
```
Free Tools:
- Google Search Console (404 reports)
- W3C Link Checker (online)
- Xenu Link Sleuth (Windows)

Paid Tools:
- Screaming Frog SEO Spider (£149/year)
- Ahrefs Site Audit ($99+/month)
- SEMrush Site Audit ($119+/month)
- Sitebulb (£120/year)
```

### Learning Resources
```
SEO Link Health:
- Moz: "Technical SEO Guide"
- Ahrefs: "Broken Link Building"
- Google: "Search Console Help - Fix 404s"

HTTP Status Codes:
- MDN Web Docs: HTTP Status Codes
- RFC 7231: HTTP/1.1 Semantics
```

---

## Conclusion

Check My Links is a lightweight, effective tool for maintaining link health on individual web pages. While it has limitations (no batch processing, no export), its speed and simplicity make it ideal for:

- **Daily Use**: Quick pre-publication checks
- **Content Audits**: Spot-checking important pages
- **Client Demos**: Visual feedback for stakeholders
- **SEO Maintenance**: Part of broader site health strategy

**Best Practice**: Use Check My Links for quick, tactical checks and combine with enterprise crawlers (Screaming Frog, Ahrefs) for comprehensive site audits.

---

## License & Attribution

Check My Links is developed by Paul Livingstone. This documentation is for educational purposes.

---

**Last Updated**: November 2024
**Documentation Version**: 1.0
**Maintained By**: SEO Professional Community

---

## Quick Reference Card

```
╔══════════════════════════════════════════════════════════╗
║              CHECK MY LINKS - QUICK REFERENCE            ║
╠══════════════════════════════════════════════════════════╣
║ Installation: Chrome Web Store → "Check My Links"       ║
║ Usage: Click extension icon → "Check Links"             ║
║ Results: Color-coded highlighting on page                ║
║                                                          ║
║ COLOR CODES:                                             ║
║ 🟢 Green  = Working (200 OK)                            ║
║ 🔴 Red    = Broken (404, 500, etc.)                     ║
║ 🟡 Yellow = Redirect (301, 302)                         ║
║ ⚪ Gray   = Not checked/Skipped                         ║
║                                                          ║
║ BEST FOR:                                                ║
║ ✓ Quick page checks before publishing                   ║
║ ✓ Content quality audits                                ║
║ ✓ Competitor analysis                                   ║
║                                                          ║
║ LIMITATIONS:                                             ║
║ ✗ No batch checking                                     ║
║ ✗ No export functionality                               ║
║ ✗ One page at a time                                    ║
║                                                          ║
║ WORKFLOW:                                                ║
║ 1. Navigate to page                                     ║
║ 2. Click Check My Links icon                            ║
║ 3. Review colored highlights                            ║
║ 4. Fix broken links                                     ║
║ 5. Re-check to verify                                   ║
╚══════════════════════════════════════════════════════════╝
```

---

*End of Documentation*
