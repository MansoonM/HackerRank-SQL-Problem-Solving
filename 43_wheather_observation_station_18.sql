-- Consider  and  to be two points on a 2D plane.

--  happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the minimum value in Western Longitude (LONG_W in STATION).
--  happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

-- Input Format

-- The STATION table is described as follows:

-- Station.jpg

-- where LAT_N is the northern latitude and LONG_W is the western longitude.

WITH MinMax AS (
    SELECT 
        MIN(LAT_N) AS min_lat,
        MIN(LONG_W) AS min_long,
        MAX(LAT_N) AS max_lat,
        MAX(LONG_W) AS max_long
    FROM STATION
)
SELECT 
    ROUND(
        ABS(min_lat - max_lat) + ABS(min_long - max_long), 
        4
    ) AS Manhattan_Distance
FROM MinMax;