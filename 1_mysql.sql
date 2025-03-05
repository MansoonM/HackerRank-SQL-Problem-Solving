-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

select NAME from CITY 
where POPULATION > 120000 AND COUNTRYCODE = 'USA';