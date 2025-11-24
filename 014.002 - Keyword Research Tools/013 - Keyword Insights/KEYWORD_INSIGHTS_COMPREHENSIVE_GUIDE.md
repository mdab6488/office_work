# Keyword Insights - Comprehensive Technical Guide

## Table of Contents
1. [Overview](#overview)
2. [Core Technology & Architecture](#core-technology--architecture)
3. [Feature Breakdown](#feature-breakdown)
4. [Technical Specifications](#technical-specifications)
5. [Workflow & Implementation](#workflow--implementation)
6. [Real-Life Examples](#real-life-examples)
7. [Pricing Structure](#pricing-structure)
8. [API Integration](#api-integration)
9. [Advanced Use Cases](#advanced-use-cases)
10. [Best Practices](#best-practices)

---

## Overview

**Keyword Insights** is an AI-powered topical SEO platform built specifically for establishing and maintaining topical authority. Unlike traditional keyword research tools that rely on outdated databases, Keyword Insights uses live SERP data, machine learning algorithms, and real-time sources to power keyword research, clustering, intent analysis, content brief generation, and AI-assisted writing.

### Key Differentiators
- **Live SERP-based clustering** (not NLP-based)
- **Real-time data sources** (Google Autocomplete, Reddit, Quora, PAA)
- **Information Gain ML model** for unique content angles
- **Up to 200,000 keywords** processable in single clustering operation
- **Integrated workflow** from discovery to published content

### Primary Use Cases
- SEO content strategy at scale
- Topical authority building
- Content gap analysis
- Keyword cannibalization prevention
- SERP intent mapping
- Competitive content analysis

---

## Core Technology & Architecture

### 1. SERP-Based Clustering Algorithm

**Technical Foundation:**
- Analyzes top 7-10 ranking URLs for each keyword
- Uses URL overlap percentage (default: 40%+) to determine clustering
- Supports two primary algorithms:
  - **Volume-based Clustering**: Groups by search volume + SERP overlap
  - **HUB Algorithm**: Creates hierarchical topic clusters

**How It Works:**
```
1. Input: List of keywords
2. SERP Scraping: Fetches top 10 results per keyword (geo-specific)
3. URL Comparison: Calculates overlap percentage between keyword pairs
4. Cluster Formation: Groups keywords with ≥40% URL overlap (adjustable)
5. Intent Classification: ML model assigns intent to each cluster
6. Output: Organized clusters with recommended lead keywords
```

**Configurable Parameters:**
- **Location**: City or country-level SERP targeting
- **Language**: All languages supported
- **Device**: Desktop, mobile (Android/iOS), tablet
- **Grouping Accuracy**: 1-10 scale (4 default = 40% overlap)
- **HUB Creation Method**: Low/Medium/High similarity strength

### 2. Search Intent Classification

**AI Model Capabilities:**
- Classifies keywords into: Informational, Commercial, Transactional, Navigational
- Operates at both keyword and cluster level
- Dominant intent determined by majority within cluster
- Helps filter irrelevant pages from brief generation

**Intent Detection Workflow:**
```
Keyword → SERP Analysis → Page Type Classification → Intent Assignment
```

### 3. Information Gain Machine Learning Model

**Purpose:** Identify unique angles and fresh perspectives that competitors miss

**Implementation:**
- Analyzes top 20 ranking pages
- Compares common vs. uncommon content elements
- Suggests novel headings, questions, and topics
- Helps content pass Google's "information gain" filter

---

## Feature Breakdown

### Feature 1: Keyword Discovery

**Data Sources:**
- Google Keyword Planner (5+ billion keywords)
- Google Autocomplete (real-time suggestions)
- Reddit discussions
- Quora questions
- People Also Ask (PAA)
- Search Console API (bypasses 1,000 keyword limit)

**Discovery Methods:**

#### A. Keyword-Based Discovery
Start with seed keyword → Generate related terms

**Real-Life Example:**
```
Seed: "calculator"
Output: 5,000+ keywords including:
- mortgage calculator
- loan calculator
- bmi calculator
- pregnancy calculator
- calorie calculator
etc.
```

#### B. Domain-Based Discovery
Analyze competitor domains → Extract ranking keywords

**Real-Life Example:**
```
Domain: competitor-calculator-site.com
Output: All keywords competitor ranks for with:
- Search volume
- Current ranking position
- CPC data
- Keyword difficulty
```

#### C. Search Console Integration
Direct API connection → Pull ALL ranking keywords (not limited to 1,000)

**Technical Implementation:**
```
1. Connect GSC account via OAuth
2. Select property
3. API fetches complete keyword list with:
   - Impressions
   - Clicks
   - CTR
   - Average position
   - Trend data
```

#### D. AI Smart Filter

**Most Powerful Feature for Keyword Discovery**

Allows natural language filtering:
```
Examples:
- "Show me keywords about mortgage calculations but exclude refinancing"
- "Find calculator keywords with commercial intent over 1000 volume"
- "Keywords related to fitness calculators for women"
```

**Real-Life Application:**
```
Scenario: Building calculator website
Smart Filter Query: "Show me all calculator keywords for health 
and fitness excluding BMI and calorie calculators that I already 
have, with volume over 500"

Result: Filtered list of 200+ relevant keywords like:
- body fat percentage calculator
- ideal weight calculator
- protein intake calculator
- tdee calculator
- macro calculator
```

### Feature 2: Keyword Clustering

**Processing Capacity:**
- Up to 200,000 keywords per project
- Live, geo-specific SERP data
- Country and city-level targeting
- All languages supported

**Clustering Outputs:**

#### Standard Cluster Report Includes:
- **Cluster ID**: Unique identifier
- **Keywords in Cluster**: All grouped terms
- **Lead Keyword**: Best keyword for targeting (highlighted green)
- **Search Volume**: Aggregated across cluster
- **Dominant Intent**: Informational/Commercial/Transactional
- **Keyword Difficulty**: Average across cluster
- **Current Rankings**: Your domain's position (if provided)
- **Ranking URL**: Page currently ranking
- **SERP Features**: Featured snippets, PAA, local packs, etc.
- **Potential Traffic**: Estimated monthly visitors

**Real-Life Example 1: Calculator Website**

```
INPUT:
3,000 calculator-related keywords uploaded

CLUSTERING SETTINGS:
- Location: United States
- Language: English
- Device: Desktop
- Grouping Accuracy: 4 (40% overlap)
- Get Rankings: yes (domain: mysite.com)

OUTPUT:
87 keyword clusters formed

Sample Cluster #23:
Lead Keyword: "mortgage calculator with extra payments"
Keywords (12): 
  - mortgage calculator extra payments
  - mortgage payoff calculator with additional payments
  - home loan calculator with extra principal
  - early mortgage payoff calculator
  - mortgage overpayment calculator
  [7 more...]
  
Total Volume: 8,900/month
Dominant Intent: Transactional
Avg. Difficulty: 28 (Easy)
Current Ranking: Not ranking
SERP Features: Calculator widget, PAA

Action: Create dedicated mortgage calculator page with 
        extra payment features
```

**Real-Life Example 2: Content Gap Analysis**

```
Scenario: You have an established finance blog

Process:
1. Cluster 5,000 finance keywords
2. Enable "Get Rankings" for your domain
3. Filter clusters showing "Not Ranking" or "Ranking >50"

Result:
Found 34 clusters where you have ZERO presence:
- Cluster #12: "investment calculator" (12 keywords, 15k vol/month)
- Cluster #18: "compound interest calculator" (8 keywords, 9k vol/month)
- Cluster #29: "dividend calculator" (6 keywords, 4.5k vol/month)

These are your content gaps → Create 34 new pages
```

#### Topical Clusters

**Advanced Feature:** Groups related clusters into broader topics

**Example Structure:**
```
TOPIC: Personal Finance Calculators
├── Cluster 1: Mortgage Calculators (23 keywords)
├── Cluster 2: Loan Calculators (18 keywords)
├── Cluster 3: Debt Payoff Calculators (15 keywords)
└── Cluster 4: Affordability Calculators (12 keywords)

TOPIC: Investment Calculators
├── Cluster 5: ROI Calculators (19 keywords)
├── Cluster 6: Compound Interest (14 keywords)
└── Cluster 7: Retirement Calculators (22 keywords)
```

**Use Case:** Build pillar pages around topics, supporting pages for clusters

#### Keyword Cluster Fragmentation

**Common Issue:** Sometimes 2+ clusters appear separate but target same intent

**Example:**
```
Cluster A: "skateboard wheel" (singular)
└── Technical specs, materials, sizes

Cluster B: "skateboard wheels" (plural)  
└── Shopping, best wheels, buying guide

Solution: Review SERP similarity manually → Decide if one page or two needed
```

### Feature 3: Search Intent (Context) Analysis

**Standalone Feature:** Can be run without clustering

**Use Cases:**
- Verify intent before content creation
- Audit existing content for intent mismatch
- Bulk intent classification for large keyword lists

**Real-Life Example:**
```
INPUT: 1,000 keywords for calculator website

OUTPUT:
- 620 Transactional (calculator tools)
- 280 Informational (how to calculate X)
- 100 Commercial (best calculator apps)

Strategy Decision:
- Build 620 calculator tool pages
- Write 280 how-to guides
- Create 100 comparison/review pages
```

### Feature 4: Content Brief Generator

**Data Sources for Brief Creation:**
- Top 20 ranking pages (full content analysis)
- Reddit discussions
- Quora questions
- People Also Ask
- Related searches
- Information Gain model for unique angles

**Brief Components:**

#### 1. Headings Analysis
```
Shows frequency of headings across top 20 results:

"What is a mortgage calculator?" - 18/20 pages
"How to use a mortgage calculator" - 16/20 pages
"Types of mortgages" - 12/20 pages
"Additional payment strategies" - 8/20 pages
"Benefits of extra payments" - 15/20 pages

→ Drag and drop to build outline
```

#### 2. Questions to Answer
```
From PAA, Reddit, Quora:

Q: "Should I make biweekly or monthly extra payments?"
Q: "How much can I save with extra principal payments?"
Q: "What's the best mortgage payoff strategy?"
Q: "Will extra payments reduce my interest?"

→ Add relevant questions to brief
```

#### 3. Entities & Topics
```
Key entities to cover:
- Principal
- Interest rate
- Amortization
- Loan term
- Extra payment
- Payoff date

Related topics:
- Tax implications
- Prepayment penalties
- Refinancing alternatives
```

#### 4. Information Gain Suggestions
```
Unique angles competitors lack:

✓ "Real-life case study: $300/month extra payment impact"
✓ "Mortgage calculator comparison across 3 major banks"
✓ "Hidden fees when making extra payments"
✓ "Mobile app integration for payment tracking"

→ These differentiate your content
```

#### 5. Metadata Generation
```
Title (AI-generated): "Mortgage Calculator with Extra Payments 
| Free Tool 2025"

Meta Description: "Calculate mortgage payoff with additional 
payments. See how extra principal reduces interest and shortens 
loan term. Free tool with amortization schedule."

Slug: /mortgage-calculator-extra-payments
```

**Real-Life Workflow:**
```
1. Select cluster from clustering project
2. Click "Create Brief" for lead keyword
3. Review 20 ranking pages data
4. Filter out transactional/irrelevant pages
5. Drag desired headings to outline
6. Add unique questions from Reddit/Quora
7. Apply Information Gain suggestions
8. Generate metadata
9. Export to Google Docs or download as Word file
10. Send to AI Writer Assistant (or use manually)
```

**Credit Cost:** Up to 100 credits per brief

### Feature 5: AI Writer Assistant

**Collaboration Model:** Human + AI (not full automation)

**Interface Tabs:**

#### Tab 1: Research
- All data from Content Brief
- Headings ranked by frequency
- Questions from multiple sources
- Topics and entities to cover
- One-click import to outline

#### Tab 2: Write
**Available AI Functions:**
- Paragraph generation
- Introduction writing
- Bullet point creation
- Pros and cons lists
- FAQs generation
- Call-to-action writing
- Tone adjustment (conversational, formal, technical)
- Sentence rewriting
- Expansion or summarization
- AI Chat assistant (ChatGPT-like interface)

**Real-Life Usage:**
```
Scenario: Writing mortgage calculator guide

1. Import outline from Research tab
2. AI generates introduction: 200 words
3. Write H2 section manually
4. Highlight paragraph → Ask AI to "expand with example"
5. AI adds case study
6. Generate FAQ section with AI
7. Manually edit for brand voice
8. AI suggests metadata optimization
```

#### Tab 3: Optimize

**Optimization Metrics:**
1. **Word Count**: Compare vs. top rankers
2. **Spelling & Grammar**: Error detection
3. **Readability Score**: Flesch reading ease
4. **Topical Coverage**: Missing entities/topics
5. **Keyword Usage**: Frequency vs. competitors
6. **AI Detection Score**: Flags overly robotic text
7. **Heading Structure**: H2/H3 hierarchy check
8. **Image Recommendations**: Suggested visual count

**Real-Time Grading:**
```
Content Grade: 78/100

Issues Found:
❌ Missing 3 key topics: "prepayment penalties", 
   "biweekly payments", "tax deductions"
❌ 35% content detected as AI (rewrite highlighted sections)
❌ Only 1,200 words (competitors average 2,800)
✓ Readability: Good (Grade 9)
✓ Keyword density: Optimal
⚠️ Add 2-3 more images

Recommendations: 
- Add section on prepayment penalties (150-200 words)
- Include biweekly payment strategy
- Humanize paragraphs marked in yellow
```

**Import Existing Content:**
Upload your current page → Get optimization suggestions

### Feature 6: AI Writer Agent

**Difference from Writer Assistant:**
- **Assistant**: Collaborative, step-by-step, full control
- **Agent**: Autonomous, end-to-end, hands-off

**Agent Workflow:**
```
1. Input: Single keyword or cluster lead keyword
2. Agent Actions (Automatic):
   a. Deep SERP research (top 20 pages)
   b. Reddit/Quora/news research
   c. Identifies content gaps
   d. Creates detailed outline
   e. Writes full draft (intro to CTA)
   f. Optimizes for entities and topics
   g. Generates metadata
   
3. Output: Publish-ready article (2,000-3,500 words typically)
```

**Customization Options:**
- Tone of voice (conversational, formal, friendly, technical)
- POV (first person, second person, third person)
- Language (multiple languages supported)
- Distinctiveness (how unique vs. competitors)
- Personal insights upload (add your expertise/data)

**Real-Life Example:**
```
Input: "pregnancy due date calculator"

Agent Process (autonomous):
1. Analyzes top 20 ranking calculator pages
2. Finds gaps: 
   - Most lack trimester-specific information
   - Few explain calculation method
   - Missing complications considerations
3. Researches Reddit pregnancy forums
4. Pulls data from medical sources
5. Writes 2,800-word article including:
   - Introduction (200 words)
   - How pregnancy dating works (400 words)
   - Trimester breakdown (600 words)
   - Common calculation methods (500 words)
   - Accuracy considerations (400 words)
   - FAQ (300 words)
   - Calculator embed instructions (200 words)
   - CTA (200 words)
6. Optimizes for 45 relevant entities
7. Generates metadata

Time: 3-5 minutes
Result: 85% publish-ready (needs minor human editing)
```

**When to Use Agent vs. Assistant:**
- **Agent**: Scale content production (10+ articles), time-constrained, need drafts fast
- **Assistant**: High-value content, brand-specific voice, need full control

### Feature 7: SERP Tools Suite

#### A. SERP Explorer
**Function:** View search results from any location without VPN

**Use Cases:**
```
- Check local SEO results
- Verify international rankings
- Analyze geo-specific competition
- Preview SERP features by location

Example:
Search "calculator" from:
- New York, NY → See local results
- London, UK → Different ranking pages
- Mumbai, India → Entirely different SERP
```

#### B. SERP Similarity Tool
**Function:** Compare URL overlap between 2-3 keywords

**Real-Life Application:**
```
Question: Should "mortgage calculator" and "home loan calculator" 
target same page or different pages?

Analysis:
SERP Similarity Score: 8/10 URLs match
→ Target on same page

vs.

"mortgage calculator" vs "mortgage insurance calculator"
SERP Similarity Score: 2/10 URLs match
→ Create separate pages
```

**Decision Matrix:**
- 7-10 shared URLs → Same page
- 4-6 shared URLs → Consider same page (depends on intent)
- 0-3 shared URLs → Separate pages

#### C. URL Grouper
**Function:** Group URLs by engagement metrics

**Data Sources:**
- Google Search Console clicks
- Impressions
- CTR
- Average position

**Use Case:**
```
Upload 500 blog URLs → Group by:
- High performers (top 10% clicks)
- Underperformers (low CTR despite impressions)
- Opportunity keywords (high impressions, low clicks)

Action Plan:
- Expand high performer topics
- Optimize underperformer metadata
- Improve opportunity page content
```

#### D. Keyword Distill
**Function:** Reverse-engineer competitor keyword strategy

**Process:**
```
1. Enter competitor domain
2. Tool scrapes their ranking keywords
3. Filters by volume/difficulty
4. Shows keywords you DON'T rank for
5. Identifies their content gaps vs. yours

Example Output:
Competitor ranks for 1,240 keywords you don't:
- 340 calculator-related (opportunity!)
- 280 how-to guides
- 190 comparison keywords
- 430 long-tail variations
```

### Feature 8: Team Collaboration

**Capabilities:**
- Multiple user seats
- Role-based permissions (admin, editor, viewer)
- Share clusters, briefs, and reports
- White label reporting (enterprise)
- Project organization
- Comment and feedback system

**Workflow Example:**
```
Team Structure:
- SEO Manager: Full access, creates clusters
- Content Strategist: Creates briefs, assigns writers
- Writers (3): Access assigned briefs, use AI Writer
- Editor: Reviews, optimizes content

Process:
1. Manager clusters 5,000 keywords → 120 clusters
2. Strategist creates 20 briefs from top priority clusters
3. Assigns 7 briefs each to writers via platform
4. Writers produce content in AI Writer
5. Editor reviews in Optimize tab
6. Manager tracks completion in project dashboard
```

---

## Technical Specifications

### System Requirements
- **Browser**: Chrome, Firefox, Safari, Edge (latest versions)
- **Internet**: Stable connection required (cloud-based)
- **No downloads**: 100% web-based platform

### Processing Limits

| Feature | Free/Trial | Paid Plans |
|---------|-----------|------------|
| Keyword Discovery | 3 searches | Unlimited |
| Clustering | Up to 200k keywords | Up to 200k keywords |
| Content Briefs | 1 | Based on credits |
| AI Writer | Limited | Based on credits |
| SERP Lookups | Limited | Based on credits |

### Data Privacy
- SOC 2 compliant
- GDPR compliant
- UK-based company (Snippet Digital Ltd)
- Data encrypted in transit and at rest

### API Access

**Authentication:**
```python
import os
import requests
from urllib.parse import urljoin

JWT_TOKEN = os.environ.get("JWT_TOKEN")
BASE_API = "https://api.keywordinsights.ai"

headers = {"Authorization": f"Bearer {JWT_TOKEN}"}
```

**Create Clustering Order:**
```python
payload = {
    "clustering_method": "volume",
    "device": "desktop",
    "grouping_accuracy": 4,
    "hub_creation_method": "medium",
    "insights": ["cluster", "context", "rank"],
    "keywords": ["keyword1", "keyword2", "keyword3"],
    "language": "en",
    "location": "United States",
    "project_name": "API Project",
    "search_volumes": [1000, 500, 300],
    "url": "yourdomain.com"  # For ranking data
}

response = requests.post(
    urljoin(BASE_API, "/api/keywords-insights/order/"),
    headers=headers,
    json=payload
)

order_id = response.json()["order_id"]
```

**Retrieve Results:**
```python
response = requests.get(
    urljoin(BASE_API, f"/api/keywords-insights/order/json/{order_id}/"),
    headers=headers
)

clusters = response.json()
```

**Query Parameters:**
- `page_size`: Results per page (max 50)
- `page_number`: Page to retrieve
- `sort_by`: `search_volume`, `keyword`, `cluster_id`
- `ascending`: `true` or `false`

---

## Workflow & Implementation

### Workflow 1: New Website Content Strategy

**Scenario:** Launching new calculator website from scratch

**Step-by-Step:**

```
1. KEYWORD DISCOVERY (Day 1)
   Input: "calculator" (seed keyword)
   Method: Keyword Discovery tool
   Output: 5,000 calculator-related keywords
   Time: 5 minutes
   
2. AI SMART FILTER (Day 1)
   Filter: "Show calculator keywords with commercial or 
   transactional intent, volume >500, exclude basic math 
   calculators"
   Output: 2,800 filtered keywords
   Time: 2 minutes

3. CLUSTERING (Day 1)
   Input: 2,800 keywords
   Settings: US, English, Desktop, Accuracy 4
   Output: 187 keyword clusters
   Time: 15 minutes
   
4. PRIORITIZATION (Day 2)
   Sort by: Search volume (highest first)
   Filter: Keyword difficulty <40 (easier to rank)
   Action: Select top 50 clusters for Phase 1
   Time: 30 minutes
   
5. CONTENT BRIEF CREATION (Week 1)
   Create briefs for top 50 clusters
   Time: ~1 hour per brief = 50 hours
   Or: Use AI Writer Agent to speed up
   
6. CONTENT PRODUCTION (Weeks 2-8)
   Option A: Manual writing with AI Writer Assistant
   Option B: AI Writer Agent + human editing
   Output: 50 optimized calculator pages
   
7. LAUNCH & MONITOR (Ongoing)
   Publish pages
   Track rankings in GSC
   Re-cluster with "Get Rankings" enabled
   Identify remaining gaps
   Repeat for Phase 2 (next 50 clusters)
```

**Expected Outcomes:**
- 50 pages launched in 8 weeks
- Targeting 187 keyword clusters (2,800 keywords)
- Coverage of all major calculator categories
- Strong topical authority foundation

### Workflow 2: Existing Website Content Gap Analysis

**Scenario:** Established blog wants to find content gaps

**Step-by-Step:**

```
1. EXPORT CURRENT CONTENT
   Connect Google Search Console
   Pull all ranking keywords (bypasses 1,000 limit)
   Result: Your current 5,200 ranking keywords
   
2. COMPETITOR RESEARCH
   Use Keyword Distill on 3 top competitors
   Combine their ranking keywords
   Remove duplicates
   Result: 8,400 competitor keywords
   
3. MERGE & DEDUPLICATE
   Combine your 5,200 + competitor 8,400
   Remove your existing keywords
   Result: 6,100 new opportunity keywords
   
4. CLUSTER OPPORTUNITIES
   Input: 6,100 new keywords
   Enable "Get Rankings" with your domain
   Result: 214 new clusters where you don't rank
   
5. ANALYZE GAPS
   Sort by potential traffic
   Filter by keyword difficulty
   Identify: 78 high-priority gap clusters
   
6. CREATE CONTENT CALENDAR
   Allocate: 2 articles per week
   Timeline: 78 articles = 39 weeks
   Strategy: Focus on lowest difficulty first (quick wins)
   
7. EXECUTE
   Use Content Brief → AI Writer workflow
   Optimize existing related pages
   Interlink new gap content with existing content
```

**Expected Outcomes:**
- 78 new pieces targeting 6,100 additional keywords
- Fill major competitive gaps
- Increase topical coverage by 85%

### Workflow 3: Content Audit & Optimization

**Scenario:** Audit 200 existing pages for cannibalization and optimization

**Step-by-Step:**

```
1. EXTRACT RANKING KEYWORDS
   Connect GSC
   Pull keywords for each of your 200 URLs
   Export to CSV
   
2. CLUSTERING ANALYSIS
   Upload all ranking keywords
   Enable "Get Rankings"
   Settings: Tight clustering (Accuracy 5+)
   Output: See which pages compete for same clusters
   
3. IDENTIFY CANNIBALIZATION
   Look for multiple pages ranking for same cluster
   
   Example Finding:
   Cluster #45: "mortgage calculator" (12 keywords)
   - Page A: /mortgage-calculator (Rank 15)
   - Page B: /home-loan-calculator (Rank 23)
   - Page C: /loan-calculator (Rank 31)
   
   Problem: 3 pages competing, splitting authority
   
4. CONSOLIDATION STRATEGY
   Decide primary page: Page A (shortest URL)
   Action: 
   - Merge content from B & C into A
   - 301 redirect B → A
   - 301 redirect C → A
   - Update internal links
   
5. OPTIMIZATION
   For remaining pages:
   - Run through Content Brief for their cluster
   - Import to AI Writer Optimize tab
   - Follow optimization recommendations
   - Update content gaps
   
6. RE-CLUSTER VALIDATION
   After 30 days, re-run clustering with rankings
   Verify: One page per cluster
   Monitor: Ranking improvements
```

**Expected Outcomes:**
- Resolve cannibalization issues
- Consolidate authority
- Improve average rankings by 5-15 positions
- Reduce content redundancy

### Workflow 4: Programmatic SEO at Scale

**Scenario:** Create 1,000 location-based calculator pages

**Step-by-Step:**

```
1. LOCATION KEYWORD DISCOVERY
   Seed: "mortgage calculator [location]"
   Smart Filter: "mortgage calculator keywords with US city names"
   Output: 2,400 location-specific keywords
   
2. LOCATION CLUSTERING
   Cluster by city
   Result: 800 unique cities with calculator keywords
   
3. TEMPLATE BRIEF CREATION
   Create master content brief for "mortgage calculator"
   Include: Standard sections, calculations, FAQs
   Customize sections for: Local rates, median prices, lenders
   
4. DATA COLLECTION
   For each location, gather:
   - Median home price
   - Average interest rate
   - Local lenders (top 3)
   - Property tax rate
   
5. BULK CONTENT GENERATION
   Use AI Writer Agent with custom data injection
   
   Template structure:
   ---
   [City], [State] Mortgage Calculator
   
   Introduction:
   - City-specific stats (median price: $X)
   - Average rate: X.XX%
   
   Calculator [Embed standard tool]
   
   Local Context:
   - Property taxes in [City]
   - Top lenders in [City]: [Lender1], [Lender2], [Lender3]
   
   How to buy in [City]
   - Market trends
   - Neighborhood breakdown
   
   FAQ
   - "What's the average mortgage in [City]?"
   - "How much income needed in [City]?"
   ---
   
6. MASS PUBLICATION
   Bulk upload to CMS
   Implement: 
   - /mortgage-calculator/[state]/[city]/ URL structure
   - Breadcrumbs for SEO
   - Internal linking between nearby cities
   
7. MONITORING
   Track rankings for location + calculator keywords
   Update: Local data quarterly
```

**Expected Outcomes:**
- 800 location pages launched
- Target 2,400 location-specific keywords
- Capture local search traffic
- Establish local topical authority

---

## Real-Life Examples

### Example 1: SaaS Company Content Strategy

**Company:** Project management software
**Goal:** Increase organic traffic from 50k to 200k monthly visitors

**Implementation:**

```
PHASE 1: DISCOVERY
- Used Keyword Discovery with seed: "project management"
- Generated 12,000 keywords
- AI Smart Filter: "project management keywords with 
  informational or commercial intent for software buyers"
- Filtered to 6,800 keywords

PHASE 2: CLUSTERING
- Clustered 6,800 keywords
- Result: 290 clusters
- Analyzed competitor visibility
- Found 140 clusters with low competition

PHASE 3: CONTENT BRIEFS
- Created briefs for top 100 priority clusters
- Focus: How-to guides, comparison articles, use cases
- Incorporated Reddit questions from r/projectmanagement

PHASE 4: EXECUTION
- Produced 100 articles over 6 months
- Used AI Writer Assistant for drafts
- Manual editing for brand voice
- Average article: 2,500 words, 15 images

RESULTS (12 months):
- Organic traffic: 50k → 185k (+270%)
- Ranking keywords: 2,400 → 8,900 (+271%)
- Top 3 rankings: 180 → 890 (+394%)
- Demo requests from organic: 1,200 → 4,800 (+300%)
- Attribution: Content generated $2.3M in closed revenue
```

### Example 2: Affiliate Marketing Website

**Niche:** Kitchen appliances reviews
**Goal:** Build authority and affiliate revenue

**Implementation:**

```
PHASE 1: COMPETITOR ANALYSIS
- Used Keyword Distill on top 5 competitors
- Extracted 15,000 combined keywords
- Removed overlaps with current rankings
- Result: 9,200 opportunity keywords

PHASE 2: CLUSTERING & PRIORITIZATION
- Clustered 9,200 keywords
- Result: 380 clusters
- Sorted by:
  a. Commercial intent (buyer keywords)
  b. Search volume
  c. Low difficulty (<35)
- Selected 120 clusters for Year 1

PHASE 3: CONTENT STRATEGY
- Cluster types identified:
  * 45 "best [appliance]" comparison clusters
  * 32 "[brand] vs [brand]" clusters  
  * 28 "[appliance] reviews" clusters
  * 15 "buying guide" clusters

PHASE 4: CONTENT PRODUCTION
- Created briefs for all 120 clusters
- AI Writer Agent for initial drafts
- Added: Personal testing, photos, affiliate links
- Average article: 3,000 words, 20+ images

PHASE 5: LINK BUILDING
- Used topical clusters to organize outreach
- Internal linking between related articles
- Built resource hub pages for each cluster topic

RESULTS (18 months):
- Articles published: 120
- Ranking keywords: 18,500+
- Monthly organic traffic: 45k → 280k
- Affiliate commissions: $2.5k → $42k/month
- Topical authority in 8 appliance categories
```

### Example 3: Local SEO for Multi-Location Business

**Business:** Dental practice with 5 locations
**Goal:** Rank for local dentistry services

**Implementation:**

```
PHASE 1: SERVICE + LOCATION KEYWORD RESEARCH
- Seeds: "dentist", "dental implants", "teeth whitening", etc.
- Added location modifiers: [City], near me, in [Neighborhood]
- Generated 2,800 local service keywords

PHASE 2: CLUSTERING BY SERVICE & LOCATION
- Clustered by service type first
- Sub-clustered by location
- Result: 45 service clusters × 5 locations = 225 target pages

PHASE 3: CONTENT BRIEF WITH LOCAL DATA
- Created service templates (dental implants, whitening, etc.)
- Customized each with:
  * Location-specific address, phone
  * Local testimonials
  * Nearby landmarks
  * Insurance accepted in that location
  * Parking information

PHASE 4: LOCATION PAGE OPTIMIZATION
- URL structure: /[city]/[service]/
- Example: /boston/dental-implants/
- Used AI Writer Assistant for consistent structure
- Added local schema markup

PHASE 5: SUPPORTING CONTENT
- Created city-specific blog content:
  * "Dental Health Resources in [City]"
  * "What [City] Residents Need to Know About [Service]"
  * "Insurance Coverage for [Service] in [City]"

RESULTS (9 months):
- 225 service pages created (45 per location)
- 60 supporting blog articles
- Rankings improved:
  * Average position: 28 → 7
  * Top 3 rankings: 12 → 156
- Phone calls increased 340%
- Online bookings up 290%
- New patient acquisition: +425% from organic search
```

### Example 4: E-commerce Product Category Expansion

**Store:** Outdoor gear retailer
**Goal:** Expand into new product categories with SEO content

**Implementation:**

```
PHASE 1: CATEGORY KEYWORD DISCOVERY
- Seeds: All current product categories
- Plus: Adjacent categories (camping, hiking, fishing, etc.)
- Generated 28,000 product and informational keywords

PHASE 2: SMART FILTERING
- Filter 1: "Show keywords with commercial intent for outdoor gear"
- Filter 2: "Include comparison and buying guide keywords"
- Filter 3: "Exclude brands we don't carry"
- Result: 15,000 relevant keywords

PHASE 3: CLUSTERING BY PRODUCT TYPE
- Clustered 15,000 keywords
- Result: 520 clusters
- Mapped clusters to:
  * 180 Product category pages
  * 140 Buying guides
  * 110 Comparison articles
  * 90 How-to/educational content

PHASE 4: CATEGORY PAGE OPTIMIZATION
- Used Content Brief to analyze top-ranking category pages
- Optimized existing 80 categories
- Created 100 new subcategory pages
- Each page included:
  * Product grid
  * Educational content (500-800 words)
  * FAQs
  * Comparison table
  * Buying considerations

PHASE 5: CONTENT HUB CREATION
- Built topical hubs:
  * "Camping Gear Guide"
  * "Hiking Equipment Essentials"  
  * "Fishing Gear Reviews"
- Each hub: 15-20 supporting articles
- Internal linking to category pages

RESULTS (14 months):
- Category pages created: 100 new + 80 optimized
- Content articles: 340
- Organic traffic: 120k → 680k/month (+467%)
- Organic revenue: $85k → $520k/month (+512%)
- Product categories ranking: 45 → 389
- Average order value from organic: +22%
```

### Example 5: Personal Brand Building (Consultant)

**Person:** Marketing consultant
**Goal:** Establish topical authority and generate leads

**Implementation:**

```
PHASE 1: EXPERTISE MAPPING
- Seeds: "marketing strategy", "brand positioning", 
  "go-to-market", "product marketing"
- Generated 4,500 keywords in expertise areas

PHASE 2: INTENT-BASED CLUSTERING
- Focused on informational intent (educational content)
- Result: 180 clusters
- Filtered to 60 clusters matching unique POV

PHASE 3: THOUGHT LEADERSHIP CONTENT
- Created content briefs for 60 clusters
- Added unique angles from consulting experience:
  * Case studies (anonymized)
  * Frameworks developed
  * Contrarian viewpoints
  * Real client challenges

PHASE 4: CONTENT PRODUCTION
- Used AI Writer Assistant for structure
- Heavily edited for personal voice
- Added:
  * Personal anecdotes
  * Custom diagrams
  * Video explanations
  * Downloadable frameworks

PHASE 5: LEAD GENERATION INTEGRATION
- Each article included:
  * Related service CTA
  * Free consultation offer
  * Newsletter signup
  * LinkedIn follow prompt

RESULTS (12 months):
- Articles published: 60
- Average word count: 2,200
- Organic traffic: 800 → 15,000/month
- Newsletter subscribers: 200 → 4,800
- Consultation requests: 3 → 28/month
- Closed clients from organic: 12 ($180k revenue)
- Speaking invitations: 15
- Podcast guest appearances: 8
```

---

## Pricing Structure

### $1 Trial (7 Days)

**Includes:**
- 6,000 credits (one-time)
- 3 Keyword Discovery searches
- 1 Content Brief
- Full access to all features
- Pro versions of SERP tools

**After Trial:**
- Auto-downgrade to Pay-As-You-Go (PAYG)
- No automatic charges
- Keep using PAYG or upgrade

### Pay-As-You-Go (PAYG)

**Structure:**
- No monthly fee
- Purchase credits as needed
- $15.98 for 1,000 credits

**Credit Costs:**
- Keyword Discovery: ~200 credits per search (varies by results)
- Clustering: 1 credit per keyword
- Search Intent: 1 credit per keyword
- Content Brief: ~100 credits per brief
- AI Writer: Variable (based on word count)
- SERP Explorer: ~10 credits per search

**Best For:**
- Occasional users
- Testing the platform
- Small projects
- Budget-conscious users

### Monthly Subscription

**Tier 1: Standard**
- **Price:** $58/month
- **Credits:** 6,000/month (recurring)
- **Includes:**
  - Unlimited Keyword Discovery searches
  - Cluster up to 6,000 keywords
  - ~60 Content Briefs
  - AI Writer access
  - All SERP tools
  - Email support

**Tier 2: Professional** (Estimated)
- **Price:** ~$149/month
- **Credits:** 15,000/month
- **Additional:**
  - Priority support
  - API access
  - Team collaboration (3 seats)
  - White label reports

**Tier 3: Agency** (Estimated)
- **Price:** ~$299/month
- **Credits:** 40,000/month
- **Additional:**
  - 10 user seats
  - Dedicated account manager
  - Advanced API limits
  - White label everything
  - Custom integrations

### Enterprise

**Custom Pricing**
- Unlimited credits (or very high limits)
- Unlimited users
- Custom workflows
- SLA guarantees
- Dedicated support team
- Custom training
- API priority access

**Contact sales for quote**

### Credit Economics

**Example Project Calculation:**

```
PROJECT: Launch 50 calculator pages

Step 1: Keyword Discovery
- 3 searches = 600 credits

Step 2: Clustering
- 3,000 keywords = 3,000 credits

Step 3: Content Briefs
- 50 briefs × 100 credits = 5,000 credits

Step 4: AI Writer (optional)
- 50 articles × 200 credits = 10,000 credits

TOTAL: 18,600 credits

Cost Options:
- PAYG: 18.6k credits = ~$297
- Monthly ($58): 3.1 months of subscription = $180
- Best Value: 3-month subscription = $174

Decision: Subscribe for 3 months
```

---

## API Integration

### Authentication

**Method:** JWT Bearer Token

**Obtaining Token:**
```python
import requests

# Login endpoint
auth_url = "https://api.keywordinsights.ai/api/auth/login/"

credentials = {
    "email": "your-email@example.com",
    "password": "your-password"
}

response = requests.post(auth_url, json=credentials)
jwt_token = response.json()["access_token"]

# Store token securely
os.environ["KWI_JWT_TOKEN"] = jwt_token
```

### Key Endpoints

#### 1. Create Clustering Order

```python
POST /api/keywords-insights/order/

payload = {
    "project_name": "API Project Name",
    "keywords": ["keyword1", "keyword2", "keyword3"],
    "search_volumes": [1000, 500, 300],  # Corresponding volumes
    "location": "United States",
    "language": "en",
    "device": "desktop",
    "clustering_method": "volume",  # or "hub"
    "grouping_accuracy": 4,  # 1-10 scale
    "hub_creation_method": "medium",  # low/medium/high
    "insights": ["cluster", "context", "rank"],
    "url": "yourdomain.com"  # Optional, for rankings
}
```

**Insights Options:**
- `"cluster"`: Keyword clustering
- `"context"`: Search intent analysis
- `"rank"`: Get current rankings (requires `url` parameter)

#### 2. Check Order Status

```python
GET /api/keywords-insights/order/{order_id}/status/

# Response
{
    "status": "completed",  # or "processing", "queued", "failed"
    "progress": 100,  # 0-100
    "estimated_completion": "2025-01-15T14:30:00Z"
}
```

#### 3. Retrieve Clustering Results

```python
GET /api/keywords-insights/order/json/{order_id}/

# Query parameters
params = {
    "page_size": 50,  # Max 50
    "page_number": 1,
    "sort_by": "search_volume",  # or "keyword", "cluster_id"
    "ascending": "false"  # true for ascending
}

response = requests.get(url, headers=headers, params=params)
clusters = response.json()
```

**Response Structure:**
```json
{
    "total_clusters": 87,
    "total_keywords": 2400,
    "clusters": [
        {
            "cluster_id": 1,
            "lead_keyword": "mortgage calculator",
            "keywords": [
                "mortgage calculator",
                "home loan calculator",
                "mortgage payment calculator"
            ],
            "search_volumes": [33100, 12100, 8100],
            "total_volume": 53300,
            "dominant_intent": "transactional",
            "avg_difficulty": 42,
            "current_rank": null,  # If ranking data requested
            "ranking_url": null,
            "serp_features": ["calculator", "paa"]
        }
    ]
}
```

#### 4. Intent-Only Analysis

```python
POST /api/keywords-insights/order/

# For intent analysis without clustering
payload = {
    "project_name": "Intent Analysis",
    "keywords": ["keyword1", "keyword2"],
    "insights": ["context"],  # Only context, not cluster/rank
    # Other clustering params still required but not used
    "clustering_method": "volume",
    "device": "desktop",
    "grouping_accuracy": 4,
    "hub_creation_method": "medium",
    "language": "en",
    "location": "United States",
    "search_volumes": [1000, 500]
}
```

### Rate Limits

- **Free/PAYG:** 10 requests per minute
- **Paid Plans:** 60 requests per minute
- **Enterprise:** Custom limits

### Webhook Support

**Setup:**
```python
POST /api/webhooks/register/

payload = {
    "url": "https://your-domain.com/webhook/keyword-insights",
    "events": ["order.completed", "order.failed"]
}
```

**Webhook Payload:**
```json
{
    "event": "order.completed",
    "order_id": "abc123",
    "project_name": "API Project",
    "timestamp": "2025-01-15T14:30:00Z",
    "total_clusters": 87,
    "total_keywords": 2400
}
```

### Integration Examples

#### Example 1: Automated Competitor Monitoring

```python
import requests
import schedule
import time

def monitor_competitor():
    # Discover competitor keywords
    competitor_domain = "competitor.com"
    
    # Use Keyword Discovery API (if available)
    # Or use third-party tool + KWI clustering
    
    keywords = get_competitor_keywords(competitor_domain)
    
    # Cluster keywords
    order = create_clustering_order(keywords)
    
    # Wait for completion
    while get_order_status(order['id']) != "completed":
        time.sleep(30)
    
    # Get results
    clusters = get_clustering_results(order['id'])
    
    # Find gaps (keywords you don't rank for)
    gaps = identify_content_gaps(clusters, "yourdomain.com")
    
    # Alert if new opportunities
    if len(gaps) > 0:
        send_alert(f"Found {len(gaps)} new content opportunities")
        create_content_briefs(gaps)

# Run weekly
schedule.every().monday.at("09:00").do(monitor_competitor)
```

#### Example 2: Bulk Content Brief Generation

```python
def generate_briefs_for_clusters(cluster_file):
    # Read clusters from CSV
    clusters = pd.read_csv(cluster_file)
    
    briefs = []
    
    for cluster in clusters.itertuples():
        # API endpoint (if available)
        brief = create_content_brief(
            keyword=cluster.lead_keyword,
            location="United States",
            language="en"
        )
        
        briefs.append(brief)
        
        # Rate limiting
        time.sleep(1)
    
    # Export all briefs
    export_briefs_to_gdocs(briefs)
```

---

## Advanced Use Cases

### Use Case 1: SERP Intent Analysis for PPC

**Goal:** Optimize PPC spend by targeting only transactional keywords

```
Process:
1. Export all PPC keywords from Google Ads (5,000 keywords)
2. Run Intent Analysis in Keyword Insights
3. Filter results:
   - Transactional: Keep in campaigns
   - Commercial: Adjust bids (lower)
   - Informational: Remove or move to content strategy
   
Result:
- Removed 1,200 informational keywords
- Saved $3,400/month in wasted spend
- Improved conversion rate by 34%
```

### Use Case 2: Content Refresh Prioritization

**Goal:** Decide which old content to update first

```
Process:
1. Export all blog URLs with traffic data
2. Pull ranking keywords for each URL
3. Cluster keywords to understand topical coverage
4. For each page:
   a. Check current cluster coverage
   b. Identify missing cluster keywords
   c. Calculate opportunity score:
      (Missing volume × (1 - current rank/100))
5. Prioritize updates by opportunity score

Example Result:
Page: "Best Project Management Tools"
Current ranking keywords: 45
Cluster contains: 120 keywords
Missing keywords: 75 (combined volume: 25,000/month)
Current rank: 15
Opportunity score: 21,250
Priority: #1 for refresh
```

### Use Case 3: YouTube Video Content Strategy

**Goal:** Plan YouTube video topics using SERP data

```
Process:
1. Keyword Discovery for your niche
2. Cluster keywords
3. For each cluster:
   a. Check SERP features
   b. Filter for clusters with "Video" SERP feature
   c. These indicate video intent
4. Create content brief for video
5. Script outline from brief headings

Example:
Cluster #45: "how to calculate mortgage payments"
SERP Features: Video, PAA
Video Intent: High

Brief sections become video chapters:
- Intro (0:00)
- What goes into a mortgage payment (0:45)
- Formula breakdown (2:10)
- Step-by-step calculation (4:30)
- Common mistakes (7:15)
- Tools and calculators (9:00)
- Conclusion (10:30)
```

### Use Case 4: Multilingual Content Strategy

**Goal:** Expand into Spanish-speaking markets

```
Process:
1. Start with English keyword clusters
2. For each cluster:
   a. Translate lead keyword to Spanish
   b. Run Keyword Discovery in Spanish
   c. Cluster Spanish keywords
   d. Compare cluster size and volume
3. Prioritize clusters with:
   - High volume in Spanish
   - Low competition
   - Good translation match

Settings:
- Location: Spain (for EU) or Mexico (for LATAM)
- Language: Spanish
- Device: Mobile (higher mobile usage in target markets)

Result:
- Identified 45 high-opportunity Spanish clusters
- Created Spanish content briefs
- Hired Spanish writers
- Launched 45 translated + localized pages
```

### Use Case 5: Internal Linking Automation

**Goal:** Build internal linking based on keyword clusters

```
Process:
1. Cluster all site's ranking keywords
2. For each published page:
   a. Identify its primary cluster
   b. Find all related clusters (topical clusters)
   c. Find pages targeting those related clusters
3. Generate contextual internal links:
   - Anchor text from cluster keywords
   - Link to pages in related clusters
4. Update content with new internal links

Example:
Page: "Mortgage Calculator"
Primary Cluster: "mortgage calculator" (12 keywords)
Related Topical Clusters:
- "refinance calculator" 
- "extra payment calculator"
- "amortization calculator"

Generated Links:
"For homeowners looking to refinance, check our 
[refinance calculator] to see if refinancing makes sense."

"Want to pay off your loan faster? Use our 
[extra payment calculator] to see the impact."
```

### Use Case 6: Featured Snippet Optimization

**Goal:** Capture featured snippets systematically

```
Process:
1. Cluster keywords with "Get Rankings" enabled
2. Filter clusters where you rank #2-#10
3. Check SERP features for each cluster
4. For clusters with featured snippets:
   a. Analyze snippet format (paragraph, list, table)
   b. Create optimized section matching format
   c. Position at top of content
5. Track snippet capture rate

Real Example:
Cluster: "how to calculate roi"
Current Rank: #6
Snippet: Yes (paragraph, 58 words)

Optimization:
Added concise answer paragraph at content start:
"ROI is calculated by subtracting the initial investment 
from the final value, dividing by the initial investment, 
and multiplying by 100 to get a percentage. For example, 
if you invest $1,000 and it grows to $1,500, your ROI is 
($1,500 - $1,000) / $1,000 × 100 = 50%."

Result: Captured snippet within 3 weeks
```

---

## Best Practices

### 1. Clustering Best Practices

**Choosing Grouping Accuracy:**

```
Accuracy Level 1-3 (Loose Clustering):
- Use for: Broad topic mapping
- Result: Fewer, larger clusters
- Example: All "calculator" keywords in one cluster
- Risk: May need to split later

Accuracy Level 4-6 (Balanced):
- Use for: Most projects
- Result: Balanced cluster sizes
- Example: "mortgage calculator" separate from "loan calculator"
- Recommended: Start here

Accuracy Level 7-10 (Tight Clustering):
- Use for: Granular content strategy
- Result: Many small clusters
- Example: "mortgage calculator" vs "mortgage calculator with taxes"
- Risk: May create duplicate content if targeting separately
```

**When to Use Volume vs. HUB Algorithm:**

```
Volume Algorithm:
- Best for: Keyword-driven content strategy
- Focuses on: Search volume as primary grouping factor
- Use when: You want high-volume keywords highlighted
- Example: E-commerce category pages

HUB Algorithm:
- Best for: Topical authority building
- Creates: Hierarchical cluster relationships
- Use when: Building content hubs and pillar pages
- Example: Educational content sites
```

### 2. Content Brief Best Practices

**Information Gain Strategy:**

```
Don't just copy competitors:
❌ If top 20 pages all discuss "monthly payment formula"
✓ Add: "Hidden costs not included in standard calculators"
✓ Add: "Real case study with actual mortgage example"
✓ Add: "Expert interview with mortgage broker"

Goal: Google rewards unique information
Your content should teach something new
```

**Source Diversity:**

```
Balance your content sources:
- 60% from top-ranking pages (SERP analysis)
- 20% from Reddit/Quora (real user questions)
- 10% from PAA (answer boxes)
- 10% from your unique expertise

This prevents "me too" content
```

### 3. AI Writer Best Practices

**Assistant vs. Agent Decision Matrix:**

```
Use AI Writer ASSISTANT when:
- High-value money pages (product pages, landing pages)
- Brand voice is critical
- Need precise control over every section
- Content requires heavy customization
- You have time for hands-on editing

Use AI Writer AGENT when:
- Scaling content production (10+ articles)
- Supporting blog content
- Time is limited
- Content follows standard structure
- You're okay with 85% publish-ready
```

**Humanizing AI Content:**

```
Red flags AI detectors look for:
- Perfect grammar (too perfect)
- Repetitive sentence structures
- Lack of contractions
- No personal voice
- Generic examples

Fixes:
1. Add personal anecdotes
2. Use contractions naturally
3. Vary sentence length dramatically
4. Include specific numbers and data
5. Edit with brand voice in mind
6. Add conversational asides
7. Use the Optimize tab's AI detection score
```

### 4. Workflow Optimization

**Batch Processing Strategy:**

```
Instead of: Discover → Cluster → Brief → Write (per topic)

Do: Batch by stage:

Week 1: Discovery Phase
- Run all keyword discoveries
- Export and merge lists
- ~10,000 keywords ready

Week 2: Clustering Phase  
- Cluster all 10,000 keywords at once
- Analyze all clusters
- Prioritize top 100 clusters

Week 3: Brief Phase
- Create 25 briefs (5 per day)
- Use templates for similar cluster types

Week 4-12: Writing Phase
- Process 3-4 articles per week
- Consistent workflow

Benefits:
- Fewer context switches
- Better pattern recognition
- Faster overall completion
```

### 5. Credit Management

**Maximizing Free Credits:**

```
With 6,000 trial credits:

Strategy 1: Single Large Project
- Cluster 3,000 keywords = 3,000 credits
- Create 30 briefs = 3,000 credits
- Result: Complete content strategy

Strategy 2: Multiple Small Projects
- 3 discoveries = 600 credits
- 3 separate clusters (500 ea) = 1,500 credits
- 40 briefs = 4,000 credits
- Result: 3 niche strategies mapped

Strategy 3: Content Refresh
- Import existing content
- Cluster current keywords = 1,000 credits
- Create optimization briefs = 3,000 credits
- Use remaining for gap analysis
```

### 6. Team Collaboration

**Role Assignment:**

```
SEO Manager:
- Keyword discovery
- Clustering strategy
- Gap analysis
- Performance monitoring

Content Strategist:
- Brief creation
- Topic prioritization
- Content calendar
- Quality standards

Writers:
- Brief-to-content conversion
- AI Writer usage
- First draft completion

Editor:
- Content optimization
- AI detection review
- Publish approval
```

### 7. Avoiding Common Mistakes

**Mistake #1: Over-clustering**
```
Problem: Creating too many clusters leads to thin content

Example:
- "mortgage calculator" (Cluster 1)
- "home mortgage calculator" (Cluster 2)
- "mortgage payment calculator" (Cluster 3)

Reality: These should be ONE page

Fix: Increase grouping accuracy to 3-4
```

**Mistake #2: Ignoring Search Intent**
```
Problem: Targeting informational keywords with transaction pages

Example:
Keyword: "what is a mortgage calculator"
Your page: Calculator tool with no explanation

Fix: Use intent analysis to separate:
- "What is" → Educational content
- "Calculator" → Tool page
```

**Mistake #3: Not Using Get Rankings**
```
Problem: Creating content for keywords you already rank for

Fix: ALWAYS enable "Get Rankings" in clustering
Filter out clusters where you rank top 10
Focus on gaps
```

**Mistake #4: Blindly Following AI**
```
Problem: Publishing AI-generated content without editing

Issues:
- Generic information
- No unique POV
- High AI detection score
- No brand voice

Fix: Use 80/20 rule
- AI generates 80% of structure/research
- Human adds 20% unique value/voice
```

### 8. Measuring Success

**KPIs to Track:**

```
Input Metrics:
- Keywords clustered
- Clusters identified
- Briefs created
- Articles published

Process Metrics:
- Time per brief
- Time per article
- Content quality score
- AI detection score

Output Metrics:
- Ranking keywords
- Organic traffic
- Top 3 positions
- Featured snippets captured

Business Metrics:
- Leads from organic
- Revenue from organic
- ROI on subscription cost
```

**Success Benchmarks:**

```
After 3 Months:
- 30-50 articles published
- 500-1,000 new ranking keywords
- 2-3x traffic increase
- 10-20 featured snippets

After 6 Months:
- 80-100 articles published
- 2,000-3,000 ranking keywords
- 5-7x traffic increase
- 30-50 featured snippets

After 12 Months:
- 150-200 articles published
- 5,000+ ranking keywords
- 10-15x traffic increase
- 100+ featured snippets
- Established topical authority
```

---

## Comparison with Other Tools

### Keyword Insights vs. SEMrush

```
SEMrush Strengths:
- Massive keyword database
- Comprehensive SEO suite
- Historical data
- Backlink analysis
- Rank tracking

Keyword Insights Strengths:
- SERP-based clustering (not NLP)
- Live data sources (Reddit, Quora)
- Integrated content workflow
- Information Gain model
- More affordable
- AI Writer included

Best Use:
Use SEMrush for: Discovery, competitive analysis, backlinks
Use Keyword Insights for: Clustering, briefs, content production
```

### Keyword Insights vs. Ahrefs

```
Ahrefs Strengths:
- Largest backlink database
- Excellent site explorer
- Content gap analysis
- Keyword difficulty accuracy

Keyword Insights Strengths:
- Superior clustering algorithm
- Content brief quality
- AI writing integration
- Lower price point
- Intent classification

Best Use:
Use Ahrefs for: Keyword research, link analysis, technical SEO
Use Keyword Insights for: Content strategy, clustering, production
```

### Keyword Insights vs. Surfer SEO

```
Surfer SEO Strengths:
- On-page optimization
- Content editor
- SERP analyzer
- NLP term extraction

Keyword Insights Strengths:
- Keyword clustering
- Topical mapping
- Content brief depth
- Search intent analysis
- More keywords per project

Best Use:
Use Surfer for: Individual article optimization
Use Keyword Insights for: Overall content strategy at scale
```

---

## Frequently Asked Questions

### Technical Questions

**Q: How does SERP-based clustering differ from semantic clustering?**

```
Semantic Clustering:
- Uses NLP to find similar meaning words
- Based on linguistic relationships
- Example: "car" and "automobile" cluster together

SERP-Based Clustering:
- Analyzes actual ranking URLs
- Based on Google's interpretation
- Example: "car" and "automobile" cluster if same URLs rank
- More accurate for SEO because it reflects real search results
```

**Q: Can I cluster keywords in multiple languages?**

```
Yes, supported languages include:
- All major European languages
- Asian languages (Chinese, Japanese, Korean)
- Arabic, Hebrew
- And many more

Process:
1. Set language in clustering settings
2. Set location (country)
3. Keywords will cluster based on geo-specific SERPs
```

**Q: What's the difference between clustering methods?**

```
Volume Method:
- Prioritizes high-volume keywords
- Groups based on volume similarity + SERP overlap
- Best for commercial projects

HUB Method:
- Creates hierarchical relationships
- Identifies parent-child topic relationships
- Best for content authority building
```

### Strategic Questions

**Q: Should I cluster before or after filtering keywords?**

```
Recommended Approach:
1. Discover keywords (large list)
2. Filter with AI Smart Filter first
3. Then cluster filtered list

Why:
- Saves clustering credits
- Faster processing
- More relevant clusters
- Less noise in results

Exception:
If exploring new niche, cluster first to see all topics
Then decide what to target
```

**Q: How many clusters should I target in Year 1?**

```
Depends on resources:

Solo Creator:
- 30-50 clusters (2-4 per month)
- Focus on quality

Small Team (2-3 people):
- 80-120 clusters (7-10 per month)
- Balance quality and quantity

Agency/Large Team:
- 200+ clusters (15-20 per month)
- Scale with quality systems

Remember: Better to fully cover 50 clusters than partially cover 200
```

**Q: How do I handle keyword cannibalization found in clustering?**

```
Step 1: Identify Cannibalization
- Look for multiple pages in same cluster
- Check which page ranks highest

Step 2: Consolidation Decision
Option A: Merge content
- Combine all content into best-performing page
- 301 redirect others to it

Option B: Differentiate
- If pages serve different purposes, differentiate them
- Target different sub-intents within cluster

Step 3: Update Internal Links
- Point all internal links to chosen page
- Update XML sitemap

Step 4: Monitor
- Track rankings after 4-6 weeks
- Should see improvement in chosen page
```

### Operational Questions

**Q: What's the typical workflow timeline?**

```
From keyword to published content:

Speed Mode (Using AI Writer Agent):
- Discovery: 5 minutes
- Clustering: 15 minutes  
- Analysis: 30 minutes
- Brief: 10 minutes
- AI Draft: 5 minutes
- Edit: 1-2 hours
- Total: 2-3 hours per article

Quality Mode (Using AI Writer Assistant):
- Discovery: 5 minutes
- Clustering: 15 minutes
- Analysis: 1 hour
- Brief: 30 minutes
- Draft: 3-4 hours
- Optimize: 1 hour
- Edit: 1 hour
- Total: 6-7 hours per article

Scale Mode (Team):
- Discovery: 5 minutes
- Clustering: 15 minutes
- Analysis: 2 hours (for all clusters)
- Brief: 30 minutes each
- Team writes 10 articles simultaneously
- Total: 2-3 days for 10 articles
```

**Q: How often should I re-cluster?**

```
Frequency depends on:

High-Competition Niches (e.g., finance, tech):
- Every 3 months
- SERP changes faster

Medium-Competition Niches:
- Every 6 months
- Quarterly check is sufficient

Low-Competition Niches:
- Every 12 months
- SERPs more stable

Triggers for immediate re-clustering:
- Major Google algorithm update
- Competitor launches big content push
- Your site's traffic drops significantly
- Entering new content category
```

---

## Conclusion

Keyword Insights is a comprehensive topical SEO platform that stands out through its SERP-based clustering technology, real-time data sources, and integrated content workflow. Unlike traditional keyword tools that stop at discovery, Keyword Insights takes you from initial keyword research through clustering, intent analysis, content briefing, and AI-assisted writing.

### Key Advantages:

1. **Live SERP Data**: More accurate than NLP-based clustering
2. **Scale**: Process up to 200,000 keywords at once
3. **Integration**: Complete workflow in one platform
4. **Information Gain**: Unique content angles, not just copying
5. **Affordability**: More accessible than enterprise SEO suites
6. **AI Collaboration**: Human + AI model, not full automation

### Best For:

- SEO professionals building topical authority
- Content teams scaling production
- Agencies managing multiple clients
- Solo creators establishing expertise
- E-commerce sites expanding categories
- SaaS companies building content engines

### Not Ideal For:

- Pure technical SEO (no site audits)
- Backlink analysis (use Ahrefs/SEMrush)
- Rank tracking (use dedicated rank tracker)
- Single-page optimization (use Surfer SEO)

### Getting Started Recommendation:

1. **Week 1**: Start with $1 trial
2. **Week 2**: Run complete project (discovery → clustering → briefs)
3. **Week 3**: Produce 5 articles to test workflow
4. **Week 4**: Evaluate results, decide on subscription
5. **Month 2+**: Scale based on team capacity

### ROI Expectation:

```
Conservative Estimate:
- Investment: $58/month ($696/year)
- Content produced: 100 articles
- Organic traffic increase: 5x
- New leads: 50-100/month
- Cost per lead: $0.58-$1.16
- Typical lead value: $50-$500

Result: 50-500x ROI
```

Keyword Insights is most valuable when used as part of a systematic content strategy, not as an ad-hoc research tool. The platform shines when you commit to the full workflow and leverage its clustering intelligence to build comprehensive topical coverage.

---

## Additional Resources

### Official Documentation
- Website: https://www.keywordinsights.ai
- Help Center: https://docs.keywordinsights.ai
- API Docs: https://docs.keywordinsights.ai/api
- Blog: https://www.keywordinsights.ai/blog

### Community
- Facebook Group: Keyword Insights Users
- YouTube Channel: Video tutorials
- Twitter: @keywordinsights

### Support
- Email: support@keywordinsights.ai
- Live Chat: Available in platform
- Response Time: <24 hours (paid users)

---

**Document Version:** 1.0  
**Last Updated:** November 2025  
**Author:** Comprehensive Technical Guide for SEO Professionals
