-- ANALYZE PHASE: Sleep Efficiency Analysis
SELECT 
    Id, 
    -- We multiply by 1.0 to ensure SQL performs decimal division instead of integer division
    CAST(AVG(TotalMinutesAsleep) / 60.0 AS DECIMAL(10,2)) AS avg_sleep_time_hour,
    CAST(AVG(TotalTimeInBed) / 60.0 AS DECIMAL(10,2)) AS avg_time_bed_hour,
    AVG(TotalTimeInBed - TotalMinutesAsleep) AS avg_wasted_bed_time_min
FROM sleepDay_merged
GROUP BY Id
ORDER BY avg_wasted_bed_time_min DESC;