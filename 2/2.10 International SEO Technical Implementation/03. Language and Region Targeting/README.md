# Technical SEO: Server, Hosting & International Implementation

---

## International SEO Technical Implementation



### Language and Region Targeting

#### Geographic Targeting in Google Search Console

**Setting Up:**
```
Steps:
1. Go to Google Search Console
2. Select property (domain)
3. Navigate to Settings → International Targeting
4. Select "Country" tab
5. Choose target country

Note: 
- Only available for ccTLDs and subdomains
- NOT available for subdirectories
- Helps reinforce geographic targeting
```

**Real Example:**
```
Domain: example.co.uk
Target Country: United Kingdom

Search Console Setting:
International Targeting → Geographic target: United Kingdom

Result:
- Stronger signal for UK searches
- Better visibility in google.co.uk
- May reduce visibility in other countries
```

#### HTML Lang Attribute

**Basic Implementation:**
```html
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>Page Title</title>
</head>
<body>
    <p>Content in US English</p>
</body>
</html>
```

**For Multi-Language Content:**
```html
<!DOCTYPE html>
<html lang="de-DE">
<head>
    <meta charset="UTF-8">
    <title>Produkte - Beispiel</title>
</head>
<body>
    <header>
        <nav>
            <p lang="en-US">Switch to English</p>
        </nav>
    </header>
    
    <main>
        <h1>Unsere Produkte</h1>
        <p>Deutscher Inhalt hier...</p>
        
        <blockquote lang="en-US">
            "Quote in English from an English source"
        </blockquote>
    </main>
</body>
</html>
```

**Common Language Codes:**
```
en-US = English (United States)
en-GB = English (United Kingdom)
en-AU = English (Australia)
en-CA = English (Canada)

es-ES = Spanish (Spain)
es-MX = Spanish (Mexico)
es-AR = Spanish (Argentina)

fr-FR = French (France)
fr-CA = French (Canada)

de-DE = German (Germany)
de-AT = German (Austria)
de-CH = German (Switzerland)

pt-BR = Portuguese (Brazil)
pt-PT = Portuguese (Portugal)

zh-CN = Chinese (Simplified)
zh-TW = Chinese (Traditional)
```

#### Content-Language HTTP Header

**Implementation:**
```
Content-Language: en-US
```

**Nginx Configuration:**
```nginx
location /en-us/ {
    add_header Content-Language "en-US" always;
}

location /en-gb/ {
    add_header Content-Language "en-GB" always;
}

location /de/ {
    add_header Content-Language "de-DE" always;
}
```

**Apache Configuration:**
```apache
<Directory "/var/www/html/en-us">
    Header set Content-Language "en-US"
</Directory>

<Directory "/var/www/html/en-gb">
    Header set Content-Language "en-GB"
</Directory>
```

#### IP-Based Redirection (Use Cautiously)

**Why to be Careful:**
- ❌ Google crawls from US IPs
- ❌ VPN users see wrong content
- ❌ Users on international IPs blocked
- ❌ Can hurt SEO if implemented poorly

**Better Approach: Suggestion Instead of Forced Redirect**
```javascript
// Detect user's location
fetch('https://ipapi.co/json/')
    .then(response => response.json())
    .then(data => {
        const userCountry = data.country_code;
        
        // Suggest, don't force redirect
        if (userCountry === 'GB' && !window.location.href.includes('/en-gb/')) {
            showBanner('You appear to be in the UK. Visit our UK site?', '/en-gb/');
        }
    });

function showBanner(message, url) {
    const banner = document.createElement('div');
    banner.className = 'location-banner';
    banner.innerHTML = `
        <p>${message}</p>
        <button onclick="window.location.href='${url}'">Yes</button>
        <button onclick="this.parentElement.remove()">Stay Here</button>
    `;
    document.body.prepend(banner);
}
```

**If You Must Use Redirects:**
```javascript
// Only redirect on homepage
if (window.location.pathname === '/' && !sessionStorage.getItem('locale_redirect')) {
    fetch('https://ipapi.co/json/')
        .then(response => response.json())
        .then(data => {
            const redirectMap = {
                'GB': '/en-gb/',
                'DE': '/de/',
                'FR': '/fr/',
                'ES': '/es/'
            };
            
            if (redirectMap[data.country_code]) {
                sessionStorage.setItem('locale_redirect', 'true');
                window.location.href = redirectMap[data.country_code];
            }
        });
}
```

**Critical Rules for Redirects:**
```
✓ Always allow Googlebot through (no redirect)
✓ Show banner/suggestion instead of forcing redirect
✓ Remember user's choice (cookie/session storage)
✓ Only redirect from homepage
✓ Provide language selector on all pages
✓ Don't redirect users who explicitly chose a version
```

---
