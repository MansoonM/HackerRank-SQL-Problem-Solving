-- wheather_observation_station

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.



SELECT TRUNCATE(SUM(LAT_N), 4) AS Sum_Lat_N
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;