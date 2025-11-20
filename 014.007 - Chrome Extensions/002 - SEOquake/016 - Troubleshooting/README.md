
## Troubleshooting

### Common Issues and Solutions

#### Issue 1: SEOquake Not Showing Data

**Symptoms**:
```
- SEO bar appears but shows "N/A" or "0" for all metrics
- SERP overlay blank
- Diagnosis not loading
```

**Solutions**:
```
1. Check Internet Connection
   - SEOquake needs internet to fetch data
   - Test: Visit other websites

2. Reload Extension
   - Click puzzle icon > Remove > Add back
   - Or: Chrome Settings > Extensions > SEOquake > Remove > Reinstall

3. Clear Cache
   - SEOquake Settings > Clear Cache
   - Or: Chrome Settings > Privacy > Clear browsing data

4. Update Extension
   - Chrome automatically updates, but force check:
   - Chrome Settings > Extensions > Developer mode > Update

5. Check API Limits
   - Free SEMrush account has limits
   - Wait a few hours or upgrade account
   - Try without SEMrush login (uses different data source)

6. Disable Conflicting Extensions
   - Other SEO extensions might conflict
   - Temporarily disable: Ahrefs toolbar, MozBar, etc.
   - Test if SEOquake works

7. Browser Issues
   - Update Chrome to latest version
   - Try incognito mode (rules out other extensions)
   - Clear all Chrome cache and cookies
```

#### Issue 2: SERP Overlay Not Appearing

**Symptoms**:
```
- Search Google but no metrics overlay on results
- SEO bar works but SERP overlay doesn't
```

**Solutions**:
```
1. Check Settings
   - Click SEOquake icon
   - Settings > SERP Overlay > Ensure "Enabled"
   - Select which search engines to overlay

2. Refresh Page
   - Hard refresh: Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

3. Clear Search Cache
   - Google stores results, might be cached version
   - Wait a moment, search again
   - Or add parameter: &no_cache=1 to URL

4. Check Search Engine
   - SEOquake supports: Google, Bing, Yahoo
   - Won't work on: DuckDuckGo, Ecosia, others
   - Verify you're on supported engine

5. Reinstall Extension
   - Remove and add fresh from Web Store
```

#### Issue 3: Diagnosis Takes Too Long

**Symptoms**:
```
- Clicking Diagnosis shows loading forever
- Partial results but then hangs
```

**Solutions**:
```
1. Page Size Issues
   - Very large pages (>10MB) take longer
   - Many images slow down analysis
   - Wait longer or simplify page

2. Server Response
   - Slow server = slow diagnosis
   - Test site speed separately
   - May indicate real performance issue

3. Browser Performance
   - Close other tabs
   - Disable other extensions temporarily
   - Restart browser

4. Try Different Page
   - Test on a simple page first
   - If that works, original page has specific issue

5. Reinstall Extension
   - As last resort, fresh install
```

#### Issue 4: Inaccurate Data

**Symptoms**:
```
- Metrics seem wrong
- Numbers don't match other tools
- Outdated information
```

**Solutions**:
```
1. Understand Data Sources
   - SEOquake uses multiple data sources
   - Google Index: Direct from Google
   - SEMrush data: From SEMrush database
   - Social metrics: From social APIs
   - Each updates on different schedules

2. Compare Timeframes
   - SEMrush: Updates monthly for most metrics
   - Google Index: Can be delayed
   - Social: Usually real-time but may cache

3. Check Multiple Sources
   Example:
   - SEOquake backlinks: 1,234
   - Ahrefs backlinks: 5,678
   - Moz backlinks: 3,456
   
   Why different?
   - Different crawl databases
   - Different update frequencies
   - Different counting methods
   
   Solution: Use as estimates, not absolute truth

4. Refresh Data
   - SEOquake Settings > Clear Cache
   - Wait a few minutes
   - Check again

5. Account for Personalization
   - Search results may be personalized
   - Metrics for personalized results less reliable
   - Use incognito mode for unbiased data
```

#### Issue 5: Export Not Working

**Symptoms**:
```
- Click Export but nothing downloads
- CSV file empty
- Data missing from export
```

**Solutions**:
```
1. Browser Permissions
   - Chrome Settings > Privacy > Site Settings > Downloads
   - Ensure automatic downloads enabled
   - Check if Chrome is blocking downloads

2. Try Different Format
   - Switch between CSV and other formats
   - Some formats work better than others

3. Data Size
   - Very large exports may timeout
   - Try exporting smaller dataset
   - Or export in chunks

4. Clear Browser Cache
   - Settings > Privacy > Clear cache
   - Try export again

5. Manual Workaround
   - Select and copy data from SEOquake panel
   - Paste into spreadsheet
   - Not ideal but works
```

### Error Messages and Meanings

```
Error: "API Limit Reached"
Meaning: Too many requests to SEMrush API
Solution: Wait 1 hour, or upgrade SEMrush account

Error: "No Data Available"
Meaning: Site not in database or very new
Solution: Normal for very new sites, wait for crawl

Error: "Connection Failed"
Meaning: Can't reach data servers
Solution: Check internet, try again, check firewall

Error: "Invalid URL"
Meaning: URL format not recognized
Solution: Ensure proper format: https://example.com/page

Error: "Extension Conflict"
Meaning: Another extension interfering
Solution: Disable other SEO tools, test individually
```
