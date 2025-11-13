
## Getting Started

### Quick Start Guide (15 Minutes)

**Step 1: Sign Up** (3 minutes)
```
1. Go to https://majestic.com
2. Click "Sign Up" / "Try For Free"
3. Choose a plan:
   - Lite: Perfect for beginners ($49.99/month)
   - Free tier available for limited features
4. Enter payment details
5. Confirm email
```

**Step 2: Your First Analysis** (5 minutes)
```
1. Click "Site Explorer" in top menu
2. Enter a domain you're curious about (try: nytimes.com)
3. Select "Root Domain"
4. Choose "Fresh Index"
5. Click "Submit"

What You'll See:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Summary Dashboard:
- Trust Flow score (0-100)
- Citation Flow score (0-100)  
- Total referring domains
- Total backlinks
- Topical Trust Flow chart
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Step 3: Analyze Your Own Site** (5 minutes)
```
1. Run Site Explorer on YOUR domain
2. Compare your metrics to the example above
3. Check your top referring domains
4. Review your anchor text distribution
5. Look at topical trust flow relevance

Quick Health Check:
✓ Trust Flow 20+ = Doing okay
✓ TF and CF within 10 points = Balanced
✓ Top topic matches your niche = Good relevance
✗ CF much higher than TF = Potential spam issue
```

**Step 4: Set Up Your First Campaign** (2 minutes)
```
1. Click "Campaigns" in menu
2. Click "Create New Campaign"
3. Name it: "My Sites & Competitors"
4. Add your site + 2-3 competitors
5. Save

Benefit: Weekly email updates on all sites!
```

---

### Installation & Setup

#### **Browser Extension**

Majestic offers a Chrome extension for quick analysis:

```
Installation:
1. Go to Chrome Web Store
2. Search: "Majestic Backlink Analyzer"
3. Click "Add to Chrome"
4. Confirm installation

Usage:
→ Browse to ANY website
→ Click Majestic icon in toolbar
→ Instantly see: TF, CF, referring domains
→ No need to open Majestic website!

Example:
You're reading a blog post, wondering about link value.
Click extension → TF 45, CF 48 → Great site to target!
```

---

#### **API Setup** (For Developers)

```javascript
// Example: Majestic API Call (JavaScript)

const fetch = require('node-fetch');

const API_KEY = 'your_majestic_api_key_here';
const domain = 'example.com';

// Get backlink data
async function getBacklinks() {
  const url = `https://api.majestic.com/api/json`;
  
  const params = {
    app_api_key: API_KEY,
    cmd: 'GetBackLinkData',
    item: domain,
    datasource: 'fresh',
    Count: 10
  };
  
  const queryString = new URLSearchParams(params).toString();
  const response = await fetch(`${url}?${queryString}`);
  const data = await response.json();
  
  console.log(`Trust Flow: ${data.DataTables.Results.Data[0].TrustFlow}`);
  console.log(`Citation Flow: ${data.DataTables.Results.Data[0].CitationFlow}`);
  console.log(`Referring Domains: ${data.DataTables.Results.Data[0].RefDomains}`);
}

getBacklinks();
```

---

#### **Google Sheets Integration**

```
Setup Steps:
1. In Google Sheets, click "Extensions" → "Add-ons" → "Get add-ons"
2. Search for "Majestic SEO Tools"
3. Install the add-on
4. Authorize with your Majestic account

Usage Example:
Column A: List of URLs
yourdomain.com
competitor1.com
competitor2.com

Click: Majestic → "Augment Data"
Automatically fills:
Column B: Trust Flow
Column C: Citation Flow  
Column D: Referring Domains
Column E: Backlinks

Perfect for: Client reporting, bulk analysis, tracking
```

---
