
### 6.7.2 Link Audits

#### What Is a Link Audit?

A link audit is a comprehensive review of all backlinks pointing to your website to identify and address toxic, spammy, or low-quality links.

#### When to Conduct a Link Audit

**Required Circumstances:**
```
□ Received a manual penalty from Google
□ Traffic dropped suddenly and significantly
□ After acquiring a domain (inheritance of previous owner's links)
□ Suspect negative SEO attack
□ Before launching major SEO campaign
```

**Recommended Schedule:**
```
- New websites: Once at 6 months
- Established sites: Quarterly (every 3 months)
- High-risk industries (loans, legal, adult): Monthly
- After algorithm updates: As needed
```

#### Complete Link Audit Process

**Phase 1: Data Collection (Week 1)**

**Tools Needed:**
- Google Search Console (free)
- Ahrefs or SEMrush (paid)
- Moz Link Explorer (paid)
- Excel or Google Sheets

**Step-by-Step:**

```markdown
1. Export Links from Google Search Console
   - Login to Search Console
   - Navigate to Links > Top linking sites
   - Click "Export" > Download "More sample links"
   - Save as GSC_Links.csv

2. Export from Ahrefs
   - Go to Site Explorer
   - Enter your domain
   - Backlinks > Export
   - Select "All backlinks"
   - Save as Ahrefs_Links.csv

3. Export from SEMrush (if available)
   - Backlink Analytics
   - Export backlinks
   - Save as SEMrush_Links.csv

4. Combine Data Sources
   - Merge all CSV files
   - Remove duplicates
   - Total unique linking domains
```

**Phase 2: Categorization (Week 2)**

```markdown
Create Spreadsheet with Columns:
| Domain | Page URL | Anchor Text | DR/DA | Toxic Score | Category | Action |

Categories:
1. Excellent (Keep)
   - High authority
   - Relevant industry
   - Editorial mention
   
2. Good (Keep)
   - Medium authority
   - Some relevance
   - Natural link
   
3. Questionable (Review)
   - Low authority but legitimate
   - Tangentially relevant
   - Could go either way
   
4. Toxic (Disavow)
   - Spam
   - Malicious
   - Clear violation

5. Unknown (Research)
   - Need more information
   - Manual site visit required
```

**Phase 3: Analysis**

**Real-Life Example Audit:**

```markdown
Website: OnlinePetStore.com
Total Backlinks: 5,000
Unique Domains: 500

Breakdown:

Excellent (Keep) - 100 domains (20%)
Examples:
✓ ASPCA.org - Article about responsible pet ownership
✓ DogTime.com - Product review
✓ LocalNews.com - Feature on local businesses

Good (Keep) - 200 domains (40%)
Examples:
✓ PetBlogger.com (DA 25) - Guest post
✓ LocalDirectory.com - Business listing
✓ CommunityForum.com - User mention

Questionable (Review) - 50 domains (10%)
Examples:
⚠️ GeneralBusinessDirectory.com (DA 15)
⚠️ LinkSubmissionSite.net (DA 10)
⚠️ RandomBlog2019.com (DA 8)

Toxic (Disavow) - 100 domains (20%)
Examples:
✗ BestCasinoOffers.ru (spam)
✗ PharmacyDiscounts247.info (spam)
✗ FreeLinks.biz (link farm)
✗ HackedWordPressSite.com (compromised)

Unknown (Research) - 50 domains (10%)
Examples:
? ForeignPetSite.jp (need translation)
? NewPetBlog2024.com (no traffic data)
? AmbiguousDirectory.org (unclear quality)
```

**Phase 4: Detailed Review**

**Manual Check Process:**

```markdown
For Each Questionable/Unknown Link:

1. Visit the Site
   □ Does it load properly?
   □ Professional design?
   □ Real content?
   □ Updated recently?

2. Check Link Context
   □ Where is the link? (footer, content, sidebar)
   □ Is it natural or spammy?
   □ Does anchor text make sense?
   □ Editorial or automated?

3. Review Site Metrics
   □ Organic traffic (SimilarWeb/Ahrefs)
   □ Domain age
   □ Backlink profile
   □ Social presence

4. Make Decision
   Keep = Legitimate, valuable
   Disavow = Harmful, spammy
   Monitor = Watch for changes
```

**Phase 5: Documentation**

```markdown
Create Audit Report:

Executive Summary:
- Total backlinks analyzed: 5,000
- Unique domains: 500
- Toxic domains identified: 100 (20%)
- Action items: 3

Link Profile Health:
- Excellent links: 20%
- Good links: 40%
- Questionable: 10%
- Toxic: 20%
- Unknown: 10%

Key Findings:
1. Negative SEO attack detected (50 Russian spam sites)
2. Old PBN links from previous owner (30 domains)
3. Hacked site links (20 domains)

Recommendations:
1. Immediate disavow of 100 toxic domains
2. Monitor 50 questionable domains
3. Request removal from 20 legitimate sites
4. Set up monthly monitoring going forward
```

---
