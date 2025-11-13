
### App Indexing

App indexing allows Google to crawl and index your app content, showing it in search results.

#### **Firebase App Indexing (Android)**

**1. Setup:**

```gradle
// app/build.gradle
dependencies {
    implementation 'com.google.firebase:firebase-appindexing:20.0.0'
}
```

```kotlin
// Mark content as indexable
import com.google.firebase.appindexing.FirebaseAppIndex
import com.google.firebase.appindexing.Indexable
import com.google.firebase.appindexing.builders.Indexables

fun indexProduct(product: Product) {
    val indexable = Indexables.newSimple(
        product.name,
        "https://example.com/products/${product.id}"
    ).apply {
        setDescription(product.description)
        setImage(product.imageUrl)
        setUrl("https://example.com/products/${product.id}")
        
        // Add structured data
        put("price", product.price)
        put("availability", "InStock")
    }
    
    FirebaseAppIndex.getInstance().update(indexable)
}

// Remove from index when no longer available
fun removeProduct(productId: String) {
    val url = "https://example.com/products/$productId"
    FirebaseAppIndex.getInstance().remove(url)
}
```

**2. Deep Link Activity Setup:**

```xml
<!-- AndroidManifest.xml -->
<activity android:name=".ProductActivity">
    <!-- HTTP URLs -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:scheme="https"
            android:host="example.com"
            android:pathPrefix="/products" />
    </intent-filter>
    
    <!-- Google Search deep links -->
    <intent-filter>
        <action android:name="com.google.android.gms.actions.SEARCH_ACTION"/>
        <category android:name="android.intent.category.DEFAULT"/>
    </intent-filter>
</activity>
```

**3. Log User Actions:**

```kotlin
import com.google.firebase.appindexing.FirebaseUserActions
import com.google.firebase.appindexing.Action
import com.google.firebase.appindexing.builders.Actions

// Log view action
fun logProductView(productId: String) {
    val action = Actions.newView(
        "Product",
        "https://example.com/products/$productId"
    )
    
    FirebaseUserActions.getInstance().start(action)
    
    // End action when user leaves
    FirebaseUserActions.getInstance().end(action)
}

// Log other actions
fun logPurchase(productId: String) {
    val action = Actions.newView(
        "BuyAction",
        "https://example.com/products/$productId"
    )
    FirebaseUserActions.getInstance().end(action)
}
```

**Real-Life Example: Etsy App**
- Products indexed in Google Search
- Search "handmade leather wallet" → Etsy app result appears
- Clicking opens product directly in Etsy app
- If app not installed, falls back to web

#### **iOS App Indexing (CoreSpotlight & NSUserActivity)**

**1. CoreSpotlight (On-Device Search):**

```swift
import CoreSpotlight
import MobileCoreServices

func indexProduct(_ product: Product) {
    // Create searchable item
    let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
    
    // Set metadata
    attributeSet.title = product.name
    attributeSet.contentDescription = product.description
    attributeSet.keywords = product.tags
    
    // Add pricing
    attributeSet.price = NSNumber(value: product.price)
    attributeSet.currency = "USD"
    
    // Add images
    if let imageData = product.image {
        attributeSet.thumbnailData = imageData
    }
    
    // Create item
    let item = CSSearchableItem(
        uniqueIdentifier: "product-\(product.id)",
        domainIdentifier: "com.company.myapp.products",
        attributeSet: attributeSet
    )
    
    // Index the item
    CSSearchableIndex.default().indexSearchableItems([item]) { error in
        if let error = error {
            print("Indexing error: \(error.localizedDescription)")
        }
    }
}

// Handle spotlight search result
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    if userActivity.activityType == CSSearchableItemActionType {
        if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            // uniqueIdentifier is "product-12345"
            let productId = uniqueIdentifier.replacingOccurrences(of: "product-", with: "")
            showProduct(id: productId)
        }
    }
}
```

**2. NSUserActivity (Cloud Indexing):**

```swift
import CoreSpotlight

func makeProductActivityIndexable(product: Product) {
    let activity = NSUserActivity(activityType: "com.company.myapp.viewProduct")
    
    // Set metadata
    activity.title = product.name
    activity.userInfo = ["productId": product.id]
    activity.isEligibleForSearch = true  // Enable Spotlight
    activity.isEligibleForPublicIndexing = true  // Enable cloud indexing
    activity.isEligibleForHandoff = true
    
    // Set content attributes for better search
    let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
    attributes.contentDescription = product.description
    attributes.thumbnailData = product.imageData
    activity.contentAttributeSet = attributes
    
    // Set web page URL for universal linking
    activity.webpageURL = URL(string: "https://example.com/products/\(product.id)")
    
    // Make current
    activity.becomeCurrent()
}

// Continue activity
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    if userActivity.activityType == "com.company.myapp.viewProduct" {
        if let productId = userActivity.userInfo?["productId"] as? String {
            showProduct(id: productId)
        }
    }
}
```

**Real-Life Example: Yelp**
- Restaurant viewed in app → Indexed in Spotlight
- User searches "Italian restaurant" in iPhone Spotlight
- Yelp result appears with restaurant name and rating
- Tap opens Yelp app directly to that restaurant

#### **Google Search Results (In-App Search Results)**

**Web page equivalent needed:**

```html
<!-- On your website: example.com/products/12345 -->
<!DOCTYPE html>
<html>
<head>
    <!-- App Indexing meta tags -->
    <meta name="google-site-verification" content="your-verification-code">
    
    <!-- iOS -->
    <meta name="apple-itunes-app" content="app-id=123456789, app-argument=myapp://products/12345">
    
    <!-- Android App Linking -->
    <link rel="alternate" href="android-app://com.company.myapp/https/example.com/products/12345">
    
    <!-- Structured Data for Rich Results -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Product",
      "name": "Blue Widget",
      "image": "https://example.com/images/widget.jpg",
      "description": "High-quality blue widget",
      "sku": "12345",
      "mpn": "12345",
      "brand": {
        "@type": "Brand",
        "name": "WidgetCo"
      },
      "offers": {
        "@type": "Offer",
        "url": "https://example.com/products/12345",
        "priceCurrency": "USD",
        "price": "29.99",
        "priceValidUntil": "2025-12-31",
        "availability": "https://schema.org/InStock"
      },
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "4.5",
        "reviewCount": "123"
      }
    }
    </script>
</head>
<body>
    <!-- Product content -->
</body>
</html>
```

**Search Console Configuration:**

```
1. Verify website ownership in Google Search Console
2. Add Android app in Search Console
   - Package name: com.company.myapp
   - SHA-256 fingerprint
3. Associate website with app
4. Submit sitemap including app:// URLs

Example Sitemap:
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://example.com/products/12345</loc>
    <xhtml:link rel="alternate" 
                href="android-app://com.company.myapp/https/example.com/products/12345"/>
    <lastmod>2025-11-05</lastmod>
    <priority>0.8</priority>
  </url>
</urlset>
```

**Real-Life Example: Pinterest**

When you search "living room ideas" on Google:
1. Pinterest web results appear
2. If Pinterest app installed: "View in App" button appears
3. Click → Opens directly in Pinterest app to that specific board
4. Rich preview cards show pins directly in search results

---
