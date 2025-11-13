
#### Language Detection

How your site determines which language to show users.

**Methods of Language Detection:**

**1. Browser Language (Accept-Language Header)**

The browser sends language preferences:

```http
Accept-Language: de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7
```

This means:
- 1st preference: German (Germany) - 100%
- 2nd preference: German (any) - 90%
- 3rd preference: English (US) - 80%
- 4th preference: English (any) - 70%

**Server-Side Detection (PHP):**

```php
<?php
function detectLanguage() {
    $supported_languages = ['en', 'de', 'fr', 'es'];
    
    // Get browser language
    $browser_language = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    
    // Check if we support it
    if (in_array($browser_language, $supported_languages)) {
        return $browser_language;
    }
    
    // Default to English
    return 'en';
}

$user_language = detectLanguage();

// Redirect to appropriate version (if not already there)
if ($user_language != 'en' && !str_contains($_SERVER['REQUEST_URI'], '/' . $user_language . '/')) {
    header('Location: /' . $user_language . '/' . $_SERVER['REQUEST_URI']);
    exit;
}
?>
```

---

**2. IP Geolocation**

Detect user's country based on their IP address.

**Example (Using CloudFlare):**

```javascript
// CloudFlare adds country code to headers
// Access in your code:

// PHP
$country = $_SERVER["HTTP_CF_IPCOUNTRY"]; // e.g., "DE", "FR", "US"

// Node.js (Express)
app.get('/', (req, res) => {
  const country = req.headers['cf-ipcountry'];
  const langMap = {
    'DE': 'de',
    'FR': 'fr',
    'ES': 'es',
    'US': 'en',
    'GB': 'en-GB'
  };
  const language = langMap[country] || 'en';
  res.redirect(`/${language}/`);
});
```

**Example (Using MaxMind GeoIP2):**

```php
<?php
require_once 'vendor/autoload.php';

use GeoIp2\Database\Reader;

$reader = new Reader('/path/to/GeoLite2-Country.mmdb');

try {
    $record = $reader->country($_SERVER['REMOTE_ADDR']);
    $country = $record->country->isoCode; // e.g., "US", "DE"
    
    $countryToLanguage = [
        'US' => 'en-US',
        'GB' => 'en-GB',
        'DE' => 'de-DE',
        'FR' => 'fr-FR',
        'ES' => 'es-ES'
    ];
    
    $language = $countryToLanguage[$country] ?? 'en';
    
} catch (Exception $e) {
    $language = 'en'; // Default
}
?>
```

---

**3. User Cookie/Session**

Remember user's language preference:

```javascript
// JavaScript Cookie-based language selection
function setLanguage(lang) {
  // Set cookie for 1 year
  document.cookie = `user_language=${lang}; max-age=31536000; path=/`;
  
  // Reload to apply
  window.location.href = `/${lang}/`;
}

// On page load, check cookie
function getLanguage() {
  const cookies = document.cookie.split(';');
  for (let cookie of cookies) {
    const [name, value] = cookie.trim().split('=');
    if (name === 'user_language') {
      return value;
    }
  }
  return null; // No preference saved
}

// Priority: Cookie > Browser Language > IP > Default
const savedLang = getLanguage();
if (savedLang && !window.location.pathname.includes('/' + savedLang + '/')) {
  window.location.href = `/${savedLang}/`;
}
```

**PHP Session Example:**

```php
<?php
session_start();

// User clicked language selector
if (isset($_GET['lang'])) {
    $lang = $_GET['lang'];
    if (in_array($lang, ['en', 'de', 'fr', 'es'])) {
        $_SESSION['language'] = $lang;
    }
}

// Check session
if (isset($_SESSION['language'])) {
    $current_language = $_SESSION['language'];
} else {
    // Fallback to detection
    $current_language = detectLanguage();
}
?>
```

---

**4. URL Parameter**

Allow manual override with URL parameter:

```
example.com/product?lang=de
example.com/product?hl=fr
```

**Implementation:**

```javascript
// Check URL parameter
const urlParams = new URLSearchParams(window.location.search);
const langParam = urlParams.get('lang');

if (langParam && ['en', 'de', 'fr', 'es'].includes(langParam)) {
  // Set cookie and redirect
  document.cookie = `user_language=${langParam}; max-age=31536000; path=/`;
  window.location.href = `/${langParam}/product`;
}
```

---

**5. Manual Selection (Language Picker)**

Best practice: Always provide a visible language selector!

**Example HTML:**

```html
<!-- Language Selector -->
<div class="language-selector">
  <button id="current-language">
    <img src="/flags/us.svg" alt=""> English (US)
  </button>
  
  <ul class="language-dropdown" hidden>
    <li><a href="/en-US/" hreflang="en-US">
      <img src="/flags/us.svg" alt=""> English (US)
    </a></li>
    <li><a href="/en-GB/" hreflang="en-GB">
      <img src="/flags/gb.svg" alt=""> English (UK)
    </a></li>
    <li><a href="/de-DE/" hreflang="de-DE">
      <img src="/flags/de.svg" alt=""> Deutsch
    </a></li>
    <li><a href="/fr-FR/" hreflang="fr-FR">
      <img src="/flags/fr.svg" alt=""> Français
    </a></li>
    <li><a href="/es-ES/" hreflang="es-ES">
      <img src="/flags/es.svg" alt=""> Español
    </a></li>
  </ul>
</div>

<script>
document.getElementById('current-language').addEventListener('click', function() {
  document.querySelector('.language-dropdown').toggleAttribute('hidden');
});
</script>
```

**Best Practices for Language Selector:**
- ✓ Show on every page (usually in header/footer)
- ✓ Display language names in their native language (Deutsch, not German)
- ✓ Show current selection
- ✓ Use recognizable icons (flags or language names)
- ✓ Make it accessible (keyboard navigation, ARIA labels)

---

**Recommended Detection Priority:**

```
1. User's saved preference (cookie/session)
2. URL parameter (if present)
3. Browser language (Accept-Language header)
4. IP Geolocation (as backup)
5. Default language (fallback)
```

**Complete Implementation Example:**

```php
<?php
function determineLanguage() {
    $supported = ['en', 'de', 'fr', 'es'];
    
    // 1. Check if user manually selected (URL param)
    if (isset($_GET['lang']) && in_array($_GET['lang'], $supported)) {
        return $_GET['lang'];
    }
    
    // 2. Check saved preference (cookie)
    if (isset($_COOKIE['user_language']) && in_array($_COOKIE['user_language'], $supported)) {
        return $_COOKIE['user_language'];
    }
    
    // 3. Check browser language
    $browser_lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    if (in_array($browser_lang, $supported)) {
        return $browser_lang;
    }
    
    // 4. Check IP geolocation (if available)
    if (isset($_SERVER['HTTP_CF_IPCOUNTRY'])) {
        $country_map = [
            'DE' => 'de',
            'FR' => 'fr',
            'ES' => 'es'
        ];
        if (isset($country_map[$_SERVER['HTTP_CF_IPCOUNTRY']])) {
            return $country_map[$_SERVER['HTTP_CF_IPCOUNTRY']];
        }
    }
    
    // 5. Default to English
    return 'en';
}

$language = determineLanguage();

// Save preference
setcookie('user_language', $language, time() + 31536000, '/');
?>
```

---
