
### Mobile Navigation

Mobile navigation must be simple, accessible, and thumb-friendly. Poor navigation leads to high bounce rates and lost conversions.

#### **Key Principles:**

**1. Hamburger Menu vs. Visible Navigation**

```html
<!-- Example: Hybrid Navigation (Best Practice) -->
<nav class="mobile-nav">
  <!-- Primary actions visible -->
  <div class="nav-visible">
    <a href="/" class="logo">Brand</a>
    <a href="/search" class="nav-icon">🔍</a>
    <a href="/cart" class="nav-icon">🛒 <span class="badge">3</span></a>
    <button class="hamburger" aria-label="Menu">☰</button>
  </div>
  
  <!-- Secondary menu in hamburger -->
  <div class="nav-drawer" id="menu">
    <ul>
      <li><a href="/shop">Shop</a></li>
      <li><a href="/deals">Deals</a></li>
      <li><a href="/account">My Account</a></li>
      <li><a href="/help">Help</a></li>
    </ul>
  </div>
</nav>

<style>
.mobile-nav {
  position: sticky;
  top: 0;
  z-index: 1000;
  background: white;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.nav-visible {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  min-height: 48px; /* Minimum touch target */
}

.nav-icon {
  min-width: 44px; /* iOS minimum touch target */
  min-height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.nav-drawer {
  transform: translateX(-100%);
  transition: transform 0.3s ease;
  position: fixed;
  top: 60px;
  left: 0;
  width: 80%;
  max-width: 320px;
  height: calc(100vh - 60px);
  background: white;
  overflow-y: auto;
}

.nav-drawer.open {
  transform: translateX(0);
}
</style>
```

**Real-Life Example: Amazon Mobile**
- Keeps search, cart, and menu always visible
- Hamburger menu contains secondary navigation
- Search bar is prominent (thumb-friendly at top)
- Categories load instantly without page refresh

**2. Bottom Navigation Bar (Popular in Apps)**

```html
<!-- Example: Bottom Tab Bar Navigation -->
<nav class="bottom-nav" role="navigation">
  <a href="/" class="nav-item active" aria-label="Home">
    <svg><!-- Home icon --></svg>
    <span>Home</span>
  </a>
  <a href="/search" class="nav-item" aria-label="Search">
    <svg><!-- Search icon --></svg>
    <span>Search</span>
  </a>
  <a href="/favorites" class="nav-item" aria-label="Favorites">
    <svg><!-- Heart icon --></svg>
    <span>Saved</span>
  </a>
  <a href="/profile" class="nav-item" aria-label="Profile">
    <svg><!-- Profile icon --></svg>
    <span>Profile</span>
  </a>
</nav>

<style>
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-around;
  background: white;
  border-top: 1px solid #e0e0e0;
  padding: 8px 0;
  z-index: 1000;
  /* iOS safe area */
  padding-bottom: max(8px, env(safe-area-inset-bottom));
}

.nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 48px;
  padding: 4px 12px;
  text-decoration: none;
  color: #666;
  font-size: 12px;
}

.nav-item.active {
  color: #007aff;
}

.nav-item svg {
  width: 24px;
  height: 24px;
  margin-bottom: 2px;
}
</style>
```

**Real-Life Example: Instagram**
- Bottom navigation for primary features (Home, Search, Reels, Shop, Profile)
- Always accessible with one thumb
- Active state clearly indicated
- Minimum 48px touch targets

**3. Breadcrumb Navigation for Deep Pages**

```html
<!-- Mobile-optimized breadcrumbs -->
<nav aria-label="Breadcrumb" class="breadcrumb-mobile">
  <ol itemscope itemtype="https://schema.org/BreadcrumbList">
    <!-- Only show last 2 levels on mobile -->
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/electronics">
        <span itemprop="name">Electronics</span>
      </a>
      <meta itemprop="position" content="1" />
    </li>
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/electronics/phones">
        <span itemprop="name">Phones</span>
      </a>
      <meta itemprop="position" content="2" />
    </li>
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <span itemprop="name">iPhone 15 Pro</span>
      <meta itemprop="position" content="3" />
    </li>
  </ol>
</nav>

<style>
.breadcrumb-mobile ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 12px 16px;
  font-size: 14px;
  overflow-x: auto;
}

.breadcrumb-mobile li:not(:last-child)::after {
  content: "›";
  margin: 0 8px;
  color: #999;
}

.breadcrumb-mobile a {
  color: #007aff;
  text-decoration: none;
  white-space: nowrap;
}
</style>
```

**Real-Life Example: eBay Mobile**
- Condensed breadcrumbs showing only relevant levels
- Horizontal scroll for long paths
- Back button integrated with breadcrumb

---
