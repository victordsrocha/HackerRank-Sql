-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true
-- MS SQL SERVER

SELECT
    MIN(CASE WHEN occupation = 'Doctor' THEN name ELSE NULL END),
    MIN(CASE WHEN occupation = 'Professor' THEN name ELSE NULL END),
    MIN(CASE WHEN occupation = 'Singer' THEN name ELSE NULL END),
    MIN(CASE WHEN occupation = 'Actor' THEN name ELSE NULL END)
FROM (
    SELECT occupation, name, ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS occ
    FROM occupations) aux
GROUP BY occ;