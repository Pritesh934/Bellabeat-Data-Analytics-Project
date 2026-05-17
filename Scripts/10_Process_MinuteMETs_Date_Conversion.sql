-- 1. Add the bucket for the date
ALTER TABLE minuteMETSNarrow_merged ADD ActivityDate_Only DATE;

-- 2. Fill the bucket (Converting the string to a DATE)
-- This might take a few seconds due to the 1.3 million rows
UPDATE minuteMETSNarrow_merged
SET ActivityDate_Only = CAST(CONVERT(DATETIME2, ActivityMinute, 101) AS DATE);