# Data Dictionary
## Project: Operational Efficiency Analysis
## Author: Bhavana Gurajala

---

| Metric | Definition | Data Type | Source |
|---|---|---|---|
| on_time_rate | % of deliveries completed on or before due date | Float | orders table |
| efficiency_score | Composite score measuring team output vs target | Integer (0-100) | performance_metrics |
| process_time_hours | Total hours taken to complete one order cycle | Float | order_processing |
| failure_category | Type of process failure logged | VARCHAR | process_failures |
| performance_score | Monthly team performance rating | Float | monthly_reports |
| target_revenue | Revenue goal set for the month | Decimal | revenue_tracking |
| actual_revenue | Actual revenue achieved for the month | Decimal | revenue_tracking |
| onboarding_days | Number of days taken to onboard a new employee | Integer | employee_onboarding |
| sprint_points_planned | Story points committed at sprint start | Integer | sprint_tracker |
| sprint_points_completed | Story points delivered by sprint end | Integer | sprint_tracker |
| kpi_threshold | Minimum acceptable value for a given KPI | Float | kpi_tracker |
