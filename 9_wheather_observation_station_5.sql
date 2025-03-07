-- intermediate question

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

WITH CityLengths AS (
    SELECT CITY, LENGTH(CITY) AS NameLength
    FROM STATION
),
ShortestCity AS (
    SELECT CITY, NameLength
    FROM CityLengths
    ORDER BY NameLength ASC, CITY ASC
    LIMIT 1
),
LongestCity AS (
    SELECT CITY, NameLength
    FROM CityLengths
    ORDER BY NameLength DESC, CITY ASC
    LIMIT 1
)
SELECT CITY, NameLength
FROM ShortestCity
UNION ALL
SELECT CITY, NameLength
FROM LongestCity;