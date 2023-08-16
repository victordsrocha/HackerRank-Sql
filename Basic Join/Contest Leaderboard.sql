-- https://www.hackerrank.com/challenges/contest-leaderboard
-- MS SQL SERVER

WITH tbl_total_score AS (
    SELECT 
        hacker_id, 
        SUM(max_score_by_challenge) AS total_score
    FROM (
        SELECT 
            hacker_id, 
            challenge_id, 
            MAX(score) AS max_score_by_challenge
        FROM Submissions
        GROUP BY hacker_id, challenge_id
    ) sub
    GROUP BY hacker_id
)
SELECT
    h.hacker_id,
    h.name,
    tts.total_score
FROM Hackers h
INNER JOIN tbl_total_score tts ON h.hacker_id = tts.hacker_id
WHERE tts.total_score > 0
ORDER BY tts.total_score DESC, h.hacker_id