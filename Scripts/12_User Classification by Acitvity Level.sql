-- ANALYZE PHASE: User Classification by Activity Level
-- Purpose: Segmenting users to provide targeted marketing recommendations.

WITH User_Averages AS (
    SELECT 
        Id, 
        AVG(TotalSteps) AS avg_daily_steps
    FROM dailyActivity_merged
    GROUP BY Id
)
SELECT 
    Id,
    avg_daily_steps,
    CASE
        WHEN avg_daily_steps < 5000 THEN 'Sedentary'
        WHEN avg_daily_steps BETWEEN 5000 AND 7499 THEN 'Lightly Active'
        WHEN avg_daily_steps BETWEEN 7500 AND 9999 THEN 'Fairly Active'
        WHEN avg_daily_steps >= 10000 THEN 'Very Active'
    END AS user_type
FROM User_Averages
ORDER BY avg_daily_steps DESC;