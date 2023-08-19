WITH Stats AS (
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
)

SELECT
    con.contest_id, 
    con.hacker_id, 
    con.name,
    SUM(sta.total_submissions),
    SUM(sta.total_accepted_submissions),
    SUM(sta.total_views),
    SUM(sta.total_unique_views)
FROM Contests con
INNER JOIN Colleges col ON con.contest_id = col.contest_id
INNER JOIN Challenges cha ON col.college_id = cha.college_id
INNER JOIN Stats sta ON cha.challenge_id = sta.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
ORDER BY contest_id;