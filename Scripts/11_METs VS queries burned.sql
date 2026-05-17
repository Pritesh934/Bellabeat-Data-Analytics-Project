-- ANALYZE PHASE: METs vs. Calories Burned Comparison
-- Purpose: Identifying if high-intensity minutes correlate with total daily calorie burn.

SELECT 
    temp1.Id, 
    temp1.ActivityDate_Only, 
    SUM(temp1.METs) AS total_mets_sum, 
    temp2.Calories AS daily_calories_burned
FROM minuteMETSNarrow_merged AS temp1
INNER JOIN dailyActivity_merged AS temp2
    ON temp1.Id = temp2.Id AND temp1.ActivityDate_Only = temp2.ActivityDate_Cleaned
GROUP BY temp1.Id, temp1.ActivityDate_Only, temp2.Calories
ORDER BY total_mets_sum DESC
-- Using OFFSET/FETCH to preview the top results
OFFSET 0 ROWS FETCH FIRST 20 ROWS ONLY;