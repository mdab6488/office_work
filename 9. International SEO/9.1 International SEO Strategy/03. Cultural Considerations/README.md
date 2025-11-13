
#### Cultural Considerations

**1. Date & Number Formats**

```html
<!-- US Format -->
<time datetime="2025-03-15">March 15, 2025</time>
<span>Price: $1,234.56</span>

<!-- UK Format -->
<time datetime="2025-03-15">15 March 2025</time>
<span>Price: £1,234.56</span>

<!-- Germany Format -->
<time datetime="2025-03-15">15. März 2025</time>
<span>Preis: 1.234,56 €</span>

<!-- Japan Format -->
<time datetime="2025-03-15">2025年3月15日</time>
<span>価格: ¥123,456</span>
```

**Implementation with JavaScript:**

```javascript
// Automatic locale formatting
const date = new Date('2025-03-15');
const price = 1234.56;

// US
console.log(date.toLocaleDateString('en-US')); // 3/15/2025
console.log(price.toLocaleString('en-US', {style: 'currency', currency: 'USD'})); 
// $1,234.56

// Germany
console.log(date.toLocaleDateString('de-DE')); // 15.3.2025
console.log(price.toLocaleString('de-DE', {style: 'currency', currency: 'EUR'})); 
// 1.234,56 €

// Japan
console.log(date.toLocaleDateString('ja-JP')); // 2025/3/15
console.log(price.toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'})); 
// ¥123,456
```

---

**2. Content & Imagery**

**Real-Life Example: IKEA**

```markdown
# IKEA Product Catalogs by Region

## Sweden (Home Market)
- Apartments: 60m² (small, typical Swedish size)
- Featured: Multi-functional furniture
- Models: Predominantly Swedish/Nordic looking

## US Market
- Apartments: 90m² (larger spaces)
- Featured: Bigger furniture, super-king beds
- Models: Diverse ethnic representation

## Middle East
- Separate sections for men and women
- No images of people in swimwear
- Prayer room furniture featured

## Japan
- Apartments: 50m² (very small)
- Focus: Ultra-compact, space-saving
- Futon-style beds, sliding doors
```

---

**3. Payment Methods**

**Critical for E-commerce SEO & Conversion:**

```markdown
# United States
- Credit Cards: 80%
- PayPal: 60%
- Digital Wallets: 40%

# Germany
- SEPA Direct Debit: 70%
- Invoice (pay after delivery): 60%
- PayPal: 50%
- Credit Cards: Only 40% (less trusted)

# China
- WeChat Pay: 85%
- Alipay: 80%
- UnionPay: 50%
- Credit Cards: 20%

# India
- UPI (Unified Payments Interface): 60%
- Cash on Delivery: 50%
- Digital Wallets (Paytm, PhonePe): 40%
- Credit Cards: 20%

# Netherlands
- iDEAL: 70%
- PayPal: 40%
- Credit Cards: 30%
```

**Example Implementation:**

```html
<!-- Payment Methods Display by Region -->

<!-- Germany -->
<div class="payment-methods" data-region="de">
  <img src="sepa.svg" alt="SEPA Lastschrift">
  <img src="rechnung.svg" alt="Kauf auf Rechnung">
  <img src="paypal.svg" alt="PayPal">
  <span class="trust-badge">Käuferschutz inklusive</span>
</div>

<!-- China -->
<div class="payment-methods" data-region="cn">
  <img src="wechat-pay.svg" alt="微信支付">
  <img src="alipay.svg" alt="支付宝">
  <img src="unionpay.svg" alt="银联">
</div>
```

---

**4. Privacy Laws & Compliance**

Different regions have different legal requirements affecting SEO:

```markdown
# GDPR (European Union)
- Cookie consent required BEFORE loading analytics
- Affects: GA4, Facebook Pixel, etc.
- Penalty: Up to €20 million or 4% of annual turnover

# CCPA/CPRA (California)
- "Do Not Sell My Info" link required
- Privacy policy must list all data collected

# China
- Personal Information Protection Law (PIPL)
- Data localization (must store in China)
- Government approval for cross-border data transfer

# Brazil
- LGPD (Lei Geral de Proteção de Dados)
- Similar to GDPR
- Penalties up to R$50 million
```

**SEO Impact Example:**

```javascript
// BEFORE (Non-compliant in EU)
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>

// AFTER (GDPR Compliant)
<script type="text/plain" data-cookie-consent="analytics">
  // Analytics code only loads AFTER user consent
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID', {
    'anonymize_ip': true,
    'cookie_flags': 'SameSite=None;Secure'
  });
</script>

// Impact: May have less tracking data in EU regions
// But necessary for compliance
```
