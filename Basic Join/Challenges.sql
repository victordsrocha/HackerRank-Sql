-- https://www.hackerrank.com/challenges/challenges
-- MS SQL SERVER

-- Solução 1: subqueries aninhadas --

SELECT
    h.hacker_id,
    name,
    total
FROM
(
    SELECT 
        hacker_id, 
        total, 
        COUNT(total) OVER (PARTITION BY total) AS count_total
    FROM
    (
        SELECT hacker_id, count(hacker_id) AS total 
        FROM Challenges
        GROUP BY hacker_id
    ) sub1
) sub2
INNER JOIN Hackers h ON h.hacker_id = sub2.hacker_id
WHERE count_total = 1
OR total = (
    SELECT MAX(total) FROM (
        SELECT hacker_id, count(hacker_id) AS total 
        FROM Challenges
        GROUP BY hacker_id
    ) sub3
)
ORDER BY total DESC, h.hacker_id;

-- Solução 2: Tabelas auxiliares --
-- https://youtu.be/00yN5ERtxbI

With tbl_num_challenges as (

SELECT
        h.hacker_id,
        h.name,
        COUNT(c.challenge_id) as num_challenges
FROM    Hackers h
JOIN    Challenges c ON c.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
--ORDER BY COUNT(c.challenge_id) desc, hacker_id asc

)

,tbl_count_challenges as (
SELECT
        num_challenges,
        COUNT(num_challenges) as count_challenges
FROM    tbl_num_challenges
GROUP BY num_challenges
--ORDER BY COUNT(num_challenges) desc

)

SELECT
        tnc.hacker_id,
        tnc.name,
        tnc.num_challenges--,
        --tcc.count_challenges
FROM    tbl_num_challenges tnc
JOIN    tbl_count_challenges tcc ON tcc.num_challenges = tnc.num_challenges
WHERE tcc.count_challenges = 1 
OR 
tnc.num_challenges = (SELECT max(num_challenges) FROM tbl_num_challenges)

ORDER BY 
     tnc.num_challenges desc, 
     tnc.hacker_id
;