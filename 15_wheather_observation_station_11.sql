-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%' AND 
      CITY NOT LIKE 'E%' AND 
      CITY NOT LIKE 'I%' AND 
      CITY NOT LIKE 'O%' AND 
      CITY NOT LIKE 'U%'
   OR CITY NOT LIKE '%a' AND 
      CITY NOT LIKE '%e' AND 
      CITY NOT LIKE '%i' AND 
      CITY NOT LIKE '%o' AND 
      CITY NOT LIKE '%u';