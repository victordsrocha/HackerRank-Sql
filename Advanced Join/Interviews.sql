-- https://www.hackerrank.com/challenges/interviews
-- MS SQL SERVER

WITH Stats AS
(
    SELECT
        COALESCE(vs.challenge_id, ss.challenge_id) AS challenge_id,
        COALESCE(ss.total_submissions, 0) AS total_submissions,
        COALESCE(ss.total_accepted_submissions, 0) AS total_accepted_submissions,
        COALESCE(vs.total_views, 0) AS total_views,
        COALESCE(vs.total_unique_views, 0) AS total_unique_views
    FROM (
        SELECT
            challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM View_Stats
        GROUP BY challenge_id
    ) vs
    FULL OUTER JOIN (
        SELECT
            challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM Submission_Stats
        GROUP BY challenge_id
    ) ss ON vs.challenge_id = ss.challenge_id
),
Sum_by_college AS
(
    SELECT 
        cha.college_id,
        SUM(sta.total_submissions) AS total_submissions,
        SUM(sta.total_accepted_submissions) AS total_accepted_submissions,
        SUM(sta.total_views) AS total_views,
        SUM(sta.total_unique_views) AS total_unique_views
    FROM Challenges cha
    INNER JOIN Stats sta ON cha.challenge_id = sta.challenge_id
    GROUP BY cha.college_id
),
Sum_by_contest AS
(
    SELECT 
        col.contest_id,
        SUM(sbc.total_submissions) AS total_submissions,
        SUM(sbc.total_accepted_submissions) AS total_accepted_submissions,
        SUM(sbc.total_views) AS total_views,
        SUM(sbc.total_unique_views) AS total_unique_views
    FROM Colleges col
    INNER JOIN Sum_by_college sbc ON col.college_id = sbc.college_id
    GROUP BY col.contest_id
)
SELECT 
    con.contest_id,
    con.hacker_id,
    con.name,
    total_submissions,
    total_accepted_submissions,
    total_views,
    total_unique_views
FROM Contests con
INNER JOIN Sum_by_contest sbc ON con.contest_id = sbc.contest_id
ORDER BY con.contest_id