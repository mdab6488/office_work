
### 🔍 Search Functionality

Internal site search is crucial for e-commerce SEO and UX. It helps users find products quickly and provides valuable data about user intent.

#### Real-Life Example: Target

**Search Features:**

1. **Autocomplete Suggestions**
```
User types: "wirele"

Suggestions:
→ wireless earbuds
→ wireless headphones
→ wireless mouse
→ wireless keyboard
→ wireless charger

Trending: wireless earbuds for running
```

2. **Search Results URL**
```
target.com/s?searchTerm=wireless+earbuds
```

3. **Search Results Page Elements**
- Number of results: "Showing 1-24 of 567 results"
- Filters (same as category pages)
- Sorting options
- Related searches
- Did you mean? (for typos)

#### SEO Best Practices for Site Search

**1. Index Strategic Search Results Pages**

✅ **Index these:**
- High-volume branded searches: `/search?q=nike+shoes`
- Popular product type searches: `/search?q=running+shoes`
- Category-relevant searches: `/search?q=mens+dress+shirts`

❌ **Don't index these:**
- Misspelled queries: `/search?q=niike+shoez`
- Single-result searches
- Zero-result searches
- Session-specific searches: `/search?q=order+12345`

**2. Canonical Search Results to Category Pages**

If search results match a category page:

```html
<!-- URL: shop.com/search?q=running+shoes -->
<link rel="canonical" href="https://shop.com/category/running-shoes">
```

**3. Redirect Popular Searches to Relevant Pages**

```javascript
// Example: Redirect branded searches
if (searchQuery === 'nike shoes') {
    redirect('/brands/nike/shoes');
}
```

#### Real-Life Example: Amazon's Search

**Search Query:** "bluetooth speaker waterproof"

**Amazon's Strategy:**

1. **Dynamic Results Page:**
```
amazon.com/s?k=bluetooth+speaker+waterproof
```

2. **Search Refinements (left sidebar):**
- Brand
- Price
- Customer Review
- Prime Shipping
- Deals

3. **Sponsored Results** (clearly labeled)
4. **Organic Results** with rich information
5. **Related Searches** at bottom:
```
"portable bluetooth speaker"
"waterproof speaker for shower"
"jbl bluetooth speaker"
"outdoor bluetooth speaker"
```

6. **Canonical Tag:**
```html
<link rel="canonical" href="https://amazon.com/s?k=bluetooth+speaker+waterproof">
```

#### Site Search Analytics

Use site search data to improve your SEO strategy:

**Google Analytics 4 Setup:**
1. Track internal searches as events
2. Identify top search terms
3. Find zero-result searches (opportunity for new products/content)
4. Discover spelling variations

**Example Insights:**
```
Top Searches:
1. "wireless headphones" (15,234 searches/month)
   Action: Create dedicated category page

2. "blue running shoes size 10" (3,456 searches/month)
   Action: Optimize existing category with better filters

3. "nike pegasus" (8,901 searches/month)
   Action: Create brand-specific landing page
```
