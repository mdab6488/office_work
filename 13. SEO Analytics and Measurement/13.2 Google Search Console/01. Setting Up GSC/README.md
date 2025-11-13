
### 2.1 Setting Up GSC

#### What is Google Search Console?

Google Search Console is a free tool that helps you monitor, maintain, and troubleshoot your site's presence in Google Search results. Unlike GA4 (which tracks all traffic), GSC focuses specifically on organic search performance.

#### Verification Methods

**Step 1: Add Your Property**

```plaintext
1. Go to https://search.google.com/search-console
2. Click "Add Property"
3. Choose property type:
   - Domain Property: https://example.com (covers all subdomains & protocols)
   - URL Prefix: https://www.example.com (specific URL only)
```

**Verification Methods:**

**Method 1: HTML File Upload (Recommended)**

```plaintext
1. Download verification file: google[xxxx].html
2. Upload to your website root directory
3. Verify it's accessible: https://yoursite.com/google[xxxx].html
4. Click "Verify" in GSC

File Location:
/public_html/google[xxxx].html  (cPanel)
/var/www/html/google[xxxx].html  (Linux)
```

**Method 2: HTML Meta Tag**

```html
<!-- Add to <head> section of homepage -->
<meta name="google-site-verification" content="your_verification_code" />
```

**Method 3: Google Analytics**

```plaintext
If you already have GA4 set up:
1. Select "Google Analytics" verification method
2. GSC automatically verifies using your GA property
3. Must be an admin on both GSC and GA4
```

**Method 4: Google Tag Manager**

```plaintext
If using GTM:
1. Select "Google Tag Manager" method
2. GSC verifies through your GTM container
3. Must have GTM container on site
```

**Method 5: DNS Verification (For Domain Property)**

```plaintext
1. Copy TXT record from GSC
2. Add to your DNS provider:

   Type: TXT
   Name: @
   Value: google-site-verification=xxxxxxxxxxxx
   TTL: 3600

3. Wait for DNS propagation (can take up to 48 hours)
4. Click "Verify" in GSC
```

**Real-Life Setup Example:**

```plaintext
Company: DigitalMarketingHub.com
Property Type: Domain Property (covers all subdomains)
Verification: DNS Method

Reason for DNS:
✓ Covers all subdomains (blog.site.com, shop.site.com)
✓ Covers both HTTP and HTTPS
✓ Verification persists even if website changes
✓ Cleaner than HTML file method

Setup Time: 24 hours (DNS propagation)
Status: Verified ✓

Properties Created:
1. https://digitalmarketinghub.com
2. https://www.digitalmarketinghub.com
3. https://blog.digitalmarketinghub.com

All properties linked to same DNS verification.
```

#### Post-Verification Setup

```plaintext
1. Add Users:
   Settings → Users and permissions → Add user
   - Owners: Full access, can add/remove users
   - Full users: All access except user management
   - Restricted: View-only access

2. Link to GA4:
   Settings → Associations → Associate with GA4 property
   (Enables cross-platform reporting)

3. Submit Sitemap:
   Sitemaps → Add new sitemap → Enter sitemap URL
   Example: https://yoursite.com/sitemap.xml

4. Set Up Email Notifications:
   Settings → Notification preferences
   ✓ Site issues
   ✓ Manual actions
   ✓ New security issues
```

---
