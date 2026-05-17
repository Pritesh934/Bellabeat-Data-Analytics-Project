-- ANALYZE PHASE: Activity Intensity vs. Calories Burned

SELECT 
    Id,
    SUM(TotalSteps) AS total_steps,
    SUM(VeryActiveMinutes) AS total_very_active_mins,
    SUM(FairlyActiveMinutes) AS total_fairly_active_mins, 
    SUM(LightlyActiveMinutes) AS total_lightly_active_mins,   
    SUM(Calories) AS total_calories
FROM dailyActivity_merged
GROUP BY Id
ORDER BY total_calories DESC;