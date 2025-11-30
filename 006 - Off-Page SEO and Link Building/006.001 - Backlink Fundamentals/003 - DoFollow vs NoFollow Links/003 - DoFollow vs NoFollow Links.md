
### DoFollow vs NoFollow Links

**DoFollow Links** (Default)
- Pass link equity to the linked page
- Tell search engines to follow and count this link
- Contribute to SEO rankings
- HTML: `<a href="example.com">Link</a>`

**NoFollow Links**
- Do NOT pass link equity (technically)
- Tell search engines not to count this link for rankings
- Still valuable for traffic and brand exposure
- HTML: `<a href="example.com" rel="nofollow">Link</a>`

**Real-Life Examples:**

```
DOFOLLOW EXAMPLE:
Forbes publishes an article about the best productivity apps:

"Notion has revolutionized workspace management [link to notion.so]"
→ This DoFollow link passes equity and helps Notion rank better

NOFOLLOW EXAMPLE:
Amazon product review by a customer:

"Check out my blog for more reviews [link]"
→ Amazon uses rel="nofollow" on user-generated content to 
   prevent spam and manipulation
```

**When Sites Use NoFollow:**
1. **Paid Links** - Required by Google guidelines
   - Sponsored blog posts
   - Affiliate links
   
2. **User-Generated Content** - Prevent spam
   - Blog comments (WordPress defaults to nofollow)
   - Forum signatures
   - Social media links (Twitter, Facebook, etc.)

3. **Untrusted Content**
   - Links to sites you don't vouch for

**Real Example:**
```
YouTube Comment Section:
"Great video! Check out my channel: youtube.com/channel/abc123"

This link is automatically nofollow because it's user-generated 
content. YouTube can't vouch for every link users post.
```

**Important Note (2019 Update):**
Google changed how they treat nofollow. Now it's a "hint" rather than a directive. Links marked nofollow might still influence rankings in some cases.

**New Attributes:**
- `rel="sponsored"` - For paid/sponsored links
- `rel="ugc"` - For user-generated content
- `rel="nofollow"` - General nofollow

---
