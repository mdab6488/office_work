
## 4. Interface Overview {#interface-overview}

### Main Interface Components

```
┌─────────────────────────────────────────────────────────────┐
│  [URL Bar]  [Start] [Stop] [Clear] [Export]                │ ← Control Panel
├─────────────────────────────────────────────────────────────┤
│  Internal  External  Protocol  Response Codes  URL  etc.   │ ← Main Tabs
├──────────────┬──────────────────────────────────────────────┤
│              │  [URL List - Main Data Window]               │
│  [Filters]   │  ┌──────────────────────────────────────┐   │
│              │  │ URL | Status | Title | H1 | ...      │   │
│  ◉ HTML      │  ├──────────────────────────────────────┤   │
│  ○ Images    │  │ Data rows...                         │   │
│  ○ CSS       │  └──────────────────────────────────────┘   │
│  ○ Script    │                                              │
│              ├──────────────────────────────────────────────┤
│              │  [Lower Panel - Detailed View]               │
│              │  Inlinks | Outlinks | Insights | etc.        │
└──────────────┴──────────────────────────────────────────────┘
```

### Key Interface Elements

**1. URL Input Bar**
- Enter website URL to crawl
- Supports http://, https://, or domain.com format
- Can crawl specific sections (e.g., example.com/blog/)

**2. Main Tabs** (Horizontal navigation)
```
├── Internal: All internal pages
├── External: External links found
├── Protocol: HTTP vs HTTPS issues
├── Response Codes: Status code breakdown
├── URL: List of all discovered URLs
├── Page Titles: Title tag analysis
├── Meta Description: Meta description review
├── H1: H1 heading analysis
├── H2: H2 heading analysis
├── Images: Image file analysis
├── Directives: Robots, canonical, hreflang
└── And 20+ more tabs...
```

**3. Left-Side Filters**
- **HTML**: Regular web pages
- **Images**: Image files (.jpg, .png, etc.)
- **CSS**: Stylesheets
- **Script**: JavaScript files
- **PDF**: PDF documents
- **Flash**: Flash files
- **Other**: Various file types

**4. Lower Panel Tabs**
```
├── Inlinks: Pages linking TO selected URL
├── Outlinks: Pages linked FROM selected URL
├── Insights: Quick issue summary
├── Source Code: Raw HTML
├── Rendered Page: Visual preview (paid only)
├── Redirect Chains: Full redirect paths
└── Structured Data: JSON-LD, Microdata
```

**5. Top Metrics Bar**
```
URLs: 1,247 | Internal: 1,103 | External: 144 | 
Time: 00:02:34 | Speed: 8.2 URLs/sec | Memory: 512MB
```

### Understanding the Data Columns

Common columns you'll see:

```
Address         : Full URL of the page
Status Code     : HTTP response (200, 301, 404, etc.)
Status          : Text status (OK, Moved Permanently, Not Found)
Content Type    : text/html, image/jpeg, etc.
Indexability    : Indexable, Non-Indexable, Canonical
Indexability Status: Why it's (non)indexable
Title 1         : Page title tag
Title 1 Length  : Character count
Title 1 Pixel Width: Visual width
Meta Description 1: Meta description tag
Meta Description 1 Length: Character count
H1-1            : First H1 on page
H1-2            : Second H1 (if exists)
Word Count      : Total words on page
Outlinks        : Number of outbound links
Inlinks         : Number of inbound internal links
Unique Inlinks  : Number of unique pages linking here
```

---
