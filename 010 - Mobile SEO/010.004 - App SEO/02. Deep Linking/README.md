
### Deep Linking

Deep linking allows users to open specific content within your app directly from web links.

#### **Types of Deep Links:**

**1. URI Schemes (Basic Deep Links)**

```xml
<!-- iOS: Configure in Info.plist -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myapp</string>
        </array>
        <key>CFBundleURLName</key>
        <string>com.company.myapp</string>
    </dict>
</array>

<!-- Android: Configure in AndroidManifest.xml -->
<activity android:name=".ProductActivity">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="myapp" />
    </intent-filter>
</activity>
```

**Usage Example:**
```html
<!-- In website or email -->
<a href="myapp://products/12345">Open Product in App</a>
<a href="myapp://profile/settings">Open Settings</a>
```

**Real-Life Example: YouTube**
- Link: `youtube://watch?v=dQw4w9WgXcQ`
- Opens specific video in YouTube app
- Falls back to web if app not installed

**Limitations:**
- Only works if app is installed
- No fallback to App Store
- Each app needs unique scheme

**2. Universal Links (iOS) / App Links (Android)**

**iOS Universal Links:**

```json
// apple-app-site-association (hosted at https://example.com/.well-known/)
{
    "applinks": {
        "apps": [],
        "details": [
            {
                "appID": "TEAM_ID.com.company.myapp",
                "paths": [
                    "/products/*",
                    "/categories/*",
                    "/user/*/profile",
                    "NOT /support/*"
                ]
            }
        ]
    }
}
```

```swift
// iOS App: Handle universal link
func application(_ application: UIApplication,
                continue userActivity: NSUserActivity,
                restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    
    guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
          let url = userActivity.webpageURL else {
        return false
    }
    
    // Parse URL and navigate
    if url.path.contains("/products/") {
        let productId = url.lastPathComponent
        showProduct(id: productId)
        return true
    }
    
    return false
}
```

**Android App Links:**

```xml
<!-- AndroidManifest.xml -->
<activity android:name=".ProductActivity">
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:scheme="https"
            android:host="example.com"
            android:pathPrefix="/products" />
    </intent-filter>
</activity>
```

```json
// assetlinks.json (hosted at https://example.com/.well-known/)
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.company.myapp",
    "sha256_cert_fingerprints": [
      "14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5"
    ]
  }
}]
```

**Real-Life Example: Airbnb**
```
Web URL: https://www.airbnb.com/rooms/12345
- On iPhone with Airbnb app: Opens directly in app
- On Android with Airbnb app: Opens directly in app
- Without app: Opens in web browser (seamless fallback)
- Smart banner shows "Open in App" option
```

**3. Deferred Deep Linking**

Deferred deep linking preserves the intended destination even if the user needs to install the app first.

**Flow:**
1. User clicks link without app installed
2. Redirected to App Store
3. Installs app
4. Opens app
5. App navigates to original intended content

**Implementation with Branch.io:**

```html
<!-- Web page with Branch deep link -->
<script>
  branch.init('YOUR_BRANCH_KEY');
  
  branch.link({
    data: {
      '$deeplink_path': 'products/12345',
      '$desktop_url': 'https://example.com/products/12345',
      '$ios_url': 'https://apps.apple.com/app/id123456789',
      '$android_url': 'https://play.google.com/store/apps/details?id=com.example',
      'product_id': '12345',
      'product_name': 'Blue Widget',
      'image_url': 'https://example.com/images/product.jpg'
    }
  }, function(err, link) {
    // link is your deep link
    document.getElementById('app-link').href = link;
  });
</script>

<a id="app-link" href="#">Open in App</a>
```

```swift
// iOS App: Handle deferred deep link
import Branch

func application(_ application: UIApplication, 
                didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
        guard let data = params as? [String: AnyObject] else { return }
        
        // First-time install with deferred deep link
        if let productId = data["product_id"] as? String {
            self.showProduct(id: productId)
        }
    }
    
    return true
}
```

**Real-Life Example: Uber**
1. Friend shares ride: `https://uber.com/ride/abc123`
2. You don't have Uber installed
3. Click link → App Store
4. Install Uber
5. Open Uber → Automatically shows ride details from original link

**4. Smart Banners**

```html
<!-- iOS Smart App Banner -->
<meta name="apple-itunes-app" 
      content="app-id=123456789, 
               app-argument=myapp://products/12345,
               affiliate-data=partnerId=123">

<!-- Android Intent -->
<a href="intent://products/12345#Intent;
         scheme=https;
         package=com.company.myapp;
         S.browser_fallback_url=https://play.google.com/store/apps/details?id=com.company.myapp;
         end">
    Open in App
</a>

<!-- Universal approach with JavaScript -->
<div id="smart-banner" class="app-banner">
  <img src="app-icon.png" alt="App Icon">
  <div class="banner-info">
    <strong>MyApp</strong>
    <p>Open in app for better experience</p>
  </div>
  <button onclick="openInApp()">Open</button>
  <button onclick="closeBanner()">✕</button>
</div>

<script>
function openInApp() {
  const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent);
  const isAndroid = /Android/.test(navigator.userAgent);
  
  const deepLink = 'myapp://products/12345';
  const fallback = isIOS 
    ? 'https://apps.apple.com/app/id123456789'
    : 'https://play.google.com/store/apps/details?id=com.company.myapp';
  
  // Try to open app
  window.location = deepLink;
  
  // If app doesn't open in 2 seconds, go to store
  setTimeout(() => {
    window.location = fallback;
  }, 2000);
}

function closeBanner() {
  document.getElementById('smart-banner').style.display = 'none';
  sessionStorage.setItem('banner-closed', 'true');
}

// Don't show banner if already closed this session
if (sessionStorage.getItem('banner-closed')) {
  document.getElementById('smart-banner').style.display = 'none';
}
</script>
```

---
