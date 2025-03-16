-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

-- * 
-- * * 
-- * * * 
-- * * * * 
-- * * * * *
-- Write a query to print the pattern P(20).

WITH RECURSIVE Pattern AS (
    SELECT 1 AS RowNum
    UNION ALL
    SELECT RowNum + 1
    FROM Pattern
    WHERE RowNum < 20
)
SELECT REPEAT('* ', RowNum) AS Asterisks
FROM Pattern;


-- Explanation:
-- WITH RECURSIVE Pattern AS: This starts a recursive Common Table Expression (CTE) named Pattern.
-- SELECT 1 AS RowNum: This initializes the CTE with the first row number, which is 1.
-- UNION ALL: This combines the initial row with the subsequent rows generated by the recursive part.
-- SELECT RowNum + 1 FROM Pattern WHERE RowNum < 20: This part of the CTE recursively adds 1 to the RowNum until it reaches 20.
-- SELECT REPEAT(' ', RowNum) AS Asterisks*: This selects the asterisks for each row, using the REPEAT function to create a string of asterisks followed by a space, based on the current RowNum.


