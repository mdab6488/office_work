
## 10. Integration with Other Tools {#integrations}

### Screaming Frog + Google Sheets

**Automating Reports**

**Step 1: Export from Screaming Frog**
```
1. Complete crawl
2. Bulk Export → All → CSV
3. Save to Google Drive folder
```

**Step 2: Import to Google Sheets**
```
1. Google Sheets → File → Import
2. Select Screaming Frog CSV
3. Choose import settings:
   ├── Separator: Comma
   ├── Convert text to numbers: Yes
   └── Import location: New sheet
```

**Step 3: Create Dashboard**
```
Metrics to visualize:
├── Status code distribution (pie chart)
├── Pages by word count (histogram)
├── Top pages by inlinks (bar chart)
├── Duplicate titles count (number)
└── Issues over time (line chart)

Example Formula:
=COUNTIF(B:B, "404")  // Count 404 errors
=AVERAGE(WordCount:WordCount)  // Average content length
=SUMIF(Status:Status, "301", Frequency:Frequency)  // Total redirects
```

**Step 4: Share with Team**
```
- Set up automatic imports via Google Drive
- Schedule email reports
- Create live dashboard for executives
```

### Screaming Frog + Ahrefs

**Finding Link Opportunities**

**Process**:
```
1. Screaming Frog: Export pages with 0 referring domains
2. Ahrefs: Analyze competitor backlink profiles
3. Identify gaps
4. Prioritize outreach

Example:
Your Page: example.com/guide-to-widgets
Referring Domains: 0
Backlinks: 0

Competitor: competitor.com/widget-tutorial
Referring Domains: 234
Backlinks: 1,456

Action: Outreach to sites linking to competitor
Pitch: Your guide is more comprehensive/updated
```

### Screaming Frog + SEMrush

**Keyword-Focused Optimization**

**Workflow**:
```
1. SEMrush: Export target keywords
2. Screaming Frog: Crawl site, export page titles
3. Match pages to keywords
4. Identify optimization opportunities

Example CSV Analysis:
Target Keyword | Current Page | Current Position | Title Optimized?
"blue widgets" | /products | 15 | No ❌
"buy widgets online" | /shop | 23 | No ❌
"widget guide" | /blog/guide | 3 | Yes ✓

Action: Optimize titles for position 15+ keywords
```

### Screaming Frog + Python

**Advanced Data Processing**

**Example Script: Find Orphaned Pages**
```python
import pandas as pd

# Load Screaming Frog exports
all_urls = pd.read_csv('internal_all.csv')
inlinks = pd.read_csv('inlinks.csv')

# Find URLs with 0 inlinks (orphaned pages)
orphaned = all_urls[all_urls['Inlinks'] == 0]

# Exclude intentional orphans
orphaned = orphaned[~orphaned['Address'].str.contains('/thank-you|/confirmation')]

# Export
orphaned[['Address', 'Title', 'Word Count']].to_csv('orphaned_pages.csv')

print(f"Found {len(orphaned)} orphaned pages")
```

**Example Script: Identify Cannibalization**
```python
import pandas as pd
from collections import defaultdict

# Load data
pages = pd.read_csv('internal_html.csv')

# Group by H1
h1_groups = pages.groupby('H1-1')['Address'].apply(list).to_dict()

# Find H1s used on multiple pages
cannibalization = {h1: urls for h1, urls in h1_groups.items() if len(urls) > 1}

# Report
for h1, urls in cannibalization.items():
    print(f"\nH1: {h1}")
    print(f"Found on {len(urls)} pages:")
    for url in urls:
        print(f"  - {url}")
```

### Screaming Frog + Excel Power Query

**Building Automated Reports**

**Setup**:
```
1. Excel → Data → Get Data → From File → From CSV
2. Select Screaming Frog export
3. Transform data:
   ├── Remove unnecessary columns
   ├── Filter to important rows
   ├── Create calculated columns
   └── Load to Excel

4. Create PivotTables and charts
5. Refresh data weekly
```

**Example Power Query**:
```
= Table.SelectRows(
    Source,
    each [Status Code] <> 200
    and [Indexability Status] = "Indexable"
)

Result: All indexable pages with errors
```

---
