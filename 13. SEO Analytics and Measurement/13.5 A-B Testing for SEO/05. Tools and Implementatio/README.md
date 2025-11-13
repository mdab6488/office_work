
## Tools and Implementation

### SEO A/B Testing Tools

#### 1. **SearchPilot (formerly Distilled ODN)**
**Best for:** Enterprise sites with thousands of pages

**Features:**
- Statistical significance calculation
- Forecast engine
- Integration with Google Analytics

**Pricing:** Enterprise (custom)

**Use case:** Large e-commerce sites, publishers

#### 2. **SplitSignal**
**Best for:** Mid-size to enterprise websites

**Features:**
- Automatic control group matching
- Shopify integration
- Real-time monitoring

**Pricing:** Starts at $500/month

**Use case:** E-commerce, SaaS companies

#### 3. **RankScience**
**Best for:** Technical SEO testing

**Features:**
- Automated testing
- Tag manager integration
- Machine learning predictions

**Pricing:** Custom

**Use case:** Technical SEO teams

### Manual Testing Setup

**Free Method Using Google Search Console and Analytics:**

```python
# Example: Tracking test groups

# 1. Tag test groups in Google Tag Manager
# Control Group URLs: /product/category-1/* to /product/category-5/*
# Variant Group URLs: /product/category-6/* to /product/category-10/*

# 2. Create custom dimension in GA4
# Dimension: test_group
# Values: control, variant

# 3. Track in Google Sheets or Data Studio
import pandas as pd
from google.analytics.data_v1beta import BetaAnalyticsDataClient
from google.analytics.data_v1beta.types import RunReportRequest

def analyze_seo_test(property_id, start_date, end_date):
    client = BetaAnalyticsDataClient()
    
    request = RunReportRequest(
        property=f"properties/{property_id}",
        dimensions=[
            {"name": "customEvent:test_group"},
            {"name": "date"}
        ],
        metrics=[
            {"name": "organicGoogleSearchClicks"},
            {"name": "organicGoogleSearchImpressions"},
            {"name": "averageSessionDuration"}
        ],
        date_ranges=[{"start_date": start_date, "end_date": end_date}]
    )
    
    response = client.run_report(request)
    
    # Process data
    data = []
    for row in response.rows:
        data.append({
            'test_group': row.dimension_values[0].value,
            'date': row.dimension_values[1].value,
            'clicks': int(row.metric_values[0].value),
            'impressions': int(row.metric_values[1].value),
            'avg_duration': float(row.metric_values[2].value)
        })
    
    df = pd.DataFrame(data)
    return df

# Statistical significance check
from scipy import stats

def check_significance(control_data, variant_data):
    t_stat, p_value = stats.ttest_ind(control_data, variant_data)
    
    if p_value < 0.05:
        return f"Statistically significant (p={p_value:.4f})"
    else:
        return f"Not significant (p={p_value:.4f})"
```

### Google Tag Manager Setup

**Step 1: Create Custom JavaScript Variable**
```javascript
function() {
  var url = {{Page Path}};
  
  // Define control group URL patterns
  var controlPatterns = [
    /^\/product\/category-[1-5]\//,
    /^\/blog\/[a-m]/
  ];
  
  // Define variant group URL patterns
  var variantPatterns = [
    /^\/product\/category-[6-9]\//,
    /^\/blog\/[n-z]/
  ];
  
  // Check if URL matches control patterns
  for (var i = 0; i < controlPatterns.length; i++) {
    if (controlPatterns[i].test(url)) {
      return 'control';
    }
  }
  
  // Check if URL matches variant patterns
  for (var i = 0; i < variantPatterns.length; i++) {
    if (variantPatterns[i].test(url)) {
      return 'variant';
    }
  }
  
  return 'excluded';
}
```

**Step 2: Create Data Layer Push**
```html
<script>
window.dataLayer = window.dataLayer || [];
dataLayer.push({
  'event': 'seoTestGroup',
  'testGroup': '{{SEO Test Group}}'  // Your GTM variable
});
</script>
```

### Google Search Console API Integration

```python
from google.oauth2 import service_account
from googleapiclient.discovery import build
import pandas as pd
from datetime import datetime, timedelta

class GSCTester:
    def __init__(self, credentials_path, site_url):
        credentials = service_account.Credentials.from_service_account_file(
            credentials_path,
            scopes=['https://www.googleapis.com/auth/webmasters.readonly']
        )
        self.service = build('searchconsole', 'v1', credentials=credentials)
        self.site_url = site_url
    
    def get_test_data(self, url_pattern, start_date, end_date):
        """Get GSC data for specific URL pattern"""
        request = {
            'startDate': start_date,
            'endDate': end_date,
            'dimensions': ['date', 'page'],
            'dimensionFilterGroups': [{
                'filters': [{
                    'dimension': 'page',
                    'operator': 'contains',
                    'expression': url_pattern
                }]
            }]
        }
        
        response = self.service.searchanalytics().query(
            siteUrl=self.site_url,
            body=request
        ).execute()
        
        return response.get('rows', [])
    
    def compare_groups(self, control_pattern, variant_pattern, days=60):
        """Compare control vs variant groups"""
        end_date = datetime.now().date()
        start_date = end_date - timedelta(days=days)
        
        control_data = self.get_test_data(
            control_pattern,
            start_date.isoformat(),
            end_date.isoformat()
        )
        
        variant_data = self.get_test_data(
            variant_pattern,
            start_date.isoformat(),
            end_date.isoformat()
        )
        
        # Calculate metrics
        control_metrics = self._aggregate_metrics(control_data)
        variant_metrics = self._aggregate_metrics(variant_data)
        
        return {
            'control': control_metrics,
            'variant': variant_metrics,
            'lift': {
                'clicks': ((variant_metrics['clicks'] - control_metrics['clicks']) 
                          / control_metrics['clicks'] * 100),
                'ctr': ((variant_metrics['ctr'] - control_metrics['ctr']) 
                       / control_metrics['ctr'] * 100)
            }
        }
    
    def _aggregate_metrics(self, data):
        """Aggregate GSC metrics"""
        total_clicks = sum(row['clicks'] for row in data)
        total_impressions = sum(row['impressions'] for row in data)
        avg_position = sum(row['position'] for row in data) / len(data) if data else 0
        
        return {
            'clicks': total_clicks,
            'impressions': total_impressions,
            'ctr': (total_clicks / total_impressions * 100) if total_impressions > 0 else 0,
            'position': avg_position
        }

# Usage
tester = GSCTester('credentials.json', 'https://www.example.com/')
results = tester.compare_groups('/control/', '/variant/', days=90)

print(f"Control CTR: {results['control']['ctr']:.2f}%")
print(f"Variant CTR: {results['variant']['ctr']:.2f}%")
print(f"Lift: {results['lift']['ctr']:.2f}%")
```

---
