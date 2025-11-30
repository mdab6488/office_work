
### 1.2 Understanding GA4 Reports

#### Report Structure

GA4 organizes reports into four main sections:

```
Reports Snapshot (Dashboard Overview)
├── Life cycle
│   ├── Acquisition (How users find you)
│   ├── Engagement (What users do)
│   ├── Monetization (Revenue tracking)
│   └── Retention (User loyalty)
├── User
│   ├── Demographics
│   └── Tech (devices, browsers)
├── Explore (Custom analysis)
└── Advertising (Campaign performance)
```

#### Key Metrics Explained

**Users vs. Sessions vs. Events**

```plaintext
Traditional (UA)          GA4
─────────────────────────────────────
Sessions                  → Sessions
Users                     → Users
Pageviews                 → Page_view events
Bounce Rate               → Engagement Rate
Goal Completions          → Conversions

Key Difference:
- UA: Session-based (30-min timeout)
- GA4: Event-based (flexible, no timeouts)
```

**Understanding the Metrics:**

| Metric | Definition | Real-Life Example |
|--------|-----------|-------------------|
| **Users** | Unique visitors to your site | 10,000 people visited your site last month |
| **Sessions** | Group of user interactions | Those 10,000 users created 15,000 sessions (some returned) |
| **Engagement Rate** | % of engaged sessions (>10s, 2+ pages, or conversion) | 65% stayed engaged, 35% bounced quickly |
| **Average Engagement Time** | Time users actively engaged | Average 2m 30s per session |
| **Event Count** | Total tracked events | 125,000 events (page views, clicks, scrolls) |

---
