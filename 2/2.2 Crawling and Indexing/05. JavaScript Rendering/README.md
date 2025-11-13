
## 2.2 Crawling and Indexing

---

### JavaScript Rendering (CSR vs SSR vs SSG)

Modern websites often use JavaScript frameworks (React, Vue, Angular). How content is rendered affects SEO significantly.

#### The Three Rendering Methods

**1. CSR (Client-Side Rendering)**  
JavaScript runs in the browser to build the page.

**2. SSR (Server-Side Rendering)**  
Server generates full HTML before sending to browser.

**3. SSG (Static Site Generation)**  
HTML pages pre-built at build time.

#### Client-Side Rendering (CSR)

**How it Works:**
```
1. Browser requests page
2. Server sends minimal HTML + JavaScript bundle
3. Browser downloads and executes JavaScript
4. JavaScript fetches data from API
5. JavaScript renders content
```

**Example: React SPA (Single Page Application)**

```html
<!-- What server sends: -->
<!DOCTYPE html>
<html>
<head>
    <title>My App</title>
</head>
<body>
    <div id="root"></div>
    <script src="/bundle.js"></script>
</body>
</html>
```

**JavaScript renders everything:**
```javascript
// React component
function ProductPage() {
  const [product, setProduct] = useState(null);
  
  useEffect(() => {
    fetch('/api/products/123')
      .then(res => res.json())
      .then(data => setProduct(data));
  }, []);
  
  if (!product) return <div>Loading...</div>;
  
  return (
    <div>
      <h1>{product.title}</h1>
      <p>{product.description}</p>
      <button>Add to Cart</button>
    </div>
  );
}
```

**SEO Problems with CSR:**

❌ **Googlebot sees empty page initially**
```html
<!-- What Googlebot first sees: -->
<div id="root"></div>
<!-- No content! -->
```

❌ **Slow indexing** (Google has to render JavaScript)  
❌ **Not all search engines render JS well**  
❌ **Potential for content not being indexed**  
❌ **Social media can't preview content** (Facebook, Twitter)

**When CSR is OK:**
- Web apps behind login
- Admin dashboards
- Internal tools
- Apps that don't need SEO

**Real Example Problem:**

```
Company: Travel booking site (React SPA)
Issue: Product pages empty in Google Search Console
Problem: All content loaded via JavaScript
Googlebot initially saw: <div id="app"></div>

Impact:
- 0 pages indexed
- No organic traffic
- Completely invisible in Google
```

#### Server-Side Rendering (SSR)

**How it Works:**
```
1. Browser requests page
2. Server executes JavaScript
3. Server generates full HTML
4. Server sends complete HTML to browser
5. Browser displays content immediately
6. JavaScript "hydrates" page (makes interactive)
```

**Example: Next.js SSR**

```javascript
// pages/product/[id].js

export async function getServerSideProps(context) {
  const { id } = context.params;
  
  // Fetch data on server
  const res = await fetch(`https://api.example.com/products/${id}`);
  const product = await res.json();
  
  // Pass data to component
  return {
    props: { product }
  };
}

export default function ProductPage({ product }) {
  return (
    <div>
      <h1>{product.title}</h1>
      <p>{product.description}</p>
      <img src={product.image} alt={product.title} />
      <button>Add to Cart</button>
    </div>
  );
}
```

**What Googlebot Receives:**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Blue Widget - Best Widget Ever</title>
    <meta name="description" content="Buy the Blue Widget...">
</head>
<body>
    <div id="__next">
        <div>
            <h1>Blue Widget</h1>
            <p>The best widget you'll ever own...</p>
            <img src="/images/widget.jpg" alt="Blue Widget">
            <button>Add to Cart</button>
        </div>
    </div>
    <script src="/bundle.js"></script>
</body>
</html>
```

**✅ SEO Benefits:**
- Content visible immediately
- Perfect for Googlebot
- Social media previews work
- Fast initial page load (perceived)

**❌ Drawbacks:**
- Server load (every request needs rendering)
- Slower Time to First Byte (TTFB)
- More complex infrastructure
- Higher hosting costs

**When to Use SSR:**
- E-commerce product pages
- Blog posts
- News articles
- Content that changes frequently
- When SEO is critical

#### Static Site Generation (SSG)

**How it Works:**
```
1. At build time, generate HTML for all pages
2. Store pre-rendered HTML files
3. When user requests page, serve static HTML (super fast!)
4. JavaScript hydrates page for interactivity
```

**Example: Next.js SSG**

```javascript
// pages/blog/[slug].js

// Generate static pages at build time
export async function getStaticPaths() {
  // Get all blog post slugs
  const posts = await getAllBlogPosts();
  
  return {
    paths: posts.map(post => ({
      params: { slug: post.slug }
    })),
    fallback: false
  };
}

export async function getStaticProps({ params }) {
  const post = await getBlogPost(params.slug);
  
  return {
    props: { post },
    revalidate: 3600 // Regenerate every hour
  };
}

export default function BlogPost({ post }) {
  return (
    <article>
      <h1>{post.title}</h1>
      <div dangerouslySetInnerHTML={{ __html: post.content }} />
    </article>
  );
}
```

**Build Process:**
```bash
npm run build

# Generates:
.next/server/pages/blog/post-1.html
.next/server/pages/blog/post-2.html
.next/server/pages/blog/post-3.html
... (one file per blog post)
```

**✅ SEO Benefits:**
- Instant loading (static files)
- Perfect for crawlers
- Low server requirements
- Can use CDN
- Best performance

**❌ Limitations:**
- Need to rebuild for content changes
- Not suitable for personalized content
- Can have long build times for huge sites

**Best For:**
- Blogs
- Documentation sites
- Marketing sites
- Portfolios
- Any content that doesn't change often

#### Incremental Static Regeneration (ISR)

**Next.js ISR: Best of Both Worlds**

```javascript
export async function getStaticProps() {
  const data = await fetch('https://api.example.com/data');
  
  return {
    props: { data },
    revalidate: 60 // Regenerate page every 60 seconds if requested
  };
}
```

**How it Works:**
1. First request: Serve stale static page (fast!)
2. Background: Regenerate fresh page
3. Next request: Serve new page

**Benefits:**
- ✅ Static speed
- ✅ Fresh content
- ✅ No build time issues

#### Comparison Table

| Method | SEO | Performance | Use Case | Complexity |
|--------|-----|-------------|----------|------------|
| **CSR** | ⚠️ Poor | Slow initial | Apps, dashboards | Low |
| **SSR** | ✅ Excellent | Medium | E-commerce, dynamic | High |
| **SSG** | ✅ Excellent | ⚡ Fastest | Blogs, marketing | Medium |
| **ISR** | ✅ Excellent | ⚡ Fast | E-commerce, news | Medium |

#### Real Implementation Example

**Choosing the Right Method for Different Pages:**

```javascript
// Next.js App

// Homepage: SSG (rarely changes)
// pages/index.js
export async function getStaticProps() {
  return { props: {} };
}

// Product Pages: ISR (inventory changes)
// pages/product/[id].js  
export async function getStaticProps({ params }) {
  const product = await getProduct(params.id);
  return {
    props: { product },
    revalidate: 300 // 5 minutes
  };
}

// Search Results: SSR (user-specific)
// pages/search.js
export async function getServerSideProps({ query }) {
  const results = await search(query.q);
  return { props: { results } };
}

// User Dashboard: CSR (requires auth)
// pages/dashboard.js
// No getServerSideProps or getStaticProps
// = Client-side rendering
```

#### Real Case Study: Rendering Migration

**Company:** E-commerce Site (10,000 products)

**Original:** React SPA (Pure CSR)
```
Problem:
- Google indexed: 50 pages (should be 10,000+)
- Organic traffic: 100 visitors/day
- Products invisible in search
```

**Solution:** Migrated to Next.js with ISR

```javascript
// pages/product/[id].js
export async function getStaticPaths() {
  // Generate top 1,000 products at build time
  const topProducts = await getTopProducts(1000);
  
  return {
    paths: topProducts.map(p => ({ params: { id: p.id } })),
    fallback: 'blocking' // Generate other pages on-demand
  };
}

export async function getStaticProps({ params }) {
  const product = await getProduct(params.id);
  
  return {
    props: { product },
    revalidate: 3600 // Regenerate hourly
  };
}
```

**Results After 4 Months:**

```
Indexing:
✅ Pages indexed: 50 → 9,800
✅ All products visible in Google

Performance:
✅ Load time: 3.5s → 0.8s
✅ Time to First Byte: 1.2s → 0.1s

SEO:
✅ Organic traffic: 100/day → 3,500/day
✅ Keywords ranking: 45 → 2,100
✅ Position 1-3 rankings: 5 → 340

Revenue:
✅ Organic revenue: $500/month → $45,000/month
```

#### Testing Your JavaScript SEO

**Tool 1: Google Search Console URL Inspection**
```
1. Enter URL
2. Click "Test Live URL"
3. Check "View Crawled Page"
4. See what Googlebot sees
```

**Tool 2: Mobile-Friendly Test**
```
https://search.google.com/test/mobile-friendly
Shows how Google renders your page
```

**Tool 3: View Page Source**
```
Right-click → View Page Source
If you see <div id="root"></div> with no content = CSR problem
```

**Tool 4: Disable JavaScript**
```
Chrome DevTools → Settings → Debugger → Disable JavaScript
If page is blank = SEO problem
```

---