
### Pop-ups and Interstitials

Google penalizes intrusive interstitials on mobile. Proper implementation is crucial for SEO and user experience.

#### **What Google Penalizes:**

**❌ BAD Examples:**

1. **Intrusive Pop-up (Blocks Content)**
```html
<!-- This will hurt your rankings -->
<div class="intrusive-popup" style="
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 9999;
  background: white;
">
  <h2>Subscribe to our newsletter!</h2>
  <p>Get 10% off your first order</p>
  <form>
    <input type="email" placeholder="Enter email">
    <button>Subscribe</button>
  </form>
  <button class="close" style="position: absolute; top: 10px; right: 10px;">✕</button>
</div>
```

2. **Standalone Interstitial Before Main Content**
```html
<!-- Blocks main content immediately -->
<div class="fullscreen-ad">
  <img src="promotion.jpg" alt="Sale">
  <button>Continue to Site</button>
</div>
```

**✅ GOOD Examples:**

**1. Banner at Top/Bottom (Google Approved)**

```html
<!-- Example: Cookie Consent Banner -->
<div class="cookie-banner" role="dialog" aria-label="Cookie consent">
  <div class="banner-content">
    <p>We use cookies to improve your experience. 
       <a href="/privacy">Learn more</a>
    </p>
    <button class="btn-accept" onclick="acceptCookies()">Accept</button>
  </div>
</div>

<style>
.cookie-banner {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.9);
  color: white;
  padding: 16px;
  z-index: 1000;
  /* Safe area for iOS */
  padding-bottom: max(16px, env(safe-area-inset-bottom));
}

.banner-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
}

.banner-content p {
  margin: 0;
  font-size: 14px;
  flex: 1;
}

.btn-accept {
  padding: 8px 24px;
  background: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  font-weight: 600;
  white-space: nowrap;
}

@media (max-width: 600px) {
  .banner-content {
    flex-direction: column;
    align-items: stretch;
  }
  
  .btn-accept {
    width: 100%;
  }
}
</style>

<script>
function acceptCookies() {
  localStorage.setItem('cookies-accepted', 'true');
  document.querySelector('.cookie-banner').style.display = 'none';
}

// Don't show if already accepted
if (localStorage.getItem('cookies-accepted')) {
  document.querySelector('.cookie-banner').style.display = 'none';
}
</script>
```

**Real-Life Example: BBC.com**
- Cookie banner at bottom
- Doesn't block content
- Easy to dismiss
- Compliant with GDPR and Google guidelines

**2. Age Verification (Legal Requirement - Allowed)**

```html
<!-- Legal age gate - Google allows these -->
<div class="age-gate" role="dialog" aria-labelledby="age-gate-title">
  <div class="age-gate-content">
    <h2 id="age-gate-title">Age Verification Required</h2>
    <p>You must be 21 or older to enter this site.</p>
    <form onsubmit="return verifyAge(event)">
      <label>Date of Birth:</label>
      <input type="date" name="dob" required>
      <button type="submit">Enter</button>
    </form>
    <a href="https://www.google.com">Exit</a>
  </div>
</div>

<style>
.age-gate {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.95);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 10000;
}

.age-gate-content {
  background: white;
  padding: 32px;
  border-radius: 8px;
  max-width: 400px;
  text-align: center;
}
</style>
```

**Real-Life Example: Diageo (Alcohol Brand Sites)**
- Legal requirement for alcohol sites
- One-time verification
- Stores result in session
- Google doesn't penalize these

**3. Exit-Intent Pop-up (User-Initiated)**

```html
<!-- Only shows when user tries to leave -->
<div id="exit-popup" class="exit-intent-popup" style="display: none;">
  <div class="popup-content">
    <button class="close-popup" onclick="closeExitPopup()">✕</button>
    <h3>Wait! Before you go...</h3>
    <p>Join our newsletter and get 15% off your first purchase</p>
    <form>
      <input type="email" placeholder="Your email">
      <button type="submit">Get Discount</button>
    </form>
  </div>
</div>

<script>
let exitIntentShown = false;

document.addEventListener('mouseleave', function(e) {
  // Only on desktop - cursor leaves top of page
  if (e.clientY < 0 && !exitIntentShown && window.innerWidth > 768) {
    showExitPopup();
  }
});

// Mobile: detect back button or tab switch
let lastTouchY = 0;
document.addEventListener('touchstart', function(e) {
  lastTouchY = e.touches[0].clientY;
});

document.addEventListener('touchmove', function(e) {
  let touchY = e.touches[0].clientY;
  let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  
  // Pulling down at top of page
  if (scrollTop === 0 && touchY > lastTouchY + 50 && !exitIntentShown) {
    showExitPopup();
  }
});

function showExitPopup() {
  if (sessionStorage.getItem('exit-popup-shown')) return;
  
  document.getElementById('exit-popup').style.display = 'flex';
  exitIntentShown = true;
  sessionStorage.setItem('exit-popup-shown', 'true');
}

function closeExitPopup() {
  document.getElementById('exit-popup').style.display = 'none';
}
</script>

<style>
.exit-intent-popup {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  animation: fadeIn 0.3s;
}

.popup-content {
  background: white;
  padding: 32px;
  border-radius: 12px;
  max-width: 400px;
  margin: 16px;
  position: relative;
  animation: slideUp 0.3s;
}

.close-popup {
  position: absolute;
  top: 12px;
  right: 12px;
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  padding: 8px;
  min-width: 44px;
  min-height: 44px;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from { transform: translateY(50px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}
</style>
```

**Real-Life Example: OptinMonster**
- Only triggers on exit intent
- Once per session
- Easy to close
- Doesn't interfere with content consumption

**4. Slide-in/Sidebar (Non-Intrusive)**

```html
<!-- Example: Newsletter slide-in (after user engagement) -->
<div id="slide-in" class="newsletter-slide" style="transform: translateX(100%);">
  <button class="close-slide" onclick="closeSlideIn()">✕</button>
  <h4>Enjoying our content?</h4>
  <p>Get weekly updates</p>
  <form>
    <input type="email" placeholder="Email address">
    <button type="submit">Subscribe</button>
  </form>
</div>

<script>
// Show after 30 seconds of engagement or 50% scroll
let engaged = false;
setTimeout(() => {
  if (!sessionStorage.getItem('slide-in-shown')) {
    showSlideIn();
  }
}, 30000);

window.addEventListener('scroll', () => {
  if (engaged) return;
  
  let scrollPercent = (window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100;
  if (scrollPercent > 50 && !sessionStorage.getItem('slide-in-shown')) {
    showSlideIn();
    engaged = true;
  }
});

function showSlideIn() {
  document.getElementById('slide-in').style.transform = 'translateX(0)';
  sessionStorage.setItem('slide-in-shown', 'true');
}

function closeSlideIn() {
  document.getElementById('slide-in').style.transform = 'translateX(100%)';
}
</script>

<style>
.newsletter-slide {
  position: fixed;
  right: 0;
  bottom: 80px;
  width: 300px;
  background: white;
  border-radius: 8px 0 0 8px;
  box-shadow: -2px 2px 12px rgba(0,0,0,0.2);
  padding: 20px;
  transition: transform 0.4s ease;
  z-index: 999;
}

@media (max-width: 768px) {
  .newsletter-slide {
    width: calc(100% - 32px);
    max-width: 320px;
  }
}
</style>
```

**Real-Life Example: Medium.com**
- Slide-in appears after engagement
- Doesn't block content
- Positioned in corner
- Easy to dismiss
