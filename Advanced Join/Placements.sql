-- https://www.hackerrank.com/challenges/placements
-- MS SQL SERVER

WITH student_salary_table AS (
    SELECT
        s.ID, 
        s.Name,
        p.Salary AS student_salary
    FROM Students s
    INNER JOIN Packages p ON s.ID = p.ID
),
friend_salary_table AS (
    SELECT
        f.ID, 
        p.Salary AS friend_salary
    FROM Friends f
    INNER JOIN Packages p ON f.Friend_ID = p.ID
)
SELECT 
     sst.Name
FROM student_salary_table sst
INNER JOIN friend_salary_table fst ON sst.ID = fst.ID
WHERE fst.friend_salary > sst.student_salary
ORDER BY fst.friend_salary