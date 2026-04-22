-- Query 1: Detect orders taking longer than average to process
SELECT 
  order_id,
  process_time_hours,
  AVG(process_time_hours) OVER () AS avg_process_time,
  CASE 
    WHEN process_time_hours > AVG(process_time_hours) OVER () * 1.5 
    THEN 'Anomaly' ELSE 'Normal' 
  END AS status
FROM order_processing
ORDER BY process_time_hours DESC;

-- Query 2: Flag departments with efficiency below threshold
SELECT 
  department,
  AVG(efficiency_score) AS avg_score,
  CASE WHEN AVG(efficiency_score) < 70 THEN 'Needs Improvement' ELSE 'Acceptable' END AS flag
FROM performance_metrics
GROUP BY department;

-- Query 3: Identify repeated process failures by category
SELECT 
  failure_category,
  COUNT(*) AS occurrence_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM process_failures
GROUP BY failure_category
ORDER BY occurrence_count DESC;

-- Query 4: Month over month performance trend
SELECT 
  MONTH(report_date) AS month,
  AVG(performance_score) AS avg_score,
  LAG(AVG(performance_score)) OVER (ORDER BY MONTH(report_date)) AS prev_month_score,
  AVG(performance_score) - LAG(AVG(performance_score)) OVER (ORDER BY MONTH(report_date)) AS change
FROM monthly_reports
GROUP BY MONTH(report_date);
