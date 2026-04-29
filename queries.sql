-- Patient Volume by Day
SELECT 
  day_of_week,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY day_of_week
ORDER BY patient_count DESC;

-- Patient Volume by Hour
SELECT 
  DATEPART(hour, admission_time) AS hour,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY hour
ORDER BY hour;

-- Average Wait Time: Peak vs Off-Peak
SELECT 
  peak_status,
  AVG(wait_time) AS avg_wait_time
FROM patient_data
GROUP BY peak_status;

-- Satisfaction Distribution (excluding missing values)
SELECT 
  wait_time_group,
  satisfaction_level,
  COUNT(*) AS count
FROM patient_data
WHERE satisfaction_level IS NOT NULL
GROUP BY wait_time_group, satisfaction_level
ORDER BY wait_time_group;
