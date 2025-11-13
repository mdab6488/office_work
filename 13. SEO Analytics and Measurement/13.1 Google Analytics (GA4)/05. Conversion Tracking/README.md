
### 1.5 Conversion Tracking

#### Setting Up Conversions

**What are Conversions?**

Conversions are important events that indicate success for your business goals (purchases, signups, downloads, etc.).

**Step-by-Step Conversion Setup:**

```plaintext
1. Navigate to: Admin → Events → Mark as conversion
2. Create a new event or convert existing event
3. Toggle "Mark as conversion" for key events

Common Conversion Events:
✓ purchase (e-commerce)
✓ generate_lead (form submissions)
✓ sign_up (account creation)
✓ add_to_cart (shopping cart)
✓ begin_checkout (checkout start)
✓ download (file downloads)
✓ contact (contact form)
```

#### E-commerce Tracking

**Enhanced E-commerce Setup:**

```javascript
// Product View
gtag('event', 'view_item', {
  'currency': 'USD',
  'value': 99.99,
  'items': [{
    'item_id': 'SKU_12345',
    'item_name': 'Wireless Headphones',
    'item_category': 'Electronics',
    'item_brand': 'TechBrand',
    'price': 99.99,
    'quantity': 1
  }]
});

// Add to Cart
gtag('event', 'add_to_cart', {
  'currency': 'USD',
  'value': 99.99,
  'items': [{
    'item_id': 'SKU_12345',
    'item_name': 'Wireless Headphones',
    'price': 99.99,
    'quantity': 1
  }]
});

// Purchase
gtag('event', 'purchase', {
  'transaction_id': 'T_12345',
  'value': 109.99,
  'tax': 10.00,
  'shipping': 5.00,
  'currency': 'USD',
  'items': [{
    'item_id': 'SKU_12345',
    'item_name': 'Wireless Headphones',
    'price': 99.99,
    'quantity': 1
  }]
});
```

**Real-Life E-commerce Conversion Analysis:**

```plaintext
ElectronicsStore.com - Conversion Funnel
═════════════════════════════════════════

30-Day Performance:
─────────────────────────────────────────
Stage                    Users     Conversion %   Drop-off
────────────────────────────────────────────────────────────
1. Product Page Views    50,000    -              -
2. Add to Cart          12,500    25.0%          75.0%
3. Begin Checkout        8,750    70.0%          30.0%
4. Shipping Info         7,000    80.0%          20.0%
5. Payment Info          6,300    90.0%          10.0%
6. Purchase Complete     5,600    88.9%          11.1%

Overall Conversion Rate: 11.2%

Revenue Breakdown:
─────────────────────────────────────────
Metric                              Value
─────────────────────────────────────────
Total Revenue                   $504,000
Average Order Value               $90.00
Transaction Count                  5,600
Revenue per User                  $10.08
Cost per Acquisition              $12.50
Return on Ad Spend (ROAS)          3.2x

Optimization Opportunities:
─────────────────────────────────────────
1. Add to Cart (25% - LOW)
   → Add urgency messaging ("Only 3 left!")
   → Show customer reviews on product page
   → Offer free shipping threshold
   
2. Checkout Drop-off (11.1%)
   → Simplify checkout process
   → Add trust badges
   → Offer guest checkout option
   
3. Product Page Engagement
   → Add comparison charts
   → Include video demonstrations
   → Show "Frequently Bought Together"
```

#### Lead Generation Tracking

**Lead Form Setup:**

```javascript
// Form Start (user begins filling)
gtag('event', 'form_start', {
  'form_id': 'contact_form',
  'form_name': 'Contact Us',
  'page_location': window.location.href
});

// Lead Generated (form submitted)
gtag('event', 'generate_lead', {
  'value': 50.00,  // estimated lead value
  'currency': 'USD',
  'form_id': 'contact_form',
  'form_name': 'Contact Us'
});
```

**Real-Life Lead Generation Example:**

```plaintext
B2B SaaS Company - Lead Quality Analysis
═════════════════════════════════════════════

Traffic Source Lead Analysis (Last Quarter):
─────────────────────────────────────────────────────────────
Source          Leads   MQL Rate   SQL Rate   Customer   CAC
─────────────────────────────────────────────────────────────
Organic Search    450     42%        18%        8.5%     $180
Paid Search       380     38%        22%        12%      $420
Content/Blog      290     35%        15%        6.2%     $95
LinkedIn Ads      210     45%        25%        15%      $580
Webinars          180     62%        38%        22%      $340
Referrals         120     58%        35%        28%      $65
─────────────────────────────────────────────────────────────
Total           1,630     44%        23%        12.8%    $285

MQL = Marketing Qualified Lead
SQL = Sales Qualified Lead
CAC = Customer Acquisition Cost

Key Insights:
✓ Webinars have highest conversion (22%) but lower volume
✓ Referrals are most cost-effective ($65 CAC)
✓ Paid search expensive but converts well (12%)
✓ Organic search provides volume + reasonable CAC

Strategy Adjustments:
→ Increase webinar frequency (2x per month → 4x)
→ Build referral program with incentives
→ Optimize paid search for lower-funnel keywords
→ Create more downloadable content for organic
```

---
