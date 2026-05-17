-- ANALYZE PHASE: Sleep and Calories Correlation
SELECT 
    act.Id, 
    SUM(act.Calories) AS total_calories,
    SUM(slp.TotalMinutesAsleep) AS total_sleep_min,
    SUM(slp.TotalTimeInBed) AS total_time_inbed_min,
    -- Calculation: Sleep as a percentage of time in bed
    CAST(SUM(slp.TotalMinutesAsleep) * 100.0 / NULLIF(SUM(slp.TotalTimeInBed), 0) AS DECIMAL(10,2)) AS sleep_efficiency_pct
FROM dailyActivity_merged AS act
INNER JOIN sleepDay_merged AS slp 
    ON act.Id = slp.Id AND act.ActivityDate_Cleaned = slp.SleepDay_Cleaned
GROUP BY act.Id
ORDER BY total_calories DESC;