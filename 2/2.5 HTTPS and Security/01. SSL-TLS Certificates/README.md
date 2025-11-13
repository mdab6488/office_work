# Technical SEO: HTTPS Security & Structured Data Guide

## 2.5 HTTPS and Security


**What is SSL/TLS?**

SSL (Secure Sockets Layer) and TLS (Transport Layer Security) are cryptographic protocols that encrypt data transmitted between a user's browser and your web server. TLS is the modern, more secure successor to SSL, though the term "SSL" is still commonly used.

**Why It Matters for SEO:**
- Google uses HTTPS as a ranking signal since 2014
- Chrome marks HTTP sites as "Not Secure"
- Users trust HTTPS sites more (higher conversion rates)
- Required for modern web features (HTTP/2, Service Workers, PWAs)

**Types of SSL Certificates:**

1. **Domain Validated (DV)**
   - Validates domain ownership only
   - Issued within minutes
   - Best for: Blogs, personal websites
   - Example: Let's Encrypt (Free)

2. **Organization Validated (OV)**
   - Validates domain + organization identity
   - Takes 1-3 days
   - Best for: Business websites
   - Example: DigiCert OV certificate

3. **Extended Validation (EV)**
   - Highest validation level
   - Shows organization name in address bar (some browsers)
   - Takes 1-2 weeks
   - Best for: E-commerce, financial sites
   - Example: Banks like Chase.com use EV certificates

**Real-Life Example:**

```bash
# Check a website's SSL certificate
curl -vI https://www.amazon.com 2>&1 | grep -A 10 "SSL certificate"

# You'll see information like:
# issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
# subject: C=US; ST=Washington; L=Seattle; O=Amazon.com Inc.; CN=www.amazon.com
```

**How to Obtain SSL Certificate:**

```bash
# Using Certbot (Let's Encrypt) - Free
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

