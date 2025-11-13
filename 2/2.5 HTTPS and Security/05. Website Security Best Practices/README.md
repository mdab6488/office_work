# Technical SEO: HTTPS Security & Structured Data Guide

## 2.5 HTTPS and Security


### Website Security Best Practices

**1. Keep Software Updated**

```bash
# Check WordPress version
wp core version

# Update WordPress core
wp core update

# Update all plugins
wp plugin update --all

# Update all themes
wp theme update --all
```

**2. Strong Password Policy**

```javascript
// Password strength requirements
const passwordRequirements = {
    minLength: 12,
    requireUppercase: true,
    requireLowercase: true,
    requireNumbers: true,
    requireSpecialChars: true,
    disallowCommon: true // No "password123", "admin", etc.
};

// Good password example
"MyD0g$Love$T0Run!"  // 17 characters, mixed case, numbers, special chars
```

**3. Two-Factor Authentication (2FA)**

Real-Life Implementation:
```javascript
// Using Google Authenticator
// 1. Install WordPress 2FA plugin
// 2. Scan QR code with phone app
// 3. Enter 6-digit code to login

// For custom apps, use libraries like:
// - Speakeasy (Node.js)
// - PyOTP (Python)
// - Google Authenticator (PHP)
```

**4. Regular Backups**

```bash
# Automated backup script (Linux/cPanel)
#!/bin/bash
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="/backups"

# Backup database
mysqldump -u username -p'password' database_name > $BACKUP_DIR/db_$DATE.sql

# Backup files
tar -czf $BACKUP_DIR/files_$DATE.tar.gz /var/www/html/

# Keep only last 30 days
find $BACKUP_DIR -type f -mtime +30 -delete

# Upload to cloud (AWS S3)
aws s3 cp $BACKUP_DIR/db_$DATE.sql s3://your-bucket/backups/
aws s3 cp $BACKUP_DIR/files_$DATE.tar.gz s3://your-bucket/backups/
```

**5. Web Application Firewall (WAF)**

Popular WAF Solutions:
- **Cloudflare** (Free tier available)
- **Sucuri**
- **Wordfence** (WordPress)
- **AWS WAF**

**Real-Life Example - Cloudflare Setup:**

```javascript
// Cloudflare Firewall Rules (Business Plan)
// Block SQL injection attempts
(http.request.uri.query contains "UNION SELECT") or
(http.request.uri.query contains "DROP TABLE") or
(http.request.uri.query contains "1=1")

// Block common attack patterns
(http.user_agent contains "sqlmap") or
(http.user_agent contains "nikto") or
(http.request.uri.path contains "/wp-admin/" and not ip.src in {YOUR_IP})
```

**6. File Upload Security**

```php
// Secure file upload (PHP)
<?php
$allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
$max_size = 5 * 1024 * 1024; // 5MB

if (in_array($_FILES['file']['type'], $allowed_types)) {
    if ($_FILES['file']['size'] <= $max_size) {
        // Generate random filename to prevent overwrites
        $extension = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
        $new_filename = uniqid() . '.' . $extension;
        
        // Move to uploads directory (outside web root if possible)
        move_uploaded_file($_FILES['file']['tmp_name'], 
            '/var/www/uploads/' . $new_filename);
    }
}
?>
```

**7. Database Security**

```php
// BAD: SQL Injection Vulnerable
$username = $_POST['username'];
$query = "SELECT * FROM users WHERE username = '$username'";
// Attacker can input: ' OR '1'='1

// GOOD: Prepared Statements
$stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username");
$stmt->execute(['username' => $username]);
```

**8. Monitor and Log**

```bash
# Monitor Apache access logs for suspicious activity
tail -f /var/log/apache2/access.log | grep -E "(admin|wp-login|xmlrpc)"

# Check for failed login attempts
grep "Failed password" /var/log/auth.log | tail -20

# Monitor file changes (Linux)
sudo apt-get install tripwire
sudo tripwire --check
```

**9. Disable Unnecessary Services**

```xml
<!-- WordPress: Disable XML-RPC (common attack vector) -->
<!-- Add to .htaccess -->
<Files xmlrpc.php>
    Order Deny,Allow
    Deny from all
</Files>
```

**10. Security Audit Checklist**

```markdown
[ ] SSL certificate installed and valid
[ ] All HTTP redirects to HTTPS
[ ] No mixed content warnings
[ ] Security headers configured
[ ] Software up to date
[ ] Strong passwords enforced
[ ] 2FA enabled for admin accounts
[ ] Daily automated backups
[ ] WAF configured
[ ] Regular security scans (weekly)
[ ] File permissions correct (644 files, 755 directories)
[ ] Database credentials secured
[ ] Error reporting disabled in production
[ ] Admin area IP-restricted (if possible)
[ ] Unused plugins/themes removed
```

---

