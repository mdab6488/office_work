
## Integration Capabilities

### Integration 1: Google Search Console

**What It Provides:**
- Search query data
- Impressions and clicks
- Average positions
- CTR metrics
- Index coverage status
- Manual actions
- Core Web Vitals data

**How to Use:**

1. **Connect GSC**
   ```
   Settings → Integrations → Google Search Console
   - Authorize with Google account
   - Select property (supports multiple)
   - Data syncs automatically daily
   ```

2. **Combining Crawl + GSC Data**
   ```
   Example Query:
   Find pages that:
   - Have technical issues (from crawl)
   - AND receive organic traffic (from GSC)
   
   Results show: High-priority fixes
   ```

3. **Practical Examples:**
   ```
   Example 1: Pages with missing titles but high impressions
   - These are losing potential clicks
   - Priority: Very High
   
   Example 2: 404 pages with backlinks and historical traffic
   - Restore these pages or redirect
   - Priority: Critical
   
   Example 3: Slow pages with high bounce rate
   - Correlate CWV data with behavior
   - Priority: High
   ```

### Integration 2: Google Analytics 4

**What It Provides:**
- User behavior metrics
- Conversion data
- Traffic sources
- Engagement rates
- E-commerce transaction data

**Strategic Use:**

1. **Connect GA4**
   ```
   Settings → Integrations → Google Analytics
   - Add GA4 property ID
   - Configure data filters
   ```

2. **Business Impact Analysis**
   ```
   Combine:
   - Technical issues (Crawl)
   - Search performance (GSC)
   - Business metrics (GA4)
   
   Find:
   High-value pages with fixable technical issues
   ```

3. **Example Analysis:**
   ```
   Filter pages where:
   - Has technical issues: Yes
   - Monthly transactions: >50
   - Bounce rate: >70%
   
   Result: 250 high-revenue pages with technical problems
   Action: Immediate priority fixes
   ROI: High (direct revenue impact)
   ```

### Integration 3: Ahrefs

**What It Provides:**
- Backlink data
- Domain authority metrics
- Organic keywords
- Competitor analysis

**How to Use:**

1. **Connect Ahrefs**
   ```
   Settings → Integrations → Ahrefs
   - Enter Ahrefs API key
   - Configure data sync
   ```

2. **Strategic Applications:**
   ```
   Use Case 1: Orphaned Pages with Backlinks
   Find pages that:
   - Have 0 internal links (orphaned)
   - Have external backlinks
   Action: Add internal links to leverage link equity
   
   Use Case 2: Broken Backlink Recovery
   Find pages that:
   - Return 404 status
   - Have high-quality backlinks
   Action: Restore page or redirect to relevant content
   
   Use Case 3: Content Gap Analysis
   Identify:
   - Keywords competitors rank for
   - Pages you don't have
   Action: Create missing content
   ```

---
