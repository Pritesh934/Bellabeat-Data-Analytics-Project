-- 1. Adding buckets to dailyActivity
ALTER TABLE dailyActivity_merged ADD ActivityDate_Cleaned DATE;
ALTER TABLE dailyActivity_merged ADD DayOfWeek NVARCHAR(20);

-- 2. Adding buckets to sleepDay
ALTER TABLE sleepDay_merged ADD SleepDay_Cleaned DATE;

-- 3. Adding buckets to Hourly Tables
ALTER TABLE hourlyCalories_merged ADD ActivityHour_Cleaned DATETIME2, ActivityDate_Only DATE, ActivityTime_Only TIME;
ALTER TABLE hourlyIntensities_merged ADD ActivityHour_Cleaned DATETIME2, ActivityDate_Only DATE, ActivityTime_Only TIME;
ALTER TABLE hourlySteps_merged ADD ActivityHour_Cleaned DATETIME2, ActivityDate_Only DATE, ActivityTime_Only TIME;