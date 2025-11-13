## 2.1 Website Architecture

---

### Breadcrumb Navigation

Breadcrumbs show users their location in the site hierarchy and provide additional internal linking.

#### What Are Breadcrumbs?

Visual path showing user's location:

```
Home > Category > Subcategory > Current Page
```

#### Types of Breadcrumbs

**1. Location-Based (Hierarchy) - Most Common**
```
Home > Electronics > Laptops > Gaming Laptops > ASUS ROG Strix
```

**2. Attribute-Based (Faceted Navigation)**
```
Home > Shoes > Running Shoes > Men's > Size 10 > Blue
```

**3. Path-Based (History)**
```
Home > Search Results > Product Category > Product
```
⚠️ Least SEO-friendly (shows user journey, not site structure)

#### Implementation Example

**HTML Breadcrumb Code:**

```html
<!-- Semantic HTML5 -->
<nav aria-label="Breadcrumb">
  <ol class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
    
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/">
        <span itemprop="name">Home</span>
      </a>
      <meta itemprop="position" content="1" />
    </li>
    
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/electronics/">
        <span itemprop="name">Electronics</span>
      </a>
      <meta itemprop="position" content="2" />
    </li>
    
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <a itemprop="item" href="/electronics/laptops/">
        <span itemprop="name">Laptops</span>
      </a>
      <meta itemprop="position" content="3" />
    </li>
    
    <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
      <span itemprop="name">Gaming Laptops</span>
      <meta itemprop="position" content="4" />
    </li>
    
  </ol>
</nav>
```

**CSS Styling:**

```css
.breadcrumb {
  display: flex;
  list-style: none;
  padding: 10px 0;
  font-size: 14px;
}

.breadcrumb li + li:before {
  content: "›";
  padding: 0 8px;
  color: #999;
}

.breadcrumb a {
  color: #0066cc;
  text-decoration: none;
}

.breadcrumb a:hover {
  text-decoration: underline;
}
```

**How It Appears:**

```
Home › Electronics › Laptops › Gaming Laptops
```

#### Rich Snippets in SERP

When properly structured, breadcrumbs appear in Google search results:

```
┌─────────────────────────────────────────────┐
│ TechStore.com › Electronics › Laptops       │
│ Best Gaming Laptops 2025 - Expert Reviews   │
│ We tested 50+ gaming laptops. Here are our  │
│ top picks for performance, battery life...  │
└─────────────────────────────────────────────┘
```

**Benefits:**
- More space in SERP
- Better CTR (20-30% increase)
- Shows site organization
- Looks more professional

#### Real-Life Example: Amazon

Amazon's breadcrumbs help users navigate complex category structures:

```
Home > Electronics > Computers & Accessories > Laptops > 
Traditional Laptops > Gaming Laptops
```

**User Behavior:**
- 40% of users click breadcrumbs to navigate
- Reduces bounce rate
- Increases pages per session

#### WordPress Implementation

**Using Yoast SEO Plugin:**

```php
<?php
if ( function_exists('yoast_breadcrumb') ) {
  yoast_breadcrumb( '<p id="breadcrumbs">','</p>' );
}
?>
```

**Custom PHP Breadcrumb Function:**

```php
function custom_breadcrumbs() {
    
    $delimiter = ' › ';
    $home = 'Home';
    $before = '<span class="current">';
    $after = '</span>';
    
    echo '<nav class="breadcrumbs">';
    
    global $post;
    $homeLink = get_bloginfo('url');
    
    if (is_home() || is_front_page()) {
        echo '<span class="current">' . $home . '</span>';
    } else {
        echo '<a href="' . $homeLink . '">' . $home . '</a>' . $delimiter;
        
        if (is_category()) {
            $thisCat = get_category(get_query_var('cat'), false);
            if ($thisCat->parent != 0) {
                echo get_category_parents($thisCat->parent, TRUE, $delimiter);
            }
            echo $before . single_cat_title('', false) . $after;
            
        } elseif (is_single() && !is_attachment()) {
            $cat = get_the_category(); 
            $cat = $cat[0];
            echo get_category_parents($cat, TRUE, $delimiter);
            echo $before . get_the_title() . $after;
            
        } elseif (is_page()) {
            echo $before . get_the_title() . $after;
        }
    }
    
    echo '</nav>';
}
```

#### Real Business Impact

**Case Study: E-commerce Site**

**Before Breadcrumbs:**
- Users often hit back button (65% bounce rate on category pages)
- Difficulty navigating categories
- Low pages per session (1.8)

**After Implementation:**
- ✅ Bounce rate: 65% → 48%
- ✅ Pages per session: 1.8 → 3.4
- ✅ Search visibility improved (breadcrumbs in SERPs)
- ✅ 23% increase in category page traffic
- ✅ Click-through rate from Google: +18%

---