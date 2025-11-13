
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.



### Minification (CSS, JavaScript, HTML)

Minification removes unnecessary characters without changing functionality.

#### CSS Minification

**Before (styles.css - 45 KB):**
```css
/* Header Styles */
.header {
    background-color: #333333;
    padding: 20px;
    margin: 0 auto;
    max-width: 1200px;
}

.header .logo {
    font-size: 24px;
    color: #ffffff;
    font-weight: bold;
}

/* Navigation */
.nav {
    display: flex;
    justify-content: space-between;
}
```

**After Minification (styles.min.css - 12 KB):**
```css
.header{background-color:#333;padding:20px;margin:0 auto;max-width:1200px}.header .logo{font-size:24px;color:#fff;font-weight:700}.nav{display:flex;justify-content:space-between}
```

**Savings: 73% reduction**

#### JavaScript Minification

**Before (app.js - 128 KB):**
```javascript
function calculateTotalPrice(items) {
    let total = 0;
    
    for (let i = 0; i < items.length; i++) {
        let item = items[i];
        let price = item.price;
        let quantity = item.quantity;
        
        total += (price * quantity);
    }
    
    return total;
}

// Initialize application
document.addEventListener('DOMContentLoaded', function() {
    initializeCart();
    loadUserPreferences();
});
```

**After Minification & Compression (app.min.js - 28 KB):**
```javascript
function calculateTotalPrice(e){let t=0;for(let i=0;i<e.length;i++){let l=e[i];t+=l.price*l.quantity}return t}document.addEventListener("DOMContentLoaded",(function(){initializeCart(),loadUserPreferences()}));
```

**Savings: 78% reduction**

#### HTML Minification

**Before:**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My E-commerce Store</title>
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Header Section -->
    <header class="header">
        <h1>Welcome to Our Store</h1>
    </header>
    
    <!-- Main Content -->
    <main>
        <p>Browse our amazing products</p>
    </main>
</body>
</html>
```

**After:**
```html
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>My E-commerce Store</title><link rel="stylesheet" href="styles.css"></head><body><header class="header"><h1>Welcome to Our Store</h1></header><main><p>Browse our amazing products</p></main></body></html>
```

#### Build Tools for Minification

**Using Webpack:**
```javascript
// webpack.config.js
const TerserPlugin = require('terser-webpack-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = {
  mode: 'production',
  optimization: {
    minimize: true,
    minimizer: [
      new TerserPlugin({
        terserOptions: {
          compress: {
            drop_console: true, // Remove console.logs
          },
        },
      }),
      new CssMinimizerPlugin(),
    ],
  },
};
```

**Real-World Impact:**
```
TechCrunch.com optimization:
Before: 2.4 MB total assets
After: 780 KB total assets
Reduction: 67%
Load Time: 5.2s → 1.9s
```

---