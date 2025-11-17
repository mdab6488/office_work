# Majestic SEO - Complete Professional Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Core Concepts & Metrics](#core-concepts--metrics)
3. [Site Explorer](#site-explorer)
4. [Backlink Analysis](#backlink-analysis)
5. [Trust Flow & Citation Flow](#trust-flow--citation-flow)
6. [Topical Trust Flow](#topical-trust-flow)
7. [Clique Hunter](#clique-hunter)
8. [Keyword Checker](#keyword-checker)
9. [Bulk Backlink Checker](#bulk-backlink-checker)
10. [Link Context](#link-context)
11. [Anchor Text Analysis](#anchor-text-analysis)
12. [Referring Domains Analysis](#referring-domains-analysis)
13. [Majestic Million](#majestic-million)
14. [API Integration](#api-integration)
15. [Competitive Analysis Workflows](#competitive-analysis-workflows)
16. [Link Building Strategies](#link-building-strategies)
17. [Disavow File Creation](#disavow-file-creation)
18. [Advanced Use Cases](#advanced-use-cases)
19. [Integration with Other Tools](#integration-with-other-tools)
20. [Best Practices & Tips](#best-practices--tips)

---

## Introduction

### What is Majestic?

Majestic is a specialized SEO tool focused exclusively on backlink analysis and link intelligence. Founded in 2004, it maintains one of the largest commercial link intelligence databases in the world, with over 10 trillion URLs indexed.

### Key Differentiators

**Unique Strengths:**
- **Historical Index**: Access to link data from 2004 onwards
- **Fresh Index**: Updated data from the last 120 days
- **Trust Flow/Citation Flow**: Proprietary link quality metrics
- **Topical Trust Flow**: Industry categorization of domains
- **Link Context**: Analyze the content surrounding backlinks
- **Clique Hunter**: Find link networks and PBNs

**Primary Use Cases:**
- Comprehensive backlink analysis
- Link building prospect research
- Competitor backlink strategies
- Link quality assessment
- PBN detection
- Link reclamation
- Historical link profile analysis

### Majestic vs. Competitors

| Feature | Majestic | Ahrefs | SEMrush | Moz |
|---------|----------|--------|---------|-----|
| Historical Data | 2004+ | 2010+ | 2012+ | Limited |
| Fresh Index | 120 days | Daily | Daily | Weekly |
| Link Database Size | Largest | Second | Third | Smallest |
| Trust Flow Metric | ✓ | × | × | × |
| Topical Analysis | Advanced | Basic | Basic | Basic |
| Clique Detection | ✓ | × | × | × |
| Price (Entry) | $49.99/mo | $129/mo | $129.95/mo | $99/mo |

---

## Core Concepts & Metrics

### The Two Indexes

#### Fresh Index
- **Update Frequency**: Continuously updated (120-day rolling window)
- **Use Case**: Current link profile analysis, recent link acquisition
- **Best For**: Monitoring active campaigns, finding new opportunities

**Real-Life Example:**
```
Scenario: You launched a guest posting campaign in October 2024
Action: Use Fresh Index to track which articles have been published
Result: See only links acquired in the last 4 months
```

#### Historic Index
- **Coverage**: Complete historical data from 2004
- **Use Case**: Long-term link profile analysis, penalty investigation
- **Best For**: Domain history research, expired domain evaluation

**Real-Life Example:**
```
Scenario: Buying an expired domain for 301 redirect
Action: Check Historic Index for complete link history
Result: Discover it had 50K links in 2015 from a PBN (avoid purchase!)
```

### Trust Flow (TF)

**Definition**: Measures the quality of backlinks based on proximity to trusted seed sites.

**Scale**: 0-100
- 0-15: Low quality
- 16-30: Moderate quality
- 31-50: Good quality
- 51-70: Very good quality
- 71-100: Exceptional quality

**Calculation Method:**
1. Majestic identifies manually vetted trusted seed sites
2. Algorithm measures how many "clicks" away your site is from these seeds
3. Closer proximity = Higher Trust Flow

**Real-Life Example 1: E-commerce Site**
```
Domain: naturalorganicskincare.com
Trust Flow: 24
Citation Flow: 42

Analysis:
- TF:CF Ratio = 24:42 = 0.57 (concerning)
- Many links but low trust
- Likely has spammy backlinks

Action Needed:
- Audit backlink profile for spam
- Disavow toxic links
- Focus on quality over quantity
```

**Real-Life Example 2: News Website**
```
Domain: techcrunch.com
Trust Flow: 88
Citation Flow: 92

Analysis:
- TF:CF Ratio = 88:92 = 0.96 (excellent)
- High quality, trustworthy link profile
- Links from authoritative sources

Opportunity:
- Target for guest contributions
- High-value link target
```

### Citation Flow (CF)

**Definition**: Measures the quantity/influence of backlinks using link equity flow.

**Scale**: 0-100
- Similar to PageRank concept
- Doesn't measure quality, only quantity
- Can be inflated with low-quality links

**Real-Life Example:**
```
Comparing Two Domains:

Site A (Authority Blog):
TF: 45 | CF: 50 | TF:CF = 0.90

Site B (Spammy Site):
TF: 12 | CF: 55 | TF:CF = 0.22

Insight:
- Site B has more links (higher CF) but they're low quality (low TF)
- Site A is better link building target despite lower CF
```

### Trust Flow vs Citation Flow Ratio

**Ideal Ratios:**
- **0.8 - 1.2**: Healthy, natural profile
- **0.5 - 0.8**: Needs improvement
- **Below 0.5**: Red flag (quantity over quality)
- **Above 1.2**: Unusual (possible spam recovery or aggressive pruning)

**Real-Life Application:**
```
Prospecting for Guest Posts:

Filter Criteria:
- TF ≥ 25
- CF ≥ 20
- TF:CF Ratio ≥ 0.7
- Topical Relevance = High

Result: High-quality, relevant prospects
```

---

## Site Explorer

### Overview Dashboard

When you enter a domain in Site Explorer, you see:
- **Summary Metrics**: TF, CF, Referring Domains, Backlinks
- **Link Growth**: Historical chart
- **Top Pages**: Most linked-to pages
- **Top Referring Domains**: Strongest link sources
- **Anchor Text Distribution**: Link anchor text analysis

### Real-Life Workflow 1: Competitor Analysis

**Scenario**: Your fitness blog vs. competitor

```
Your Site: fitnesstips.com
- Trust Flow: 28
- Citation Flow: 35
- Referring Domains: 342
- Backlinks: 5,420

Competitor: healthandfitness.com
- Trust Flow: 42
- Citation Flow: 48
- Referring Domains: 1,250
- Backlinks: 18,900

Analysis Steps:
1. Gap identified: Competitor has 3.6x more referring domains
2. Navigate to their "Referring Domains" tab
3. Sort by Trust Flow (descending)
4. Export top 200 referring domains
5. Filter for sites in your niche
6. Create outreach list for link building
```

### Real-Life Workflow 2: Link Loss Investigation

**Scenario**: Sudden traffic drop

```
Action Steps:

1. Site Explorer → "Backlinks" Tab
2. Set Date Range: Last 6 months
3. Filter: "Status" = "Deleted"
4. Sort by: Trust Flow (descending)

Results Found:
- Lost 23 high-TF links (TF 40+)
- 18 from technology news sites
- All removed in the same week

Investigation:
- Links were from syndicated news article
- Original article was taken down
- All syndications removed links automatically

Solution:
- Reach out to original publisher
- Request article restoration or replacement
- Diversify link sources to prevent single-point failures
```

### Real-Life Workflow 3: Content Performance

**Scenario**: Identify which content attracts links

```
Action Steps:

1. Site Explorer → "Pages" Tab
2. Sort by: External Backlinks (descending)
3. Analyze top 20 pages

Findings:
1. "Ultimate Guide to Keto Diet" - 245 referring domains
2. "Scientific Study Compilation" - 198 referring domains
3. "Free Meal Plan Template" - 167 referring domains

Pattern Identified:
- Comprehensive guides perform best (1st)
- Data/research compilations (2nd)
- Free tools/resources (3rd)

Action Plan:
- Create more comprehensive guides
- Compile more research studies
- Develop free tools/templates
- Promote these content types
```

---

## Backlink Analysis

### Backlink Tab Features

**Available Filters:**
- **Link Type**: Text, Image, Redirect, Frame, Form
- **Link Status**: Live, Deleted, Lost
- **Link Attribute**: Follow, Nofollow
- **Language**: Filter by page language
- **TLD**: Filter by domain extension
- **Trust Flow Range**: Custom range
- **Date Range**: When link was discovered

### Real-Life Example 1: Link Quality Audit

**Scenario**: Website penalty recovery

```
Website: outdoorgear.com
Issue: Manual penalty for unnatural links

Audit Process:

Step 1: Export all backlinks
- Site Explorer → Backlinks
- Export: All backlinks (may require multiple exports)
- Data: ~45,000 backlinks

Step 2: Filter low-quality links
Criteria:
- Trust Flow < 10
- Citation Flow > 30
- TF:CF Ratio < 0.3

Result: 8,423 suspicious links identified

Step 3: Analyze link patterns
Common issues found:
- 3,200 links from "get-backlinks.com" network
- 1,800 links from Russian gambling sites
- 2,100 links from auto-generated directories
- 1,323 links with exact-match anchor "buy outdoor gear"

Step 4: Create disavow file
- Group by domain
- Add to disavow list
- Submit to Google Search Console

Outcome:
- Penalty lifted after 2 months
- Rankings recovered 80% after 4 months
```

### Real-Life Example 2: Link Reclamation

**Scenario**: Find lost link opportunities

```
Company: SaaS platform "ProjectManager Pro"

Step 1: Identify brand mentions
- Export all backlinks with anchor text containing "ProjectManager Pro"
- Filter: Nofollow links
- Result: 245 nofollow brand mentions

Step 2: Categorize mentions
Analysis:
- 87 blog articles/reviews
- 56 forum discussions
- 43 social media posts
- 34 news articles
- 25 comparison pages

Step 3: Prioritize outreach
Focus on:
1. News articles (TF 30+): 18 targets
2. Review sites (TF 25+): 31 targets
3. Comparison pages (TF 20+): 22 targets

Step 4: Outreach campaign
Template used:
"Hi [Name],

I noticed you mentioned ProjectManager Pro in your article '[Title]'.
Thank you for the feature!

I wanted to let you know we've recently released [new feature].
Would you consider updating the article with this information?

Also, we noticed the link is set to nofollow. Since this is 
editorial content about our product, would you be willing to 
change it to a regular follow link?

Best regards,
[Your Name]"

Results:
- 23 links converted to follow (31% success rate)
- Estimated value: $4,600 (based on $200/link average)
```

### Real-Life Example 3: Negative SEO Detection

**Scenario**: Sudden spam link attack

```
Website: consultingfirm.com

Warning Signs:
- Referring domains jumped from 450 to 3,200 in one month
- Trust Flow dropped from 38 to 29

Investigation Process:

Step 1: Analyze recent backlinks
- Site Explorer → Backlinks
- Date Filter: Last 30 days
- Sort by: Date discovered (newest first)

Findings:
- 2,750 new links in past month
- 89% from TF 0-5 domains
- 67% from .info and .tk TLDs
- Anchor text: 95% exact-match commercial keywords

Step 2: Identify attack patterns
Common characteristics:
- Footer sitewide links
- Automated comment spam
- Foreign language adult sites
- Pharmaceutical spam sites

Step 3: Immediate response
Actions taken:
1. Document evidence with screenshots
2. Export complete list of spam domains
3. Create comprehensive disavow file
4. Submit disavow to Google (same day)
5. Monitor for continued attacks

Step 4: File reconsideration request
Included:
- Timeline of attack
- Evidence of spam links
- Disavow file submission proof
- Steps taken to clean profile

Outcome:
- Attack stopped after 2 weeks
- Disavow processed by Google
- Rankings stabilized after 45 days
```

---

## Trust Flow & Citation Flow

### Using TF & CF for Link Prospecting

**Real-Life Prospecting Workflow:**

```
Goal: Find guest posting opportunities for Digital Marketing blog

Step 1: Build prospect list from competitors
- Analyze 3 top competitors
- Export their referring domains
- Combine into master list (remove duplicates)

Step 2: Filter by quality metrics
Criteria:
- Trust Flow: 25-50 (sweet spot for outreach)
- Citation Flow: 20-60
- TF:CF Ratio: 0.7-1.2
- Language: English
- TLD: .com, .org, .net

Initial List: 1,247 domains
After Filtering: 183 domains

Step 3: Analyze topical relevance
- Export Topical Trust Flow data
- Filter for categories:
  * Marketing
  * Business
  * Technology
  * Advertising

After Topical Filter: 97 domains

Step 4: Check editorial standards
Manual review:
- Visit each site
- Check for "Write for Us" page
- Assess content quality
- Verify they accept guest posts
- Check posting frequency

Final List: 34 quality prospects

Step 5: Prioritize outreach
Tier 1 (TF 40-50): 8 sites - Personalized outreach
Tier 2 (TF 30-39): 15 sites - Semi-personalized
Tier 3 (TF 25-29): 11 sites - Template-based

Expected Success Rate:
- Tier 1: 25-30% (2-3 placements)
- Tier 2: 15-20% (2-3 placements)
- Tier 3: 10-15% (1-2 placements)

Total Expected: 5-8 guest posts
```

### Trust Flow Trends Analysis

**Real-Life Example: Domain Growth Tracking**

```
Company: E-commerce startup
Timeline: 18-month link building campaign

Month 1 (Jan 2023):
- Trust Flow: 12
- Citation Flow: 18
- Referring Domains: 45

Month 6 (Jun 2023):
- Trust Flow: 22 (+10)
- Citation Flow: 31 (+13)
- Referring Domains: 156 (+111)

Analysis:
- TF:CF Ratio improved from 0.67 to 0.71
- Quality focus showing results
- Good trajectory

Month 12 (Dec 2023):
- Trust Flow: 34 (+12)
- Citation Flow: 45 (+14)
- Referring Domains: 298 (+142)

Analysis:
- TF:CF Ratio = 0.76 (healthy)
- Consistent improvement
- Acceleration in quality links

Month 18 (Jun 2024):
- Trust Flow: 41 (+7)
- Citation Flow: 52 (+7)
- Referring Domains: 421 (+123)

Analysis:
- TF:CF Ratio = 0.79 (excellent)
- Slower growth but higher quality
- Approaching diminishing returns

Key Insights:
1. Early months: Focus on quantity builds foundation
2. Mid-campaign: Quality links accelerate TF growth
3. Later stages: Marginal gains from higher-authority targets
4. Steady ratio maintenance indicates natural growth
```

---

## Topical Trust Flow

### Understanding Topical Categories

Majestic categorizes websites into 18 main topics:
1. Arts
2. Business
3. Computers
4. Games
5. Health
6. Home
7. Kids and Teens
8. News
9. Recreation
10. Reference
11. Regional
12. Science
13. Shopping
14. Society
15. Sports
16. Adult
17. World
18. Unknown

**Subcategories**: Each has 2-3 levels of subcategories (800+ total)

### Real-Life Example 1: Niche Site Analysis

**Scenario**: Analyzing fitness blog's topical authority

```
Domain: fitlife360.com

Top Topical Trust Flow Categories:

1. Health (TF: 28)
   └─ Health > Fitness (TF: 26)
      └─ Health > Fitness > Nutrition (TF: 19)

2. Sports (TF: 15)
   └─ Sports > Strength Sports (TF: 12)

3. Shopping (TF: 11)
   └─ Shopping > Health (TF: 9)

Analysis:
- Strong topical focus in Health/Fitness (82% of TF)
- Natural crossover to Sports (11% of TF)
- Some commercial intent (Shopping category)
- Highly relevant link profile

Benchmark vs. Competitor:
Competitor: everydayhealth.com

1. Health (TF: 42)
   └─ Health > Fitness (TF: 38)
   └─ Health > Nutrition (TF: 35)
   └─ Health > Mental Health (TF: 32)

Gap Identified:
- Missing: Mental Health category (0 vs 32)
- Opportunity: Create mental wellness content
- Potential: Target mental health link sources
```

### Real-Life Example 2: Link Building Strategy

**Scenario**: Build topically relevant links for legal blog

```
Current Topical Trust Flow:

Your Site: lawyersblog.com
1. Society > Law (TF: 31)
2. Business > Law (TF: 18)
3. Reference (TF: 12)

Goal: Increase topical authority in legal categories

Step 1: Identify topical gaps
Desired categories:
- Society > Law > Criminal (Current: 8, Target: 20)
- Society > Law > Family (Current: 5, Target: 18)
- Business > Law > Intellectual Property (Current: 11, Target: 22)

Step 2: Find topically relevant link sources

Using Clique Hunter:
- Search Query: "criminal law blog"
- Filter: Topical Trust Flow in "Society > Law > Criminal"
- Minimum TF: 20

Results: 67 potential link sources

Step 3: Cross-reference with competitor links
- Find competitors strong in target categories
- Export their referring domains
- Filter for topical matches
- Identify overlapping prospects

Final List: 29 high-value targets

Step 4: Create category-specific content
Content Plan:
1. Criminal Law Category:
   - "Guide to Criminal Defense Strategies"
   - "Understanding Your Rights During Arrest"
   
2. Family Law Category:
   - "Child Custody Laws by State"
   - "Divorce Process Timeline"

3. IP Law Category:
   - "Patent Filing Process Explained"
   - "Trademark vs Copyright: Complete Guide"

Step 5: Outreach to topical sources
- Pitch category-specific content
- Offer expert quotes for their articles
- Propose resource page additions

Expected Outcome:
- 8-12 highly relevant links
- Increased Topical TF by 5-8 points per category
- Stronger topical authority signals
```

### Real-Life Example 3: Penalty Diagnosis

**Scenario**: Site hit by algorithm update

```
Website: techreviews.com
Problem: Lost 40% organic traffic after update

Topical Trust Flow Analysis:

Before Update:
1. Computers > Hardware (TF: 34)
2. Computers > Software (TF: 29)
3. Shopping > Electronics (TF: 22)
4. Adult > Spam (TF: 0)

Current Status:
1. Computers > Hardware (TF: 34)
2. Computers > Software (TF: 29)
3. Shopping > Electronics (TF: 22)
4. Adult (TF: 8) ← RED FLAG
5. Health > Pharmacy (TF: 5) ← RED FLAG
6. Shopping > Spam (TF: 4) ← RED FLAG

Investigation:
- Recent spam links appeared (last 60 days)
- 1,200 links from adult sites
- 800 links from pharmacy spam
- These links added irrelevant topical categories

Action Taken:
1. Export all links in "Adult" category
2. Export all links in "Health > Pharmacy"
3. Export all links in "Spam" categories
4. Review for legitimate vs spam
5. Create disavow file (2,000+ domains)
6. Submit to Google

Follow-up (3 months):
- Spam categories removed from profile
- Topical Trust Flow cleaned up
- Traffic recovered 85%
```

---

## Clique Hunter

### What is Clique Hunter?

Clique Hunter identifies groups of websites that link to each other, helping you discover:
- Link networks and PBNs
- Guest posting networks
- Industry communities
- Potential link sources

### Real-Life Example 1: Finding PBNs

**Scenario**: Due diligence before link purchase

```
Prospecting Situation:
- Vendor offers links from 10 "high-quality" sites
- Price: $200/link
- All sites TF 25-35

Due Diligence Process:

Step 1: List all 10 domains
1. qualityblog1.com
2. informationsite2.net
3. contenthub3.org
[... 7 more]

Step 2: Use Clique Hunter
Input: All 10 domains
Settings:
- Minimum sites in common: 2
- Minimum TF: 15

Results:
- All 10 sites link to each other
- They share 47 common outbound links
- Network includes 23 additional similar sites
- Same IP ranges (C-class)
- Similar WHOIS info (privacy protected)
- Identical site templates

Red Flags Identified:
1. Circular linking pattern (PBN indicator)
2. Unnatural cross-linking
3. Same hosting infrastructure
4. Cookie-cutter design
5. Thin content on manual review

Decision:
- AVOID - Clear PBN network
- Report vendor as selling PBN links
- Saved $2,000 + potential penalty
```

### Real-Life Example 2: Guest Posting Network Discovery

**Scenario**: Find legitimate guest posting opportunities

```
Strategy: Find sites that accepted guest posts from competitors

Step 1: Identify known guest posts from competitor
- Review competitor blog (authorbio.com)
- Found 15 published guest posts
- Extract domain list

Step 2: Input into Clique Hunter
Domains:
- marketingpro.com
- businessinsights.net
- entrepreneurblog.org
[... 12 more]

Settings:
- Minimum sites in common: 3
- Minimum TF: 20
- Filter: Editorial sites only

Step 3: Analyze results
Findings:
- 23 sites commonly accept guest posts
- They link to similar authoritative sources
- Natural linking patterns (not reciprocal)
- All have clear editorial guidelines
- Active "Write for Us" pages

Step 4: Expand the network
- Check who links to these 23 sites
- Filter for similar quality metrics
- Identified 47 additional prospects

Step 5: Qualify prospects
Manual review criteria:
✓ Clear editorial standards
✓ Quality existing content
✓ Active engagement (comments, shares)
✓ Regular publishing schedule
✓ Relevant audience

Final List: 31 high-potential guest post targets

Success Metrics (after 6 months):
- Pitched: 31 sites
- Accepted: 19 sites (61%)
- Published: 17 posts (55%)
- Average TF: 28
- Total investment: ~$1,700 (writing + outreach)
- Estimated value: $5,100+ (based on market rates)
```

### Real-Life Example 3: Industry Link Network

**Scenario**: Find interconnected industry resources

```
Niche: Sustainable fashion

Step 1: Start with known authority sites
Seeds:
- sustainablefashion.com
- ecowarriorprincess.net
- greenmatters.com
- fashtrav.com

Step 2: Clique Hunter analysis
Settings:
- Minimum common links: 5
- Topical filter: Shopping > Fashion + Society > Issues > Environment

Results:
Network discovered: 41 interconnected sites

Categories identified:
1. News/Magazine sites (12): TF 30-45
2. Blogger network (18): TF 20-35
3. Brand websites (7): TF 25-40
4. Non-profits (4): TF 35-50

Step 3: Relationship mapping
Key hubs identified:
- fashionrevolution.org (linked by 34 sites)
- commonobjective.co (linked by 28 sites)
- remake.world (linked by 26 sites)

Step 4: Create link building strategy

Tier 1 - Authority hubs (4 sites):
Approach: Contribute research/data
Timeline: 6-12 months
Difficulty: High

Tier 2 - News sites (12 sites):
Approach: Press releases + expert commentary
Timeline: 3-6 months
Difficulty: Medium

Tier 3 - Blogger network (18 sites):
Approach: Collaborations + guest posts
Timeline: 1-3 months
Difficulty: Low-Medium

Tier 4 - Brand partnerships (7 sites):
Approach: Product features + interviews
Timeline: 2-4 months
Difficulty: Medium

Implementation:
- Created data study on "Fashion Industry Waste"
- Pitched to all 4 authority hubs
- 2 accepted and published
- Generated 23 natural links from network
- Total network links acquired: 23 (from initial outreach)
- Ripple effect links: 14 additional (over 6 months)
```

---

## Keyword Checker

### Overview

Keyword Checker shows you:
- Which pages rank for specific keywords
- Backlink profile for those pages
- Competitors ranking for same keywords
- Link comparison with competitors

### Real-Life Example 1: SERP Analysis

**Scenario**: Understand why competitor outranks you

```
Target Keyword: "best project management software"

Your Site: projecttoolhub.com
- Position: #8
- Page: /best-project-management-software
- Referring Domains to Page: 23
- TF of Page: 22

Competitor: softwarereview.com
- Position: #3
- Page: /reviews/project-management
- Referring Domains to Page: 87
- TF of Page: 38

Majestic Keyword Checker Analysis:

Step 1: Compare top 10 results
Rankings:
1. g2.com/categories/project-management
   - Referring Domains: 234
   - Page TF: 45

2. capterra.com/project-management-software
   - Referring Domains: 189
   - Page TF: 42

3. softwarereview.com/reviews/project-management
   - Referring Domains: 87
   - Page TF: 38

... (continuing to #10)

8. projecttoolhub.com/best-project-management-software
   - Referring Domains: 23
   - Page TF: 22

Step 2: Analyze link gap
Average for Top 3:
- Referring Domains: 170
- Page TF: 42

Your Site Gap:
- Referring Domains: -147 (need 147 more)
- Page TF: -20 points

Step 3: Identify link sources for top rankers
Export referring domains for position #3:
- 87 total referring domains
- Filter TF 20+: 34 domains
- Filter topical relevance: 28 domains

Cross-reference with #1 and #2:
- Common sources: 18 domains
- Unique to each: 16, 21, 19 domains

Step 4: Create link acquisition plan
Target Sources (by priority):

Priority 1 - Common to all top 3 (18 domains):
Examples:
- techcrunch.com (TF: 45)
- forbes.com/technology (TF: 52)
- inc.com/tools (TF: 41)

Priority 2 - Unique to top ranker (16 domains):
Examples:
- projectmanagement.com (TF: 38)
- pmi.org (TF: 45)
- pm-software-reviews.com (TF: 28)

Priority 3 - Competitor's easier targets (12 domains):
Examples:
- blog.trello.com (TF: 35)
- asana.com/resources (TF: 38)
- monday.com/blog (TF: 32)

Step 5: Outreach execution
Campaign 1: Get featured in comparison articles
- Target: Priority 1 sites
- Pitch: "Update your 2025 comparison"
- Success: 3/18 (17%)

Campaign 2: Expert roundups
- Target: Priority 2 sites
- Pitch: Expert quote contributions
- Success: 5/16 (31%)

Campaign 3: Tool integration content
- Target: Priority 3 sites
- Pitch: Integration guides
- Success: 4/12 (33%)

Total Links Acquired: 12
Timeline: 4 months

Results (after 6 months):
- Position improved: #8 → #5
- Referring domains: 23 → 35
- Page TF: 22 → 29
- Organic traffic to page: +145%
```

### Real-Life Example 2: Content Gap Analysis

**Scenario**: Find keywords where competitors have strong pages

```
Your Site: healthyrecipes.com
Competitor: cookinglight.com

Process:

Step 1: Extract competitor's top pages
- Site Explorer: cookinglight.com
- Sort by: External backlinks
- Export: Top 50 pages

Step 2: Analyze each page in Keyword Checker
Page 1: cookinglight.com/recipes/quick-weeknight-dinners
- Referring Domains: 47
- Ranking Keywords: ~1,200 (estimated from other tools)
- Top Keywords:
  * "quick dinner recipes" - Position #2
  * "weeknight dinner ideas" - Position #3
  * "30 minute meals" - Position #4

Your Coverage: No comparable page (content gap!)

Page 2: cookinglight.com/recipes/meal-prep-sunday
- Referring Domains: 38
- Top Keywords:
  * "meal prep ideas" - Position #1
  * "sunday meal prep" - Position #2
  * "weekly meal prep" - Position #3

Your Coverage: healthyrecipes.com/meal-prep (Position #12)
Link Gap: 38 vs 6 referring domains

Step 3: Prioritize content creation

High Priority (No coverage):
1. Quick weeknight dinners hub
2. Budget meal planning guide
3. Slow cooker recipe collection

Medium Priority (Weak coverage):
1. Meal prep page needs more links
2. Healthy desserts needs update
3. Vegetarian recipes needs expansion

Step 4: Analyze link sources for each
For "quick weeknight dinners" page:

Top Referring Domains:
1. parents.com/recipes (TF: 42)
2. realsimple.com/food (TF: 45)
3. womenshealth.com/nutrition (TF: 48)
4. busytoddler.com/dinner-ideas (TF: 28)

Common theme: Family + lifestyle sites

Step 5: Create targeted content + outreach
Content Created:
- "50 Quick Weeknight Dinners Ready in 30 Minutes"
- Unique angle: Nutritionist-approved, macro breakdown
- Added value: Printable meal planning template

Outreach Targets:
- Parenting blogs (18 targets)
- Lifestyle magazines (12 targets)
- Working mom blogs (15 targets)

Campaign Results (3 months):
- 8 links acquired from target niches
- Page ranking for 23 related keywords
- Position #7 for "quick dinner recipes"
```

---

## Bulk Backlink Checker

### Features

Check up to 400 URLs simultaneously for:
- Backlink counts
- Trust Flow
- Citation Flow
- Referring domains
- Link strength

### Real-Life Example 1: Content Portfolio Audit

**Scenario**: Analyze 200-page content site

```
Site: marketinginsights.com
Goal: Identify underperforming content for link building

Step 1: Export all pages from sitemap
- 247 total pages
- Mix of blog posts, guides, tools

Step 2: Bulk check in Majestic
Input: All 247 URLs
Export data:
- URL
- Referring Domains
- Trust Flow
- Citation Flow
- External Backlinks

Step 3: Categorize content by link strength

Tier 1 - Strong (TF 25+):
- 18 pages
- Average referring domains: 34
- These are winners, promote more

Tier 2 - Moderate (TF 15-24):
- 62 pages
- Average referring domains: 12
- Link building opportunity

Tier 3 - Weak (TF 5-14):
- 89 pages
- Average referring domains: 3
- Need significant improvement

Tier 4 - No Links (TF 0-4):
- 78 pages
- No backlinks
- Consider consolidation or deletion

Step 4: Analyze patterns

Top performing content types:
1. "Ultimate Guide to [Topic]" - Avg TF: 32, Avg RD: 42
2. "Data Study: [Topic]" - Avg TF: 29, Avg RD: 38
3. "Free Template: [Tool]" - Avg TF: 26, Avg RD: 31

Poor performing content types:
1. Short news posts - Avg TF: 4, Avg RD: 1
2. Product updates - Avg TF: 5, Avg RD: 2
3. Opinion pieces - Avg TF: 7, Avg RD: 3

Step 5: Action plan

Immediate actions:
- Delete 45 thin content pages (Tier 4)
- 301 redirect 33 outdated pages to updated versions
- Consolidate 25 similar posts into 5 comprehensive guides

Link building focus:
- Target 30 Tier 3 pages with promotion
- Upgrade 15 Tier 2 pages to comprehensive guides
- Build links to support Tier 1 content

Content creation strategy going forward:
- Focus on "Ultimate Guide" format
- Incorporate data studies monthly
- Create free tools quarterly

Results (after 6 months):
- Total pages: 247 → 144 (consolidation)
- Average page TF: 12 → 19
- Average referring domains per page: 8 → 15
- Overall site TF: 31 → 38
- Organic traffic: +67%
```

### Real-Life Example 2: Competitor Content Analysis

**Scenario**: Analyze multiple competitors at once

```
Niche: Personal finance

Your Site: smartmoneytips.com

Competitors to analyze:
1. nerdwallet.com - Top 50 pages
2. thesimpledollar.com - Top 50 pages
3. creditkarma.com - Top 50 pages
4. investopedia.com - Top 50 pages

Total URLs: 200

Step 1: Bulk backlink check
Export all URLs with metrics

Step 2: Aggregate analysis

Average metrics by competitor:

Nerdwallet:
- Avg TF: 42
- Avg Referring Domains: 67
- Strongest categories: Credit cards, Banking

The Simple Dollar:
- Avg TF: 34
- Avg Referring Domains: 48
- Strongest categories: Budgeting, Saving

Credit Karma:
- Avg TF: 38
- Avg Referring Domains: 52
- Strongest categories: Credit scores, Personal loans

Investopedia:
- Avg TF: 45
- Avg Referring Domains: 89
- Strongest categories: Investing, Definitions

Your Site:
- Avg TF: 28
- Avg Referring Domains: 23
- Need improvement: All categories

Step 3: Identify content gaps

High-value topics (competitor pages with TF 40+):
1. "How to Build Credit Fast" - All 4 competitors have strong pages
   Your coverage: Weak article (TF: 15, RD: 4)

2. "Best High-Yield Savings Accounts" - 3 of 4 have TF 45+ pages
   Your coverage: None (gap!)

3. "Beginner's Guide to Investing" - All 4 have comprehensive guides
   Your coverage: Outdated article (TF: 12, RD: 6)

Step 4: Link source analysis

For "Best High-Yield Savings Accounts" pages:
Common link sources across competitors:
- bankrate.com
- money.com
- cnbc.com/finance
- forbes.com/advisor

Your approach:
1. Create superior comparison table
2. Update monthly (competitors update quarterly)
3. Add unique "savings goals calculator"
4. Outreach to common sources

Step 5: Competitive content creation

Created: "Best High-Yield Savings Accounts 2024"
Differentiators:
- Monthly rate updates (vs quarterly)
- Historical rate charts
- Personalized recommendations quiz
- Interactive calculator
- Mobile app comparison

Link building campaign:
- Targeted 32 sites that linked to competitors
- Success rate: 28% (9 links)
- Average TF of acquired links: 35

Results (after 5 months):
- Page TF: 0 → 31
- Referring domains: 0 → 12
- Ranking position: Not ranking → #6
- Monthly organic sessions: 0 → 2,300
```

### Real-Life Example 3: Link Decay Monitoring

**Scenario**: Track link health across portfolio

```
Agency: Managing 15 client sites
Challenge: Monitor link health at scale

Setup:

Step 1: Create monitoring list
- Top 10 pages from each client (150 total URLs)
- These pages represent 70% of organic traffic

Step 2: Establish baseline
Monthly bulk check:
- Document all referring domains
- Track Trust Flow changes
- Monitor link status (live/deleted)

Step 3: Monthly monitoring (example month)

Results from November 2024 check:

Client A (e-commerce):
- Lost 12 links (2 were TF 30+)
- Reason: News article links expired
- Action: Reach out to renew/update

Client B (B2B SaaS):
- Gained 8 links naturally
- Source: Product launch coverage
- Action: Promote similar announcements

Client C (Local service):
- No change in link count
- But TF dropped 3 points overall
- Investigation: Linked-from sites lost authority
- Action: Seek new link sources

Client D (Blog):
- Lost 5 links, gained 3
- Net: -2 links
- Cause: Directory cleanup
- Action: Diversify link types

Step 4: Alert system

Set thresholds:
- Alert if page loses 3+ TF points: Investigate
- Alert if page loses 5+ referring domains: Priority investigation
- Alert if site loses 10+ referring domains: Emergency review

November Alerts:
- Client A: Page lost 4 TF points → Discovered broken internal links
- Client F: Site lost 12 RDs → Found site migration issues

Step 5: Quarterly reporting

Metrics tracked:
- Average TF across all monitored pages
- Total referring domains
- Link acquisition rate
- Link loss rate
- Net link growth

Q4 2024 Summary:
- Average TF: +2.3 points across portfolio
- Total referring domains: +147 net gain
- Link acquisition: 223 new links
- Link loss: 76 links
- Net growth: +147 (healthy)
- Clients with TF decline: 2/15 (addressed immediately)

Value demonstrated to clients:
- Caught 23 technical issues early
- Prevented estimated 40+ additional link losses
- Proactive link building added $45K in estimated value
```

---

## Link Context

### What is Link Context?

Link Context shows you the actual content surrounding your backlinks:
- Text before and after the link
- Related terms and topics
- Relevance of the linking context
- Quality of surrounding content

### Real-Life Example 1: Checking Guest Post Quality

**Scenario**: Verify vendor-placed guest posts

```
Service Provider: Charged $300 per guest post placement
Claimed: "High-quality, contextually relevant links"

Verification Process:

Post 1: healthandwellness.com/nutrition-guide
Link Context Analysis:

Surrounding text:
"...proper nutrition is essential. Studies show that [Your Link: organic-supplements.com] consumption of vitamins can improve health. In addition, regular exercise..."

Issues identified:
- Minimal context (one sentence)
- Generic anchor text
- Feels inserted, not natural
- No value to reader

Quality Score: 3/10

Post 2: fitnessblog.net/workout-routines
Link Context Analysis:

Surrounding text:
"For those looking to optimize their pre-workout nutrition, [Your Link: organic-supplements.com/pre-workout-guide] provides an evidence-based guide covering timing, macronutrients, and supplementation. The guide includes research from 15 peer-reviewed studies and practical meal examples for different fitness goals."

Analysis:
- Relevant context (full paragraph)
- Descriptive anchor text
- Natural integration
- Adds value to content

Quality Score: 9/10

Post 3: wellnessjournal.org/supplement-dangers
Link Context Analysis:

Surrounding text:
"Many supplements contain harmful ingredients. [Your Link: organic-supplements.com] and similar sites often promote products without proper testing. Consumers should be cautious..."

MAJOR ISSUE:
- Negative context!
- Link positioned as example of bad practice
- Damages brand reputation
- Request immediate removal

Quality Score: 0/10 (harmful)

Summary Report to Vendor:
- Acceptable: 2/5 posts
- Poor integration: 2/5 posts
- Harmful: 1/5 post
- Request: Refund for 3 posts + removal of harmful link

Outcome:
- Vendor agreed to replace poor posts
- Refunded harmful placement
- Learned to always check context before accepting links
```

### Real-Life Example 2: Natural Link Profile Analysis

**Scenario**: Audit link context diversity

```
Website: outdoorequipment.com

Step 1: Export sample of backlinks (100 links)
- Sort by Trust Flow
- Get even distribution of link types

Step 2: Analyze context patterns

Natural, High-Quality Context Examples:

Example A (gear review site):
Context: "For serious hikers tackling multi-day trails, investing in a high-quality tent is crucial. After testing 15 models over six months, our top recommendation is the [Brand X Alpine Tent from outdoorequipment.com]. It weighs just 3.2 pounds, withstood winds up to 50mph in our testing, and packs down to the size of a water bottle. While it's pricier than budget options, the durability and weight savings are worth every penny for committed backpackers."

Analysis:
✓ Natural mention in editorial content
✓ Specific product reference
✓ Context shows genuine use/testing
✓ Detailed supporting information
✓ Helpful to reader

Example B (hiking blog):
Context: "Trail recommendations for the Pacific Northwest include careful gear preparation. I source most of my equipment from outdoorequipment.com, which has served me well through countless adventures. Their customer service team helped me select proper sizing for my backpack..."

Analysis:
✓ Personal testimony
✓ Natural link placement
✓ Relevant to content topic
✓ Mentions positive experience
✓ Not overly promotional

Unnatural, Low-Quality Context Examples:

Example C (directory listing):
Context: "outdoorequipment.com - Outdoor Equipment | Camping Gear | Hiking Supplies | Backpacking Equipment | Tents | Sleeping Bags | Backpacks"

Analysis:
✗ Keyword-stuffed description
✗ No real content
✗ Directory-style listing
✗ Low value to users
✗ Potential spam signal

Example D (footer link):
Context: "Partners: outdoorequipment.com | camping-gear-store.com | tent-sales-online.com | backpack-wholesale.net"

Analysis:
✗ Sitewide footer link
✗ No contextual relevance
✗ Listed with questionable sites
✗ Link scheme indicator
✗ Disavow candidate

Step 3: Categorize all 100 links

Results:
- Natural, Editorial: 34 links (healthy)
- Product Reviews: 21 links (good)
- Resource Lists: 15 links (acceptable)
- Directory/Lists: 18 links (questionable)
- Footer/Sidebar: 8 links (problematic)
- Comment Spam: 4 links (remove/disavow)

Step 4: Clean-up actions

Immediate:
- Disavow 4 spam links
- Request removal of 8 footer links
- Evaluate 18 directory links individually

Ongoing:
- Focus on earning editorial links (34 → 60%)
- Pursue more product review placements
- Avoid directory submissions

Result:
- Cleaner link profile
- Better context quality
- Reduced spam risk
- More natural appearance
```

### Real-Life Example 3: Competitive Context Analysis

**Scenario**: Why competitor links are more valuable

```
Keyword: "best CRM software"

Your Site: crmtool.com
- Position: #7
- Total backlinks: 234
- Referring domains: 45

Competitor: crmbest.com
- Position: #2
- Total backlinks: 189
- Referring domains: 38

Question: Why do they rank higher with fewer links?

Link Context Analysis:

Your Link Example:
Source: businesstools.com
Context: "Various CRM solutions exist including crmtool.com, Salesforce, HubSpot, and others..."

Analysis:
- Mentioned in list format
- No specific discussion
- Equal weight to all options
- No distinguishing value

Competitor Link Example:
Source: businesstools.com (same site!)
Context: "After extensive testing of 12 CRM platforms, crmbest.com emerged as our top choice for small businesses. The intuitive interface reduced our team's learning curve by 70%, and the automation features saved us an estimated 15 hours per week. At $49/user/month, it offers the best value proposition in its category..."

Analysis:
✓ Detailed endorsement
✓ Specific metrics and benefits
✓ Context of testing/comparison
✓ Clear recommendation with reasoning
✓ Price point mentioned naturally

Finding: Same referring domain, dramatically different context quality

Systematic Analysis:

Checked 20 common referring domains:

Your Context Quality:
- Detailed endorsement: 2/20 (10%)
- Brief mention: 15/20 (75%)
- List inclusion: 3/20 (15%)

Competitor Context Quality:
- Detailed endorsement: 12/20 (60%)
- Brief mention: 6/20 (30%)
- List inclusion: 2/20 (10%)

Key Insights:
1. Same sites, different quality
2. Competitor has stronger relationships
3. More in-depth reviews/features
4. Better brand advocacy

Action Plan:

Short-term:
- Reach out to existing linking sites
- Request review updates with more detail
- Provide case studies and testimonials
- Offer product trials for testing

Medium-term:
- Develop review program with incentives
- Create detailed documentation for reviewers
- Build case study library
- Improve product features for genuine endorsements

Long-term:
- Focus on earning editorial endorsements
- Build relationships with industry reviewers
- Create content that naturally earns quality context
- Monitor and improve context quality metrics

Implementation (6 months):
- Contacted 25 existing referring sites
- 12 updated their coverage (48% success)
- New context includes specific features and benefits
- Rankings improved: #7 → #4
- Organic traffic: +89%
```

---

## Anchor Text Analysis

### Anchor Text Distribution

Healthy anchor text profile should include:
- **Branded (40-50%)**: Company name, brand variations
- **URL/Generic (20-30%)**: "click here", "website", naked URLs
- **Topical (15-25%)**: Relevant non-commercial terms
- **Commercial (5-15%)**: Target keywords, money terms
- **Other (5-10%)**: Images, misc.

### Real-Life Example 1: Over-Optimization Detection

**Scenario**: Site with unnatural anchor text profile

```
Website: lawncarepros.com

Current Anchor Text Distribution:

Exact Match Commercial (62%):
- "lawn care services" - 234 links
- "best lawn care company" - 189 links
- "professional lawn care" - 167 links
- "lawn maintenance services" - 143 links

Branded (15%):
- "Lawn Care Pros" - 89 links
- "lawncarepros.com" - 34 links

Generic/URL (18%):
- "click here" - 67 links
- naked URL - 45 links

Topical (3%):
- "lawn tips" - 12 links

Other (2%):
- Image links - 8 links

RED FLAGS:
1. 62% exact-match anchors (should be 5-15%)
2. Only 15% branded (should be 40-50%)
3. Minimal generic/URL anchors
4. Almost no topical variation

Risk Assessment: HIGH
- Classic over-optimization pattern
- Penguin penalty risk
- Unnatural link building history

Historical Analysis:

2018-2020:
- Purchased link packages
- Private blog network
- Article directories
- All used exact-match anchors

2021-2023:
- Google Penguin update hit site (-65% traffic)
- Recovery attempt started
- Some cleanup done

Current Situation (2024):
- Still suffering from old link profile
- Many toxic links remain
- Anchor text needs complete rebalancing

Recovery Plan:

Phase 1: Disavow toxic exact-match links (0-3 months)
- Export all "lawn care services" anchor links
- Filter TF < 10
- Review for spam indicators
- Created disavow file: 1,247 domains

Phase 2: Build natural branded links (3-9 months)
Target: 150+ new branded links

Tactics:
- Press releases → 23 branded links
- Sponsorships → 18 branded links
- Partnership pages → 31 branded links
- Customer testimonials → 45 branded links
- Social profiles → 33 branded links

Phase 3: Diversify anchor text (6-12 months)
Target distribution:
- Branded: 15% → 45%
- Generic/URL: 18% → 25%
- Topical: 3% → 20%
- Commercial: 62% → 10%

New link acquisition guidelines:
- 70% branded or generic anchors
- 20% topical variations
- 10% or less commercial

Phase 4: Monitoring (ongoing)
Monthly tracking:
- Anchor text distribution
- New link acquisition
- Rankings for commercial terms
- Overall organic traffic

Results (after 12 months):

Anchor Text Distribution:
- Branded: 42% ✓
- Generic/URL: 24% ✓
- Topical: 19% ✓
- Commercial: 12% ✓
- Other: 3% ✓

Impact:
- Traffic recovered: +127% from low point
- Rankings stabilized
- No penalty warnings
- Natural growth pattern established
```

### Real-Life Example 2: Strategic Anchor Text Planning

**Scenario**: Launching new service line

```
Company: SaaS productivity tool
New Feature: "Time tracking"
Goal: Rank for "time tracking software"

Current Situation:
- Established brand (TF 38)
- Known for project management
- Zero visibility for time tracking terms

Anchor Text Strategy:

Month 1-2: Brand + Feature
Target: "ProjectTool Time Tracking"
Placements: 15 links
Sources:
- Product update announcements
- Review site features
- Integration partners
Goal: Establish feature association

Month 3-4: Generic + URL
Target: Mix of "see more", "learn more", naked URLs
Placements: 25 links
Sources:
- Guest posts
- Resource pages
- Blog mentions
Goal: Natural profile building

Month 5-6: Topical Variations
Target: "time tracking features", "employee time tracking", "automatic time tracking"
Placements: 30 links
Sources:
- Educational content
- How-to guides
- Comparison articles
Goal: Build topical relevance

Month 7-9: Gradual Commercial Introduction
Target: "time tracking software" (very selectively)
Placements: 5-8 links (no more!)
Sources:
- High-authority reviews
- Earned editorial mentions only
- Curated resource lists
Goal: Direct ranking signal (controlled)

Month 10-12: Maintain Balance
Target: Mix of all types
Placements: 40 links
Distribution:
- 45% branded
- 25% generic
- 20% topical
- 10% commercial

Implementation Tracking:

Spreadsheet columns:
- Date acquired
- Source URL
- Target URL
- Anchor text
- Category (branded/generic/topical/commercial)
- TF of source
- Notes

Weekly review:
- Current distribution percentages
- Adjust new acquisition targets
- Ensure staying within guidelines

Results (12 months):

Anchor Text Distribution Achieved:
- "ProjectTool Time Tracking": 18% (branded + feature)
- "ProjectTool" + "our tool": 24% (pure branded)
- Generic/URL: 27%
- Topical variations: 23%
- "time tracking software" (target): 8%

Rankings:
- "time tracking software": #12 → #4
- "best time tracking app": #18 → #7
- "employee time tracking": Not ranking → #5
- "automatic time tracking": Not ranking → #8

Success Factors:
1. Gradual, natural-looking growth
2. Prioritized brand building first
3. Limited commercial anchor usage
4. Strong topical relevance built
5. High-quality source selection
```

### Real-Life Example 3: Anchor Text Forensics

**Scenario**: Investigating competitor's rankings

```
Mystery: New competitor dominating SERPs quickly

Competitor: quicksolutions.com
- Domain age: 14 months
- Rankings: #1-3 for 47 competitive terms
- Suspiciously fast growth

Anchor Text Investigation:

Step 1: Export all backlinks (Majestic)
- Total backlinks: 3,847
- Referring domains: 247
- Average age of links: 8 months

Step 2: Analyze anchor text distribution

Finding:
Commercial Anchors: 71%!!

Top anchors:
- "business solutions software" - 289 links (exact match)
- "best business software" - 267 links (exact match)
- "business management tools" - 234 links (exact match)
- "enterprise business software" - 201 links (exact match)

Branded: 12%
Generic: 11%
Topical: 6%

Step 3: Source analysis
- 89% from TF 5-15 sites (low quality)
- 67% from .info, .biz TLDs
- 54% footer sitewide links
- Same link patterns across network

Step 4: Cross-reference with Clique Hunter
- Found 89 sites linking with same anchors
- All part of coordinated network
- Clear PBN structure

Step 5: Temporal analysis
Link acquisition timeline:
- Month 1-2: 50 links/month (natural)
- Month 3-5: 200+ links/month (spike!)
- Month 6-8: 350+ links/month (massive spike!)
- Month 9-12: 180+ links/month
- Month 13-14: 40 links/month (sudden drop)

Pattern indicates:
- Aggressive link buying campaign
- Likely PBN usage
- Recent slowdown (ran out of inventory?)

Step 6: Compare with legitimate competitors

Established Competitor A:
- Commercial anchors: 9%
- Branded: 48%
- Generic: 28%
- Topical: 15%

Established Competitor B:
- Commercial anchors: 12%
- Branded: 43%
- Generic: 24%
- Topical: 21%

Your Site:
- Commercial anchors: 11%
- Branded: 45%
- Generic: 26%
- Topical: 18%

Suspicious Site:
- Commercial anchors: 71%
- Branded: 12%
- Generic: 11%
- Topical: 6%

Conclusion: Definite manipulation

Action Taken:
1. Documented evidence
2. Filed spam report with Google
3. Continued white-hat link building
4. Monitored situation

Outcome (8 months later):
- Competitor hit by manual action
- Rankings dropped dramatically
- Site deindexed for 4 months
- Slow recovery after cleanup
- Your site gained their positions

Lesson:
- Unnatural anchor text = early warning sign
- Short-term gains from manipulation
- Long-term penalty inevitable
- Staying white-hat wins eventually
```

---

## Referring Domains Analysis

### Key Metrics to Track

- **Total referring domains**: Unique domains linking to you
- **Domain quality**: Trust Flow distribution
- **Domain diversity**: TLD, country, topic variety
- **New vs. lost**: Net domain growth
- **Follow vs. nofollow**: Link equity distribution

### Real-Life Example 1: Referring Domain Velocity Analysis

**Scenario**: Understanding normal vs. abnormal growth

```
Website: marketingconsultancy.com

Historical Data (18 months):

Month 1-3:
- Starting RDs: 234
- New RDs: +12, +15, +11 = 38 total
- Lost RDs: -3, -5, -4 = 12 total
- Net: +26 RDs
- Average: 8.7 RDs/month

Analysis: Healthy, organic growth

Month 4-6:
- Starting RDs: 260
- New RDs: +18, +21, +16 = 55 total
- Lost RDs: -4, -6, -5 = 15 total
- Net: +40 RDs
- Average: 13.3 RDs/month

Analysis: Content marketing campaign paying off

Month 7-9:
- Starting RDs: 300
- New RDs: +156, +178, +134 = 468 total (!)
- Lost RDs: -8, -6, -7 = 21 total
- Net: +447 RDs (!)
- Average: 149 RDs/month

WARNING: Unnatural spike!

Investigation:
- Hired new SEO agency in Month 7
- They implemented "aggressive link building"
- Analysis of new domains:

New Domain Characteristics:
- 78% TF 0-10 (very low quality)
- 89% from overseas (.ru, .ua, .cn)
- 67% footer/sidebar sitewide links
- 92% same anchor text pattern
- Clear PBN indicators

Month 10-12:
- Google manual action received (Month 11)
- Stopped agency immediately
- Started disavow process
- RD count: 747 → 320 (cleaned up)
- Rankings: Dropped 60%

Month 13-18: Recovery
- Disavow file submitted
- Focused on quality link building
- New RDs: Slow, steady growth
- Average: 12 RDs/month (back to normal)
- Rankings: Recovering gradually (+40% from low point)

Lessons Learned:
1. Sudden velocity changes = red flag
2. Quality > quantity always
3. Vet agencies carefully
4. Monitor RD acquisition closely
5. Normal growth should be gradual and steady

Established Benchmarks:
For similar-sized sites in this niche:
- Normal growth: 8-15 RDs/month
- Good campaign: 15-25 RDs/month
- Suspicious: 50+ RDs/month
- Almost certainly spam: 100+ RDs/month
```

### Real-Life Example 2: Referring Domain Diversity Analysis

**Scenario**: Site with narrow referring domain profile

```
Website: locallawfirm.com

Current Referring Domains: 178

Breakdown Analysis:

By TLD:
- .com: 89 (50%)
- .org: 23 (13%)
- .net: 19 (11%)
- .info: 31 (17%)
- .biz: 16 (9%)

Issues:
- 26% from low-quality TLDs (.info, .biz)
- Need more authoritative domains

By Country:
- United States: 145 (81%)
- United Kingdom: 12 (7%)
- Canada: 8 (4%)
- Other: 13 (8%)

Analysis:
- Good: Strong US presence (local business)
- Acceptable geographic distribution

By Topic (Topical Trust Flow):
- Law/Legal: 67 (38%)
- Business: 34 (19%)
- Regional/Local: 28 (16%)
- General Directories: 31 (17%)
- Unrelated/Spam: 18 (10%)

Issues:
1. Only 38% from legal topics (should be 60%+)
2. Too many general directories (17%)
3. 10% spam domains (need cleanup)

By Page Type:
- Homepage: 89 (50%)
- Category/Resource pages: 45 (25%)
- Blog posts: 31 (17%)
- Directories: 13 (8%)

Analysis:
- Too many homepage links (suspicious)
- Need more contextual blog mentions

By Trust Flow:
- TF 0-10: 47 (26%) - Too high!
- TF 11-20: 62 (35%) - OK
- TF 21-30: 41 (23%) - Good
- TF 31-40: 21 (12%) - Great
- TF 41+: 7 (4%) - Excellent

Issues:
- 26% very low quality
- Need more high-TF domains

Improvement Strategy:

Phase 1: Cleanup (Month 1-2)
- Disavow 18 spam domains
- Request removal from 15 low-quality directories
- Focus on improving quality score

Phase 2: Legal Authority Building (Month 3-6)
Targets:
- Legal blogs and publications
- Bar association sites
- Legal directories (high-quality only)
- Law school resources

Goal: Increase legal topical percentage to 55%+

Phase 3: Diversify Quality (Month 6-12)
Acquisition targets by TF:
- 40% from TF 20-30 sites
- 30% from TF 30-40 sites
- 20% from TF 40+ sites
- 10% from TF 10-20 sites (organic only)

Phase 4: Content Diversity (Ongoing)
Target page types:
- Resource pages: 40% of new links
- Blog mentions: 35% of new links
- News/PR: 15% of new links
- Quality directories: 10% of new links

Results (12 months):

New Breakdown:

By TLD:
- .com: 65%
- .org: 22%
- .net: 8%
- .edu: 3%
- Other: 2%

By Topic:
- Law/Legal: 58% ✓
- Business: 21%
- Regional/Local: 14%
- Other: 7%

By Trust Flow:
- TF 0-10: 8% ✓
- TF 11-20: 32%
- TF 21-30: 35%
- TF 31-40: 18%
- TF 41+: 7%

Impact:
- Overall site TF: 28 → 34
- Rankings improved across board
- More natural, diverse profile
- Reduced spam risk significantly
```

### Real-Life Example 3: Lost Referring Domain Recovery

**Scenario**: Massive link loss event

```
Company: E-commerce fashion site

Event: Lost 156 referring domains in one month

Initial Panic Response:
- Traffic dropped 35%
- Rankings fell for 200+ keywords
- Sales declined 40%

Investigation Process:

Step 1: Categorize lost domains
Using Majestic Backlinks → Filter: Status = "Deleted"
Export all lost links from past 60 days

Analysis of 156 lost domains:

Category A: News/Magazine sites (47 domains)
- Fashion news sites
- Lifestyle magazines
- Celebrity gossip sites
- All removed links from old seasonal articles

Category B: Blogger Network (38 domains)
- Fashion blogger reviews
- Links from 2-3 year old posts
- Blogs shut down or redesigned

Category C: Aggregator Sites (29 domains)
- Price comparison sites
- Deal aggregators
- Shopping engines
- Removed old product listings

Category D: Social/UGC (24 domains)
- Forum posts deleted
- Social bookmarking sites
- Old Q&A threads removed

Category E: Partner Sites (18 domains)
- Retail partners changed sites
- Affiliate network changes
- Partnership ended

Step 2: Prioritize recovery efforts

High Priority (TF 30+ domains):
- 12 news/magazine sites
- Worth recovering: YES
- Approach: Pitch new seasonal content

Medium Priority (TF 20-29 domains):
- 23 blogger sites
- Worth recovering: MAYBE
- Approach: Check if still active, pitch updated content

Low Priority (TF < 20 domains):
- Remaining domains
- Worth recovering: Selective only
- Approach: Only if highly relevant

Step 3: Recovery campaigns

Campaign 1: News/Magazine Reactivation
Target: 12 high-TF news sites

Outreach:
"Hi [Editor],

We noticed your 2023 fall fashion trends article 
performed well. We'd love to collaborate on a 
2024 spring trends piece, featuring our new 
sustainable collection.

We can provide:
- Exclusive first-look images
- Designer interviews
- Trend data and insights

Would this interest your readers?"

Results: 7/12 accepted (58% success rate)

Campaign 2: Blogger Outreach
Target: 23 fashion bloggers (filtered to 15 still active)

Approach:
- Sent free products for review
- Offered affiliate commission
- Provided high-quality images

Results: 9/15 published new reviews (60%)

Campaign 3: New Link Building
Goal: Replace lost Category C-D links with better sources

Tactics:
- Created fashion trend reports
- Launched designer interview series
- Built industry resource guides
- Pursued high-quality directories

Results: 34 new referring domains acquired

Step 4: Diversification Strategy

To prevent future vulnerability:

Rule 1: No more than 10% of links from any single category
Rule 2: Build relationships, not just links
Rule 3: Create evergreen linkable assets
Rule 4: Maintain ongoing outreach (not campaign-based)

Implemented:
- Monthly linkable content calendar
- Relationship manager for key sites
- Quarterly link health audits
- Proactive link maintenance program

Final Results (6 months):

Referring Domains:
- Pre-loss: 389 RDs
- Post-loss: 233 RDs (-156)
- After recovery: 312 RDs
- Net result: -77 RDs but higher quality

Impact:
- Traffic: Recovered to 95% of previous levels
- Rankings: Back to 92% of previous positions
- Sales: Exceeded previous highs by 8%

Lessons:
1. Link loss is normal; panic is not productive
2. Focus on recovering high-value links only
3. Use crises as opportunity to improve quality
4. Diversification prevents catastrophic loss
5. Ongoing maintenance > reactive recovery
```

---

## Majestic Million

### What is Majestic Million?

A free daily-updated ranking of the top 1 million websites based on referring subnets (not domains). It provides:
- Global site rankings
- Referring subnet counts
- Trust Flow scores
- Historical data

### Real-Life Example 1: Competitive Benchmarking

**Scenario**: Understanding market position

```
Your Site: techstartupblog.com
Majestic Million Rank: 247,392

Competitor Analysis:

Direct Competitor A: techcrunch.com
- MM Rank: 1,423
- Referring Subnets: 84,234
- Trust Flow: 88
- Gap: 245,969 ranks

Direct Competitor B: thenextweb.com
- MM Rank: 8,912
- Referring Subnets: 31,456
- Trust Flow: 72
- Gap: 238,480 ranks

Direct Competitor C: betalist.com
- MM Rank: 156,742
- Referring Subnets: 4,892
- Trust Flow: 48
- Gap: 90,650 ranks (closest)

Realistic Targets:

Tier 1 Goal (6-12 months):
- Target MM Rank: 200,000
- Need: +1,500 referring subnets
- Strategy: Quality content + consistent outreach

Tier 2 Goal (12-24 months):
- Target MM Rank: 150,000
- Need: +2,000 additional referring subnets
- Strategy: Scale successful tactics

Tier 3 Goal (24-36 months):
- Target MM Rank: 100,000
- Need: +3,500 additional referring subnets
- Strategy: Establish authority status

Progress Tracking:

Month 1:
- MM Rank: 247,392
- Referring Subnets: 1,234
- Trust Flow: 31

Month 6:
- MM Rank: 221,156 (improved 26,236!)
- Referring Subnets: 1,789 (+555)
- Trust Flow: 35 (+4)

Month 12:
- MM Rank: 198,432 (improved 22,724!)
- Referring Subnets: 2,456 (+667)
- Trust Flow: 38 (+3)

On track to hit Tier 1 goal!

Analysis of Growth:
- Steady improvement
- Subnet growth accelerating
- Trust Flow climbing
- Realistic trajectory
```

### Real-Life Example 2: Industry Research

**Scenario**: Understanding niche landscape

```
Research Goal: Identify top players in "sustainable fashion" niche

Process:

Step 1: Manual research
- Google search for top sustainable fashion sites
- Industry reports
- Competitor analysis
- Found 50 relevant sites

Step 2: Check Majestic Million ranks
Export MM data for all 50 sites:

Top 10 Results:

1. patagonia.com
   - MM Rank: 12,345
   - TF: 78
   - Category: Retail/Advocacy

2. everlane.com
   - MM Rank: 45,678
   - TF: 62
   - Category: Retail

3. reformation.com
   - MM Rank: 67,890
   - TF: 58
   - Category: Retail

4. thegoodtrade.com
   - MM Rank: 89,234
   - TF: 51
   - Category: Media/Blog

5. sustainablejungle.com
   - MM Rank: 156,789
   - TF: 42
   - Category: Blog

... continuing to #10

Step 3: Segment by tier

Tier 1 (Unrealistic targets):
- MM Rank < 50,000
- Massive brands
- Not practical for link building

Tier 2 (Aspirational targets):
- MM Rank 50,000-150,000
- Established media sites
- Long-term relationship building

Tier 3 (Realistic targets):
- MM Rank 150,000-300,000
- Growing blogs and publications
- Active outreach targets

Tier 4 (Peer level):
- MM Rank 300,000+
- Similar authority
- Partnership opportunities

Step 4: Create target lists by tier

Tier 2 Targets (15 sites):
- Media/blog sites
- Accept guest contributions
- Strong topical authority
- Worth long-term investment

Tier 3 Targets (28 sites):
- Active bloggers
- Review products
- Collaborate on content
- Primary outreach focus

Tier 4 Peers (22 sites):
- Cross-promotion opportunities
- Guest post exchanges
- Joint ventures
- Networking focus

Step 5: Track competitive movement

Monthly monitoring:
- Which sites are rising/falling
- New entrants to track
- Opportunities from falling competitors
- Threats from rising competitors

Insights gained:
- Identified 5 rapidly rising blogs (future targets)
- Found 3 declining authorities (deprioritize)
- Discovered 7 new sites not previously known
- Mapped complete competitive landscape
```

### Real-Life Example 3: Link Prospect Qualification

**Scenario**: Quickly qualify link prospects at scale

```
Situation: Agency managing 50 clients
Challenge: Efficiently qualify thousands of potential link targets

Solution: Majestic Million as screening tool

Process:

Step 1: Build master prospect list
Sources:
- Client competitor analysis
- Content research
- Industry directories
- HARO respondents
- Guest post databases

Total prospects: 3,847 domains

Step 2: Append Majestic Million data
Using API:
- MM Rank
- Referring Subnets
- Trust Flow

Step 3: Create scoring system

Quality Score Formula:
Base score = 100

MM Rank:
- < 100,000: +25 points
- 100,000-500,000: +15 points
- 500,000-1,000,000: +5 points
- > 1,000,000: -15 points

Trust Flow:
- TF 40+: +25 points
- TF 30-39: +15 points
- TF 20-29: +10 points
- TF 10-19: +5 points
- TF < 10: -10 points

Referring Subnets:
- 10,000+: +15 points
- 1,000-9,999: +10 points
- 100-999: +5 points
- < 100: 0 points

Step 4: Segment prospects

Tier 1 (Score 130+):
- 287 prospects
- Priority outreach
- Personalized approach
- Senior team handles

Tier 2 (Score 110-129):
- 923 prospects
- Standard outreach
- Semi-personalized
- Mid-level team handles

Tier 3 (Score 90-109):
- 1,456 prospects
- Template-based outreach
- Junior team handles
- Scale approach

Tier 4 (Score < 90):
- 1,181 prospects
- Avoid/deprioritize
- Only if highly relevant
- Automated filtering

Step 5: Results tracking

After 6 months:

Tier 1 (287 prospects):
- Contacted: 287 (100%)
- Response rate: 34%
- Placement rate: 18%
- Links acquired: 52
- Average TF: 42
- Cost per link: $380 (labor + content)
- Value: $20,800

Tier 2 (923 prospects):
- Contacted: 731 (79%)
- Response rate: 22%
- Placement rate: 11%
- Links acquired: 80
- Average TF: 31
- Cost per link: $220
- Value: $17,600

Tier 3 (1,456 prospects):
- Contacted: 428 (29%)
- Response rate: 12%
- Placement rate: 6%
- Links acquired: 26
- Average TF: 23
- Cost per link: $180
- Value: $4,680

Tier 4: Mostly ignored (cost-benefit too low)

ROI Analysis:

Total links acquired: 158
Total cost: $41,940
Total estimated value: $43,080
ROI: 3% (break-even, but built assets)

Efficiency gains:
- 1,181 low-value prospects filtered out (saved ~200 hours)
- Focus on high-value targets yielded best results
- Clear prioritization framework
- Scalable process for agency

Key Learnings:
1. MM Rank excellent for quick qualification
2. Trust Flow + MM Rank = strong indicators
3. Focus resources on Tier 1-2 prospects
4. Systematic approach beats ad-hoc outreach
5. Data-driven prospecting saves time and money
```

---

## API Integration

### Majestic API Overview

**Available Endpoints:**
- GetIndexItemInfo: Get summary stats for a URL
- GetBackLinkData: Retrieve backlinks
- GetRefDomains: Get referring domains
- GetTopBackLinks: Get highest quality backlinks
- GetTopicalTrustFlow: Get topical categories
- GetAnchorText: Anchor text analysis

### Real-Life Example 1: Automated Monitoring System

**Scenario**: Build dashboard for 50 client sites

```python
# Python Example: Client Dashboard System

import requests
import pandas as pd
from datetime import datetime
import json

class MajesticMonitor:
    def __init__(self, api_key):
        self.api_key = api_key
        self.base_url = "https://api.majestic.com/api/json"
    
    def get_site_metrics(self, domain):
        """Get basic metrics for a domain"""
        params = {
            'app_api_key': self.api_key,
            'cmd': 'GetIndexItemInfo',
            'items': 1,
            'item0': domain,
            'datasource': 'fresh'
        }
        
        response = requests.get(self.base_url, params=params)
        data = response.json()
        
        return {
            'domain': domain,
            'trust_flow': data['DataTables']['Results']['Data'][0]['TrustFlow'],
            'citation_flow': data['DataTables']['Results']['Data'][0]['CitationFlow'],
            'ref_domains': data['DataTables']['Results']['Data'][0]['RefDomains'],
            'ext_backlinks': data['DataTables']['Results']['Data'][0]['ExtBackLinks'],
            'timestamp': datetime.now().isoformat()
        }
    
    def get_new_backlinks(self, domain, days=7):
        """Get backlinks discovered in last N days"""
        params = {
            'app_api_key': self.api_key,
            'cmd': 'GetBackLinkData',
            'item': domain,
            'datasource': 'fresh',
            'Count': 100,
            'from': days
        }
        
        response = requests.get(self.base_url, params=params)
        data = response.json()
        
        return data['DataTables']['BackLinks']['Data']
    
    def monitor_clients(self, client_domains):
        """Monitor all client sites"""
        results = []
        
        for domain in client_domains:
            try:
                metrics = self.get_site_metrics(domain)
                results.append(metrics)
                print(f"✓ {domain}: TF {metrics['trust_flow']}, CF {metrics['citation_flow']}")
            except Exception as e:
                print(f"✗ {domain}: Error - {str(e)}")
        
        return pd.DataFrame(results)
    
    def check_alerts(self, current_df, previous_df):
        """Check for significant changes"""
        alerts = []
        
        for _, current in current_df.iterrows():
            domain = current['domain']
            prev = previous_df[previous_df['domain'] == domain]
            
            if not prev.empty:
                prev = prev.iloc[0]
                
                # Trust Flow drop alert
                tf_change = current['trust_flow'] - prev['trust_flow']
                if tf_change <= -3:
                    alerts.append({
                        'domain': domain,
                        'type': 'TF Drop',
                        'change': tf_change,
                        'severity': 'HIGH'
                    })
                
                # Referring domains drop alert
                rd_change = current['ref_domains'] - prev['ref_domains']
                rd_pct = (rd_change / prev['ref_domains']) * 100 if prev['ref_domains'] > 0 else 0
                if rd_pct <= -10:
                    alerts.append({
                        'domain': domain,
                        'type': 'RD Drop',
                        'change': f"{rd_change} ({rd_pct:.1f}%)",
                        'severity': 'MEDIUM'
                    })
        
        return alerts

# Usage Example
monitor = MajesticMonitor(api_key="YOUR_API_KEY")

# Client list
clients = [
    'client1.com',
    'client2.com',
    'client3.com',
    # ... 47 more
]

# Weekly monitoring
current_data = monitor.monitor_clients(clients)
current_data.to_csv(f'client_metrics_{datetime.now().date()}.csv')

# Load previous week's data
previous_data = pd.read_csv('client_metrics_previous_week.csv')

# Check for alerts
alerts = monitor.check_alerts(current_data, previous_data)

if alerts:
    print("\n⚠️  ALERTS:")
    for alert in alerts:
        print(f"{alert['severity']}: {alert['domain']} - {alert['type']}: {alert['change']}")
```

**Implementation Results:**

Week 1:
- Monitored 50 sites successfully
- 3 alerts generated
- Caught 2 technical issues early
- Saved estimated 8 hours of manual checking

Week 4:
- Automated reporting to clients
- Dashboard shows trends over time
- Proactive issue detection
- Client satisfaction increased
```

### Real-Life Example 2: Competitive Intelligence System

**Scenario**: Track 10 competitors automatically

```python
# Competitor Tracking System

class CompetitorIntelligence:
    def __init__(self, api_key):
        self.api_key = api_key
        self.base_url = "https://api.majestic.com/api/json"
    
    def get_top_referring_domains(self, domain, count=50):
        """Get top referring domains for competitor"""
        params = {
            'app_api_key': self.api_key,
            'cmd': 'GetRefDomains',
            'item': domain,
            'datasource': 'fresh',
            'Count': count,
            'MaxSourceURLsPerRefDomain': 1
        }
        
        response = requests.get(self.base_url, params=params)
        data = response.json()
        
        return data['DataTables']['RefDomains']['Data']
    
    def analyze_competitor_links(self, your_domain, competitor_domains):
        """Find link opportunities from competitors"""
        
        # Get your referring domains
        your_rds = set([rd['Domain'] for rd in self.get_top_referring_domains(your_domain, 200)])
        
        opportunities = []
        
        for comp in competitor_domains:
            print(f"Analyzing {comp}...")
            comp_rds = self.get_top_referring_domains(comp, 200)
            
            for rd in comp_rds:
                rd_domain = rd['Domain']
                
                # Find domains linking to competitor but not to you
                if rd_domain not in your_rds:
                    opportunities.append({
                        'domain': rd_domain,
                        'trust_flow': rd['TrustFlow'],
                        'linking_to': comp,
                        'ref_domains': rd['RefDomains']
                    })
        
        # Remove duplicates and sort by quality
        df = pd.DataFrame(opportunities)
        df = df.drop_duplicates(subset=['domain'])
        df = df.sort_values('trust_flow', ascending=False)
        
        return df
    
    def track_competitor_growth(self, competitors):
        """Track competitor metrics over time"""
        tracking_data = []
        
        for comp in competitors:
            metrics = self.get_site_metrics(comp)
            metrics['date'] = datetime.now().date()
            tracking_data.append(metrics)
        
        return pd.DataFrame(tracking_data)

# Usage
intel = CompetitorIntelligence(api_key="YOUR_API_KEY")

your_site = "yoursite.com"
competitors = [
    'competitor1.com',
    'competitor2.com',
    'competitor3.com',
    'competitor4.com',
    'competitor5.com'
]

# Find link opportunities
print("Finding link opportunities...")
opportunities = intel.analyze_competitor_links(your_site, competitors)

# Filter for high-quality prospects
high_quality = opportunities[
    (opportunities['trust_flow'] >= 25) &
    (opportunities['ref_domains'] >= 100)
]

print(f"\nFound {len(high_quality)} high-quality link opportunities")
high_quality.to_csv('link_opportunities.csv', index=False)

# Track competitor growth monthly
growth_data = intel.track_competitor_growth(competitors)
growth_data.to_csv(f'competitor_tracking_{datetime.now().date()}.csv', index=False)
```

**Results (3 months):**

Opportunities Identified: 342
High-quality prospects: 89
Links acquired: 23 (26% success rate)
Time saved: ~40 hours/month
Cost savings: $6,000+ in research time
```

### Real-Life Example 3: Bulk Domain Analysis Tool

**Scenario**: Evaluate 1,000 expired domains for acquisition

```python
# Expired Domain Analyzer

class DomainAnalyzer:
    def __init__(self, api_key):
        self.api_key = api_key
        self.base_url = "https://api.majestic.com/api/json"
    
    def bulk_analyze(self, domains, batch_size=100):
        """Analyze domains in batches"""
        results = []
        
        for i in range(0, len(domains), batch_size):
            batch = domains[i:i+batch_size]
            
            # Build parameters for batch
            params = {
                'app_api_key': self.api_key,
                'cmd': 'GetIndexItemInfo',
                'datasource': 'historic',
                'items': len(batch)
            }
            
            # Add each domain
            for idx, domain in enumerate(batch):
                params[f'item{idx}'] = domain
            
            response = requests.get(self.base_url, params=params)
            data = response.json()
            
            for item in data['DataTables']['Results']['Data']:
                results.append({
                    'domain': item['Item'],
                    'trust_flow': item['TrustFlow'],
                    'citation_flow': item['CitationFlow'],
                    'ref_domains': item['RefDomains'],
                    'ext_backlinks': item['ExtBackLinks'],
                    'tf_cf_ratio': item['TrustFlow'] / item['CitationFlow'] if item['CitationFlow'] > 0 else 0
                })
            
            print(f"Processed {i+len(batch)}/{len(domains)} domains")
        
        return pd.DataFrame(results)
    
    def get_domain_history(self, domain):
        """Check historical link profile"""
        params = {
            'app_api_key': self.api_key,
            'cmd': 'GetBackLinkData',
            'item': domain,
            'datasource': 'historic',
            'Count': 100
        }
        
        response = requests.get(self.base_url, params=params)
        data = response.json()
        
        backlinks = data['DataTables']['BackLinks']['Data']
        
        # Analyze link quality
        spam_indicators = 0
        for link in backlinks:
            # Check for spam indicators
            if link['TrustFlow'] < 5:
                spam_indicators += 1
            if any(keyword in link['SourceURL'].lower() for keyword in ['casino', 'porn', 'pills', 'viagra']):
                spam_indicators += 1
        
        spam_ratio = spam_indicators / len(backlinks) if backlinks else 0
        
        return {
            'total_backlinks': len(backlinks),
            'spam_ratio': spam_ratio,
            'has_spam': spam_ratio > 0.2
        }
    
    def score_domain(self, domain_data, history):
        """Calculate domain quality score"""
        score = 0
        red_flags = []
        
        # Trust Flow (max 40 points)
        score += min(domain_data['trust_flow'], 40)
        
        # TF:CF Ratio (max 20 points)
        if domain_data['tf_cf_ratio'] >= 0.7:
            score += 20
        elif domain_data['tf_cf_ratio'] >= 0.5:
            score += 10
        else:
            red_flags.append("Low TF:CF ratio")
        
        # Referring Domains (max 20 points)
        if domain_data['ref_domains'] >= 100:
            score += 20
        elif domain_data['ref_domains'] >= 50:
            score += 15
        elif domain_data['ref_domains'] >= 20:
            score += 10
        elif domain_data['ref_domains'] >= 10:
            score += 5
        
        # Link Quality (max 20 points)
        if not history['has_spam']:
            score += 20
        else:
            score -= 30  # Penalty for spam
            red_flags.append("Spam history detected")
        
        return {
            'score': max(score, 0),
            'red_flags': red_flags,
            'grade': 'A' if score >= 80 else 'B' if score >= 60 else 'C' if score >= 40 else 'D' if score >= 20 else 'F'
        }

# Usage Example
analyzer = DomainAnalyzer(api_key="YOUR_API_KEY")

# List of expired domains to evaluate
expired_domains = [
    'expireddomain1.com',
    'expireddomain2.com',
    # ... 998 more
]

print("Analyzing 1,000 expired domains...")
bulk_results = analyzer.bulk_analyze(expired_domains)

# Filter for promising candidates (TF >= 20)
promising = bulk_results[bulk_results['trust_flow'] >= 20]
print(f"Found {len(promising)} promising domains")

# Deep analysis on promising candidates
detailed_results = []

for _, domain_data in promising.iterrows():
    domain = domain_data['domain']
    print(f"Deep analyzing {domain}...")
    
    history = analyzer.get_domain_history(domain)
    scoring = analyzer.score_domain(domain_data, history)
    
    detailed_results.append({
        'domain': domain,
        'trust_flow': domain_data['trust_flow'],
        'citation_flow': domain_data['citation_flow'],
        'ref_domains': domain_data['ref_domains'],
        'tf_cf_ratio': domain_data['tf_cf_ratio'],
        'spam_ratio': history['spam_ratio'],
        'score': scoring['score'],
        'grade': scoring['grade'],
        'red_flags': ', '.join(scoring['red_flags']) if scoring['red_flags'] else 'None'
    })

# Create final report
df_detailed = pd.DataFrame(detailed_results)
df_detailed = df_detailed.sort_values('score', ascending=False)

# Export results
df_detailed.to_csv('expired_domain_analysis.csv', index=False)

# Summary
grade_a = len(df_detailed[df_detailed['grade'] == 'A'])
grade_b = len(df_detailed[df_detailed['grade'] == 'B'])

print(f"\nAnalysis Complete!")
print(f"Grade A domains: {grade_a}")
print(f"Grade B domains: {grade_b}")
print(f"Recommended for acquisition: {grade_a + grade_b}")
```

**Results:**

From 1,000 expired domains analyzed:
- Grade A: 12 domains (excellent quality)
- Grade B: 34 domains (good quality)
- Grade C: 78 domains (acceptable)
- Grade D: 156 domains (poor)
- Grade F: 720 domains (avoid)

Acquired: 8 Grade A domains
Investment: $2,400 ($300/domain average)
Estimated value: $16,000+

Time saved: 160+ hours of manual analysis
```

---

## Competitive Analysis Workflows

### Complete Competitor Analysis Process

**Step-by-step workflow using Majestic**

### Real-Life Workflow: Complete Competitive Analysis

```
Project: Outrank competitor in "CRM software" niche

Your Site: ourcrm.com
- Trust Flow: 32
- Citation Flow: 41
- Referring Domains: 234
- Position: #8 for "best CRM software"

Target Competitor: crmexpert.com
- Trust Flow: 45
- Citation Flow: 52
- Referring Domains: 587
- Position: #3 for "best CRM software"

Phase 1: High-Level Analysis (Day 1)

Step 1.1: Compare core metrics
Tool: Site Explorer

Your Site:
- TF: 32
- CF: 41
- TF:CF Ratio: 0.78
- RDs: 234
- Backlinks: 4,523

Competitor:
- TF: 45 (+13 points)
- CF: 52 (+11 points)
- TF:CF Ratio: 0.87
- RDs: 587 (+353 domains)
- Backlinks: 12,847 (+8,324 links)

Key Gap: 353 more referring domains

Step 1.2: Historical growth analysis
Chart: Link profile growth over 2 years

Findings:
- Competitor adds ~25 RDs/month consistently
- You add ~12 RDs/month
- Need to double acquisition rate to catch up

Step 1.3: Topical Trust Flow comparison

Your Site Top Categories:
1. Computers > Software (TF: 28)
2. Business > Management (TF: 22)
3. Business > Business Services (TF: 19)

Competitor Top Categories:
1. Computers > Software (TF: 41)
2. Business > Management (TF: 38)
3. Business > Business Services (TF: 35)
4. Business > Small Business (TF: 31)

Gap: Missing strong presence in Small Business category

Phase 2: Link Source Analysis (Days 2-3)

Step 2.1: Export competitor's referring domains
Tool: Site Explorer → Referring Domains Tab
Export: Top 500 referring domains
Filter: TF >= 20

Step 2.2: Categorize link sources

Analysis of 500 domains:

Type A - Industry Publications (87 domains):
Examples:
- capterra.com (TF: 67)
- g2.com (TF: 72)
- softwareadvice.com (TF: 64)

Your coverage: 12 of these (14%)
Gap: 75 missing opportunities

Type B - Tech Blogs (134 domains):
Examples:
- techcrunch.com (TF: 88)
- thenextweb.com (TF: 72)
- venturebeat.com (TF: 75)

Your coverage: 23 of these (17%)
Gap: 111 missing opportunities

Type C - Business Resources (98 domains):
Examples:
- forbes.com/technology (TF: 86)
- entrepreneur.com (TF: 79)
- inc.com (TF: 82)

Your coverage: 8 of these (8%)
Gap: 90 missing opportunities

Type D - Integration Partners (76 domains):
Examples:
- zapier.com (TF: 68)
- integromat.com (TF: 52)
- workato.com (TF: 48)

Your coverage: 31 of these (41%)
Gap: 45 missing opportunities

Type E - Niche Blogs (105 domains):
Examples:
- crmblog.com (TF: 34)
- salesprocess.io (TF: 28)
- customersuccess.com (TF: 31)

Your coverage: 19 of these (18%)
Gap: 86 missing opportunities

Step 2.3: Prioritize by value

Scoring system:
- Trust Flow (40% weight)
- Topical relevance (30% weight)
- Traffic estimate (20% weight)
- Acquisition difficulty (10% weight)

Top 20 Priority Targets identified

Phase 3: Content Analysis (Days 4-5)

Step 3.1: Identify competitor's top pages
Tool: Site Explorer → Pages Tab
Sort by: External Backlinks

Competitor's Top 5 Pages:

1. /best-crm-comparison (245 RDs)
2. /crm-implementation-guide (198 RDs)
3. /free-crm-template (187 RDs)
4. /crm-integration-guide (156 RDs)
5. /crm-pricing-calculator (134 RDs)

Your comparable content:

1. /crm-comparison (34 RDs) - Gap: 211 RDs
2. No comparable page - Missing!
3. No comparable page - Missing!
4. /api-documentation (23 RDs) - Gap: 133 RDs
5. No comparable page - Missing!

Content Gaps Identified:
- Need implementation guide
- Need free template/tool
- Need pricing calculator
- Comparison needs major upgrade

Step 3.2: Analyze link sources for top pages

For /best-crm-comparison:
Common link sources:
- SaaS review sites
- Business tool directories
- Tech blogs doing roundups
- Startup resource lists

For /free-crm-template:
Common link sources:
- Productivity blogs
- Resource collection pages
- Tool aggregators
- Small business blogs

Pattern: Free tools/resources attract most links

Phase 4: Strategy Development (Days 6-7)

Strategy 1: Fill Content Gaps
Priority: HIGH

Create:
1. "Complete CRM Implementation Guide" (Month 1)
   - 10,000+ word comprehensive guide
   - Video tutorials
   - Step-by-step checklist
   - Case studies

2. "Free CRM Template & Setup Kit" (Month 2)
   - Excel/Google Sheets template
   - Setup checklist
   - Email templates
   - Video walkthrough

3. "CRM ROI Calculator" (Month 3)
   - Interactive tool
   - Personalized recommendations
   - PDF report generation
   - Lead magnet

Expected links: 150-200 across all three

Strategy 2: Target Priority Link Sources
Priority: HIGH

Tier 1 (20 targets):
- Industry review sites
- Major tech publications
- Approach: Product features, data partnerships

Tier 2 (50 targets):
- Tech and business blogs
- Approach: Expert quotes, guest posts

Tier 3 (100 targets):
- Niche CRM blogs
- Approach: Collaborations, resources

Timeline: 6 months
Expected success: 35-45 new links

Strategy 3: Build Topical Authority
Priority: MEDIUM

Focus category: Business > Small Business

Tactics:
- Create small business CRM guides
- Target small business publications
- Speak at small business events
- Partner with small business resources

Expected Topical TF increase: 12 → 25+

Strategy 4: Strengthen Weak Link Types
Priority: MEDIUM

Focus: Integration partnerships (currently 41% coverage)

Actions:
- Complete missing integrations
- Create integration guides
- Partner announcement posts
- Get listed in partner directories

Expected: 30-40 new integration-related links

Phase 5: Execution (Months 1-6)

Month 1:
- Created Implementation Guide
- Launched outreach to Tier 1 targets
- Results: 3 links, TF 45+ average

Month 2:
- Released Free CRM Template
- Continued Tier 1, started Tier 2 outreach
- Results: 18 new links
- Implementation Guide gained 12 natural links

Month 3:
- Launched ROI Calculator
- Full Tier 2 outreach
- Results: 21 new links
- Template gained 15 natural links

Month 4:
- Started Tier 3 outreach
- Small business content campaign
- Results: 28 new links
- Calculator gained 8 natural links

Month 5:
- Integration partnership push
- Continued all campaigns
- Results: 34 new links

Month 6:
- Sustained outreach
- Content update cycle
- Results: 23 new links

Total New Links: 147 new referring domains

Phase 6: Results Analysis (Month 6)

Before Campaign:
- Trust Flow: 32
- Citation Flow: 41
- Referring Domains: 234
- Position: #8

After Campaign:
- Trust Flow: 41 (+9)
- Citation Flow: 48 (+7)
- Referring Domains: 381 (+147)
- Position: #4 (+4 positions!)

Gap to Competitor:
- TF: 45 vs 41 (gap reduced from 13 to 4)
- CF: 52 vs 48 (gap reduced from 11 to 4)
- RDs: 587 vs 381 (gap reduced from 353 to 206)

Additional Impacts:
- Organic traffic: +156%
- Leads: +189%
- Trial signups: +223%
- Brand searches: +145%

ROI:
- Investment: $45,000 (content + outreach + tools)
- New MRR: $87,000
- LTV of new customers: $420,000+
- ROI: 833%

Key Success Factors:
1. Systematic competitive analysis
2. Data-driven prioritization
3. Focus on content gaps
4. Quality over quantity
5. Sustained execution
6. Regular monitoring and adjustment

Ongoing Strategy:
- Maintain 25+ new RDs/month
- Continue content updates
- Monitor competitor movements
- Build on successful tactics
- Expand to adjacent keywords
```

---

## Link Building Strategies

### Using Majestic for Link Prospecting

### Real-Life Strategy: Resource Page Link Building

```
Campaign: Build links for B2B SaaS tool

Goal: Acquire 50 high-quality links in 6 months

Strategy: Target resource pages and tool directories

Phase 1: Identify Resource Pages

Step 1: Find competitor links from resource pages

Majestic Process:
1. Site Explorer → Competitor domain
2. Backlinks tab
3. Filter URL patterns containing:
   - "/resources"
   - "/tools"
   - "/links"
   - "/directory"

Found: 147 resource page links to competitor

Step 2: Analyze resource page quality

For each resource page:
- Trust Flow
- Page content relevance
- Update frequency
- Contact information available

Filtered to: 89 high-quality resource pages

Step 3: Check current coverage

Cross-reference with your backlinks:
- You're on 12 of these pages (13%)
- Missing from 77 pages (87%)

Opportunity: 77 immediate targets

Step 4: Expand the list

Using Clique Hunter:
- Input the 89 resource page URLs
- Find pages that link to multiple competitors
- Discovered additional 54 resource pages

Total Target List: 131 resource pages

Phase 2: Qualification Process

Criteria for each target:
✓ Trust Flow ≥ 20
✓ Page updated within 12 months
✓ Clear submission process or contact
✓ Topically relevant
✓ No paid placement required

After qualification: 94 targets remain

Phase 3: Outreach Execution

Template Created:
"Subject: Resource suggestion for [Page Title]

Hi [Name],

I noticed your excellent resource page on [topic].

We've developed [Your Tool], which [brief value proposition]. 
It's been featured on [authority sites] and has helped 
[specific results].

I think it would be a valuable addition to your [specific 
section] section.

Would you consider adding it?

Here's the suggested description:
[Your Tool] - [One sentence description]

Thanks for maintaining such a helpful resource!

Best,
[Your Name]"

Outreach Results:

Month 1 (30 contacts):
- Response rate: 33%
- Added to resource: 7 (23%)
- TF average: 28

Month 2 (30 contacts):
- Response rate: 30%
- Added to resource: 8 (27%)
- TF average: 31

Month 3 (34 contacts):
- Response rate: 27%
- Added to resource: 6 (18%)
- TF average: 26

Total: 21 new links from 94 outreach attempts (22% success rate)

Phase 4: Second-Tier Strategy

Action: Find resource pages that don't link to competitors yet

Majestic Search Strategy:
1. Identify sites in your niche (from competitor analysis)
2. Use site:domain.com "resources" in Google
3. Check each page in Majestic
4. Verify they have authority but haven't linked to competitors

Found: 67 additional targets

Outreach Results (Months 4-6):
- Contacted: 67
- Success rate: 31% (higher!)
- New links: 21

Total Campaign Results:

Links Acquired: 42
Success Rate: 26%
Average TF: 29
Average acquisition time: 18 days
Cost per link: $48 (labor only)

Impact:
- Site TF: +4 points
- Rankings improved for 23 keywords
- Referral traffic: +890 visits/month
- Trial signups from referrals: 47
```

### Real-Life Strategy: Broken Link Building

```
Campaign: Tech blog link acquisition

Goal: Leverage broken links for placements

Phase 1: Finding Broken Links

Step 1: Identify competitor sites with broken links

Process:
1. Export competitor backlinks from Majestic
2. Check link status (Live/Deleted)
3. Filter for "Deleted" status
4. Focus on high-TF sources (30+)

Found: 234 broken links from high-authority sites

Step 2: Categorize broken link types

Analysis:
- Broken tool links: 89 (38%)
- Broken guide links: 67 (29%)
- Broken blog post links: 54 (23%)
- Other: 24 (10%)

Focus: Broken tool links (highest replacement opportunity)

Step 3: Verify broken links

Manual check of 89 tool links:
- Confirmed broken: 78
- Redirecting: 11 (skip these)

Step 4: Match with your content

Your content that can replace:
- Your tool: 34 opportunities
- Your guides: 28 opportunities
- Your blog posts: 16 opportunities

Total opportunities: 78 qualified targets

Phase 2: Outreach Execution

Outreach Template:

"Subject: Broken link on [Article Title]

Hi [Name],

I was reading your article "[Title]" and found it extremely 
helpful for [specific insight].

I noticed one of the links (to [broken URL]) is no longer 
working. It looks like the page was taken down.

We've created a similar resource that covers [topic]: 
[Your URL]

It includes [specific features that make it a good replacement].

Would you consider updating the link? Happy to provide any 
additional information.

Best regards,
[Your Name]"

Results by Source Type:

High-Authority Blogs (TF 40+):
- Targets: 23
- Response rate: 39%
- Link replacement: 8 (35% of responses)

Mid-Authority Blogs (TF 25-39):
- Targets: 34
- Response rate: 29%
- Link replacement: 11 (38% of responses)

Lower-Authority Blogs (TF 20-24):
- Targets: 21
- Response rate: 19%
- Link replacement: 5 (33% of responses)

Total Results:
- Outreach: 78 contacts
- Links acquired: 24 (31% success rate)
- Average TF: 33
- Time investment: 32 hours
- Cost per link: $67 (labor)

Phase 3: Scale the Strategy

Month 2 Expansion:

Action: Find broken links in broader niche

Process:
1. Identify top 50 authority sites in niche
2. Use broken link checker tools
3. Find pages with broken outbound links
4. Cross-reference with your content

Found: 156 additional opportunities

Results: 19 more links acquired

Total Campaign Results:

Links: 43 total
Success rate: 31%
Average TF: 31
Total time: 58 hours
Cost per link: $56

Bonus Benefits:
- Built relationships with 19 editors
- 7 requested future collaboration
- 3 became regular link sources
- Referral traffic: 1,240 visits/month
```

---

## Disavow File Creation

### Using Majestic for Link Audits

### Real-Life Example: Complete Link Audit & Disavow

```
Situation: E-commerce site with traffic decline

Site: outdoorgear.com
Issue: 40% organic traffic drop over 3 months
Suspect: Link-based penalty

Phase 1: Export Link Profile

Step 1: Export all backlinks from Majestic
- Data source: Historic Index (complete history)
- Export limit: All backlinks
- Result: 47,823 backlinks from 2,134 domains

Step 2: Initial analysis

Trust Flow Distribution:
- TF 0-5: 892 domains (42%) ← RED FLAG
- TF 6-10: 456 domains (21%)
- TF 11-20: 389 domains (18%)
- TF 21-30: 267 domains (13%)
- TF 31+: 130 domains (6%)

Problem: 63% of domains have TF ≤ 10

Phase 2: Identify Toxic Links

Red Flag Categories:

Category A: Very Low TF + High CF
Filter: TF < 5 AND CF > 20
Result: 234 domains
Reason: Link schemes, PBN indicators

Category B: Foreign Language Adult Content
Filter: Topic = "Adult"
Result: 167 domains
Reason: Link spam, negative association

Category C: Pharmaceutical/Casino Spam
Search: Anchor text contains "viagra", "casino", "poker", "pills"
Result: 89 domains
Reason: Clear spam signals

Category D: Sitewide Footer Links
Filter: Links per domain > 50
Result: 156 domains
Reason: Unnatural link patterns

Category E: Exact-Match Anchor Spam
Filter: Same exact-match anchor from domain
Result: 178 domains
Reason: Over-optimization

Category F: Known Link Networks
Cross-reference: Clique Hunter analysis
Result: 93 domains
Reason: PBN participation

Phase 3: Manual Review

Sample Review Process:

For each suspicious domain:
1. Visit site (if accessible)
2. Check link context
3. Verify topical relevance
4. Assess link placement
5. Check for other spam indicators

Review Results:

Tier 1 - Definite Spam (remove immediately):
- 567 domains
- Clear manipulation
- No value whatsoever

Tier 2 - Likely Spam (disavow):
- 289 domains
- Suspicious patterns
- Better safe than sorry

Tier 3 - Questionable (monitor):
- 156 domains
- Could be legitimate
- Watch for patterns

Tier 4 - Acceptable (keep):
- 1,122 domains
- Legitimate links
- Some value

Phase 4: Create Disavow File

Disavow File Structure:

```
# Disavow file for outdoorgear.com
# Created: 2024-11-17
# Reason: Link audit following traffic decline

# Category: Low-quality PBN networks
domain:spam-network-site1.com
domain:spam-network-site2.com
domain:spam-network-site3.com
[... 234 domains]

# Category: Adult content spam
domain:adult-spam1.com
domain:adult-spam2.com
[... 167 domains]

# Category: Pharmaceutical spam
domain:pharmacy-spam1.info
domain:pharmacy-spam2.biz
[... 89 domains]

# Category: Unnatural footer links
domain:footer-link-site1.com
domain:footer-link-site2.com
[... 156 domains]

# Category: Exact-match anchor spam
domain:exact-match-spam1.com
[... 178 domains]

# Category: Known link networks
domain:known-pbn1.com
[... 93 domains]

# Total domains disavowed: 917
```

Phase 5: Submission & Documentation

Documentation Created:

1. Audit Report:
   - Total links analyzed: 47,823
   - Total domains analyzed: 2,134
   - Domains disavowed: 917 (43%)
   - Domains kept: 1,217 (57%)

2. Evidence Package:
   - Screenshots of spam sites
   - Link pattern analysis
   - Anchor text distribution
   - Timeline of link acquisition

3. Outreach Log:
   - Removal requests sent: 145
   - Responses received: 23
   - Links removed: 12

Submission:
- Submitted to Google Search Console
- Backup copy saved
- Client notified

Phase 6: Monitoring Results

Week 2:
- No immediate changes (expected)
- Continued monitoring

Week 6:
- GSC confirms disavow processed
- Small ranking fluctuations

Week 10:
- Traffic starting to recover (+15%)
- Some rankings improving

Week 16:
- Traffic recovered to 85% of previous levels
- Most rankings restored
- Some keywords ranking higher than before

Month 6:
- Traffic exceeded previous levels (+12%)
- Rankings stable and improving
- New links being acquired naturally

Final Results:

Traffic Recovery: 112% of pre-penalty levels
Rankings: 94% restored, 15% improved
Time to Recovery: 4 months
Cost: $8,500 (audit + remediation)

Additional Actions Taken:

1. Updated link building guidelines
2. Implemented monthly link audits
3. Trained team on quality signals
4. Created approval process for new links
5. Regular monitoring system established

Prevention Measures:

Monthly Checks:
- New backlinks review (Majestic Fresh Index)
- Trust Flow monitoring
- Anchor text distribution
- Source diversity analysis

Quarterly Audits:
- Full link profile review
- Competitive comparison
- Disavow file updates
- Strategy adjustments

Lessons Learned:

1. Regular audits prevent major issues
2. Quality signals matter (TF/CF ratio)
3. Anchor text distribution is crucial
4. Diverse link sources are important
5. Fast action on suspicious links
6. Documentation is essential
7. Prevention is cheaper than recovery
```

---

## Advanced Use Cases

### 1. Link Velocity Analysis for Algorithm Updates

```
Scenario: Understand why site survived algorithm update

Site: healthblog.com
Situation: Niche hit by Google update, you weren't affected

Analysis Process:

Step 1: Compare your site vs. affected competitors

Your Site (unaffected):
Link Velocity (12 months):
- Jan-Mar: +23, +19, +27 RDs (avg 23/month)
- Apr-Jun: +21, +25, +24 RDs (avg 23/month)
- Jul-Sep: +22, +28, +26 RDs (avg 25/month)
- Oct-Dec: +24, +23, +27 RDs (avg 25/month)

Pattern: Steady, gradual growth

Competitor A (penalized):
Link Velocity (12 months):
- Jan-Mar: +12, +15, +11 RDs
- Apr-Jun: +89, +112, +94 RDs ← Spike!
- Jul-Sep: +87, +91, +85 RDs
- Oct-Dec: +14, +12, +9 RDs ← Sudden drop

Pattern: Unnatural spike then drop

Competitor B (penalized):
Link Velocity (12 months):
- Jan-Jun: +8, +9, +7, +11, +8, +10 RDs
- Jul-Dec: +67, +72, +69, +71, +68, +65 RDs

Pattern: Sudden sustained increase (link purchase?)

Key Insight: Your gradual, steady growth appeared natural
Affected sites had suspicious velocity patterns

Step 2: Analyze TF changes over time

Your Site:
- Jan: TF 34
- Mar: TF 35
- Jun: TF 37
- Sep: TF 38
- Dec: TF 40

Pattern: Gradual increase

Competitor A:
- Jan: TF 28
- Mar: TF 29
- Jun: TF 31 (slight increase)
- Sep: TF 29 (dropped!)
- Dec: TF 24 (major drop)

Competitor B:
- Jan: TF 31
- Jun: TF 32
- Sep: TF 26 (dropped)
- Dec: TF 23 (continued decline)

Insight: Your TF grew steadily, theirs declined

Conclusion: Natural link building velocity = algorithm immunity
```

### 2. International SEO Link Analysis

```
Scenario: Expanding to multiple countries

Company: SaaS product expanding from US to UK, Germany, France

Strategy: Build country-specific authority

Phase 1: Current State Analysis

Majestic Topical Trust Flow by Country:

United States:
- Total RDs: 456
- Average TF: 38
- Topical categories strong

United Kingdom:
- Total RDs: 23 (low!)
- Average TF: 28
- Weak topical presence

Germany:
- Total RDs: 8 (very low!)
- Average TF: 22
- Minimal presence

France:
- Total RDs: 12 (very low!)
- Average TF: 24
- Minimal presence

Phase 2: Competitive Analysis by Country

UK Market:

Top UK Competitor:
- UK RDs: 234
- UK TF: 42
- Sources: UK tech blogs, business publications

Action: Analyze their UK link sources
- Export referring domains
- Filter by: UK TLD (.co.uk)
- Filter by: UK IP addresses
- Result: 189 UK-specific targets identified

Germany Market:

Top DE Competitor:
- DE RDs: 189
- DE TF: 39
- Sources: German tech sites, business media

Action: Build German prospect list
- Identified 156 German link targets
- Hired German content writer
- Prepared translated resources

France Market:

Top FR Competitor:
- FR RDs: 167
- FR TF: 37
- Sources: French tech publications

Action: French link building plan
- 134 French targets identified
- French PR agency engaged
- Localized content created

Phase 3: Execution (12 months)

UK Campaign:
- Created UK-specific content
- UK press releases
- UK blogger outreach
- UK industry directories

Results:
- New UK RDs: 67
- UK TF improvement: 28 → 36
- UK organic traffic: +340%

Germany Campaign:
- Translated blog content
- German trade publications
- German tech news outreach
- German business directories

Results:
- New DE RDs: 43
- DE TF improvement: 22 → 32
- DE organic traffic: +520%

France Campaign:
- French content creation
- French media outreach
- French business partnerships
- French tech blogs

Results:
- New FR RDs: 39
- FR TF improvement: 24 → 31
- FR organic traffic: +480%

Monitoring:

Used Majestic to track:
- Country-specific referring domains
- Country-specific Trust Flow
- Geographic distribution of links
- Topical relevance by country

Final Results (12 months):

International RDs:
- UK: 23 → 90 (291% increase)
- DE: 8 → 51 (538% increase)
- FR: 12 → 51 (325% increase)

International Revenue:
- UK: +$145K MRR
- DE: +$98K MRR
- FR: +$87K MRR
- Total: +$330K MRR

ROI: 340%
```

### 3. Link Risk Scoring System

```
Scenario: Create automated link quality system

Goal: Score every backlink for risk level

Scoring System Design:

Risk Factors (each adds points, higher = worse):

1. Trust Flow (max -20 to +30 points):
   - TF 0-5: +30 points (high risk)
   - TF 6-10: +15 points
   - TF 11-20: +5 points
   - TF 21-30: 0 points
   - TF 31-40: -10 points (good)
   - TF 41+: -20 points (excellent)

2. TF:CF Ratio (max +25 points):
   - Ratio < 0.3: +25 points (spam indicator)
   - Ratio 0.3-0.5: +15 points
   - Ratio 0.5-0.7: +5 points
   - Ratio 0.7-1.2: 0 points
   - Ratio > 1.2: +5 points (unusual)

3. Anchor Text (max +20 points):
   - Exact-match commercial: +20 points
   - Partial-match commercial: +10 points
   - Branded: 0 points
   - Generic: 0 points
   - URL: 0 points

4. Link Type (max +15 points):
   - Footer/Sidebar: +15 points
   - Comment: +10 points
   - Forum signature: +10 points
   - In-content: 0 points

5. Topical Relevance (max +15 points):
   - Completely unrelated: +15 points
   - Loosely related: +8 points
   - Related: 0 points
   - Highly relevant: -5 points

6. Link Context (max +10 points):
   - No context: +10 points
   - Minimal context: +5 points
   - Good context: 0 points
   - Rich context: -5 points

Total Risk Score Interpretation:
- 0-20: Excellent link (keep)
- 21-40: Good link (keep)
- 41-60: Moderate risk (monitor)
- 61-80: High risk (consider disavow)
- 81+: Very high risk (disavow immediately)

Implementation:

Step 1: Export all backlinks with metrics from Majestic

Step 2: Apply scoring algorithm

Example Calculations:

Link A:
- TF: 8 (+15 points)
- TF:CF: 0.45 (+15 points)
- Anchor: "buy cheap widgets" (+20 points)
- Type: Footer (+15 points)
- Topical: Unrelated (+15 points)
- Context: None (+10 points)
Total: 90 points → DISAVOW

Link B:
- TF: 42 (-20 points)
- TF:CF: 0.92 (0 points)
- Anchor: "CompanyName" (0 points)
- Type: In-content (0 points)
- Topical: Highly relevant (-5 points)
- Context: Rich (-5 points)
Total: -30 points → EXCELLENT

Results from System:

Analyzed: 12,847 backlinks

Distribution:
- Excellent (0-20): 2,341 links (18%)
- Good (21-40): 4,567 links (36%)
- Moderate (41-60): 3,123 links (24%)
- High Risk (61-80): 1,890 links (15%)
- Very High Risk (81+): 926 links (7%)

Actions Taken:
- Disavowed: 926 very high risk
- Monitoring: 1,890 high risk
- Keeping: 10,031 acceptable links

Automated Monthly Review:
- Check new backlinks (Fresh Index)
- Apply risk scoring
- Flag links scoring 61+
- Review and add to disavow if needed
```

---

## Integration with Other Tools

### Majestic + Ahrefs + SEMrush Workflow

```
Scenario: Comprehensive backlink analysis using multiple tools

Why use multiple tools:
- Each has unique index
- Different strengths
- Cross-verification
- Find more opportunities

Workflow:

Phase 1: Initial Discovery (All Tools)

Majestic:
- Best for: Historical data, Trust Flow analysis
- Export: All referring domains (Historic Index)
- Result: 2,134 domains

Ahrefs:
- Best for: Fresh data, DR scoring
- Export: All referring domains
- Result: 1,987 domains

SEMrush:
- Best for: Authority Score, traffic estimates
- Export: All referring domains
- Result: 1,845 domains

Phase 2: Create Master List

Combine all exports:
- Total unique domains: 3,421
- Only in Majestic: 567
- Only in Ahrefs: 320
- Only in SEMrush: 234
- In all three: 1,876

Insight: Each tool found unique links!

Phase 3: Enrichment Process

For each domain, gather:
From Majestic:
- Trust Flow
- Citation Flow
- Topical Trust Flow
- Link context

From Ahrefs:
- Domain Rating
- Organic traffic
- Ranking keywords
- Link growth

From SEMrush:
- Authority Score
- Traffic estimate
- Top keywords
- Toxic score

Phase 4: Quality Assessment

Combined Scoring:
Domain quality = (Majestic TF × 0.3) + (Ahrefs DR × 0.3) + (SEMrush AS × 0.4)

Example:
Domain: techblog.com
- Majestic TF: 35 (35 × 0.3 = 10.5)
- Ahrefs DR: 42 (42 × 0.3 = 12.6)
- SEMrush AS: 48 (48 × 0.4 = 19.2)
- Combined Score: 42.3 (Good quality)

Phase 5: Link Building Prioritization

High Priority (Score 60+):
- 234 domains
- All metrics strong
- Worth significant effort

Medium Priority (Score 40-59):
- 678 domains
- Good metrics overall
- Standard outreach

Low Priority (Score < 40):
- 1,234 domains
- Mixed or weak metrics
- Low effort only

Results:

Links Acquired:
- From high priority: 34 (15%)
- From medium priority: 89 (13%)
- From low priority: 23 (2%)

ROI:
- High priority: Best ROI
- Medium priority: Good ROI
- Low priority: Poor ROI (as expected)

Validation:
- Cross-tool verification prevented 89 bad targets
- Found 203 unique opportunities missed by single-tool approach
- More accurate quality assessment
- Better prioritization
```

---

## Best Practices & Tips

### 1. Regular Monitoring Schedule

```
Daily Tasks:
- Check Fresh Index for new backlinks
- Monitor for spam attacks
- Track important keyword rankings

Weekly Tasks:
- Review Trust Flow trends
- Check new vs. lost referring domains
- Analyze competitor movements
- Review ongoing campaigns

Monthly Tasks:
- Comprehensive link audit
- Export full backlink profile
- Update disavow file if needed
- Competitive analysis refresh
- Report generation

Quarterly Tasks:
- Full link profile review
- Strategy adjustment
- Tool evaluation
- Team training updates

Annual Tasks:
- Complete domain authority assessment
- Multi-year trend analysis
- Comprehensive competitor study
- Budget planning for next year
```

### 2. Data Export Best Practices

```
Export Strategy:

Fresh Index:
- Use for: Current link building
- Export: Monthly minimum
- Focus: Last 120 days

Historic Index:
- Use for: Complete analysis
- Export: Quarterly
- Focus: Full historical data

Key Fields to Always Export:
- Source URL
- Target URL
- Anchor Text
- Trust Flow
- Citation Flow
- Link Type
- First Seen
- Last Seen
- Link Status

Organization:
- Date all exports
- Use consistent naming
- Store in organized folders
- Keep historical records
- Document methodology

Tools for Analysis:
- Excel/Google Sheets
- Python/R for large datasets
- Tableau/Power BI for visualization
- Custom scripts for automation
```

### 3. Common Mistakes to Avoid

```
Mistake 1: Focusing only on quantity
Solution: Prioritize Trust Flow and relevance over raw numbers

Mistake 2: Ignoring TF:CF ratio
Solution: Always check ratio; aim for 0.7-1.2

Mistake 3: Using only Fresh Index
Solution: Use Historic Index for complete picture

Mistake 4: Not checking link context
Solution: Always review actual link placement and surrounding content

Mistake 5: Automatic disavowing
Solution: Manual review before disavowing; some low-TF links are legitimate

Mistake 6: Ignoring topical relevance
Solution: Use Topical Trust Flow for better targeting

Mistake 7: Over-optimized anchor text
Solution: Maintain natural distribution (40-50% branded)

Mistake 8: Not monitoring competitors
Solution: Regular competitive analysis prevents being outpaced

Mistake 9: Neglecting link loss
Solution: Monitor and address lost high-value links

Mistake 10: Single-tool reliance
Solution: Cross-reference with other tools for complete picture
```

### 4. Pro Tips

```
Tip 1: Historic Index for Domain Research
When evaluating expired domains, ALWAYS check Historic Index
Look for: Past penalties, spam history, unnatural growth

Tip 2: Clique Hunter for PBN Detection
Before accepting any link offer, run domains through Clique Hunter
Red flag: Circular linking patterns

Tip 3: Link Context is Your Friend
Don't just count links; read the context
Quality context = quality link

Tip 4: Trust Flow Sweet Spot
For link building, target TF 25-45
Below 25: Often not worth it
Above 45: Usually very difficult to acquire

Tip 5: Topical Trust Flow for Niche Domination
Build authority in specific Topical TF categories
Focused topical authority > scattered general links

Tip 6: Regular Fresh Index Checks
Set up weekly checks for new backlinks
Catch spam early before it causes problems

Tip 7: Export, Export, Export
Always keep historical data exports
Invaluable for trend analysis and documentation

Tip 8: Competitor Tracking System
Monitor top 5 competitors monthly
Watch for: New link sources, growth patterns, penalties

Tip 9: Anchor Text Tracking
Maintain spreadsheet of all anchor text
Ensure healthy distribution over time

Tip 10: Documentation is Critical
Document everything: strategy, outreach, results
Essential for reporting, learning, and scaling
```

---

## Conclusion

Majestic SEO is an incredibly powerful tool for backlink analysis and link building when used systematically. Key takeaways:

**Strengths:**
- Largest historical link database
- Unique Trust Flow/Citation Flow metrics
- Excellent for link quality assessment
- Superior for penalty investigation
- Best-in-class topical categorization

**Best Use Cases:**
- Comprehensive backlink audits
- Competitor link analysis
- Link building prospecting
- PBN detection
- Historical link research
- Domain authority assessment

**Success Formula:**
1. Use both Fresh and Historic indexes
2. Focus on Trust Flow and quality metrics
3. Regularly monitor your link profile
4. Combine with other tools for complete picture
5. Maintain detailed documentation
6. Take action on insights gained

**Remember:**
Quality > Quantity
Context > Count
Strategy > Tactics
Consistency > Campaigns

---

## Additional Resources

**Official Resources:**
- Majestic Blog: majestic.com/blog
- API Documentation: developer-support.majestic.com
- Knowledge Base: support.majestic.com
- Community Forum: majestic.com/community

**Recommended Reading:**
- "The Art of SEO" by Eric Enge
- "Link Building for SEO" by Paddy Moogan
- Moz Blog: moz.com/blog
- Ahrefs Blog: ahrefs.com/blog
- Search Engine Journal: searchenginejournal.com

**Training:**
- Majestic Webinars
- SEO training courses
- Industry conferences
- Online communities

---

*This guide is based on real-world experience and best practices. Always adapt strategies to your specific situation and stay updated with algorithm changes and industry trends.*

*Last Updated: November 2024*
*Version: 2.0*
