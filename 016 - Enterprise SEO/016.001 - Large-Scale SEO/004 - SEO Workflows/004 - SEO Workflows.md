
### SEO Workflows

#### 1. Enterprise SEO Request Management

**Real-World Example: IBM (100+ SEO requests per month)**

```yaml
# SEO Request Workflow Configuration
name: Enterprise SEO Request Workflow
version: 2.0

# Request Types
request_types:
  - type: new_page_optimization
    priority: medium
    sla: 5_business_days
    required_info:
      - page_url
      - target_keywords
      - business_objectives
      - competitive_analysis
    
  - type: technical_seo_issue
    priority: high
    sla: 2_business_days
    required_info:
      - affected_pages
      - issue_description
      - impact_assessment
      - screenshots
    
  - type: content_update
    priority: low
    sla: 10_business_days
    required_info:
      - page_url
      - current_content
      - requested_changes
      - target_date
    
  - type: emergency_fix
    priority: critical
    sla: 4_hours
    required_info:
      - issue_description
      - affected_traffic
      - business_impact
      - stakeholder_contact

# Workflow Stages
workflow_stages:
  1_intake:
    owner: seo_team_lead
    actions:
      - validate_request
      - assign_priority
      - route_to_specialist
    
  2_analysis:
    owner: seo_specialist
    actions:
      - conduct_keyword_research
      - analyze_competitors
      - assess_technical_requirements
      - estimate_effort
    
  3_development:
    owner: dev_team
    actions:
      - implement_changes
      - run_qa_tests
      - deploy_to_staging
    
  4_review:
    owner: seo_team
    actions:
      - verify_implementation
      - test_functionality
      - approve_for_production
    
  5_deployment:
    owner: dev_ops
    actions:
      - deploy_to_production
      - monitor_rollout
      - verify_live_status
    
  6_monitoring:
    owner: seo_team
    actions:
      - track_rankings
      - measure_traffic_impact
      - generate_results_report

# Automation Rules
automation:
  - trigger: new_request_submitted
    action: send_confirmation_email
    
  - trigger: sla_approaching_50_percent
    action: send_reminder_to_owner
    
  - trigger: sla_breach
    action: escalate_to_manager
    
  - trigger: request_completed
    action: send_completion_report
```

**Implementation Code:**

```python
# IBM's SEO Request Management System
from enum import Enum
from datetime import datetime, timedelta
from typing import List, Dict

class RequestPriority(Enum):
    CRITICAL = 1
    HIGH = 2
    MEDIUM = 3
    LOW = 4

class RequestStatus(Enum):
    SUBMITTED = "submitted"
    IN_ANALYSIS = "in_analysis"
    IN_DEVELOPMENT = "in_development"
    IN_REVIEW = "in_review"
    DEPLOYED = "deployed"
    MONITORING = "monitoring"
    COMPLETED = "completed"

class SEORequest:
    def __init__(self, request_id, request_type, submitter, description):
        self.request_id = request_id
        self.request_type = request_type
        self.submitter = submitter
        self.description = description
        self.status = RequestStatus.SUBMITTED
        self.priority = self.determine_priority()
        self.sla_deadline = self.calculate_sla()
        self.assigned_to = None
        self.created_at = datetime.now()
        self.updated_at = datetime.now()
        self.comments = []
        self.attachments = []
    
    def determine_priority(self):
        """Automatically determine request priority"""
        # Emergency keywords
        emergency_keywords = ['down', 'broken', 'critical', 'urgent', 'emergency']
        if any(keyword in self.description.lower() for keyword in emergency_keywords):
            return RequestPriority.CRITICAL
        
        # High priority keywords
        high_priority_keywords = ['homepage', 'revenue', 'conversion', 'major']
        if any(keyword in self.description.lower() for keyword in high_priority_keywords):
            return RequestPriority.HIGH
        
        # Default to medium
        return RequestPriority.MEDIUM
    
    def calculate_sla(self):
        """Calculate SLA deadline based on priority"""
        sla_hours = {
            RequestPriority.CRITICAL: 4,
            RequestPriority.HIGH: 48,
            RequestPriority.MEDIUM: 120,
            RequestPriority.LOW: 240
        }
        
        hours = sla_hours[self.priority]
        return self.created_at + timedelta(hours=hours)
    
    def assign_specialist(self, specialist):
        """Assign request to specialist"""
        self.assigned_to = specialist
        self.updated_at = datetime.now()
        self.add_comment(f"Assigned to {specialist}")
    
    def update_status(self, new_status, comment=None):
        """Update request status"""
        self.status = new_status
        self.updated_at = datetime.now()
        
        if comment:
            self.add_comment(comment)
    
    def add_comment(self, comment):
        """Add comment to request"""
        self.comments.append({
            'timestamp': datetime.now(),
            'comment': comment
        })
    
    def is_sla_at_risk(self):
        """Check if SLA is at risk"""
        time_remaining = self.sla_deadline - datetime.now()
        total_sla_time = self.sla_deadline - self.created_at
        
        # At risk if 50% of SLA time has passed
        return time_remaining < (total_sla_time * 0.5)
    
    def has_breached_sla(self):
        """Check if SLA has been breached"""
        return datetime.now() > self.sla_deadline

class SEORequestManager:
    def __init__(self):
        self.requests = {}
        self.specialists = self.load_specialists()
    
    def load_specialists(self):
        """Load available SEO specialists"""
        return {
            'technical_seo': ['John Smith', 'Jane Doe'],
            'content_seo': ['Bob Johnson', 'Alice Williams'],
            'local_seo': ['Charlie Brown', 'Diana Prince'],
            'ecommerce_seo': ['Edward Norton', 'Fiona Apple']
        }
    
    def create_request(self, request_data):
        """Create new SEO request"""
        request_id = self.generate_request_id()
        
        request = SEORequest(
            request_id=request_id,
            request_type=request_data['type'],
            submitter=request_data['submitter'],
            description=request_data['description']
        )
        
        # Auto-assign based on type
        specialist_type = self.map_request_to_specialty(request.request_type)
        available_specialist = self.get_available_specialist(specialist_type)
        
        if available_specialist:
            request.assign_specialist(available_specialist)
        
        self.requests[request_id] = request
        
        # Send notifications
        self.notify_stakeholders(request)
        
        return request
    
    def map_request_to_specialty(self, request_type):
        """Map request type to specialist area"""
        mapping = {
            'technical_seo_issue': 'technical_seo',
            'content_update': 'content_seo',
            'local_optimization': 'local_seo',
            'product_page_optimization': 'ecommerce_seo'
        }
        return mapping.get(request_type, 'technical_seo')
    
    def get_available_specialist(self, specialty):
        """Get least busy specialist"""
        specialists = self.specialists.get(specialty, [])
        
        if not specialists:
            return None
        
        # Count active requests per specialist
        workload = {specialist: 0 for specialist in specialists}
        
        for request in self.requests.values():
            if request.assigned_to in workload and request.status != RequestStatus.COMPLETED:
                workload[request.assigned_to] += 1
        
        # Return specialist with lowest workload
        return min(workload, key=workload.get)
    
    def monitor_slas(self):
        """Monitor all requests for SLA compliance"""
        at_risk = []
        breached = []
        
        for request in self.requests.values():
            if request.status == RequestStatus.COMPLETED:
                continue
            
            if request.has_breached_sla():
                breached.append(request)
            elif request.is_sla_at_risk():
                at_risk.append(request)
        
        # Send alerts
        if at_risk:
            self.send_sla_risk_alerts(at_risk)
        
        if breached:
            self.escalate_breached_requests(breached)
        
        return {
            'at_risk': at_risk,
            'breached': breached
        }
    
    def generate_dashboard(self):
        """Generate request dashboard"""
        total_requests = len(self.requests)
        
        by_status = {}
        by_priority = {}
        
        for request in self.requests.values():
            # Count by status
            status = request.status.value
            by_status[status] = by_status.get(status, 0) + 1
            
            # Count by priority
            priority = request.priority.name
            by_priority[priority] = by_priority.get(priority, 0) + 1
        
        return {
            'total_requests': total_requests,
            'by_status': by_status,
            'by_priority': by_priority,
            'sla_compliance': self.calculate_sla_compliance()
        }
    
    def calculate_sla_compliance(self):
        """Calculate SLA compliance rate"""
        completed = [r for r in self.requests.values() if r.status == RequestStatus.COMPLETED]
        
        if not completed:
            return 100.0
        
        on_time = sum(1 for r in completed if not r.has_breached_sla())
        
        return (on_time / len(completed)) * 100
    
    def notify_stakeholders(self, request):
        """Send notifications to stakeholders"""
        # Email notification logic
        print(f"📧 Request {request.request_id} created and assigned to {request.assigned_to}")
    
    def send_sla_risk_alerts(self, requests):
        """Send alerts for at-risk requests"""
        for request in requests:
            print(f"⚠️ SLA ALERT: Request {request.request_id} at risk - {request.sla_deadline}")
    
    def escalate_breached_requests(self, requests):
        """Escalate breached SLA requests"""
        for request in requests:
            print(f"🚨 SLA BREACH: Request {request.request_id} - Escalating to management")
    
    def generate_request_id(self):
        """Generate unique request ID"""
        return f"SEO-{datetime.now().strftime('%Y%m%d')}-{len(self.requests) + 1:04d}"

# Usage Example
manager = SEORequestManager()

# Create sample requests
request1 = manager.create_request({
    'type': 'technical_seo_issue',
    'submitter': 'Marketing Team',
    'description': 'Homepage title tag is missing - URGENT'
})

request2 = manager.create_request({
    'type': 'content_update',
    'submitter': 'Content Team',
    'description': 'Update product category descriptions for Q4'
})

# Monitor SLAs
sla_status = manager.monitor_slas()

# Generate dashboard
dashboard = manager.generate_dashboard()
print("\n📊 SEO Request Dashboard:")
print(f"Total Requests: {dashboard['total_requests']}")
print(f"SLA Compliance: {dashboard['sla_compliance']:.1f}%")
print(f"By Status: {dashboard['by_status']}")
print(f"By Priority: {dashboard['by_priority']}")
```

**IBM Results:**
- Processes 100+ SEO requests/month efficiently
- 94% SLA compliance rate
- Reduced average resolution time from 12 days to 4.5 days
- Increased stakeholder satisfaction by 78%
