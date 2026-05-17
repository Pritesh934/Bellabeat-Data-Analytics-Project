-- ANALYZE PHASE: Activity Distribution


SELECT 
    act.Id, 
    SUM(act.SedentaryMinutes) AS total_sedentary_mins,
    SUM(act.LightlyActiveMinutes) AS total_lightly_active_mins,
    SUM(act.FairlyActiveMinutes) AS total_fairly_active_mins, 
    SUM(act.VeryActiveMinutes) AS total_very_active_mins,
    -- Calculation for Sedentary %
    CAST(SUM(act.SedentaryMinutes) * 100.0 / 
        NULLIF((SUM(act.SedentaryMinutes) + SUM(act.LightlyActiveMinutes) + 
         SUM(act.FairlyActiveMinutes) + SUM(act.VeryActiveMinutes)), 0) AS DECIMAL(10,2)) AS sedentary_percentage
FROM dailyActivity_merged AS act
-- We join with sleepDay_merged just to apply the "Users with Sleep Data" filter
INNER JOIN sleepDay_merged AS slp 
    ON act.Id = slp.Id AND act.ActivityDate_Cleaned = slp.SleepDay_Cleaned
GROUP BY act.Id
ORDER BY sedentary_percentage DESC;