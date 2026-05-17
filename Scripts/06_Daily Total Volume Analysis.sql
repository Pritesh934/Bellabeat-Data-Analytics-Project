-- ANALYZE PHASE: Daily Total Volume Analysis


SELECT 
    DayOfWeek,
    SUM(TotalSteps) AS total_steps,
    CAST(SUM(TotalDistance) AS DECIMAL(10,2)) AS total_distance,
    SUM(Calories) AS total_calories
FROM dailyActivity_merged
GROUP BY DayOfWeek
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