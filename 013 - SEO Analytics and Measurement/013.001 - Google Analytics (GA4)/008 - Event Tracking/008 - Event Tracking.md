
### 1.8 Event Tracking

#### Default Events in GA4

**Automatically Collected Events:**

```plaintext
Enhanced Measurement Events (Auto-tracked):
✓ page_view          - Page loads
✓ scroll             - User scrolls 90%
✓ click              - Outbound link clicks
✓ view_search_results - Site search usage
✓ video_start        - Video engagement
✓ video_progress     - 10%, 25%, 50%, 75%
✓ video_complete     - Video finished
✓ file_download      - File downloads (.pdf, .docx, etc.)
✓ first_visit        - New user visit
✓ session_start      - Session begins
```

#### Custom Event Tracking

**Creating Custom Events:**

```javascript
// Example 1: Track Newsletter Signup
document.getElementById('newsletter-form').addEventListener('submit', function() {
  gtag('event', 'newsletter_signup', {
    'location': 'footer',
    'method': 'email'
  });
});

// Example 2: Track Product Filter Usage
function trackFilterUse(filterType, filterValue) {
  gtag('event', 'filter_used', {
    'filter_type': filterType,
    'filter_value': filterValue,
    'page_type': 'product_listing'
  });
}

// Usage:
trackFilterUse('price', '$50-$100');
trackFilterUse('brand', 'Nike');

// Example 3: Track Error Messages
function trackError(errorType, errorMessage) {
  gtag('event', 'error_occurred', {
    'error_type': errorType,
    'error_message': errorMessage,
    'page_url': window.location.href
  });
}

// Usage:
trackError('validation', 'Invalid email format');

// Example 4: Track Social Sharing
document.querySelectorAll('.social-share').forEach(button => {
  button.addEventListener('click', function() {
    gtag('event', 'share', {
      'method': this.dataset.platform,  // Facebook, Twitter, LinkedIn
      'content_type': 'article',
      'item_id': 'blog-post-123'
    });
  });
});

// Example 5: Track Time to Interactive
window.addEventListener('load', function() {
  const loadTime = performance.timing.loadEventEnd - performance.timing.navigationStart;
  
  gtag('event', 'timing_complete', {
    'name': 'page_load',
    'value': loadTime,
    'event_category': 'Performance'
  });
});
```

**Real-Life Event Tracking Implementation:**

```plaintext
Case Study: SaaS Product Dashboard Tracking
═══════════════════════════════════════════════

Business Goal: Understand feature usage to improve product

Events Implemented:
─────────────────────────────────────────────────────────

1. Feature Usage Tracking:
   gtag('event', 'feature_used', {
     'feature_name': 'analytics_dashboard',
     'user_role': 'admin',
     'plan_type': 'premium'
   });

2. Report Generation:
   gtag('event', 'report_generated', {
     'report_type': 'sales_summary',
     'date_range': '30_days',
     'export_format': 'pdf'
   });

3. Help Documentation Access:
   gtag('event', 'help_accessed', {
     'article_title': 'How to create custom reports',
     'search_query': 'custom reports',
     'was_helpful': true
   });

4. Upgrade Prompt Interaction:
   gtag('event', 'upgrade_prompt_seen', {
     'prompt_location': 'feature_limit_reached',
     'current_plan': 'free',
     'suggested_plan': 'professional'
   });

Results After 30 Days:
─────────────────────────────────────────────

Feature Usage (Most Popular):
1. Analytics Dashboard - 12,450 uses
2. Export Reports - 8,230 uses
3. Team Collaboration - 6,890 uses
4. Data Integration - 4,560 uses
5. Custom Fields - 3,120 uses

Insights Discovered:
✓ 78% of users never explore advanced features
  → Created onboarding tutorial
  
✓ Export feature heavily used in free plan
  → Made it premium-only feature
  
✓ Help docs accessed most for integrations
  → Improved integration documentation
  
✓ 45% see upgrade prompt, 12% click through
  → A/B test prompt messaging

Business Impact:
→ Feature adoption increased 34%
→ Support tickets reduced 23%
→ Upgrade conversions improved 67%
→ User engagement +28%
```

#### Event Debug Mode

**Testing Your Events:**

```plaintext
Enable Debug Mode in GA4:

Method 1: Chrome Extension
1. Install "Google Analytics Debugger"
2. Click extension icon to enable
3. Open site and check browser console

Method 2: Tag Manager Preview
1. GTM → Preview button
2. Enter your website URL
3. See real-time event firing

Method 3: DebugView in GA4
1. GA4 Admin → DebugView
2. Add ?_gl=debug to URL
3. View events in real-time

Common Event Errors to Check:
──────────────────────────────────────
✗ Missing required parameters
✗ Incorrect parameter data types
✗ Event names with spaces (use underscores)
✗ Parameter names over 40 characters
✗ Event fired multiple times
✗ Mismatched measurement IDs
```
