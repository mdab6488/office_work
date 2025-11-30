
### 6. JAVASCRIPT RENDERING
**Requirement**: Content accessible to crawlers (server-side rendering)

**Specification**:
```javascript
// Use Next.js server-side rendering
export async function getServerSideProps(context) {
    const { productId } = context.params;
    
    // Fetch product data server-side
    const product = await fetchProduct(productId);
    
    // Return as props for server-side rendering
    return {
        props: {
            product,
            // Pre-render SEO metadata
            seoMetadata: {
                title: `${product.name} | ${product.category} | Salesforce`,
                description: product.seo_description,
                canonical: `https://www.salesforce.com/products/${product.category}/${product.slug}/${productId}`
            }
        }
    };
}

// Component receives pre-rendered data
export default function ProductPage({ product, seoMetadata }) {
    return (
        <>
            <Head>
                <title>{seoMetadata.title}</title>
                <meta name="description" content={seoMetadata.description} />
                <link rel="canonical" href={seoMetadata.canonical} />
            </Head>
            
            <main>
                <h1>{product.name}</h1>
                <div dangerouslySetInnerHTML={{ __html: product.description }} />
            </main>
        </>
    );
}
```

**Testing Protocol**:
```bash
# Test server-side rendering
curl -A "Googlebot" https://www.salesforce.com/products/test | grep "<h1>"

# Should return actual content, not "Loading..." or empty
```

**Acceptance Criteria**:
- [x] Critical content rendered server-side
- [x] HTML source contains actual content (not client-rendered)
- [x] Works with JavaScript disabled
- [x] Googlebot can access content (test with curl)
