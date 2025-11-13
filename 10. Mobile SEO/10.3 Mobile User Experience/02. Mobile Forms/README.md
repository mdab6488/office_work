
### Mobile Forms

Forms are critical conversion points. Mobile form optimization can dramatically improve completion rates.

#### **Best Practices with Examples:**

**1. Optimize Input Types for Mobile Keyboards**

```html
<!-- Example: E-commerce Checkout Form -->
<form class="mobile-form" action="/checkout" method="post">
  
  <!-- Email input triggers email keyboard -->
  <div class="form-group">
    <label for="email">Email Address</label>
    <input 
      type="email" 
      id="email" 
      name="email"
      autocomplete="email"
      placeholder="you@example.com"
      required
      aria-required="true"
    >
  </div>
  
  <!-- Tel input triggers number keyboard with special chars -->
  <div class="form-group">
    <label for="phone">Phone Number</label>
    <input 
      type="tel" 
      id="phone" 
      name="phone"
      autocomplete="tel"
      placeholder="(555) 123-4567"
      pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
    >
  </div>
  
  <!-- Number input for numeric-only fields -->
  <div class="form-group">
    <label for="quantity">Quantity</label>
    <input 
      type="number" 
      id="quantity" 
      name="quantity"
      min="1"
      max="10"
      value="1"
      inputmode="numeric"
    >
  </div>
  
  <!-- Credit card with proper masking -->
  <div class="form-group">
    <label for="card">Card Number</label>
    <input 
      type="text" 
      id="card" 
      name="card"
      inputmode="numeric"
      autocomplete="cc-number"
      placeholder="1234 5678 9012 3456"
      pattern="[0-9\s]{13,19}"
      maxlength="19"
    >
  </div>
  
  <!-- Date input -->
  <div class="form-group">
    <label for="expiry">Expiration Date</label>
    <input 
      type="month" 
      id="expiry" 
      name="expiry"
      autocomplete="cc-exp"
    >
  </div>
  
  <!-- URL input -->
  <div class="form-group">
    <label for="website">Website</label>
    <input 
      type="url" 
      id="website" 
      name="website"
      autocomplete="url"
      placeholder="https://example.com"
    >
  </div>
  
  <button type="submit" class="btn-submit">Complete Order</button>
</form>

<style>
.mobile-form {
  padding: 16px;
  max-width: 600px;
  margin: 0 auto;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  font-size: 14px;
}

.form-group input {
  width: 100%;
  padding: 12px 16px;
  font-size: 16px; /* Prevents iOS zoom */
  border: 1px solid #ddd;
  border-radius: 8px;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #007aff;
  box-shadow: 0 0 0 3px rgba(0,122,255,0.1);
}

.btn-submit {
  width: 100%;
  padding: 16px;
  font-size: 18px;
  font-weight: 600;
  background: #007aff;
  color: white;
  border: none;
  border-radius: 8px;
  min-height: 48px;
}
</style>
```

**Real-Life Example: Airbnb Mobile**
- Uses date pickers for check-in/check-out (not text input)
- Number keyboard for guest count
- Location field uses autocomplete with Google Places API
- Progress indicator shows form completion status

**2. Auto-fill and Smart Suggestions**

```html
<!-- Example: Registration Form with Autocomplete -->
<form autocomplete="on">
  <!-- Name fields -->
  <input 
    type="text" 
    name="fname" 
    autocomplete="given-name"
    placeholder="First Name"
  >
  <input 
    type="text" 
    name="lname" 
    autocomplete="family-name"
    placeholder="Last Name"
  >
  
  <!-- Address autocomplete -->
  <input 
    type="text" 
    name="address" 
    autocomplete="street-address"
    placeholder="Street Address"
  >
  <input 
    type="text" 
    name="city" 
    autocomplete="address-level2"
    placeholder="City"
  >
  <input 
    type="text" 
    name="state" 
    autocomplete="address-level1"
    placeholder="State"
  >
  <input 
    type="text" 
    name="zip" 
    autocomplete="postal-code"
    inputmode="numeric"
    placeholder="ZIP Code"
  >
  
  <!-- Payment autocomplete -->
  <input 
    type="text" 
    name="cc-name" 
    autocomplete="cc-name"
    placeholder="Name on Card"
  >
  <input 
    type="text" 
    name="cc-number" 
    autocomplete="cc-number"
    inputmode="numeric"
    placeholder="Card Number"
  >
</form>
```

**Key Autocomplete Values:**
- `name` - Full name
- `given-name` - First name
- `family-name` - Last name
- `email` - Email address
- `tel` - Phone number
- `street-address` - Full address
- `postal-code` - ZIP code
- `cc-number` - Credit card number
- `cc-exp` - Card expiration

**3. Single-Column Layout**

```html
<!-- BAD: Multi-column on mobile -->
<div class="form-row-bad">
  <input type="text" placeholder="First Name" style="width: 48%">
  <input type="text" placeholder="Last Name" style="width: 48%">
</div>

<!-- GOOD: Single column, one field at a time -->
<div class="form-stack">
  <div class="form-field">
    <label for="first-name">First Name</label>
    <input type="text" id="first-name" name="first-name">
  </div>
  <div class="form-field">
    <label for="last-name">Last Name</label>
    <input type="text" id="last-name" name="last-name">
  </div>
</div>

<style>
.form-stack {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.form-field {
  width: 100%;
}

.form-field input {
  width: 100%;
  padding: 12px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 4px;
}
</style>
```

**Real-Life Example: Stripe Payment Forms**
- One input per line
- Large, tappable fields (minimum 44px height)
- Real-time validation feedback
- Card type detection (Visa/Mastercard icon appears)

**4. Error Handling and Validation**

```html
<!-- Example: Real-time validation -->
<div class="form-group">
  <label for="email-input">Email Address</label>
  <input 
    type="email" 
    id="email-input"
    aria-describedby="email-error"
    aria-invalid="false"
  >
  <span id="email-error" class="error-message" role="alert"></span>
</div>

<script>
const emailInput = document.getElementById('email-input');
const errorSpan = document.getElementById('email-error');

emailInput.addEventListener('blur', function() {
  if (!this.validity.valid) {
    this.setAttribute('aria-invalid', 'true');
    errorSpan.textContent = 'Please enter a valid email address';
    this.classList.add('input-error');
  } else {
    this.setAttribute('aria-invalid', 'false');
    errorSpan.textContent = '';
    this.classList.remove('input-error');
  }
});
</script>

<style>
.input-error {
  border-color: #d32f2f !important;
  background-color: #ffebee;
}

.error-message {
  display: block;
  color: #d32f2f;
  font-size: 14px;
  margin-top: 4px;
  min-height: 20px;
}

.error-message:empty {
  display: none;
}
</style>
```

**Real-Life Example: Google Forms Mobile**
- Inline validation as you type
- Clear error messages below each field
- Red border and icon for errors
- Success indicators (green checkmark)

**5. Progress Indicators for Multi-Step Forms**

```html
<!-- Example: Multi-step form progress -->
<div class="form-progress">
  <div class="progress-steps">
    <div class="step completed">
      <div class="step-number">✓</div>
      <div class="step-label">Contact</div>
    </div>
    <div class="step active">
      <div class="step-number">2</div>
      <div class="step-label">Shipping</div>
    </div>
    <div class="step">
      <div class="step-number">3</div>
      <div class="step-label">Payment</div>
    </div>
  </div>
  <div class="progress-bar">
    <div class="progress-fill" style="width: 66%"></div>
  </div>
</div>

<style>
.progress-steps {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.step {
  flex: 1;
  text-align: center;
}

.step-number {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #e0e0e0;
  color: #666;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 4px;
  font-weight: 600;
}

.step.active .step-number {
  background: #007aff;
  color: white;
}

.step.completed .step-number {
  background: #4caf50;
  color: white;
}

.step-label {
  font-size: 12px;
  color: #666;
}

.progress-bar {
  height: 4px;
  background: #e0e0e0;
  border-radius: 2px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: #007aff;
  transition: width 0.3s ease;
}
</style>
```

---
