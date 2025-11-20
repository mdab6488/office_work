
## Key Metrics Explained

### Domain Authority (DA)

**What it is:**
A score from 1-100 that predicts how well a domain will rank in search engines.

**How it's calculated:**
- Based on link data from Moz's web index
- Considers linking root domains
- Quality and quantity of backlinks
- Uses machine learning algorithm

**Interpretation:**

```
DA 0-20   = Very weak domain
DA 21-40  = Below average authority
DA 41-50  = Average authority
DA 51-60  = Good authority
DA 61-70  = Strong authority
DA 71-80  = Very strong authority
DA 81-100 = Exceptional authority
```

**Real Example:**
```
nytimes.com      → DA: 95 (Exceptional news authority)
hubspot.com      → DA: 93 (Strong marketing authority)
medium.com       → DA: 94 (High publishing platform authority)
startupblog.com  → DA: 28 (Developing blog)
newsite.com      → DA: 1  (Brand new site)
```

### Page Authority (PA)

**What it is:**
A score from 1-100 that predicts how well a specific page will rank.

**How it's calculated:**
- Similar to DA but page-specific
- Considers internal links to the page
- External links to the page
- Content quality signals

**Key Difference from DA:**
```
Domain Authority  = Entire website's authority
Page Authority    = Individual page's authority

Example:
nytimes.com           → DA: 95
nytimes.com/homepage  → PA: 87 (high-value page)
nytimes.com/new-article → PA: 35 (new page, building authority)
```

**Real Example:**
```
wikipedia.org/wiki/SEO        → PA: 67 (established article)
wikipedia.org/wiki/New_Topic  → PA: 41 (newer article)
```

### Spam Score

**What it is:**
A percentage (0-100%) representing how similar a site is to known penalized sites.

**Categories:**
```
0-30%   = Low spam risk (Safe)
31-60%  = Medium spam risk (Caution)
61-100% = High spam risk (Avoid)
```

**Warning Flags:**
- High spam score doesn't guarantee a penalty
- Low spam score doesn't guarantee safety
- Use as one factor among many

**Real Example:**
```
google.com         → Spam Score: 1%  (Trusted site)
legitimate-blog.com → Spam Score: 15% (Low risk)
sketchy-site.com   → Spam Score: 87% (High risk)
```

### Linking Root Domains

**What it is:**
The number of unique domains linking to a page or site.

**Why it matters:**
- More important than total links
- 100 links from 1 domain < 10 links from 10 domains
- Diversity matters for SEO

**Example:**
```
Site A: 1,000 backlinks from 50 domains   → Moderate strength
Site B: 500 backlinks from 200 domains    → Stronger profile
Site C: 10,000 backlinks from 10 domains  → Potentially weak/spammy
```