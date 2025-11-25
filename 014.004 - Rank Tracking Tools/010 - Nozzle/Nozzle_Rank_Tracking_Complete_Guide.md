# Nozzle - Complete Guide to Enterprise Rank Tracking

## Table of Contents
1. [Overview](#overview)
2. [Core Differentiators](#core-differentiators)
3. [Key Features](#key-features)
4. [Advanced Metrics](#advanced-metrics)
5. [SERP Features Tracking](#serp-features-tracking)
6. [Competitor Tracking](#competitor-tracking)
7. [Scheduling & Frequency Options](#scheduling--frequency-options)
8. [Data Access & Export](#data-access--export)
9. [Brand & Property Tracking](#brand--property-tracking)
10. [Segments & Custom Filtering](#segments--custom-filtering)
11. [Real-Life Use Cases](#real-life-use-cases)
12. [BigQuery Integration](#bigquery-integration)
13. [API Access](#api-access)
14. [Comparison with Other Tools](#comparison-with-other-tools)
15. [Getting Started](#getting-started)
16. [Pricing Model](#pricing-model)
17. [Best Practices](#best-practices)

---

## Overview

**Nozzle** is an enterprise-grade SERP (Search Engine Results Page) analytics and rank tracking platform designed for technical SEOs, agencies, and large-scale enterprises who require granular SERP data beyond simple position tracking.

### What Makes Nozzle Different?
Unlike traditional rank trackers that simply report "you're #3," Nozzle provides comprehensive SERP intelligence including:
- Pixel-level position tracking
- Full SERP feature analysis
- Unlimited competitor tracking
- Complete historical SERP data
- Raw HTML storage for every SERP
- Real-time to monthly tracking frequencies
- Direct BigQuery integration

### Target Users
- **Enterprise SEO Teams**: Managing thousands to millions of keywords
- **SEO Agencies**: Multi-client environments with diverse tracking needs
- **Technical SEOs**: Data analysts who want raw SERP data
- **Data Scientists**: Teams integrating SEO data into BI pipelines
- **Local SEO Specialists**: Hyper-local tracking requirements

---

## Core Differentiators

### 1. **Pixel Rank Tracking (Pioneer)**
Nozzle pioneered pixel-based ranking metrics, measuring actual visibility on screen rather than just numeric position.

**Why It Matters:**
```
Traditional Rank #1 Scenario:
- Position: #1
- Pixel Position: 155px (no ads)
- Above Fold %: 85%
- Result: High CTR

Same Position #1 with SERP Features:
- Position: #1  
- Pixel Position: 1,250px (after AI Overview, 4 ads, Featured Snippet)
- Above Fold %: 0%
- Result: Dramatically reduced CTR
```

**Real-Life Example:**
A SaaS client noticed traffic dropped 40% despite maintaining #1 rankings. Nozzle's pixel tracking revealed:
- Pixel Position increased from 172px to 1,180px
- AI Overviews (600px) + 4 Ads (400px) pushed organic result below fold
- Above the Fold % dropped from 75% to 0%
- Recommendation: Target different keywords with fewer SERP features

### 2. **Unlimited Competitor Tracking**
Most rank trackers charge per competitor or limit tracking. Nozzle tracks the entire SERP (top 100 results) automatically.

**Capabilities:**
- Track unlimited competitor domains
- Add new competitors retroactively
- Historical data backfill ("rewrite history")
- Discover unknown competitors automatically

**Real-Life Example:**
Agency discovers their e-commerce client faces competition from:
- 3 known direct competitors
- 7 marketplace aggregators (Amazon, Etsy, eBay)
- 12 content publishers
- 5 YouTube videos
- Total: 27 competitive entities tracked at no extra cost

### 3. **Complete SERP Data Retention**
Nozzle stores full SERP HTML and 1,000+ data fields indefinitely.

**What's Stored:**
- Raw HTML of every SERP
- All ranking positions (1-100)
- Every SERP feature
- Pixel measurements
- Device-specific data
- Location-specific results

---

## Key Features

### 1. Enterprise-Scale Keyword Tracking
- **Unlimited keywords** (pricing based on SERPs pulled, not keywords)
- Track from dozens to millions of keywords
- Keyword grouping and categorization
- Bulk import/export
- AdWords criteria ID integration

### 2. Comprehensive Brand Monitoring
Track your entire digital footprint:
- Primary domain
- Subdomains
- Social profiles (Twitter, LinkedIn, Facebook)
- YouTube channels and videos
- Guest posts on external sites
- Press releases
- Quora answers
- Pinterest boards
- Medium posts

**Configuration Example:**
```
Brand: "TechStartup Inc"
Properties:
├── techstartup.com (main site)
├── blog.techstartup.com
├── support.techstartup.com
├── @TechStartup (Twitter)
├── linkedin.com/company/techstartup
├── youtube.com/c/techstartup
├── medium.com/@techstartup
└── Custom URL matches: *.techstartup.*
```

### 3. Device & Location Tracking
- **Desktop & Mobile** tracking separately
- **Geo-specific** tracking down to zip code level
- **Language** preferences
- Custom user-agent strings

### 4. Flexible Scheduling
Customize tracking frequency per keyword group:
- **Every 5 minutes** (breaking news, crisis management)
- **Hourly** (highly volatile SERPs)
- **Daily** (standard tracking)
- **Weekly** (mid-tail keywords)
- **Monthly** (long-tail, low-priority)

**Cost Optimization Example:**
```
Keyword Strategy:
- 50 brand terms → Hourly tracking
- 500 commercial keywords → Daily tracking  
- 2,000 informational keywords → Weekly tracking
- 10,000 long-tail keywords → Monthly tracking

This mixed approach balances cost with data needs
```

---

## Advanced Metrics

### 1. **Pixels From Top**
Measures exact distance from top of page to your listing.

**Formula:**
```
Pixels From Top = Distance (in pixels) from top of SERP to your result
```

**Interpretation:**
- 155-172px: First organic position, no ads
- 200-400px: Result after 1-2 ads
- 600-1000px: Result after featured snippet, ads, and other features
- 1200+px: Significantly below the fold

**Real-Life Example:**
Real estate website tracking "condos in Miami":
- Date 1: Pixels From Top = 165px (clean SERP, #1 organic)
- Date 2: Pixels From Top = 1,350px (AI Overview added, same #1 position)
- Action: Optimized for featured snippet to gain visibility

### 2. **Above the Fold Percentage**
Percentage of your listing visible without scrolling.

**Calculation:**
Nozzle renders common screen resolutions:
- Desktop: 1920x1080 standard
- Mobile: 375x667 (iPhone)

Measures visible pixels of your result vs. total result height.

**Example:**
```
Listing Height: 120px
Visible Above Fold: 30px
Above Fold %: 25%

Interpretation: Only 1/4 of listing visible, poor visibility
```

### 3. **SERP Percentage**
Pixel coverage your result occupies compared to entire SERP.

**Use Case:**
Understanding visual dominance in SERPs:
- Featured Snippet: 15-25% SERP coverage
- Standard Organic: 3-5% SERP coverage
- Rich Snippet: 8-12% SERP coverage

### 4. **Ad-Adjusted Rank**
Your organic position accounting for ad positions.

**Example:**
```
Scenario 1:
- Organic Rank: #1
- Ads Present: 4
- Ad-Adjusted Rank: #5

Scenario 2:
- Organic Rank: #3
- Ads Present: 0
- Ad-Adjusted Rank: #3
```

### 5. **Estimated CTR**
Advanced CTR calculation considering:
- SERP position
- SERP features present
- Ad presence
- Device type
- Result type (organic, featured snippet, etc.)

**Algorithm:**
1. Base CTR curve by device type
2. Adjust for SERP features (featured snippets, PAA, etc.)
3. Adjust for surrounding elements
4. Calculate final estimated CTR

**Real-Life Application:**
```
Keyword: "best project management software"
- Position #2, Desktop
- Base CTR: 15%
- Featured Snippet present above: -40% adjustment
- 2 Ads above: -15% adjustment
- Estimated CTR: 6.75%

Helps forecast traffic more accurately than position alone
```

### 6. **Search Volume Data**
Integrated Google Keyword Planner data:
- Monthly search volume
- By location
- Historical trends

---

## SERP Features Tracking

Nozzle tracks **84+ SERP features** including:

### Standard Features
- **Featured Snippets** (paragraph, list, table, video)
- **People Also Ask (PAA)**
- **Local Pack** (3-pack, expanded)
- **Knowledge Panel/Graph**
- **Image Pack/Carousel**
- **Video Carousel**
- **Top Stories/News**
- **Shopping/Product Ads**
- **Site Links**
- **Reviews/Ratings**

### Advanced Features
- **AI Overviews** (SGE/AI answers)
- **Twitter Cards**
- **Recipe Rich Results**
- **Job Postings**
- **Events**
- **FAQs**
- **How-To Schema**
- **App Packs**

### Feature Analysis Capabilities

#### 1. Featured Snippet Ownership
Track who owns featured snippets across your keyword set:

**Dashboard View:**
```
Top Featured Snippet URLs:
1. competitor.com/guide → 47 keywords
2. yoursite.com/blog → 23 keywords
3. authority-site.com → 19 keywords
4. industry-publication.com → 15 keywords
```

**Real-Life Example:**
Healthcare client discovered:
- Competitor owned 60% of featured snippets
- Their content was longer but less structured
- Action: Restructured content with clear headers, bullet points, tables
- Result: Featured snippet acquisition increased by 180% in 3 months

#### 2. PAA (People Also Ask) Analysis
Identify PAA box opportunities:

**Nozzle's PAA Report:**
- Which domains appear most in PAA
- PAA questions by frequency
- Keywords triggering PAA boxes
- Content gaps analysis

**Use Case:**
SaaS company analyzed 5,000 keywords:
- 3,200 triggered PAA boxes
- Identified 450 unique questions
- Created content addressing top 100 questions
- Appeared in 78 new PAA boxes within 6 months

#### 3. Local Pack Tracking
Essential for local SEO:

**Data Points:**
- Who appears in 3-pack
- Position within pack
- Review count and rating
- Distance from search location
- Business attributes shown

**Real-Life Example:**
Multi-location restaurant chain:
```
Keyword: "italian restaurant"
Location: Chicago, IL

Tracking:
- Main location: Appears in 42% of Chicago searches
- Competitor A: 68% (higher reviews)
- Competitor B: 55% (better attributes)

Action: Focus on review acquisition, update GMB attributes
Result: 3-pack appearance increased to 61%
```

### SERP Feature Segmentation

Create custom segments to analyze specific features:

**Example Segments:**
```
1. "Featured Snippets - Tables"
   → Shows all keywords where table snippets appear
   → Helps identify structured content opportunities

2. "Video Carousels - YouTube Only"
   → Keywords with YouTube video packs
   → Video content opportunities

3. "Local Pack + Reviews"
   → Local searches with review rich results
   → Review generation priority

4. "AI Overviews Present"
   → Keywords affected by AI Overview
   → Content strategy adjustment needed
```

---

## Competitor Tracking

### Unlimited Competitor Philosophy
Nozzle's approach: "The entire SERP is your playground"

### How It Works

#### 1. Automatic Competitor Discovery
Nozzle tracks top 100 results for every keyword automatically.

**Share of Voice Dashboard:**
```
Competitive Landscape for 1,000 Keywords:

By Domain:
1. yoursite.com: 340 rankings (34% SOV)
2. competitor-a.com: 280 rankings (28% SOV)
3. competitor-b.com: 195 rankings (19.5% SOV)
4. industry-publication.com: 120 rankings
5. marketplace.com: 85 rankings
...continuing through position 100
```

#### 2. Named Competitors
Add specific competitors for focused tracking:
- Get historical data backfilled automatically
- Create competitor-specific reports
- Set up alerts for competitor movements

**Real-Life Example:**
E-commerce fashion brand adds competitor on March 15:
- Nozzle backfills data to January 1 (project start date)
- Shows competitor's historical ranking trends
- Reveals they launched major campaign in February
- Client can analyze entire competitive timeline

#### 3. Competitive Share of Voice Analysis

**By Position Segments:**
```
Top 3 Positions:
- Your Site: 45 keywords
- Competitor A: 38 keywords  
- Competitor B: 22 keywords

Positions 1-10:
- Your Site: 234 keywords
- Competitor A: 198 keywords
- Competitor B: 176 keywords
```

**By SERP Feature:**
```
Featured Snippets:
- Competitor A: 67 owned
- Your Site: 34 owned
- Competitor B: 23 owned

PAA Appearances:
- Authority Site: 145 appearances
- Your Site: 89 appearances
- Competitor A: 67 appearances
```

### Competitive Intelligence Use Cases

#### Use Case 1: Algorithm Update Analysis
```
Event: Google Core Update - March 2024

Pre-Update (Feb):
- Your Site: 450 top 10 rankings
- Competitor A: 380 top 10 rankings

Post-Update (April):
- Your Site: 520 top 10 rankings (+15.6%)
- Competitor A: 310 top 10 rankings (-18.4%)

Analysis:
- Identify what changed for Competitor A
- Review lost pages and content types
- Replicate what worked for your site
- Avoid strategies that caused Competitor A's decline
```

#### Use Case 2: Content Strategy Reverse Engineering
```
Observation: Competitor B gaining featured snippets

Nozzle Analysis:
- 47 new featured snippets acquired in Q2
- All are "list-format" snippets
- Average content length: 1,200-1,500 words
- Consistent H2 structure: "What is X", "How to X", "Benefits of X"
- All include comparison tables

Your Action:
- Create similar content structure template
- Target keywords where competitor B has snippets
- Add enhanced visuals and data for differentiation
```

#### Use Case 3: Market Entry Detection
```
Alert: New competitor domain appearing frequently

Week 1: 3 top-10 rankings
Week 4: 47 top-10 rankings
Week 8: 156 top-10 rankings

Analysis via Nozzle:
- Targeting exact-match commercial keywords
- Heavy programmatic content approach
- Acquired featured snippets on 23 terms
- Minimal social/PR links

Action:
- Prioritize defensive content updates
- Accelerate internal linking to key pages
- Launch targeted link building campaign
```

---

## Scheduling & Frequency Options

### Frequency Tiers

| Frequency | Use Case | Cost Impact | Example Keywords |
|-----------|----------|-------------|------------------|
| **Every 5 minutes** | Crisis management, breaking news, real-time events | Highest | "company name scandal", "breaking news topic" |
| **Hourly** | Highly volatile SERPs, competitive terms | High | Brand terms, high-value commercial keywords |
| **Daily** | Standard tracking | Medium | Most commercial and informational keywords |
| **Weekly** | Mid-tail keywords | Low | Supporting content keywords |
| **Monthly** | Long-tail, low priority | Lowest | Niche, low-volume keywords |

### Strategic Scheduling Examples

#### Example 1: E-commerce Site
```
Brand Protection (50 keywords) → Hourly
- "brand name"
- "brand name + product"
- "brand name reviews"

Commercial Intent (500 keywords) → Daily
- "best [product category]"
- "buy [product] online"
- "[product] comparison"

Informational (2,000 keywords) → Weekly
- "how to [use product]"
- "what is [product feature]"
- "[product] tips"

Long-tail (10,000 keywords) → Monthly
- Very specific product queries
- Niche how-to queries
```

**Monthly SERP Budget:**
```
Hourly: 50 keywords × 24 hours × 30 days = 36,000 SERPs
Daily: 500 keywords × 30 days = 15,000 SERPs
Weekly: 2,000 keywords × 4.3 weeks = 8,600 SERPs
Monthly: 10,000 keywords × 1 = 10,000 SERPs
Total: 69,600 SERPs/month
```

#### Example 2: News/Media Site
```
Breaking News (20 keywords) → Every 5 minutes
- Current event terms
- Trending topics

Evergreen Content (300 keywords) → Daily
- Consistent traffic generators

Archive Content (5,000 keywords) → Monthly
- Historical articles
```

#### Example 3: Local Business (Multiple Locations)
```
Per Location Strategy:

High-Priority Location (Downtown):
- 30 local keywords → Daily
- "restaurant near me"
- "best [cuisine] [city]"

Standard Locations (5 suburbs):
- 20 keywords each × 5 = 100 keywords → Weekly

Test Locations (2 new areas):
- 15 keywords each × 2 = 30 keywords → Monthly
```

### On-Demand Tracking
Manually trigger one-time or ad-hoc pulls:
- After content publish
- Post-algorithm update
- Competitor activity detected
- Before client reports

---

## Data Access & Export

### Export Formats

#### 1. CSV Export
**Available Throughout UI:**
- Click-to-export from any view
- Filtered data exports
- Custom column selection
- Date range specification

**Use Cases:**
- Quick Excel analysis
- Share with non-technical stakeholders
- Ad-hoc reporting

**Example Export:**
```csv
keyword,rank,url,pixels_from_top,above_fold_pct,serp_features,date
"best crm software",1,yoursite.com/crm-guide,172,75.5,"featured_snippet,paa",2024-03-15
"crm comparison",3,yoursite.com/comparison,450,22.1,"reviews,shopping",2024-03-15
```

#### 2. API Access
**Included with all plans** (no paywall)

**API Capabilities:**
- Query ranking data
- Retrieve SERP features
- Access competitor data
- Pull historical data
- Manage keywords and brands

**Authentication:**
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.nozzle.io/v1/rankings?keyword_id=12345
```

**Response Structure:**
```json
{
  "keyword": "best crm software",
  "rank": 1,
  "url": "yoursite.com/crm-guide",
  "pixels_from_top": 172,
  "above_fold_percentage": 75.5,
  "serp_features": ["featured_snippet", "paa"],
  "competitors": [
    {"domain": "competitor.com", "rank": 2},
    {"domain": "authority.com", "rank": 3}
  ]
}
```

**Use Cases:**
- Custom internal dashboards
- Automated alerting systems
- Integration with proprietary tools
- Data science workflows

#### 3. BigQuery Integration
**Enterprise-grade data warehouse access**

[See detailed BigQuery section below]

---

## Brand & Property Tracking

### Brand Architecture

Unlike domain-centric rank trackers, Nozzle uses a hierarchical structure:

```
Workspace (Agency/Company Level)
└── Projects (Client/Website Level)
    └── Brands (Entity Level)
        └── Properties (Individual Assets)
            └── URLs (Specific Pages)
```

### Setting Up Brands

#### Example: Software Company
```
Brand: "ProjectFlow"
└── Properties:
    ├── projectflow.com (main domain)
    │   ├── projectflow.com/features
    │   ├── projectflow.com/pricing
    │   └── projectflow.com/blog/*
    ├── app.projectflow.com (SaaS app)
    ├── help.projectflow.com (docs)
    ├── @ProjectFlow (Twitter)
    ├── linkedin.com/company/projectflow
    ├── youtube.com/c/projectflow
    │   ├── Individual video URLs
    │   └── Channel page
    ├── medium.com/@projectflow (blog)
    ├── github.com/projectflow (open source)
    └── Custom matches:
        ├── External guest posts
        ├── Press releases
        └── Partner sites featuring brand
```

### Property Matching Rules

#### 1. Domain Matching
```
Match Type: Exact Domain
Rule: projectflow.com
Captures: All projectflow.com pages

Match Type: Subdomain Wildcard
Rule: *.projectflow.com
Captures: app.projectflow.com, help.projectflow.com, blog.projectflow.com

Match Type: Path Specific
Rule: projectflow.com/blog/*
Captures: Only blog section
```

#### 2. URL Pattern Matching
```
Match Type: Contains
Rule: URL contains "projectflow"
Captures: Any URL with brand mention

Match Type: Regular Expression
Rule: ^https?://(www\.)?projectflow\.com/features/.*$
Captures: All feature pages with regex precision
```

### Real-Life Brand Tracking Example

**Agency Client: Multi-Brand Hospitality Group**

```
Parent Brand: "Luxury Stays Group"

Sub-Brands:
1. Brand: "Mountain Resorts Collection"
   Properties:
   ├── mountainresorts.com
   ├── Social: @MountainResorts
   ├── Trip Advisor listings
   └── 5 individual resort domains

2. Brand: "Coastal Hotels Network"
   Properties:
   ├── coastalhotels.com
   ├── 12 individual hotel domains
   ├── Instagram accounts per location
   └── Booking platform profiles

3. Brand: "Urban Boutique Suites"
   Properties:
   ├── urbanboutique.com
   ├── 8 location pages
   └── Social profiles
```

**Keyword Tracking:**
```
Generic Hotel Terms (2,000 keywords):
- Track all brands
- Compare brand performance
- "luxury hotels [city]"
- "best hotels [region]"

Brand Terms (500 keywords):
- Brand-specific
- "mountain resorts collection"
- "coastal hotels reviews"

Location Terms (3,000 keywords):
- Property-specific
- "hotels in [specific area]"
- "[city] accommodations"
```

**Reporting Benefits:**
- Compare brand performance across same keywords
- Identify which brand dominates which segments
- Allocate marketing budget based on SERP presence
- Unified view of entire company SERP footprint

---

## Segments & Custom Filtering

### Built-in Segments (84+)

Nozzle includes 84 pre-built segments for instant analysis:

#### Position-Based Segments
```
- Top 3 Positions
- Top 5 Positions
- Top 10 Positions
- Positions 1-3
- Positions 4-10
- Positions 11-20
- Positions 21-50
- Positions 51-100
- Not Ranking (below 100)
```

#### SERP Feature Segments
```
- Featured Snippets (All)
- Featured Snippets - Paragraph
- Featured Snippets - List
- Featured Snippets - Table
- Featured Snippets - Video
- People Also Ask
- Local Pack
- Knowledge Panel
- Image Pack
- Video Carousel
- Shopping Results
- Top Stories
- Site Links
- Reviews
- AI Overviews
```

#### Performance Segments
```
- Above the Fold
- Below the Fold
- High CTR (>5%)
- Low CTR (<1%)
- High Search Volume (>1000)
- Ranking Improvements (vs. last week/month)
- Ranking Declines
```

### Custom Segment Creation

**Interface:**
```
Click Gear Icon → Segments → Add Segment

Available Filters:
- Rank (exact, range, comparison)
- Pixel Position
- SERP Features (present/absent)
- Competitors (present/absent)
- Search Volume
- CTR
- Device Type
- Location
- Keyword Groups
- URL patterns
```

### Custom Segment Examples

#### Example 1: Featured Snippet Opportunities
```
Segment Name: "Featured Snippet Opportunities"

Filters:
- Rank: 2-5
- Featured Snippet: Present on SERP
- My Site: Not in Featured Snippet
- Search Volume: >500

Logic: "Keywords where FS exists, I rank well, but don't own the snippet"

Result: 147 keywords identified
Action: Content optimization for snippet acquisition
```

#### Example 2: Competitor Vulnerability Analysis
```
Segment Name: "Weak Competitor #1 Rankings"

Filters:
- Competitor A: Rank 1-3
- My Site: Rank 4-10
- Above Fold %: <30% (for Competitor A's listing)
- SERP Features: Local Pack NOT present

Logic: "Competitor ranks high but has poor visibility due to ads/features"

Result: 89 keywords where competitor's #1 is less visible
Action: Focus link building here, easier to displace
```

#### Example 3: High-Value Underperformers
```
Segment Name: "High-Volume Low-Rank"

Filters:
- Search Volume: >5,000
- My Site Rank: 11-20 (page 2)
- Intent: Commercial
- Trend: Not declining

Result: 34 keywords with high potential
Action: Priority for content update and link building
```

#### Example 4: AI Overview Impact
```
Segment Name: "AI Overview Affected Keywords"

Filters:
- AI Overview: Present
- Date: After [AI Overview launch date]
- Rank Change: Declined OR Traffic dropped
- Pixels From Top: Increased

Result: Keywords pushed down by AI Overviews
Action: 
- Consider alternative keywords
- Optimize for inclusion in AI Overview sources
- Focus on transactional terms (fewer AI Overviews)
```

#### Example 5: Local Pack Dominance
```
Segment Name: "Local Pack Wins"

Filters:
- SERP Feature: Local Pack present
- My Locations: Appearing in pack
- Pack Position: 1-3
- Review Count: My locations > competitors

Result: 76 local keywords dominated
Action: Maintain review acquisition, monitor competition
```

### Segment-Based Workflows

#### Workflow 1: Monthly Content Planning
```
Step 1: Run segment "Top Opportunities"
        (High volume, rank 4-10, low competition)
        
Step 2: Export keyword list

Step 3: Analyze top-ranking content for each keyword

Step 4: Create content improvement plan

Step 5: Track segment monthly to measure improvement
```

#### Workflow 2: Competitive Defense
```
Step 1: Create segment "Brand Terms - Competitor Present"

Step 2: Set up weekly email alert

Step 3: When competitor appears on brand terms:
        - Analyze their approach
        - Increase brand content frequency
        - Launch targeted campaign

Step 4: Measure via segment trend over time
```

---

## Real-Life Use Cases

### Use Case 1: E-commerce Product Launch

**Scenario:** Consumer electronics company launching new smart speaker

**Challenge:**
- Highly competitive space (Amazon Echo, Google Home)
- Need real-time tracking during launch week
- Must monitor brand mentions and reviews

**Nozzle Implementation:**
```
Keyword Strategy:
- 50 brand keywords → Every 5 minutes (launch day)
- 200 comparison keywords → Hourly
- 500 general smart speaker terms → Daily
- 2,000 long-tail → Weekly

Brand Tracking:
- Product domain: newproduct.com
- Main company site: company.com/newproduct
- YouTube channel: youtube.com/c/company
- Social handles: @NewProduct
- Retailer listings: amazon.com, bestbuy.com product pages
- Review site mentions: CNET, TechCrunch, etc.

Competitor Monitoring:
- Amazon Echo ecosystem
- Google Home products
- Apple HomePod
- 15+ other smart speakers
```

**Real-Time Insights:**

**Launch Day Results:**
```
Hour 1-4:
- Brand term rankings: Not in top 100
- Expected: Building initial index

Hour 5-8:
- Appeared in position 45-60 for brand terms
- Featured in "Latest Products" SERP feature
- YouTube review videos began ranking

Hour 12-24:
- Reached position 15-25 for brand terms
- Featured snippet acquired for "what is [product name]"
- 3 YouTube reviews in top 10
- Major tech sites ranking for review terms

Day 2-7:
- Settled into position 5-10 for brand terms
- Amazon and Best Buy product pages appearing
- 47 review articles ranking across 200+ keywords
```

**Action Taken Based on Data:**
- Hour 6: Noticed low pixel position (1,500px+) due to ads
  → Launched Google Ads campaign to occupy top positions
  
- Day 3: Competitor ranking for "[product] vs [competitor]"
  → Published comparison content, acquired position #3

- Day 5: Featured snippet stolen by competitor article
  → Updated content with better formatting, regained snippet

**Outcome:**
- 67% of target keywords in top 10 within 1 week
- 23 featured snippets acquired
- Comprehensive SERP visibility across brand + category terms
- Executive dashboard showed real-time launch performance

---

### Use Case 2: Local SEO for Multi-Location Restaurant Chain

**Scenario:** 25-location restaurant chain across 3 states

**Challenge:**
- Each location competes in local pack
- Varying review profiles per location
- Competition differs by neighborhood
- Need location-specific insights

**Nozzle Implementation:**
```
Brand Structure:
Brand: "Bella's Italian Kitchen"

Properties (per location):
- bellasitalian.com/locations/downtown-chicago
- bellasitalian.com/locations/naperville
- ... (25 locations)
- Google My Business listings (all 25)
- Social profiles (chain-wide + location-specific)

Keyword Strategy (per location):
- 20 core local keywords: Daily
  Example: "italian restaurant near me" (Chicago)
           "best pasta [neighborhood]"
           "italian food delivery [zip code]"
           
- 30 cuisine-specific: Weekly
  Example: "best lasagna [area]"
           "romantic italian restaurant [city]"
```

**Location Performance Dashboard:**
```
Analysis Date: March 2024

Top Performing Locations:
1. Downtown Chicago
   - Local Pack Appearance: 78% of keywords
   - Avg Pack Position: 1.4
   - Reviews: 847 (4.6★)
   
2. Naperville
   - Local Pack: 71%
   - Avg Position: 1.8
   - Reviews: 523 (4.7★)

Underperforming Locations:
23. Oak Park
    - Local Pack: 31%
    - Avg Position: 2.9
    - Reviews: 127 (4.2★)
    
24. Evanston
    - Local Pack: 28%
    - Avg Position: 3.1
    - Reviews: 94 (4.1★)
```

**Competitive Intelligence:**
```
Local Pack Analysis - "Italian Restaurant" (Chicago area):

Competitor Frequency in Pack:
1. Competitor A: Appears 82% of searches
2. Bella's (Our Chain): Appears 58% of searches
3. Competitor B: Appears 51% of searches
4. Competitor C: Appears 44% of searches

Insights:
- Competitor A has higher review count (avg 650 vs our 420)
- Their GMB optimization superior (more attributes)
- Photos updated more frequently
- Faster response to reviews
```

**Actions Taken:**

**Month 1: Review Acquisition Campaign**
```
Target: All locations increase reviews by 50% in 90 days

Tactics:
- Table tents with QR codes
- Staff training on review requests
- Post-meal email campaign
- Incentive program (monthly drawing)

Results (90 days):
- Downtown Chicago: 847 → 1,124 reviews (+32.7%)
- Oak Park: 127 → 203 reviews (+59.8%)
- Chain average: +47.3% reviews
```

**Month 2-3: GMB Optimization**
```
Updates:
- Added 30+ attributes per location
- Weekly photo uploads (15+ photos/location/month)
- Consistent NAP (Name, Address, Phone) across all citations
- Service area expansion in GMB
- Menu links and service details
- COVID-19 updates and safety measures

Nozzle Tracking:
- Local Pack appearance increased 18% overall
- Oak Park: 31% → 42% pack appearance
- Evanston: 28% → 39% pack appearance
```

**Month 4: Content & Link Building**
```
Per-Location Strategy:
- Created neighborhood guides:
  "Best Italian Restaurants in [Neighborhood]" (owned blog)
  
- Local PR:
  Acquired features in local publications
  
- Partnership links:
  Local chamber of commerce
  Neighborhood associations
  Local food bloggers

Link Profile Impact:
- Downtown: +34 local links
- Oak Park: +18 local links (major improvement area)
```

**Outcome After 6 Months:**
```
Overall Metrics:
- Local Pack Appearance: 58% → 73% (+25.9%)
- Average Pack Position: 2.1 → 1.6 (-23.8% improvement)
- Total Reviews: 10,472 → 15,938 (+52.2%)
- Average Rating: 4.4★ → 4.6★

Traffic Impact:
- Organic visits from local searches: +41%
- Google Maps profile views: +67%
- Direction requests: +53%
- Phone calls from GMB: +48%

Revenue Correlation:
- Locations with >60% pack appearance: +23% revenue
- Locations with <40% pack appearance: +8% revenue
- Clear correlation between local SERP visibility and revenue
```

**Ongoing Monitoring:**
```
Weekly Segment: "Local Pack Losses"
- Alerts when location drops out of pack
- Immediate investigation of:
  → Competitor review surge?
  → Our review quality decline?
  → Algorithm update?
  → Competitor GMB optimization?

Monthly Report per Location:
- Pack appearance %
- Average position
- Review velocity
- Competitor comparison
- Action items for underperformers
```

---

### Use Case 3: SaaS Company Algorithm Update Response

**Scenario:** B2B SaaS project management tool during Google Core Update

**Challenge:**
- March 2024 Google Core Update
- Traffic dropped 28% overnight
- Need rapid analysis and response
- 3,500 tracked keywords

**Pre-Update Baseline (February):**
```
Overall Performance:
- Top 3 Rankings: 342 keywords
- Top 10 Rankings: 1,247 keywords
- Featured Snippets: 67 owned
- Estimated Monthly Traffic: 125,000 organic visits

Competitor Landscape:
- Our Company: 34% Share of Voice
- Competitor A: 28% SOV
- Competitor B: 19% SOV
- Competitor C: 12% SOV
```

**Post-Update Analysis (March 15, using Nozzle):**

**Day 1: Immediate Impact Assessment**
```
Rankings Changes:
- Top 3 Rankings: 342 → 267 (-21.9%)
- Top 10 Rankings: 1,247 → 1,089 (-12.7%)
- Featured Snippets: 67 → 54 (-19.4%)
- Pages dropped out of top 100: 234 keywords

Traffic Projection:
- Estimated Monthly Traffic: 125,000 → 90,000 (-28%)
```

**Nozzle Segment Analysis:**

**Segment 1: "Major Losers"**
```
Filter: Rank declined by 5+ positions

Results: 456 keywords

Pattern Analysis:
- 67% were "what is [topic]" informational keywords
- Average word count: 2,800 words
- Content age: 18-24 months old
- Internal link count: Low (avg 3 internal links)
- Backlink profile: Moderate quality

Top Affected Pages:
1. /blog/what-is-project-management (Rank 2 → 8)
2. /blog/agile-methodology-guide (Rank 1 → 6)
3. /guides/project-planning (Rank 3 → 11)
... 23 more pages severely impacted
```

**Segment 2: "Competitor Gains"**
```
Filter: Competitor A ranks improved, our ranks declined

Results: 178 keywords

Analysis:
- Competitor A gained on 178 keywords we lost
- Their content pattern:
  → More recent publish dates (last 6 months)
  → Better E-E-A-T signals (author bios, credentials)
  → More practical examples and case studies
  → Better schema markup
  → More frequent updates
```

**Segment 3: "Unaffected Winners"**
```
Filter: Our rankings stable or improved

Results: 892 keywords

Pattern Analysis:
- Mostly product comparison pages
- Commercial intent keywords
- More recent content (< 12 months)
- Strong internal linking
- User-generated content (reviews, testimonials)
- Better engagement metrics (assumed)

Example Pages:
- /compare/vs-asana (Rank stable at #3)
- /alternatives/jira-alternatives (Rank improved 7 → 5)
- /reviews (Rank stable at #2)
```

**Competitor Deep Dive:**

**Competitor A Performance:**
```
Change:
- Top 10 Rankings: 978 → 1,156 (+18.2%)
- Featured Snippets: 45 → 67 (+48.9%)
- SOV: 28% → 36%

What They Did Right:
1. Content Freshness
   - 78% of their ranking content updated in last 6 months
   - Clear "Last Updated" timestamps
   
2. Author Authority
   - Added verified author profiles
   - Industry expert contributors
   - LinkedIn integration showing credentials
   
3. Practical Examples
   - More templates and downloadable resources
   - Video tutorials embedded
   - Interactive calculators and tools

4. User Engagement Features
   - Comments sections with active replies
   - Community input integrated
   - Real customer examples
```

**Response Strategy:**

**Phase 1: Emergency Triage (Week 1)**
```
Action: Fix critical pages first

Top 25 Pages - Immediate Updates:
1. Content Refresh
   - Update statistics to 2024
   - Add new examples from past 12 months
   - Expand sections based on PAA questions
   - Add "Last Updated: March 2024" timestamp

2. E-E-A-T Enhancement
   - Add detailed author bios
   - Include credentials and experience
   - Link to author LinkedIn profiles
   - Add "About the Expert" sections

3. Schema Markup
   - Implement Article schema
   - Add Author schema
   - Include ReviewedBy markup
   - Add FAQPage schema

Implementation Timeline:
- Day 1-2: Top 5 pages updated and republished
- Day 3-5: Next 10 pages updated
- Day 6-7: Final 10 pages updated

Nozzle Tracking:
- Set these 25 pages to hourly tracking
- Create custom segment: "Emergency Update Pages"
- Monitor daily for ranking improvements
```

**Phase 2: Strategic Content Overhaul (Week 2-4)**
```
Segment: "Informational Losers" (456 keywords)

Action Plan:
1. Content Audit
   - Identified 89 pages needing major updates
   - Prioritized by:
     → Search volume
     → Historical traffic
     → Commercial value (indirect)

2. Content Enhancement Framework
   Per Page:
   - Add 500-800 words of new content
   - Include 2024 data and examples
   - Embed 1-2 relevant videos
   - Add downloadable template/resource
   - Expand FAQ section using PAA data
   - Update images with fresh screenshots
   - Improve internal linking (+5 contextual links)

3. New Content Assets
   - Created 12 interactive tools:
     → ROI Calculator
     → Timeline Generator
     → Budget Estimator
   - Embedded in relevant content
   - Tracked as separate properties in Nozzle

Weekly Progress Tracking:
Week 2: 25 pages updated
Week 3: 35 pages updated
Week 4: 29 pages updated
Total: 89 pages overhauled
```

**Phase 3: Link Building & PR (Week 2-8)**
```
Strategy:
- Targeted link building to updated pages
- Focus on authoritative sources
- Industry publication outreach

Results:
- 47 new backlinks acquired
- 12 mentions in industry publications
- 3 podcast interviews
- 8 guest post placements

Nozzle Tracking:
- Monitored competitor backlink gains
- Tracked relative link velocity
- Identified link sources competitors used
```

**Results Tracking via Nozzle:**

**Week 2 Results:**
```
Rankings Changes:
- Top 3: 267 → 281 (+5.2%)
- Top 10: 1,089 → 1,127 (+3.5%)
- Featured Snippets: 54 → 58 (+7.4%)

Early Winners (Emergency Updates):
- 18 of 25 emergency pages showed improvement
- Average rank improvement: +3.2 positions
- 5 pages regained featured snippets
```

**Week 4 Results:**
```
Rankings Changes:
- Top 3: 281 → 304 (+8.2%)
- Top 10: 1,127 → 1,198 (+6.3%)
- Featured Snippets: 58 → 64 (+10.3%)

Traffic Recovery:
- Estimated Monthly: 90,000 → 107,000 (+18.9%)
- Still below pre-update (125K) but recovering
```

**Week 8 Results:**
```
Rankings Changes:
- Top 3: 304 → 356 (+4.0% from baseline)
- Top 10: 1,198 → 1,312 (+5.2% from baseline)
- Featured Snippets: 64 → 73 (+9.0% from baseline)

Traffic:
- Estimated Monthly: 107,000 → 132,000 (+5.6% above pre-update!)

New Wins:
- Recovered 87% of lost keywords
- Gained 65 new top-10 rankings
- Acquired 6 featured snippets on new terms
```

**Key Insights from Nozzle Data:**

1. **Speed Matters**
   - Pages updated in Week 1 recovered fastest
   - Average recovery time: 2-3 weeks
   - Delayed updates took 4-6 weeks to recover

2. **E-E-A-T Signals Critical**
   - Pages with enhanced author credentials improved 31% more
   - Schema markup correlated with faster recovery
   - Expert contributor pages outperformed staff-written

3. **Content Freshness Rewarded**
   - "Last Updated" timestamp with real updates worked
   - Pages with 2024 data ranked better
   - Fake "refresh" (minor changes) didn't help

4. **Competitive Intelligence**
   - Watching Competitor A's tactics was invaluable
   - Reverse engineering winners saved time
   - Segment comparisons highlighted successful patterns

**Ongoing Monitoring Setup:**
```
Custom Segments Created:
1. "Recovery Watch"
   - Pages affected by update
   - Track weekly for continued improvement
   
2. "Competitor A Tracking"
   - Keywords where they rank above us
   - Alert on any gains
   - Analyze their new content monthly

3. "EEAT Score Proxy"
   - Pages with author markup
   - Track performance vs non-author pages
   - Validate EEAT impact

4. "Content Age Monitor"
   - Pages >12 months old
   - Alert when rankings decline
   - Proactive refresh schedule

Alerts Set Up:
- Daily: Any page drops >5 positions
- Weekly: Top 25 pages ranking changes
- Monthly: Share of Voice vs competitors
- Quarterly: Full SERP landscape report
```

---

### Use Case 4: Agency Managing 50+ Clients

**Scenario:** Digital marketing agency with diverse client portfolio

**Challenge:**
- 50 clients across industries
- 250,000+ total keywords tracked
- Different reporting needs per client
- Need scalable workflow

**Nozzle Workspace Architecture:**
```
Workspace: "Digital Agency Pro"

Projects (Clients):
├── Client 1: E-commerce Fashion
│   ├── 5,000 keywords
│   ├── 3 brands
│   └── Tracking: Daily
├── Client 2: Local Medical Practice
│   ├── 200 keywords
│   ├── 1 brand, 5 locations
│   └── Tracking: Weekly
├── Client 3: SaaS Startup
│   ├── 1,500 keywords
│   ├── 1 brand
│   └── Tracking: Daily
├── ... (47 more clients)
└── Client 50: Enterprise B2B
    ├── 15,000 keywords
    ├── 2 brands
    └── Tracking: Daily + Hourly for brand terms
```

**Agency Workflow:**

**1. Onboarding New Client**
```
Day 1: Setup
- Create new project
- Import keyword list (from Discovery tool or client)
- Set up brand tracking
- Add known competitors
- Configure initial schedule (usually Daily)

Day 3: Baseline Report
- Run initial rankings (24-48 hours for first data)
- Create baseline benchmark
- Identify quick wins (positions 4-10)
- Competitor analysis
- Present findings to client

Week 2: Strategy Refinement
- Adjust tracking frequency based on volatility
- Add discovered competitors
- Create client-specific segments
- Set up automated reporting
```

**2. Monthly Reporting Automation**

**Standard Agency Report Structure:**
```
Section 1: Executive Summary
- Overall rank distribution (top 3, top 10, etc.)
- Change from last month
- Share of Voice vs. competitors
- Featured snippet count

Section 2: Keyword Performance
- Top movers (improved >5 positions)
- Top decliners (dropped >5 positions)
- New top 10 rankings
- Lost top 10 rankings

Section 3: Competitor Analysis
- Competitive Share of Voice
- Competitor gains/losses
- SERP feature ownership comparison

Section 4: Opportunities
- Quick wins (rank 4-10, low competition)
- Featured snippet opportunities
- Content gaps (competitors rank, client doesn't)

Section 5: SERP Features
- Featured snippets owned
- PAA appearances
- Local pack (if applicable)
- Rich results

All data pulled from Nozzle via BigQuery and automated into Google Slides template
```

**3. Aggregated Agency Dashboard**

**Top-Level Metrics (All Clients):**
```
Agency Performance Dashboard:

Overall Statistics:
- Total Keywords Tracked: 247,832
- Total Top 10 Rankings: 89,456 (36.1%)
- Total Featured Snippets: 1,247
- Average SOV Growth: +3.2% (month over month)

Client Performance Tiers:
Tier 1 (Excellent): 18 clients
- SOV Growth >5%
- Top 10 rankings increased
- Status: Green

Tier 2 (Good): 24 clients
- SOV Growth 0-5%
- Stable rankings
- Status: Yellow

Tier 3 (Needs Attention): 8 clients
- SOV Decline or flat
- Ranking losses
- Status: Red - Schedule review meetings

Alert Clients: 3
- Significant ranking drops
- Potential algorithm update impact
- Immediate action required
```

**4. Competitive Intelligence Across Clients**

**Pattern Recognition:**
```
Agency Insight: Algorithm Update Detection

March 2024 Analysis:
- 47 of 50 clients showed ranking changes March 10-15
- Correlation: 94% probability of algorithm update

Affected Client Patterns:
Same Sector Comparison:
- Healthcare: 8 clients, 6 negatively affected
- E-commerce: 12 clients, 4 negatively affected
- SaaS: 9 clients, 7 negatively affected

Action: 
- Created cross-client analysis report
- Identified update targeted informational content
- Rolled out update response playbook to all affected clients
- Proactive outreach to clients before they noticed issues
```

**5. Cross-Client Learning**

**Successful Tactic Identification:**
```
Observation: Client 23 (SaaS) Featured Snippet Surge

Analysis:
- Acquired 34 new featured snippets in 2 months
- Method: Structured content with H2 questions
- Template: "What is X?", "How does X work?", "Benefits of X"
- Average content length: 1,200 words
- Includes comparison table

Application:
- Adapted template for 15 other SaaS/tech clients
- Results across 15 clients:
  → Average 23 new featured snippets per client
  → 12 of 15 clients saw top 3 ranking improvements
  → Method validated and added to agency playbook

Nozzle Tracking:
- Created segment: "Client 23 Method Success"
- Tracked all pages using the template
- Compared performance vs. control group
- Validated 47% better performance
```

**6. Nozzle Features Critical for Agencies:**

**A. Unlimited Users**
```
Agency Team Structure:
- 5 SEO Strategists: Full access
- 12 SEO Specialists: Project-specific access
- 3 Analysts: Read-only, report generation
- 8 Freelance Writers: Keyword research access
- Total: 28 users, no additional cost
```

**B. Team & Client Segmentation**
```
Workspace Organization:
- Team A (Strategist Sarah): Clients 1-10
- Team B (Strategist Mike): Clients 11-20
- Team C (Strategist Lisa): Clients 21-30
- Team D (Strategist Tom): Clients 31-40
- Team E (Strategist Jane): Clients 41-50

Permissions:
- Each strategist manages their client projects
- Cross-team visibility for knowledge sharing
- Agency owner: Full workspace access
```

**C. Bulk Keyword Management**
```
Scenario: Add 500 new keywords to Client 15

Process:
1. Create CSV with keywords
2. Bulk import via Nozzle UI
3. Auto-assign to keyword groups
4. Schedule applied (inherit from project)
5. First data available in 24-48 hours

Time Saved: 5 hours vs. manual entry
```

**D. BigQuery for Cross-Client Analysis**
```
SQL Query Example: Find common winning patterns

SELECT 
    client_name,
    keyword,
    current_rank,
    previous_rank,
    rank_change,
    serp_features,
    content_word_count,
    backlinks
FROM nozzle_rankings
WHERE 
    rank_change > 5 
    AND current_rank <= 10
    AND date BETWEEN '2024-03-01' AND '2024-03-31'
ORDER BY rank_change DESC
LIMIT 100;

Result: Top 100 ranking improvements across all clients
Analysis: Identify common success factors
```

**7. ROI Tracking for Agency**

**Cost Analysis:**
```
Nozzle Subscription: $5,000/month (example enterprise tier)
Keywords Tracked: 247,832
Cost Per Keyword: $0.0202/month

Competitive Comparison:
- Tool A: $0.15/keyword = $37,175/month (❌ 7.4x more expensive)
- Tool B: $0.08/keyword = $19,827/month (❌ 4x more expensive)
- Tool C: Limited to 50,000 keywords, multiple accounts needed

Agency Benefit:
- Cost savings: $32,175/month vs. competitor tools
- Reinvested into: 2 additional full-time SEO specialists
- Result: Better client service, higher retention
```

**Client Retention Impact:**
```
Before Nozzle (Limited Rank Tracker):
- Monthly reports: Basic rank updates
- Competitor insights: Limited
- Data depth: Surface level
- Client churn: 18% annually

After Nozzle (Comprehensive SERP Intelligence):
- Monthly reports: Detailed SERP analysis
- Competitor insights: Comprehensive
- Data depth: 1,000+ fields per ranking
- Client value perception: Significantly higher
- Client churn: 9% annually (50% reduction)

ROI Calculation:
- Average client value: $3,000/month
- Reduced churn: 4.5 clients/year retained = $162,000/year
- Nozzle cost: $60,000/year
- Net benefit: $102,000/year
- ROI: 170%
```

---

## BigQuery Integration

### Overview
Nozzle provides **direct BigQuery integration**, piping all SERP data into Google's cloud data warehouse.

### How It Works

**1. Setup Process**
```
Step 1: Request BigQuery Access
- Contact Nozzle support
- Provide: Google email address, Workspace slug, Project slug
- Nozzle grants access to shared dataset

Step 2: Access Your Data
URL Format:
https://console.cloud.google.com/bigquery?ws=!1m10!1m4!4m3!1snozzledata!2sWORKSPACE_PROJECT!3srankings

Example:
Workspace: "agency-pro"
Project: "client-ecommerce"
URL: ...!2sagency-pro_client-ecommerce!3srankings

Step 3: Star the Project
- Find dataset in BigQuery console
- Star for easy access
- Begin querying
```

**2. Data Structure**

**Main Tables:**
```
1. rankings
   - Primary table with all SERP data
   - ~1,000 fields per row
   - Updated as new rankings collected

2. latest_keywords_by_keyword_id
   - Current keyword configuration
   - Keyword groups
   - Search volume
   - Tracking settings

3. historical_keywords (optional)
   - Keyword configuration changes over time
```

**3. Data Schema**

**Key Fields in Rankings Table:**
```sql
-- Core Ranking Data
keyword_id (STRING)
keyword (STRING)
rank (INTEGER)
rank_type (STRING) -- 'organic', 'paid', 'featured_snippet', etc.
url (STRING)
domain (STRING)
brand_name (STRING)
property_name (STRING)

-- Position Metrics
pixels_from_top (INTEGER)
above_fold_percentage (FLOAT)
serp_percentage (FLOAT)
ad_adjusted_rank (INTEGER)

-- SERP Features (Boolean flags)
featured_snippet.is_featured_snippet (BOOLEAN)
featured_snippet.type (STRING) -- 'paragraph', 'list', 'table', 'video'
people_also_ask.is_paa (BOOLEAN)
local_pack.is_local_pack (BOOLEAN)
knowledge_panel.is_knowledge_panel (BOOLEAN)
image_pack.is_image_pack (BOOLEAN)
video_carousel.is_video_carousel (BOOLEAN)
shopping_results.is_shopping (BOOLEAN)
-- ... 80+ more feature flags

-- Traffic Estimates
estimated_ctr (FLOAT)
estimated_traffic (INTEGER)
search_volume (INTEGER)

-- Metadata
device_type (STRING) -- 'desktop', 'mobile'
location (STRING)
language (STRING)
search_date (DATE)
collected_at (TIMESTAMP)

-- Competitor Data
competitor_present (BOOLEAN)
competitor_rank (INTEGER)
competitor_url (STRING)

-- Technical
raw_html (STRING) -- Full SERP HTML
serp_hash (STRING) -- Unique SERP identifier
```

### BigQuery Query Examples

#### Example 1: Basic Ranking Overview
```sql
-- Get current rankings summary
SELECT 
    keyword,
    rank,
    url,
    pixels_from_top,
    above_fold_percentage,
    estimated_traffic,
    search_volume
FROM `nozzledata.workspace_project.rankings`
WHERE 
    brand_name = 'Your Brand'
    AND search_date = CURRENT_DATE()
    AND rank <= 20
ORDER BY estimated_traffic DESC
LIMIT 100;
```

#### Example 2: Featured Snippet Analysis
```sql
-- Find featured snippet opportunities
SELECT 
    keyword,
    rank,
    url,
    search_volume,
    featured_snippet.type AS current_fs_type,
    competitor_url AS competitor_with_fs
FROM `nozzledata.workspace_project.rankings`
WHERE 
    search_date = CURRENT_DATE()
    AND featured_snippet.is_featured_snippet = TRUE
    AND rank BETWEEN 2 AND 5
    AND brand_name = 'Your Brand'
    AND search_volume > 500
ORDER BY search_volume DESC;

-- Interpretation: 
-- Keywords where FS exists, you rank 2-5, high volume
-- These are prime targets for snippet optimization
```

#### Example 3: Competitor Tracking
```sql
-- Compare Share of Voice with competitors
SELECT 
    CASE 
        WHEN brand_name = 'Your Brand' THEN 'Your Brand'
        ELSE competitor_domain 
    END AS entity,
    COUNT(CASE WHEN rank <= 3 THEN 1 END) AS top_3_rankings,
    COUNT(CASE WHEN rank <= 10 THEN 1 END) AS top_10_rankings,
    COUNT(CASE WHEN featured_snippet.is_featured_snippet THEN 1 END) AS featured_snippets,
    ROUND(AVG(rank), 2) AS avg_rank
FROM `nozzledata.workspace_project.rankings`
WHERE search_date = CURRENT_DATE()
GROUP BY entity
ORDER BY top_10_rankings DESC;
```

#### Example 4: Ranking Movement Analysis
```sql
-- Identify biggest rank improvements this month
WITH current_month AS (
    SELECT keyword, rank AS current_rank
    FROM `nozzledata.workspace_project.rankings`
    WHERE brand_name = 'Your Brand'
        AND search_date = CURRENT_DATE()
),
previous_month AS (
    SELECT keyword, rank AS previous_rank
    FROM `nozzledata.workspace_project.rankings`
    WHERE brand_name = 'Your Brand'
        AND search_date = DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
)
SELECT 
    c.keyword,
    p.previous_rank,
    c.current_rank,
    (p.previous_rank - c.current_rank) AS rank_improvement,
    k.search_volume
FROM current_month c
JOIN previous_month p ON c.keyword = p.keyword
JOIN `nozzledata.workspace_project.latest_keywords_by_keyword_id` k 
    ON c.keyword = k.keyword
WHERE (p.previous_rank - c.current_rank) > 5
ORDER BY rank_improvement DESC;
```

#### Example 5: SERP Feature Prevalence
```sql
-- What SERP features appear most for our keywords?
SELECT 
    CASE 
        WHEN featured_snippet.is_featured_snippet THEN 'Featured Snippet'
        WHEN people_also_ask.is_paa THEN 'People Also Ask'
        WHEN local_pack.is_local_pack THEN 'Local Pack'
        WHEN video_carousel.is_video_carousel THEN 'Video Carousel'
        WHEN image_pack.is_image_pack THEN 'Image Pack'
        WHEN shopping_results.is_shopping THEN 'Shopping Results'
        ELSE 'Standard Organic'
    END AS serp_feature,
    COUNT(*) AS occurrence_count,
    ROUND(AVG(pixels_from_top), 0) AS avg_pixels_from_top,
    ROUND(AVG(above_fold_percentage), 1) AS avg_above_fold_pct
FROM `nozzledata.workspace_project.rankings`
WHERE search_date = CURRENT_DATE()
    AND rank <= 10
GROUP BY serp_feature
ORDER BY occurrence_count DESC;
```

#### Example 6: Pixel Position Impact on Traffic
```sql
-- Correlation between pixel position and estimated traffic
SELECT 
    CASE 
        WHEN pixels_from_top <= 200 THEN '0-200px'
        WHEN pixels_from_top <= 500 THEN '201-500px'
        WHEN pixels_from_top <= 1000 THEN '501-1000px'
        WHEN pixels_from_top <= 1500 THEN '1001-1500px'
        ELSE '1500px+'
    END AS pixel_range,
    COUNT(*) AS keyword_count,
    ROUND(AVG(estimated_traffic), 0) AS avg_estimated_traffic,
    ROUND(AVG(estimated_ctr), 3) AS avg_estimated_ctr
FROM `nozzledata.workspace_project.rankings`
WHERE 
    search_date = CURRENT_DATE()
    AND brand_name = 'Your Brand'
    AND rank <= 10
GROUP BY pixel_range
ORDER BY pixel_range;
```

#### Example 7: Content Performance by Page Type
```sql
-- Which URL patterns perform best?
SELECT 
    CASE 
        WHEN url LIKE '%/blog/%' THEN 'Blog'
        WHEN url LIKE '%/product/%' THEN 'Product'
        WHEN url LIKE '%/guide/%' THEN 'Guide'
        WHEN url LIKE '%/comparison/%' THEN 'Comparison'
        ELSE 'Other'
    END AS page_type,
    COUNT(DISTINCT keyword) AS ranking_keywords,
    COUNT(CASE WHEN rank <= 3 THEN 1 END) AS top_3_count,
    ROUND(AVG(rank), 2) AS avg_rank,
    SUM(estimated_traffic) AS total_estimated_traffic
FROM `nozzledata.workspace_project.rankings`
WHERE 
    search_date = CURRENT_DATE()
    AND brand_name = 'Your Brand'
    AND rank <= 20
GROUP BY page_type
ORDER BY total_estimated_traffic DESC;
```

### Integration with BI Tools

#### Google Looker Studio (Data Studio)

**Setup:**
```
1. Create new Looker Studio report
2. Add data source → BigQuery
3. Select: nozzledata.workspace_project.rankings
4. Build visualizations
```

**Common Visualizations:**
```
Dashboard Components:

1. Scorecard Metrics:
   - Total Keywords Tracked
   - Top 10 Rankings
   - Featured Snippets Owned
   - Average Rank
   - Estimated Monthly Traffic

2. Time Series Chart:
   - Ranking distribution over time
   - Share of Voice trend
   - Featured snippet acquisition

3. Table:
   - Top performing keywords
   - Biggest movers
   - Competitor comparison

4. Geo Map:
   - Rankings by location (if tracking multiple locations)

5. Bar Chart:
   - SERP feature distribution
   - Competitor Share of Voice

6. Scatter Plot:
   - Search Volume vs. Rank
   - Pixel Position vs. Estimated Traffic
```

**Nozzle's PAA Report Template:**
Nozzle provides a pre-built Looker Studio template for People Also Ask analysis:
- All PAA questions across keyword set
- Frequency of PAA appearance
- Which domains appear in PAA
- Content gap identification

#### Tableau Integration

**Connection:**
```
1. Connect to Data → Google BigQuery
2. Authenticate with Google account
3. Select nozzledata project
4. Choose workspace_project dataset
```

**Advanced Tableau Analysis:**
```
Use Case: Executive Dashboard

Sheets:
1. KPI Overview
   - Top 3, Top 10, Top 20 rankings
   - Month-over-month change
   - Featured snippets
   
2. Competitive Landscape
   - Share of Voice comparison
   - Scatter plot: Our rank vs. Competitor rank
   
3. SERP Feature Analysis
   - Feature prevalence
   - Pixel impact visualization
   
4. Opportunity Finder
   - High-volume, mid-rank keywords
   - Featured snippet opportunities
```

#### Power BI

**Setup:**
```
Get Data → More → Online Services → Google BigQuery
Authenticate → Select dataset
Load tables → Create relationships
```

### Data Export Options

#### Export to S3 (AWS)

For teams using AWS infrastructure:

**Setup Process:**
```
1. Create S3 bucket
2. Configure IAM permissions
3. Provide bucket details to Nozzle
4. Nozzle sets up daily export pipeline
```

**File Formats:**
- **Parquet** (recommended): Best compression, full schema
- **Avro**: Good compression, schema included
- **Newline-delimited JSON**: Human readable

**Naming Convention Examples:**
```
Default:
rankings--2024-04-15--your-company-000000000014.parquet

Custom (partitioned):
exports/year=2024/month=04/day=15/rankings-000000000014.parquet
```

**Use Case:**
Data engineering team runs ETL pipelines:
```
Daily Process:
1. Nozzle exports to S3
2. Lambda function triggered on new file
3. Data transformed and loaded to Redshift
4. Integrated with CRM and analytics data
5. Combined attribution modeling
```

### Advanced BigQuery Techniques

#### 1. Historical Ranking Analysis
```sql
-- Track rank changes over 90 days
WITH daily_ranks AS (
    SELECT 
        keyword,
        search_date,
        rank,
        ROW_NUMBER() OVER (
            PARTITION BY keyword 
            ORDER BY search_date
        ) AS day_number
    FROM `nozzledata.workspace_project.rankings`
    WHERE 
        brand_name = 'Your Brand'
        AND search_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
)
SELECT 
    keyword,
    MIN(rank) AS best_rank,
    MAX(rank) AS worst_rank,
    AVG(rank) AS avg_rank,
    STDDEV(rank) AS rank_volatility
FROM daily_ranks
GROUP BY keyword
ORDER BY rank_volatility DESC;

-- High volatility = unstable rankings, need investigation
```

#### 2. SERP Feature Impact Analysis
```sql
-- Compare CTR with and without featured snippets present
SELECT 
    CASE 
        WHEN featured_snippet.is_featured_snippet THEN 'FS Present'
        ELSE 'No FS'
    END AS serp_state,
    rank,
    COUNT(*) AS keyword_count,
    ROUND(AVG(estimated_ctr), 4) AS avg_ctr,
    ROUND(AVG(pixels_from_top), 0) AS avg_pixels
FROM `nozzledata.workspace_project.rankings`
WHERE 
    search_date = CURRENT_DATE()
    AND rank <= 10
GROUP BY serp_state, rank
ORDER BY serp_state, rank;

-- Shows CTR impact of featured snippets at each position
```

#### 3. Competitor Content Gap Analysis
```sql
-- Find keywords competitors rank for but you don't
WITH competitor_keywords AS (
    SELECT DISTINCT keyword
    FROM `nozzledata.workspace_project.rankings`
    WHERE 
        search_date = CURRENT_DATE()
        AND competitor_domain = 'competitor.com'
        AND rank <= 20
),
our_keywords AS (
    SELECT DISTINCT keyword
    FROM `nozzledata.workspace_project.rankings`
    WHERE 
        search_date = CURRENT_DATE()
        AND brand_name = 'Your Brand'
        AND rank <= 100
)
SELECT 
    c.keyword,
    k.search_volume,
    r.rank AS competitor_rank,
    r.url AS competitor_url
FROM competitor_keywords c
LEFT JOIN our_keywords o ON c.keyword = o.keyword
JOIN `nozzledata.workspace_project.rankings` r 
    ON c.keyword = r.keyword 
    AND r.competitor_domain = 'competitor.com'
JOIN `nozzledata.workspace_project.latest_keywords_by_keyword_id` k 
    ON c.keyword = k.keyword
WHERE 
    o.keyword IS NULL
    AND k.search_volume > 500
ORDER BY k.search_volume DESC;

-- Result: High-volume keywords where competitor ranks but you don't
```

---

## API Access

### Overview
Nozzle provides full API access with all plans (no paywall or extra fees).

### Authentication
```bash
# API endpoint
https://api.nozzle.io/v1/

# Authentication header
Authorization: Bearer YOUR_API_KEY

# Get API key from Nozzle dashboard:
Settings → API → Generate Key
```

### Common API Endpoints

#### 1. Get Rankings Data
```bash
GET /v1/rankings

Parameters:
- project_id (required)
- keyword_id (optional)
- date (optional, default: latest)
- device (optional: 'desktop' or 'mobile')
```

**Example Request:**
```bash
curl -X GET "https://api.nozzle.io/v1/rankings?project_id=12345&date=2024-03-15" \
     -H "Authorization: Bearer YOUR_API_KEY"
```

**Example Response:**
```json
{
  "data": [
    {
      "keyword_id": "abc123",
      "keyword": "best crm software",
      "rank": 3,
      "url": "yoursite.com/crm-guide",
      "pixels_from_top": 450,
      "above_fold_percentage": 35.2,
      "estimated_ctr": 0.089,
      "search_volume": 12000,
      "serp_features": {
        "featured_snippet": false,
        "people_also_ask": true,
        "ads_count": 4
      },
      "device": "desktop",
      "date": "2024-03-15"
    }
  ],
  "pagination": {
    "total": 5000,
    "page": 1,
    "per_page": 100
  }
}
```

#### 2. Get Keyword List
```bash
GET /v1/keywords

Parameters:
- project_id (required)
- keyword_group (optional)
```

#### 3. Add Keywords
```bash
POST /v1/keywords

Body:
{
  "project_id": "12345",
  "keywords": [
    {
      "keyword": "new keyword to track",
      "location": "New York, NY",
      "device": "desktop",
      "language": "en"
    }
  ]
}
```

#### 4. Get Competitor Data
```bash
GET /v1/competitors

Parameters:
- project_id
- keyword_id (optional)
- date
```

### API Use Cases

#### Use Case 1: Custom Slack Alerting
```python
import requests
import json

# Configuration
NOZZLE_API_KEY = "your_api_key"
SLACK_WEBHOOK = "your_slack_webhook"
PROJECT_ID = "12345"

def check_rank_drops():
    # Get today's rankings
    response = requests.get(
        f"https://api.nozzle.io/v1/rankings",
        params={"project_id": PROJECT_ID},
        headers={"Authorization": f"Bearer {NOZZLE_API_KEY}"}
    )
    
    rankings = response.json()['data']
    
    # Check for significant drops
    alerts = []
    for ranking in rankings:
        if ranking['rank_change'] < -5:  # Dropped more than 5 positions
            alerts.append({
                "keyword": ranking['keyword'],
                "old_rank": ranking['previous_rank'],
                "new_rank": ranking['rank'],
                "url": ranking['url']
            })
    
    # Send to Slack if alerts exist
    if alerts:
        message = "🚨 Ranking Alerts:\n\n"
        for alert in alerts:
            message += f"• {alert['keyword']}: #{alert['old_rank']} → #{alert['new_rank']}\n"
            message += f"  URL: {alert['url']}\n\n"
        
        requests.post(SLACK_WEBHOOK, json={"text": message})

# Run daily via cron job
check_rank_drops()
```

#### Use Case 2: Automated Report Generation
```python
import requests
from datetime import datetime, timedelta

def generate_monthly_report(project_id, output_file):
    # Date range: Last 30 days
    end_date = datetime.now()
    start_date = end_date - timedelta(days=30)
    
    # Fetch data from Nozzle API
    rankings = requests.get(
        f"https://api.nozzle.io/v1/rankings",
        params={
            "project_id": project_id,
            "start_date": start_date.strftime("%Y-%m-%d"),
            "end_date": end_date.strftime("%Y-%m-%d")
        },
        headers={"Authorization": f"Bearer {NOZZLE_API_KEY}"}
    ).json()
    
    # Calculate metrics
    top_3 = sum(1 for r in rankings if r['rank'] <= 3)
    top_10 = sum(1 for r in rankings if r['rank'] <= 10)
    featured_snippets = sum(1 for r in rankings 
                           if r['serp_features']['featured_snippet'])
    
    # Generate report
    report = f"""
    Monthly SEO Report - {end_date.strftime("%B %Y")}
    
    Key Metrics:
    - Top 3 Rankings: {top_3}
    - Top 10 Rankings: {top_10}
    - Featured Snippets: {featured_snippets}
    
    Top Performing Keywords:
    """
    
    # Add top keywords
    sorted_rankings = sorted(rankings, 
                            key=lambda x: x['estimated_traffic'], 
                            reverse=True)
    for i, ranking in enumerate(sorted_rankings[:10], 1):
        report += f"\n{i}. {ranking['keyword']} (Rank #{ranking['rank']}, Est. Traffic: {ranking['estimated_traffic']})"
    
    # Save report
    with open(output_file, 'w') as f:
        f.write(report)
    
    return report
```

#### Use Case 3: Real-Time Dashboard
```javascript
// Node.js + Express + Socket.io for real-time ranking dashboard

const express = require('express');
const axios = require('axios');
const socketIo = require('socket.io');

const app = express();
const server = require('http').createServer(app);
const io = socketIo(server);

const NOZZLE_API_KEY = process.env.NOZZLE_API_KEY;
const PROJECT_ID = '12345';

// Fetch rankings every 5 minutes
setInterval(async () => {
    const response = await axios.get('https://api.nozzle.io/v1/rankings', {
        params: { project_id: PROJECT_ID },
        headers: { Authorization: `Bearer ${NOZZLE_API_KEY}` }
    });
    
    const rankings = response.data.data;
    
    // Emit to all connected clients
    io.emit('rankings-update', {
        timestamp: new Date(),
        data: rankings
    });
}, 5 * 60 * 1000);

// Client connection
io.on('connection', (socket) => {
    console.log('Client connected to real-time dashboard');
});

server.listen(3000);
```

---

## Comparison with Other Tools

### Nozzle vs. SEMrush

| Feature | Nozzle | SEMrush |
|---------|---------|----------|
| **Focus** | Deep SERP analytics | All-in-one SEO suite |
| **Rank Tracking** | Pixel-level, comprehensive | Standard position tracking |
| **Competitors** | Unlimited, free | Limited, often requires higher tiers |
| **Keywords** | Unlimited (pricing by SERPs) | Tiered limits by plan |
| **SERP Features** | 84+ tracked, detailed | Basic feature tracking |
| **Data Export** | BigQuery, API, CSV | Limited CSV export |
| **Keyword Research** | Not included | Extensive tools |
| **Backlink Analysis** | Not included | Comprehensive |
| **Site Audit** | Not included | Included |
| **Best For** | Technical SEOs, agencies needing deep SERP data | All-in-one SEO needs |

**When to Use Both:**
- SEMrush for keyword research and backlink analysis
- Nozzle for detailed rank tracking and SERP intelligence

---

### Nozzle vs. Ahrefs

| Feature | Nozzle | Ahrefs |
|---------|---------|----------|
| **Rank Tracking** | Enterprise-grade, pixel tracking | Standard rank tracking |
| **Frequency** | 5 min to monthly | Daily standard |
| **Competitors** | Unlimited | Limited per project |
| **SERP Data** | Full HTML, 1000+ fields | Standard metrics |
| **Keyword Research** | Not included | Industry-leading |
| **Content Explorer** | Not included | Excellent |
| **Link Analysis** | Not included | Best-in-class |
| **BigQuery** | Native integration | Not available |
| **Best For** | Rank tracking specialists | Comprehensive SEO toolkit |

---

### Nozzle vs. AccuRanker

| Feature | Nozzle | AccuRanker |
|---------|---------|----------|
| **Pricing Model** | Pay per SERP | Pay per keyword |
| **Long-tail Keywords** | Cost-effective (monthly schedule) | Expensive (all tracked daily) |
| **Pixel Tracking** | Yes, pioneer | No |
| **API** | Included free | Additional cost |
| **Competitor Tracking** | Unlimited | Limited by plan |
| **SERP Feature Analysis** | Comprehensive | Good |
| **Speed** | Fast | Very fast (known for speed) |
| **Best For** | Mixed keyword priorities, enterprise | Fast daily tracking of all keywords |

---

### Nozzle vs. STAT (Moz)

| Feature | Nozzle | STAT |
|---------|---------|----------|
| **Frequency** | 5 min to monthly | Daily only |
| **Pixel Metrics** | Yes | No |
| **Competitor Tracking** | Unlimited, free | Charged per competitor |
| **Historical Data** | Forever | Limited retention |
| **API** | Included | Included |
| **Enterprise Focus** | Yes | Yes |
| **Contract** | Month-to-month | Often annual contract |
| **Best For** | Flexible enterprise needs | Enterprise with daily tracking needs |

---

## Getting Started

### Step 1: Sign Up & Trial
```
1. Visit nozzle.io
2. Click "Start Free Trial"
3. No credit card required for trial
4. 14-day full access
5. Self-serve, no sales call needed
```

### Step 2: Create Your First Project

**Project Setup:**
```
1. Name your project (e.g., "Main Website")
2. Choose workspace (if agency: client name)
3. Set timezone for reporting
4. Configure default settings:
   - Device: Desktop, Mobile, or Both
   - Location: Default search location
   - Language: Default language
```

### Step 3: Set Up Your Brand

**Brand Configuration:**
```
1. Add brand name
2. Define properties:
   - Main domain
   - Subdomains
   - Social profiles
   - YouTube channels
   - Other owned properties

Example:
Brand: "TechCorp"
Properties:
- techcorp.com
- blog.techcorp.com
- @TechCorp (Twitter)
- linkedin.com/company/techcorp
```

### Step 4: Import Keywords

**Import Methods:**

**A. CSV Upload**
```csv
keyword,location,device,language,group
"best project management",United States,desktop,en,commercial
"project management software",United States,desktop,en,commercial
"crm for startups",United States,mobile,en,product
```

**B. Manual Entry**
- Add keywords one-by-one via interface
- Suitable for small initial lists

**C. API Import**
- Programmatic bulk import
- Integrate with keyword research tools

**D. Google Search Console Import**
- Connect GSC account
- Import existing ranking keywords
- Automatic sync

### Step 5: Add Competitors

**Methods:**

**A. Manual Addition**
```
1. Go to Brands section
2. Add Competitor Brand
3. Enter:
   - Competitor name
   - Primary domain
   - Properties to track
```

**B. Auto-Discovery**
```
1. Run initial rankings
2. View Share of Voice dashboard
3. Identify frequent domains
4. Click "Add as Competitor"
5. Historical data automatically backfilled
```

### Step 6: Configure Scheduling

**Scheduling Strategy:**
```
1. Create Keyword Groups:
   - Brand Terms (50 keywords)
   - Commercial (500 keywords)
   - Informational (2,000 keywords)
   - Long-tail (5,000 keywords)

2. Assign Schedules:
   - Brand → Hourly
   - Commercial → Daily
   - Informational → Weekly
   - Long-tail → Monthly

3. Set Active Hours (Optional):
   - Track only during business hours to save costs
   - Example: 6 AM - 10 PM local time
```

### Step 7: Wait for First Data

**Timeline:**
```
Initial Pull: 24-48 hours for first complete dataset
- Nozzle collects rankings
- Processes SERP features
- Builds baseline

Ongoing Updates: Per your schedule
- Hourly keywords: Every hour
- Daily keywords: Once daily (usually overnight)
- Weekly/Monthly: As scheduled
```

### Step 8: Explore Dashboards

**Key Dashboards:**

**A. Overview Dashboard**
- Total keywords tracked
- Rank distribution (top 3, top 10, etc.)
- Featured snippets
- Share of Voice

**B. Share of Voice**
- Your brand vs. competitors
- Filter by position, SERP feature
- View by domain, URL, or brand

**C. Keyword Performance**
- Individual keyword rankings
- Historical trends
- SERP feature presence
- Competitor presence

**D. Nozzle Vision**
- Visual SERP comparisons
- See exactly how SERP looked
- Compare dates side-by-side
- Overlay metrics on visual

### Step 9: Set Up Alerts (Optional)

**Recommended Alerts:**
```
1. Rank Drop Alert
   - Trigger: Any keyword drops >5 positions
   - Frequency: Daily
   - Recipients: SEO team

2. Featured Snippet Loss
   - Trigger: Lost any featured snippet
   - Frequency: Immediate
   - Recipients: Content team

3. Competitor Movement
   - Trigger: Competitor enters top 3 on brand terms
   - Frequency: Hourly
   - Recipients: Management

4. New Top 10 Rankings
   - Trigger: New keyword reaches top 10
   - Frequency: Weekly summary
   - Recipients: Team + stakeholders
```

### Step 10: Request BigQuery Access (Optional)

**For Advanced Users:**
```
1. Email Nozzle support or use in-app chat
2. Provide:
   - Google email address
   - Workspace slug
   - Project slug
   - Use case (helps them assist)

3. Access granted within 24 hours

4. Begin querying via BigQuery console or BI tools
```

---

## Pricing Model

### Pricing Philosophy
Nozzle charges based on **SERPs pulled**, not keywords tracked.

**What's a SERP pull?**
```
1 SERP = 1 keyword search at specific:
- Location
- Device (desktop or mobile)
- Date/time
```

### Pricing Structure (Example)

**Note:** Actual pricing varies. Contact Nozzle for current rates.

**Tier Structure:**
```
Starter: $X/month
- X SERPs/month
- All features included
- Unlimited users
- API access
- BigQuery access

Professional: $X/month
- X SERPs/month
- All features
- Priority support

Enterprise: Custom pricing
- Millions of SERPs/month
- Dedicated support
- Custom integrations
- SLA guarantees
```

### Cost Calculation Examples

#### Example 1: Small Business
```
Keywords: 500
Schedule: Daily (all keywords)
Devices: Desktop only

Monthly SERPs:
500 keywords × 30 days × 1 device = 15,000 SERPs

Estimated Cost: ~$X/month (Starter tier)
```

#### Example 2: Mid-Size Company
```
Keywords: 5,000
Schedule:
- 100 keywords hourly (brand terms)
- 1,500 keywords daily (commercial)
- 3,400 keywords weekly (informational)

Monthly SERPs:
- Hourly: 100 × 24 × 30 = 72,000
- Daily: 1,500 × 30 = 45,000
- Weekly: 3,400 × 4.3 = 14,620
Total: 131,620 SERPs

Estimated Cost: ~$X/month (Professional tier)
```

#### Example 3: Enterprise Agency
```
Clients: 50
Avg keywords per client: 5,000
Total keywords: 250,000

Schedule: Mixed (mostly daily + weekly)
Avg 1.2 pulls per keyword per month

Monthly SERPs:
250,000 × 1.2 = 300,000 SERPs

Estimated Cost: ~$X/month (Enterprise tier)
Cost per client: ~$X/month
```

### Cost Optimization Strategies

**1. Strategic Scheduling**
```
Don't track all keywords daily if not needed:
- Brand terms: Hourly/Daily (high priority)
- Commercial terms: Daily (medium priority)
- Long-tail: Weekly or Monthly (low priority)

Savings: Up to 60% vs. tracking everything daily
```

**2. Device Prioritization**
```
Track desktop only unless mobile-specific insights needed:
- B2B: Often desktop-focused
- Local: Mobile critical
- E-commerce: Both devices important

Savings: 50% if tracking one device vs. both
```

**3. Location Consolidation**
```
Track most impactful locations:
- National: Track country-level, not city-level
- Local: Track specific cities only
- International: Priority markets first

Avoid: Tracking 50 cities when 5 cover 80% of business
```

**4. Keyword Pruning**
```
Quarterly review:
- Remove zero-search keywords
- Consolidate similar keywords
- Deprioritize low-value terms to monthly

Example: Reduced 10,000 keywords to 6,000 active
Savings: 40% ongoing
```

---

## Best Practices

### 1. Keyword Organization

**Hierarchical Structure:**
```
Project: Main Website
└── Keyword Groups:
    ├── 1. Brand Terms
    │   ├── Exact brand name
    │   ├── Brand + product
    │   └── Brand variations
    ├── 2. Commercial Intent
    │   ├── "Best [product]"
    │   ├── "[Product] comparison"
    │   ├── "Buy [product]"
    │   └── "[Product] pricing"
    ├── 3. Informational
    │   ├── "How to [action]"
    │   ├── "What is [concept]"
    │   └── "[Topic] guide"
    ├── 4. Product Categories
    │   ├── Category A keywords
    │   ├── Category B keywords
    │   └── Category C keywords
    └── 5. Long-tail
        └── Specific, low-volume queries
```

**Benefits:**
- Easier filtering in dashboards
- Segment-based analysis
- Custom scheduling per group
- Cleaner reporting

### 2. Competitor Management

**Best Practices:**
```
✅ DO:
- Add 5-10 main competitors as named competitors
- Use Share of Voice dashboard to discover unknown competitors
- Backfill historical data when adding new competitors
- Track competitor's entire property portfolio (not just main domain)
- Set alerts for competitor movements on your brand terms

❌ DON'T:
- Add 50+ competitors (makes dashboards cluttered)
- Only track competitor's homepage (track their best pages)
- Forget to update competitor list quarterly
- Ignore competitor featured snippet gains
```

### 3. Segment Creation

**Effective Segments:**
```
1. "Quick Wins" Segment
   Filter:
   - Rank: 4-10
   - Search Volume: >500
   - Trend: Stable or improving
   Use: Priority content optimization

2. "SERP Feature Opportunities"
   Filter:
   - Featured Snippet present on SERP
   - My rank: 1-5
   - Not owning the snippet
   Use: Snippet acquisition targets

3. "Competitor Vulnerability"
   Filter:
   - Competitor ranking 1-3
   - Above Fold % < 30%
   - SERP has multiple ads
   Use: Easier displacement opportunities

4. "Content Refresh Needed"
   Filter:
   - Rank declined >5 positions (vs. 90 days ago)
   - Previously in top 10
   Use: Content update priorities
```

### 4. Regular Monitoring Cadence

**Daily:**
- Check alerts (rank drops, competitor movements)
- Review top-priority keywords (brand terms, commercial)
- Scan for SERP changes on key terms

**Weekly:**
- Review Share of Voice trends
- Analyze new top 10 rankings
- Check competitor activity
- Review SERP feature changes

**Monthly:**
- Full ranking report
- Competitor analysis deep dive
- Content gap analysis
- Strategy adjustments
- Stakeholder reporting

**Quarterly:**
- Keyword portfolio review
- Competitor landscape assessment
- Add/remove competitors
- Adjust tracking frequencies
- Budget optimization

### 5. Data Hygiene

**Regular Maintenance:**
```
Monthly:
- Remove keywords with 0 search volume
- Consolidate duplicate keywords
- Update keyword groups as site evolves
- Archive old campaigns

Quarterly:
- Review and update brand properties
- Add new company properties (new blog, social accounts)
- Update competitor list
- Adjust scheduling based on budget/needs

Annually:
- Full keyword audit
- Evaluate all tracking locations
- Assess device tracking needs
- Review overall tracking strategy
```

### 6. BigQuery Optimization

**Query Best Practices:**
```sql
-- ✅ GOOD: Use date partitions
SELECT keyword, rank
FROM `nozzledata.workspace_project.rankings`
WHERE search_date = CURRENT_DATE()  -- Partition filter
  AND brand_name = 'Your Brand'

-- ❌ BAD: Scan entire table
SELECT keyword, rank
FROM `nozzledata.workspace_project.rankings`
WHERE brand_name = 'Your Brand'  -- No date filter = expensive

-- ✅ GOOD: Limit results
SELECT keyword, rank
FROM `nozzledata.workspace_project.rankings`
WHERE search_date = CURRENT_DATE()
LIMIT 1000

-- ✅ GOOD: Aggregate before exporting
SELECT 
    keyword,
    AVG(rank) as avg_rank,
    MIN(rank) as best_rank
FROM `nozzledata.workspace_project.rankings`
WHERE search_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY keyword
```

### 7. Alert Configuration

**Effective Alerting:**
```
Smart Alert Setup:

1. Use thresholds that matter
   ❌ Bad: Alert on any 1-position change
   ✅ Good: Alert on 5+ position drops for high-value keywords

2. Segment your alerts
   ❌ Bad: One alert for all 10,000 keywords
   ✅ Good: Separate alerts for brand, commercial, informational

3. Right frequency
   ❌ Bad: Hourly alerts for all keywords (alert fatigue)
   ✅ Good: 
      - Hourly: Brand terms only
      - Daily: Commercial terms
      - Weekly: Summary for long-tail

4. Right recipients
   ❌ Bad: Send all alerts to everyone
   ✅ Good: 
      - Brand drops → Management
      - Commercial drops → SEO team
      - Technical issues → Dev team
      - Weekly summary → All stakeholders
```

### 8. Reporting Standards

**Effective Reporting:**
```
Executive Report (Monthly):
1. Executive Summary (1 slide)
   - Overall performance vs. goals
   - Key wins and challenges
   - Next month's focus

2. Core Metrics (1 slide)
   - Top 3, Top 10 rankings trend
   - Share of Voice vs. competitors
   - Featured snippets owned
   - Estimated traffic impact

3. Notable Changes (1 slide)
   - Biggest gains
   - Concerning losses
   - New opportunities

4. Competitive Landscape (1 slide)
   - Market position
   - Competitor movements
   - Strategic implications

5. Action Plan (1 slide)
   - Next month's priorities
   - Resource needs
   - Expected outcomes

Total: 5 slides, 10-minute presentation
```

**Technical Report (Weekly, for SEO team):**
```
1. Ranking Changes
   - New top 10 entries
   - Dropped rankings (>5 positions)
   - Featured snippet changes

2. SERP Analysis
   - New SERP features detected
   - Pixel position impacts
   - Algorithm update signals

3. Competitor Activity
   - Competitor content launches
   - Their SERP feature wins
   - Aggressive movements

4. Action Items
   - Content updates needed
   - Link building priorities
   - Technical fixes

5. Experiments & Tests
   - Ongoing test results
   - New test proposals
```

---

## Advanced Techniques

### Technique 1: SERP Volatility Detection

**Use Case:** Detect algorithm updates before announcements

**Method:**
```sql
-- Calculate daily average rank changes across all keywords
WITH daily_changes AS (
    SELECT 
        search_date,
        AVG(ABS(rank - LAG(rank) OVER (
            PARTITION BY keyword 
            ORDER BY search_date
        ))) AS avg_rank_change
    FROM `nozzledata.workspace_project.rankings`
    WHERE search_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
    GROUP BY search_date
)
SELECT 
    search_date,
    avg_rank_change,
    CASE 
        WHEN avg_rank_change > (AVG(avg_rank_change) OVER() + 2 * STDDEV(avg_rank_change) OVER())
        THEN 'HIGH VOLATILITY - Possible Algorithm Update'
        ELSE 'Normal'
    END AS volatility_signal
FROM daily_changes
ORDER BY search_date DESC;
```

**Alert Threshold:** 
- Avg change > 2 standard deviations = Likely algorithm update
- Immediate investigation warranted

### Technique 2: Content Decay Detection

**Use Case:** Identify content losing rankings that needs refresh

**Method:**
```sql
-- Find pages with consistent ranking decline
WITH rank_trends AS (
    SELECT 
        url,
        keyword,
        search_date,
        rank,
        AVG(rank) OVER (
            PARTITION BY url, keyword 
            ORDER BY search_date 
            ROWS BETWEEN 7 PRECEDING AND CURRENT ROW
        ) AS rank_7day_avg
    FROM `nozzledata.workspace_project.rankings`
    WHERE brand_name = 'Your Brand'
        AND search_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
)
SELECT 
    url,
    COUNT(DISTINCT keyword) AS declining_keywords,
    AVG(rank - rank_7day_avg) AS avg_decline_rate
FROM rank_trends
WHERE rank > rank_7day_avg
GROUP BY url
HAVING declining_keywords > 5 AND avg_decline_rate > 2
ORDER BY declining_keywords DESC;
```

**Action:** Content refresh priorities identified

### Technique 3: SERP Feature Correlation Analysis

**Use Case:** Understand which SERP features impact CTR most

**Method:**
```sql
-- Compare estimated CTR by SERP feature presence
SELECT 
    featured_snippet.is_featured_snippet AS has_featured_snippet,
    people_also_ask.is_paa AS has_paa,
    local_pack.is_local_pack AS has_local_pack,
    ROUND(AVG(estimated_ctr), 4) AS avg_ctr,
    COUNT(*) AS occurrences
FROM `nozzledata.workspace_project.rankings`
WHERE search_date = CURRENT_DATE()
    AND rank <= 5
GROUP BY has_featured_snippet, has_paa, has_local_pack
ORDER BY avg_ctr DESC;
```

**Insights:** 
- Quantify CTR impact of each SERP feature
- Prioritize optimization efforts

---

## Conclusion

Nozzle is the most comprehensive SERP analytics and rank tracking platform available, designed for technical SEOs, agencies, and enterprises who need deep insights beyond basic position tracking.

### Key Takeaways

**When Nozzle Excels:**
✅ Need pixel-level position tracking
✅ Tracking hundreds to millions of keywords
✅ Require unlimited competitor monitoring
✅ Want complete historical SERP data
✅ Need flexible tracking schedules (5 min to monthly)
✅ Integrate SEO data with BI tools (BigQuery)
✅ Agency managing multiple clients
✅ Data-driven SEO approach

**When to Consider Alternatives:**
❌ Need all-in-one SEO suite (keyword research, backlinks, etc.)
❌ Very small keyword list (<100) with simple needs
❌ Limited technical expertise (though Nozzle is getting more user-friendly)
❌ Only need basic rank tracking

### Next Steps

1. **Start Free Trial:** [nozzle.io](https://nozzle.io)
2. **Join Community:** Nozzle has active user community for tips and best practices
3. **Watch Tutorials:** Check Nozzle's YouTube channel for feature guides
4. **Connect Support:** In-app chat for setup assistance

---

## Additional Resources

### Official Documentation
- Help Center: https://help.nozzle.io
- API Documentation: https://api.nozzle.io/docs
- BigQuery Samples: https://help.nozzle.io/sample-bigquery-queries
- Blog: https://nozzle.io/blog

### Community & Support
- Support Email: support@nozzle.io
- In-app Chat: Available 24/7
- Twitter: @NozzleIO
- LinkedIn: Nozzle (company page)

### Recommended Integrations
- Google BigQuery: Data warehouse
- Looker Studio: Dashboards and reporting
- Tableau: Advanced visualization
- Slack: Alerting integration
- Python/R: Data science workflows

---

**Document Version:** 1.0  
**Last Updated:** November 2025  
**Author:** SEO Documentation Specialist  
**For:** Advanced SEO professionals and agencies

---

## Appendix: Common Questions

**Q: How long does it take to see first rankings?**
A: 24-48 hours for initial data collection after keyword setup.

**Q: Can I track local rankings for multiple locations?**
A: Yes, specify location per keyword. Track down to zip code level.

**Q: Does Nozzle work for non-Google search engines?**
A: Primarily Google (desktop/mobile). Some Bing support, check with Nozzle.

**Q: How far back does historical data go?**
A: From your project start date. New competitors get backfilled to project start.

**Q: Can I pause keyword tracking?**
A: Yes, archive keywords to stop tracking without deleting.

**Q: Is there a limit on users?**
A: No, unlimited users on all plans.

**Q: Can I export all my data?**
A: Yes, via BigQuery, API, or CSV. All data always accessible.

**Q: Does Nozzle offer white-label reporting?**
A: Limited white-labeling. Best approach: Export to your own BI tool for full branding.

**Q: How accurate is the estimated traffic?**
A: Estimates based on search volume, rank, CTR curves, SERP features. Generally within 20-30% of actual for well-tracked sites.

**Q: Can Nozzle track YouTube rankings?**
A: Yes, for YouTube search results. Not for YouTube's internal search (different SERPs).

---

*End of Document*