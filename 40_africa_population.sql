-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT CITY.name FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';