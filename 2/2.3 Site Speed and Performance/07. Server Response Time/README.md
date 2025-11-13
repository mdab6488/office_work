
## 2.3 Site Speed and Performance

Site speed is a critical ranking factor for Google and directly impacts user experience, conversion rates, and bounce rates.


### Server Response Time (TTFB)

Time to First Byte (TTFB) is the time between request and first byte received.

**Good TTFB:** Under 600ms
**Poor TTFB:** Over 1000ms

#### Common Causes of Slow TTFB

1. **Slow Database Queries**
2. **No Server-Side Caching**
3. **Shared Hosting / Weak Server**
4. **Poor Server Configuration**
5. **Heavy Server-Side Processing**

#### Real-Life Example: WordPress Site

**Before Optimization:**
```
TTFB: 2,400ms
Issue: 47 database queries per page
Database query time: 1,850ms
Server processing: 430ms
Network: 120ms
```

**Optimization Steps:**

**1. Database Query Optimization**
```sql
-- ❌ Bad: N+1 Query Problem
SELECT * FROM posts;
-- Then for each post:
SELECT * FROM post_meta WHERE post_id = ?;

-- ✅ Good: Single Optimized Query
SELECT p.*, GROUP_CONCAT(pm.meta_value) as meta
FROM posts p
LEFT JOIN post_meta pm ON p.id = pm.post_id
GROUP BY p.id;

-- Add Indexes
CREATE INDEX idx_post_id ON post_meta(post_id);
CREATE INDEX idx_post_status ON posts(status, publish_date);
```

**2. Implement Object Caching (Redis)**
```php
// Check cache first
$posts = wp_cache_get('recent_posts');

if (false === $posts) {
    // Cache miss - query database
    $posts = get_posts(['posts_per_page' => 10]);
    
    // Store in cache for 1 hour
    wp_cache_set('recent_posts', $posts, '', 3600);
}

return $posts;
```

**3. OpCode Caching (OPcache)**
```ini
; php.ini
opcache.enable=1
opcache.memory_consumption=256
opcache.interned_strings_buffer=16
opcache.max_accelerated_files=10000
opcache.validate_timestamps=0
opcache.revalidate_freq=0
```

**After Optimization:**
```
TTFB: 180ms (92.5% improvement)
Database queries: 8 (83% reduction)
Database query time: 45ms (97.6% faster)
Server processing: 95ms (78% faster)
Network: 40ms (CDN implemented)

Result:
- Page load: 6.2s → 1.4s
- Bounce rate: 72% → 31%
- Server costs: -58% (less CPU usage)
```

#### Server Configuration Optimization

**Nginx Optimization:**
```nginx
# Worker processes
worker_processes auto;
worker_rlimit_nofile 100000;

events {
    worker_connections 4000;
    use epoll;
    multi_accept on;
}

http {
    # Compression
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css text/xml text/javascript 
               application/json application/javascript application/xml+rss;
    
    # Brotli (better compression)
    brotli on;
    brotli_comp_level 6;
    brotli_types text/plain text/css application/javascript application/json;
    
    # Connection optimization
    keepalive_timeout 65;
    keepalive_requests 100;
    
    # Buffer sizes
    client_body_buffer_size 128k;
    client_max_body_size 10m;
    client_header_buffer_size 1k;
    large_client_header_buffers 4 4k;
    output_buffers 1 32k;
    postpone_output 1460;
    
    # Timeouts
    client_header_timeout 3m;
    client_body_timeout 3m;
    send_timeout 3m;
}
```

---