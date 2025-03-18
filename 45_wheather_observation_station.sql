-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

-- Input Format

-- The STATION table is described as follows:

-- Station.jpg

-- where LAT_N is the northern latitude and LONG_W is the western longitude.


WITH OrderedLatitudes AS (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total_count
    FROM STATION
)
SELECT 
    ROUND(
        CASE 
            WHEN total_count % 2 = 1 THEN 
                (SELECT LAT_N FROM OrderedLatitudes WHERE rn = (total_count + 1) / 2)
            ELSE 
                (SELECT AVG(LAT_N) 
                 FROM OrderedLatitudes 
                 WHERE rn IN (total_count / 2, total_count / 2 + 1))
        END, 
        4
    ) AS Median_Latitude
FROM OrderedLatitudes
LIMIT 1;








-- Explanation of the SQL Query:
-- Common Table Expression (CTE) - OrderedLatitudes:

-- We select the LAT_N values and assign a row number (rn) to each latitude based on its order.
-- We also calculate the total count of rows using COUNT(*) OVER ().
-- Final SELECT Statement:

-- We use a CASE statement to determine if the total count of latitudes is odd or even.
-- If odd, we select the middle value using the row number.
-- If even, we calculate the average of the two middle values.
-- We round the result to 4 decimal places using the ROUND function.
-- Example
-- Assuming the STATION table has the following data:

-- LAT_N

-- 34.0

-- 36.0

-- 35.0

-- 33.0

-- 37.0

-- The sorted LAT_N values are: 33.0, 34.0, 35.0, 36.0, 37.0.
-- The total count is 5 (odd), so the median is the middle value, which is 35.0.
-- Thus, the output would be:

-- Run
-- Copy code
-- Median_Latitude
-- 35.0000
-- This output meets the requirements specified in the prompt, providing the median of the Northern Latitudes rounded to four decimal places.