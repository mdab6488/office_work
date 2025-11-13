
## 12. Bulk Operations {#bulk-operations}

### Bulk Exports

**Exporting All Data**:
```
Bulk Export → All

Exports all tabs to separate CSV files:
├── internal_all.csv
├── external_all.csv
├── images.csv
├── page_titles.csv
├── meta_descriptions.csv
├── h1.csv
└── ... (30+ files)

Destination: Choose folder
```

**Custom Bulk Export**:
```
Bulk Export → Custom

Select specific columns:
✓ Address (URL)
✓ Status Code
✓ Title 1
✓ Title 1 Length
✓ Meta Description 1
✓ H1-1
✓ Word Count
✓ Inlinks
✓ Outlinks
✓ Indexability
✓ Canonical Link Element 1

Export to single CSV with only chosen columns
```

### Bulk URL Analysis

**List Mode for Specific URLs**:

**Scenario**: Check 5,000 specific product URLs

**Step 1: Prepare URL List**
```
Create CSV or TXT file:

https://example.com/product-1
https://example.com/product-2
https://example.com/product-3
...
https://example.com/product-5000
```

**Step 2: Upload to Screaming Frog**
```
1. Mode → List
2. Upload → Select file
3. Configuration → Limits → Uncheck "Crawl Linked URLs"
4. Start

Result: Crawls only specified 5,000 URLs
Time: Much faster than full site crawl
```

**Use Cases**:
- Check if URLs return 200
- Verify titles and descriptions
- Confirm canonical tags
- Check indexability
- Validate redirects

### Bulk Find & Replace

**Example: Fixing Title Tag Template**

**Scenario**: 500 pages with format "Page Title | Old Brand"  
**Need**: Change to "Page Title | New Brand"

**Using Excel After Export**:
```
1. Export Page Titles
2. Open in Excel
3. Find & Replace:
   Find: | Old Brand
   Replace: | New Brand
4. Generate list of updates for dev team
```

**Python Script Alternative**:
```python
import pandas as pd

# Load data
titles = pd.read_csv('page_titles.csv')

# Update titles
titles['New Title'] = titles['Title 1'].str.replace('| Old Brand', '| New Brand')

# Create update list
updates = titles[['Address', 'Title 1', 'New Title']]
updates.to_csv('title_updates.csv', index=False)
```

### Bulk Image Optimization Check

**Finding Large Images**:
```
Process:
1. Images tab
2. Export → Custom → Select:
   ├── Address
   ├── Size (bytes)
   ├── Alt Text 1
   └── Status Code

3. Open in Excel
4. Sort by Size descending
5. Filter: Size > 500,000 bytes (500KB)

Result:
URL | Size | Alt Text | Status
image-1.jpg | 2,456,789 | Missing ⚠️ | 200
image-2.png | 1,234,567 | Product image | 200
image-3.jpg | 987,654 | Hero image | 200

Action: Optimize large images, add alt text
```

### Bulk Redirect Mapping

**Generating Redirect Rules**:

**Scenario**: 1,000 pages returning 404

**Step 1: Export 404s**
```
1. Response Codes → Client Error (4xx)
2. Filter: Status Code = 404
3. Export → Custom:
   ├── Address (404 URL)
   ├── Inlinks
   └── Source (referring URLs)
```

**Step 2: Find Redirect Targets**
```
For each 404, determine:
1. Is there a replacement page?
2. Which category should it redirect to?
3. Should it be 410 (Gone)?

Methods:
- Search for similar URLs in site
- Check archived versions
- Review content type
```

**Step 3: Create Redirect File**
```
CSV Format:
Old URL | New URL | Type
/old-product-1 | /products/new-product-1 | 301
/old-category | /new-category | 301
/obsolete-page | /category | 301
/truly-gone | - | 410

Use for:
- Apache .htaccess
- Nginx config
- Cloudflare rules
- CDN redirects
```

**Apache .htaccess Example**:
```apache
# Generated from Screaming Frog audit
Redirect 301 /old-product-1 /products/new-product-1
Redirect 301 /old-category /new-category
Redirect 301 /obsolete-page /category
```

---
