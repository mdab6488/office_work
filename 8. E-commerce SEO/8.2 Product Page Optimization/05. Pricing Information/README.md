
### 💵 Pricing Information

Pricing is critical for both conversions and SEO. Transparent, optimized pricing information improves user experience and search visibility.

#### Pricing Display Best Practices

**1. Clear Price Display**

✅ **Good:**
```html
<div class="product-price">
  <span class="current-price">$129.99</span>
  <span class="original-price">$179.99</span>
  <span class="savings">Save $50 (28%)</span>
  <span class="price-note">Free shipping</span>
</div>
```

❌ **Bad:**
```html
<div class="price">
  Call for price
  Price available after login
  See cart for price
</div>
```

**2. Price Comparison**

Show value:
```html
<div class="pricing-info">
  <div class="your-price">
    <label>Your Price:</label>
    <span class="price">$129.99</span>
  </div>
  
  <div class="list-price">
    <label>List Price:</label>
    <span class="strikethrough">$179.99</span>
  </div>
  
  <div class="savings">
    <label>You Save:</label>
    <span class="highlight">$50 (28%)</span>
  </div>
</div>
```

**3. Bulk Pricing**

For wholesale or quantity discounts:
```html
<table class="bulk-pricing">
  <tr>
    <th>Quantity</th>
    <th>Price Per Unit</th>
  </tr>
  <tr>
    <td>1-10</td>
    <td>$12.99</td>
  </tr>
  <tr>
    <td>11-50</td>
    <td>$11.49 (11% off)</td>
  </tr>
  <tr>
    <td>51+</td>
    <td>$9.99 (23% off)</td>
  </tr>
</table>
```

#### Real-Life Example: Amazon Pricing

Amazon's pricing strategy is masterful:

**Price Display Elements:**

1. **Main Price** (large, prominent)
```
$129.99
```

2. **List Price** (if different)
```
List Price: $179.99
```

3. **Savings Badge**
```
Save $50 (28%)
```

4. **Subscribe & Save Option**
```
Subscribe & Save: $123.49 (5% off)
Deliver every: [1 month ▼]
```

5. **Other Sellers**
```
Other sellers on Amazon: $131.99
Used from: $89.99
```

6. **Price History** (via browser extensions)
```
30-day price history:
High: $149.99
Low: $124.99
Average: $134.99
```

#### Pricing Schema Markup

Include pricing in your product schema:

```json
{
  "@type": "Offer",
  "price": "129.99",
  "priceCurrency": "USD",
  "priceValidUntil": "2025-12-31",
  "availability": "https://schema.org/InStock",
  
  // Optional: Show sale price
  "priceSpecification": {
    "@type": "PriceSpecification",
    "price": "129.99",
    "priceCurrency": "USD",
    "valueAddedTaxIncluded": false
  }
}
```

#### Dynamic Pricing Considerations

Many e-commerce sites use dynamic pricing. SEO considerations:

**1. Price Changes**
- Update schema markup when prices change
- Use `priceValidUntil` to indicate temporary prices
- Don't hide prices from search engines

**2. Personalized Pricing**
```
❌ Don't show different prices to Googlebot
✅ Show consistent pricing to all users
✅ Use coupons/promo codes for discounts instead
```

**3. Geolocation Pricing**

If prices vary by location:
```html
<!-- Show default price in HTML -->
<span class="price" data-currency="USD">$129.99</span>

<!-- Update with JavaScript after detection -->
<script>
// Detect user location
// Update price and currency
// Keep schema markup updated
</script>
```

#### Real-Life Example: Booking.com Pricing

Booking.com handles complex pricing:

**Display Elements:**

1. **Base Price**
```
$189 per night
```

2. **Tax and Fees**
```
+ $25 taxes and fees
Total: $214
```

3. **Price Breakdown**
```
2 nights: $378
Taxes & fees: $50
Total: $428
```

4. **Discount Indicators**
```
🏷️ 15% discount applied
Today's deal!
Only 2 rooms left at this price
```

5. **Price Comparison**
```
Our price: $189
Average price: $210
You save: $21 (10%)
```

#### Shipping Costs and Total Price

Include shipping in total price transparency:

```html
<div class="price-summary">
  <div class="line-item">
    <span>Subtotal:</span>
    <span>$129.99</span>
  </div>
  
  <div class="line-item">
    <span>Shipping:</span>
    <span class="free">FREE</span>
  </div>
  
  <div class="line-item">
    <span>Tax:</span>
    <span>$10.40</span>
  </div>
  
  <div class="total">
    <span>Total:</span>
    <span>$140.39</span>
  </div>
  
  <div class="delivery-note">
    Estimated delivery: Nov 8-10
  </div>
</div>
```

#### Price Anchoring Psychology

Use psychological pricing tactics:

**1. Comparison Pricing**
```
Was: $179.99
Now: $129.99
```

**2. Bundle Pricing**
```
Buy individually: $189
Bundle price: $139
Save: $50
```

**3. Decoy Pricing**
```
Basic: $49
→ Pro: $79 (Most Popular!)
Enterprise: $149
```

---
