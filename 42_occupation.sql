-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

-- Note: Print NULL when there are no more names corresponding to an occupation.

-- Input Format

-- The OCCUPATIONS table is described as follows:



-- Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

-- Sample Input



-- Sample Output

-- Jenny    Ashley     Meera  Jane
-- Samantha Christeen  Priya  Julia
-- NULL     Ketty      NULL   Maria
-- Explanation

-- The first column is an alphabetically ordered list of Doctor names.
-- The second column is an alphabetically ordered list of Professor names.
-- The third column is an alphabetically ordered list of Singer names.
-- The fourth column is an alphabetically ordered list of Actor names.
-- The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.







select D.Name, P.Name, S.Name, A.Name FROM (SELECT row_number()over(order by Occupation) id FROM Occupations ) F LEFT JOIN (SELECT row_number()over(order by Name) id ,Name FROM Occupations WHERE Occupation = 'Doctor') D ON F.id = D.id LEFT JOIN (SELECT row_number()over(order by Name) id ,Name FROM Occupations WHERE Occupation = 'Professor') P ON F.id = P.id LEFT JOIN (SELECT row_number()over(order by Name) id ,Name FROM Occupations WHERE Occupation = 'Singer') S ON F.id = S.id LEFT JOIN (SELECT row_number()over(order by Name) id ,Name FROM Occupations WHERE Occupation = 'Actor') A ON F.id = A.id WHERE D.id is not null or P.id is not null OR S.id is not null OR A.id is not null;