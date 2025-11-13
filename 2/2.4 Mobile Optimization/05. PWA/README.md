
## 2.4 Mobile Optimization

Mobile traffic accounts for over 60% of all web traffic globally. Google uses mobile-first indexing, making mobile optimization critical for SEO.


### Progressive Web Apps (PWA)

PWAs combine the best of web and mobile apps.

#### PWA Features

```markdown
✅ Installable (Add to home screen)
✅ Offline functionality
✅ Push notifications
✅ Fast loading
✅ App-like experience
✅ HTTPS required
```

#### Service Worker (Offline Support)

**service-worker.js:**
```javascript
const CACHE_NAME = 'my-site-cache-v1';
const urlsToCache = [
  '/',
  '/styles/main.css',
  '/script/main.js',
  '/images/logo.png'
];

// Install Service Worker
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});

// Fetch from cache
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Cache hit - return response
        if (response) {
          return response;
        }
        
        // Clone request
        const fetchRequest = event.request.clone();
        
        return fetch(fetchRequest).then(response => {
          // Check if valid response
          if (!response || response.status !== 200) {
            return response;
          }
          
          // Clone response
          const responseToCache = response.clone();
          
          caches.open(CACHE_NAME)
            .then(cache => {
              cache.put(event.request, responseToCache);
            });
          
          return response;
        });
      })
  );
});

// Update Service Worker
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME];
  
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
```

**Register Service Worker:**
```javascript
// main.js
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/service-worker.js')
      .then(registration => {
        console.log('SW registered:', registration);
      })
      .catch(error => {
        console.log('SW registration failed:', error);
      });
  });
}
```

#### Web App Manifest

**manifest.json:**
```json
{
  "name": "My Progressive Web App",
  "short_name": "MyPWA",
  "description": "A sample progressive web application",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#007bff",
  "orientation": "portrait-primary",
  "icons": [
    {
      "src": "/icons/icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-96x96.png",
      "sizes": "96x96",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-128x128.png",
      "sizes": "128x128",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-144x144.png",
      "sizes": "144x144",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-152x152.png",
      "sizes": "152x152",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-384x384.png",
      "sizes": "384x384",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

**Link Manifest:**
```html
<link rel="manifest" href="/manifest.json">
<meta name="theme-color" content="#007bff">
```

#### Real-Life Example: Twitter Lite

**Twitter's PWA Success:**

**Challenge:**
- Slow connections in emerging markets
- Large app download size (23MB)
- Low storage on devices

**PWA Solution:**
```
Initial load: 600KB (97% smaller than app)
Load time: 3 seconds (on 3G)
Offline support: Full browsing of cached content
Data usage: 70% reduction
```

**Results:**
```
- Pages per session: +65%
- Tweets sent: +75%
- Bounce rate: -20%
- Time on site: +40%
- Install rate: 250K daily installs
- Push notification opt-in: 30%
```

**PWA vs Native App:**
```
Native App:
- Download size: 23MB
- Install time: 2-3 minutes
- Storage space: 80MB (installed)
- Update frequency: Manual

PWA:
- Download size: 600KB
- Install time: <5 seconds
- Storage space: 1.5MB
- Update frequency: Automatic
```

---
