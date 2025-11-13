
### 1.1 Setting Up GA4

#### What is GA4?

Google Analytics 4 is the latest version of Google Analytics, replacing Universal Analytics (which sunset in July 2023). GA4 uses an event-based model rather than session-based tracking, providing more flexibility and privacy-focused measurement.

#### Step-by-Step Setup Process

**Step 1: Create a GA4 Property**

```plaintext
1. Go to admin.google.com/analytics
2. Click "Admin" (gear icon) → "Create Property"
3. Enter Property Details:
   - Property Name: "YourWebsite.com - GA4"
   - Reporting Time Zone: Your local timezone
   - Currency: Your business currency
4. Click "Next" → Select Industry & Business Size
5. Click "Create" → Accept Terms of Service
```

**Step 2: Set Up Data Stream**

```plaintext
For Website:
1. Select "Web" as platform
2. Enter Website URL: https://yourwebsite.com
3. Stream Name: "Main Website"
4. Enable Enhanced Measurement (recommended)
   ✓ Page views
   ✓ Scrolls
   ✓ Outbound clicks
   ✓ Site search
   ✓ Video engagement
   ✓ File downloads
```

**Step 3: Install Tracking Code**

**Method 1: Google Tag Manager (Recommended)**

```html
<!-- Add to <head> section -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-XXXXXXX');</script>

<!-- Add immediately after <body> -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-XXXXXXX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
```

**Method 2: Direct Installation (gtag.js)**

```html
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

**Real-Life Example:**

An e-commerce store "TechGadgets.com" set up GA4 with these parameters:
- Property Name: TechGadgets.com - GA4
- Time Zone: America/New_York
- Currency: USD
- Industry: Electronics
- They used Google Tag Manager for easier tag management and future integrations

#### Verification

```plaintext
Test Your Setup:
1. Open your website in a new browser
2. Go to GA4 → Reports → Realtime
3. You should see yourself as an active user within 30 seconds
4. Navigate to different pages to verify tracking
```

---
