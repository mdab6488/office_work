
## Tips & Tricks

### Power User Strategies

#### **1. The "Link Reclamation" Strategy**

```
Problem: You've been mentioned online but without a link!

Solution Using Majestic:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Step 1: Find Brand Mentions
- Use Google: "YourBrand" -site:yourdomain.com
- Find pages mentioning you

Step 2: Check in Majestic
- Run Site Explorer on YOUR site
- Look for anchor text = your brand name
- Cross-reference with Google results

Step 3: Identify Non-Linked Mentions
- Sites mentioning you WITHOUT linking
- Usually: News sites, blogs, forums

Step 4: Outreach
Email template:
"Hi [Author],
Thanks for mentioning [YourBrand] in your article!
I noticed the mention wasn't linked. Would you mind
adding a link to help readers find us?
Thanks!"

Success Rate: 30-50% conversion
Effort: Low (already mentioned you!)
Result: Easy, high-quality backlinks
```

---

#### **2. The "Broken Link Building" Method**

```
Advanced Technique Using Majestic:

Step 1: Find Competitors' Dead Pages
- Site Explorer → Competitor domain
- Filter backlinks by HTTP status: 404

Step 2: Identify High-Value 404s
Example finding:
competitor.com/ultimate-seo-guide (404)
- Had 50 backlinks
- Avg Trust Flow of linkers: 40
- Recently went down

Step 3: Create Better Content
- Write YOUR version of the guide
- Make it more comprehensive
- Update for current year
- Add visuals, data, examples

Step 4: Outreach to Linkers
"Hi [Name],
I noticed you linked to [competitor's dead page].
Unfortunately, it's no longer available (404 error).

I recently published a comprehensive guide on
the same topic that your readers might find helpful:
[your-link]

Would you consider updating the link?
Best regards!"

Success Rate: 20-30%
Value: Each conversion = TF 40 backlink!
```

---

#### **3. The "Resource Page Jackpot"**

```
What Are Resource Pages?
- Pages listing "helpful resources" in a niche
- Usually .edu, .gov, or authority sites
- Easy to get listed (just ask!)
- High Trust Flow links

Finding Them with Majestic:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Step 1: Identify Known Resource Page
- Google: [your topic] + "resources"
- Example: "digital marketing resources"
- Find a good one (edu site, TF 50+)

Step 2: Run Majestic Site Explorer
- Analyze the resource page
- Check "Referring Domains"
- Look at WHO ELSE links to this page

Step 3: Hypothesis
If Site A links to this resource page,
Site A might have its OWN resource page!

Step 4: Verify
- Visit each referring domain
- Search for: site:domain.com "resources"
- Build list of 50+ resource pages

Step 5: Mass Outreach
"Hi,
I noticed your [topic] resource page.
I created [brief description of your resource].
Would you consider adding it?
Thanks!"

Result: 10-20 new high-authority links!
```

---

#### **4. Export & Filter Like a Pro**

```
Majestic CSV Export Tricks:

1. EXPORT BACKLINKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- Site Explorer → Backlinks tab
- Click "Download" → CSV
- Import to Excel/Google Sheets

2. FILTER IN EXCEL
Formulas to Use:

// Find .edu backlinks
=IF(RIGHT(A2,4)=".edu", "EDU", "")

// Calculate TF/CF ratio
=B2/C2

// Flag potential spam
=IF(C2/B2>2, "CHECK", "OK")

// Count links per domain
=COUNTIF($A$2:$A$1000,A2)

3. SORT & PRIORITIZE
Sort by:
1. Trust Flow (descending)
2. Domain extension (.edu, .gov first)
3. Relevance (topical trust flow)

4. CREATE TARGET LIST
Filter for:
- TF 30-60 (not too big, not too small)
- Your industry topic
- Active sites (recently updated)

Result: Laser-focused outreach list!
```

---

#### **5. Monitoring Negative SEO**

```
Protect Your Site from Attacks:

Setup Weekly Monitoring:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Create Campaign for your site
2. Enable email alerts
3. Set alert triggers:
   - 50+ new backlinks in one day
   - Sudden TF drop (5+ points)
   - Links from suspicious TLDs (.ru, .cn, etc.)

4. Weekly Manual Check:
   - Review new backlinks
   - Sort by Trust Flow (ascending)
   - Look for patterns:
     ⚠ Same anchor text 50+ times
     ⚠ Links from adult/casino sites
     ⚠ All on same IP (PBN)
     ⚠ Foreign language sites (if you're English)

5. If Attack Detected:
   a) Document everything
   b) Screenshot bad links
   c) Export full list
   d) Create disavow file
   e) Submit to Google Search Console
   f) Monitor recovery

Prevention:
→ Keep Trust Flow healthy
→ Monitor weekly (not monthly!)
→ Act fast (within 48 hours)
```

---

### Hidden Features

```
🔍 HIDDEN GEM #1: Link Density Report
Location: Site Explorer → Ref Domains → Click a domain
Shows: How many links per page from that domain
Use: Identify if links are sitewide (footer) or editorial

🔍 HIDDEN GEM #2: Link Context Export
Most people ignore this!
Use: Verify link quality at scale
Export contexts → Search for spam patterns

🔍 HIDDEN GEM #3: Topical Trust Flow Categories
500+ specific categories available
Use: Find hyper-relevant link opportunities
Example: Not just "Health" but "Health/Fitness/Yoga"

🔍 HIDDEN GEM #4: Majestic Million CSV
Download entire top 1M sites list
Use: Offline prospecting, Excel analysis
Free even without subscription!

🔍 HIDDEN GEM #5: Fresh Index Update Speed
Fresh Index updates vary by site
Check "Last Crawled" date
High-authority sites = crawled daily
Your site = might be weekly
Use: Time your link building campaigns
```

---
