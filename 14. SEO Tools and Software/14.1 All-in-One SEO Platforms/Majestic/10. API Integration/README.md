
## API Integration

### Available APIs

Majestic offers three main APIs:

#### **1. OpenApps API**
```
Purpose: Integrate Majestic data into apps/dashboards
Use Cases:
- SEO software integrations
- Custom client dashboards
- Automated reporting tools

Example Integration:
// React Dashboard Component
import React, { useEffect, useState } from 'react';

function BacklinkWidget({ domain }) {
  const [data, setData] = useState(null);
  
  useEffect(() => {
    fetch(`/api/majestic/summary?domain=${domain}`)
      .then(res => res.json())
      .then(data => setData(data));
  }, [domain]);
  
  if (!data) return <div>Loading...</div>;
  
  return (
    <div className="backlink-widget">
      <h3>{domain}</h3>
      <div className="metrics">
        <div className="metric">
          <label>Trust Flow</label>
          <span className="score">{data.TrustFlow}</span>
        </div>
        <div className="metric">
          <label>Citation Flow</label>
          <span className="score">{data.CitationFlow}</span>
        </div>
        <div className="metric">
          <label>Ref Domains</label>
          <span className="count">{data.RefDomains.toLocaleString()}</span>
        </div>
      </div>
    </div>
  );
}
```

---

#### **2. Data Explorers API**
```
Purpose: Direct access to backlink and domain data
Use Cases:
- Bulk data analysis
- Research projects
- Custom analytics

Example: Get Top Backlinks
import requests

API_KEY = "your_api_key"
DOMAIN = "example.com"

params = {
    "app_api_key": API_KEY,
    "cmd": "GetBackLinkData",
    "item": DOMAIN,
    "datasource": "fresh",
    "Count": 100,
    "OrderBy": "SourceTrustFlow:desc"
}

response = requests.get(
    "https://api.majestic.com/api/json",
    params=params
)

data = response.json()

for backlink in data['DataTables']['BackLinks']['Data']:
    print(f"From: {backlink['SourceURL']}")
    print(f"Anchor: {backlink['AnchorText']}")
    print(f"TF: {backlink['SourceTrustFlow']}")
    print("---")
```

---

#### **3. Reporting API**
```
Purpose: Generate comprehensive reports programmatically
Use Cases:
- Automated client reports
- Scheduled audits
- Multi-site monitoring

Example: Monthly Report Generation
const MajesticReporter = {
  async generateMonthlyReport(domains) {
    const reports = [];
    
    for (const domain of domains) {
      const summary = await this.getSummary(domain);
      const newLinks = await this.getNewLinks(domain, 30);
      const lostLinks = await this.getLostLinks(domain, 30);
      
      reports.push({
        domain,
        trustFlow: summary.TrustFlow,
        citationFlow: summary.CitationFlow,
        newLinksCount: newLinks.length,
        lostLinksCount: lostLinks.length,
        netGrowth: newLinks.length - lostLinks.length,
        status: this.getHealthStatus(summary)
      });
    }
    
    return this.formatReport(reports);
  },
  
  getHealthStatus(summary) {
    const ratio = summary.TrustFlow / summary.CitationFlow;
    if (ratio > 0.8) return "✓ Healthy";
    if (ratio > 0.5) return "⚠ Monitor";
    return "🚩 Action Required";
  }
};

// Usage
const clientDomains = ['client1.com', 'client2.com', 'client3.com'];
const report = await MajesticReporter.generateMonthlyReport(clientDomains);
console.log(report);
```

---

### API Rate Limits & Best Practices

```
RATE LIMITS (API Plan):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- Standard: 1M analysis units/month
- Large: 5M analysis units/month  
- Extra Large: Custom limits

UNIT CONSUMPTION:
- Basic Summary: 1 unit
- Full Backlink List: 10-100 units (depends on size)
- Bulk Export: 1,000+ units

BEST PRACTICES:
1. Cache Results
   → Don't re-query same domain frequently
   → Store data locally for 24-48 hours
   
2. Batch Requests
   → Use bulk endpoints when available
   → Query multiple domains at once
   
3. Schedule Off-Peak
   → Run large queries during off-hours
   → Reduces API load

4. Monitor Usage
   → Track API units consumed
   → Set alerts at 80% capacity
   
5. Handle Errors Gracefully
   → Implement retry logic
   → Respect 429 (rate limit) responses
```

---
