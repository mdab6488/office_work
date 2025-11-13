
### Currency and Units

Displaying the right currency and measurement units is crucial for user experience and conversions.

#### Currency Implementation

**Best Practices:**

**1. Auto-Detection with Manual Override**

```html
Example: Shopify Store

Visitor from UK arrives:
- Auto-detected location: United Kingdom
- Display: £49.99 GBP
- Option to change: [🌍 US$ | €EUR | £GBP]
```

**Real Example: Amazon**
- amazon.com → $ (USD)
- amazon.co.uk → £ (GBP)
- amazon.de → € (EUR)
- amazon.co.jp → ¥ (JPY)

Each has localized pricing, not just currency conversion!

**2. Pricing Strategy - Not Just Conversion**

**Wrong Approach:**
```
US Price: $99.99
Simple Conversion to EUR: €92.45
```

**Right Approach (Localized Pricing):**
```
US Price: $99.99
UK Price: £89.99 (includes VAT, accounts for shipping, market positioning)
EU Price: €99.99 (includes VAT, round number preferred in Europe)
```

**Real Example: Apple Products**

```
MacBook Air (M2)
USA: $1,199
UK: £1,199 (not £1,077 direct conversion)
Germany: €1,499 (includes 19% VAT)
Australia: AU$1,899 (includes 10% GST)
```
Apple adjusts for taxes, import duties, and market expectations.

**3. Display Format**

Different countries format currency differently:

```
$1,234.56    (USA)
£1,234.56    (UK)
€1.234,56    (Germany - note comma/period swap!)
1 234,56 €   (France - space as thousands separator)
¥1,234       (Japan - no decimal places)
₹1,23,456.00 (India - different grouping: 1,23,456 not 123,456)
```

**Implementation Example:**

```javascript
// Good: Use Intl.NumberFormat API
const price = 1234.56;

// US format
new Intl.NumberFormat('en-US', { 
  style: 'currency', 
  currency: 'USD' 
}).format(price); // $1,234.56

// German format
new Intl.NumberFormat('de-DE', { 
  style: 'currency', 
  currency: 'EUR' 
}).format(price); // 1.234,56 €

// Japanese format
new Intl.NumberFormat('ja-JP', { 
  style: 'currency', 
  currency: 'JPY' 
}).format(price); // ¥1,235
```

#### Units and Measurements

**Real Example: Recipe Website**

**USA Version:**
```
Chocolate Chip Cookies Recipe

Ingredients:
- 2 cups all-purpose flour
- 1 cup butter (2 sticks)
- 3/4 cup sugar
- Oven: 350°F
- Bake for 12 minutes
```

**UK Version:**
```
Chocolate Chip Biscuits Recipe

Ingredients:
- 250g plain flour
- 225g butter
- 150g caster sugar
- Oven: 180°C / Gas Mark 4
- Bake for 12 minutes
```

**Key Differences:**
- "Cookies" → "Biscuits"
- Cups → Grams
- Fahrenheit → Celsius + Gas Mark
- Volume → Weight (Europeans prefer weight)

**Real Example: Nike Running App**

**US User:**
```
Today's Run:
Distance: 3.1 miles
Pace: 7:30 per mile
Elevation: 150 feet
Temperature: 72°F
```

**European User:**
```
Today's Run:
Distance: 5.0 km
Pace: 4:39 per km
Elevation: 45 meters
Temperature: 22°C
```

**Implementation for E-commerce:**

```html
<!-- Product Dimensions -->

US Site:
<div class="dimensions">
  Dimensions: 24" W × 36" H × 18" D
  Weight: 45 lbs
</div>

EU Site:
<div class="dimensions">
  Dimensions: 61 cm L × 91 cm H × 46 cm P
  Poids: 20.4 kg
</div>
```

---
