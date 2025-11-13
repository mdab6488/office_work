# Complete Guide to Canonicalization and Redirects

## 2.8 Redirects

---


### 307 and 308 Redirects

#### 307 Redirect: Temporary Redirect (HTTP/1.1)

**Definition:** Similar to 302, but guarantees the request method won't change.

**Key Difference from 302:**
- 302: Browser may change POST to GET
- 307: Browser MUST keep original request method (POST stays POST)

#### Real-Life Example: Form Submission

**Scenario:** Payment processing form

```
User submits POST to: https://shop.com/checkout
Temporary redirect to: https://payment.shop.com/process
```

**Why 307?**
```python
# Flask example
@app.route('/checkout', methods=['POST'])
def checkout():
    # Temporarily redirect to payment processor
    # POST data must be preserved
    return redirect('https://payment.shop.com/process', code=307)
```

**Problem with 302:**
```
User submits: POST /checkout with payment data
302 redirect: Changes to GET /process (data lost!)
Result: Payment fails
```

**Solution with 307:**
```
User submits: POST /checkout with payment data
307 redirect: Keeps POST /process with data intact
Result: Payment succeeds
```

#### 308 Redirect: Permanent Redirect (HTTP/1.1)

**Definition:** Similar to 301, but guarantees the request method won't change.

**When to use:**
- Permanent redirects where POST/PUT requests are involved
- API endpoints that moved permanently
- RESTful API migrations

#### Real-Life Example: API Migration

**Scenario:** Company moves API to new infrastructure

```
Old API: https://api.company.com/v1/users
New API: https://api-new.company.com/v1/users
```

**Why 308?**
```javascript
// Old API server configuration
app.use('/v1/*', (req, res) => {
    const newUrl = req.url.replace(
        'https://api.company.com',
        'https://api-new.company.com'
    );
    
    // 308 ensures POST/PUT/DELETE methods are preserved
    res.redirect(308, newUrl);
});
```

**Client behavior:**
```
Client: POST /v1/users (create new user)
Old server: 308 → https://api-new.company.com/v1/users
Client: Resends POST to new URL
Result: User created successfully
```

#### When to Use 307 vs 308?

| Scenario | Use | Reason |
|----------|-----|---------|
| Temporary API maintenance | 307 | Preserve POST/PUT, but temporary |
| Permanent API migration | 308 | Preserve POST/PUT, permanent |
| Form temporarily moved | 307 | POST data must stay POST |
| Form permanently moved | 308 | POST data must stay POST |
| GET requests (temporary) | 302 | Simpler, more compatible |
| GET requests (permanent) | 301 | Standard, widely supported |
