-- Fill dailyActivity
UPDATE dailyActivity_merged
SET ActivityDate_Cleaned = CONVERT(DATE, ActivityDate, 101),
    DayOfWeek = DATENAME(WEEKDAY, CONVERT(DATE, ActivityDate, 101));

-- Fill sleepDay
UPDATE sleepDay_merged
SET SleepDay_Cleaned = TRY_CONVERT(DATE, SleepDay, 101);

-- Fill Hourly Tables (Calories, Intensity, Steps)
UPDATE hourlyCalories_merged 
SET ActivityHour_Cleaned = TRY_CONVERT(DATETIME2, ActivityHour, 101),
    ActivityDate_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS DATE),
    ActivityTime_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS TIME);

UPDATE hourlyIntensities_merged 
SET ActivityHour_Cleaned = TRY_CONVERT(DATETIME2, ActivityHour, 101),
    ActivityDate_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS DATE),
    ActivityTime_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS TIME);

UPDATE hourlySteps_merged 
SET ActivityHour_Cleaned = TRY_CONVERT(DATETIME2, ActivityHour, 101),
    ActivityDate_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS DATE),
    ActivityTime_Only = CAST(TRY_CONVERT(DATETIME2, ActivityHour, 101) AS TIME);

-- Create Unified Hourly Table
SELECT 
    cal.Id, cal.ActivityDate_Only AS ActivityDate, cal.ActivityTime_Only AS ActivityTime,
    DATENAME(WEEKDAY, cal.ActivityDate_Only) AS DayOfWeek,
    CASE
        WHEN DATEPART(HOUR, cal.ActivityTime_Only) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, cal.ActivityTime_Only) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, cal.ActivityTime_Only) BETWEEN 17 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS TimeOfDay,
    cal.Calories, int.TotalIntensity, int.AverageIntensity, stp.StepTotal
INTO hourly_data_unified
FROM hourlyCalories_merged AS cal
INNER JOIN hourlyIntensities_merged AS int ON cal.Id = int.Id AND cal.ActivityHour_Cleaned = int.ActivityHour_Cleaned
INNER JOIN hourlySteps_merged AS stp ON cal.Id = stp.Id AND cal.ActivityHour_Cleaned = stp.ActivityHour_Cleaned;

-- Create Daily Unified Table
SELECT 
    act.Id, act.ActivityDate_Cleaned, act.DayOfWeek, act.TotalSteps, act.Calories,
    slp.TotalMinutesAsleep, slp.TotalTimeInBed
INTO daily_activity_and_sleep_unified
FROM dailyActivity_merged AS act
LEFT JOIN sleepDay_merged AS slp ON act.Id = slp.Id AND act.ActivityDate_Cleaned = slp.SleepDay_Cleaned;