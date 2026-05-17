-- High-level averages for the daily data
SELECT 
    AVG(TotalSteps) AS avg_steps,
    AVG(Calories) AS avg_calories,
    AVG(TotalMinutesAsleep) AS avg_sleep_mins,
    AVG(TotalMinutesAsleep)/60 AS avg_sleep_hours
FROM daily_activity_and_sleep_unified;

-- Best and Worst times for activity (Hourly trends)
SELECT 
    TimeOfDay, 
    AVG(StepTotal) AS avg_hourly_steps,
    AVG(Calories) AS avg_hourly_calories
FROM hourly_data_unified
GROUP BY TimeOfDay
ORDER BY avg_hourly_steps DESC;