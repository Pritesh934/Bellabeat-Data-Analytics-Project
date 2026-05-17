-- ANALYZE PHASE: Weekday Performance Trends


SELECT 
    DayOfWeek,
    AVG(TotalSteps) AS avg_steps,
    CAST(AVG(TotalDistance) AS DECIMAL(10,2)) AS avg_distance,
    AVG(Calories) AS avg_calories
FROM dailyActivity_merged
GROUP BY DayOfWeek
-- Custom ordering to ensure the results follow a standard calendar (Monday-Sunday)
ORDER BY 
    CASE 
        WHEN DayOfWeek = 'Monday' THEN 1
        WHEN DayOfWeek = 'Tuesday' THEN 2
        WHEN DayOfWeek = 'Wednesday' THEN 3
        WHEN DayOfWeek = 'Thursday' THEN 4
        WHEN DayOfWeek = 'Friday' THEN 5
        WHEN DayOfWeek = 'Saturday' THEN 6
        WHEN DayOfWeek = 'Sunday' THEN 7
    END;