HEALTHCARE SQL ANALYSIS PROJECT
-- Patient Flow, Wait Times, and Satisfaction
-- 

-- 1. DATA QUALITY CHECKS
-- =========================================

-- Check total rows and missing satisfaction values
SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN satisfaction_level IS NULL THEN 1 ELSE 0 END) AS missing_satisfaction
FROM patient_data;

-- Identify extreme wait time outliers
SELECT *
FROM patient_data
WHERE wait_time > 120;


-- 2. VOLUME ANALYSIS
-- =========================================

-- Patient volume by day of week
SELECT 
  day_of_week,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY day_of_week
ORDER BY patient_count DESC;

-- Patient volume by hour of day
SELECT 
  DATEPART(hour, admission_time) AS hour,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY hour
ORDER BY hour;

-- Top 5 busiest hours
SELECT 
  DATEPART(hour, admission_time) AS hour,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY hour
ORDER BY patient_count DESC
LIMIT 5;

-- Busiest periods by day and hour (multi-dimensional analysis)
SELECT 
  day_of_week,
  DATEPART(hour, admission_time) AS hour,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY day_of_week, hour
ORDER BY patient_count DESC;



-- 3. OPERATIONAL PERFORMANCE
-- =========================================

-- Average wait time: Peak vs Off-Peak
SELECT 
  peak_status,
  COUNT(*) AS patient_count,
  AVG(wait_time) AS avg_wait_time
FROM patient_data
GROUP BY peak_status;

-- Wait time distribution
SELECT 
  wait_time_flag,
  COUNT(*) AS patient_count
FROM patient_data
GROUP BY wait_time_group;



-- 4. SATISFACTION ANALYSIS
-- =========================================

-- Satisfaction distribution (excluding missing values)
SELECT 
  wait_time_flag,
  satisfaction_level,
  COUNT(*) AS count
FROM patient_data
WHERE satisfaction_level IS NOT NULL
GROUP BY wait_time_flag, satisfaction_level
ORDER BY wait_time_flag;

-- High satisfaction rate by wait time group
SELECT 
  wait_time_flag,
  AVG(CASE WHEN satisfaction_level = 'High' THEN 1 ELSE 0 END) AS high_satisfaction_rate
FROM patient_data
WHERE satisfaction_level IS NOT NULL
GROUP BY wait_time_flag;
