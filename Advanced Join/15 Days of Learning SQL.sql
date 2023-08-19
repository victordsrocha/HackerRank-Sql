-- https://www.hackerrank.com/challenges/15-days-of-learning-sql
-- MS SQL SERVER

DECLARE @consistent_hackers TABLE (
    hacker_id int,
    submission_date date);

DECLARE @subdate date;
DECLARE @remainingdate date;

INSERT INTO @consistent_hackers
SELECT
    hacker_id,
    submission_date
FROM Submissions
WHERE submission_date LIKE '2016-03-01';

SET @subdate = '2016-03-01';
SET @remainingdate = '2016-03-01';

WHILE @subdate < '2016-03-15'
BEGIN

    SET @subdate = DATEADD(day,1,@subdate);

    INSERT INTO @consistent_hackers
    SELECT
        s.hacker_id,
        s.submission_date
    FROM    submissions s
    JOIN    @consistent_hackers ch ON ch.hacker_id = s.hacker_id AND
        ch.submission_date LIKE @remainingdate
    WHERE   s.submission_date LIKE @subdate;

    SET @remainingdate = DATEADD(day,1,@remainingdate);

END;

WITH submissions_by_date AS (
    SELECT 
        submission_date, count(distinct(hacker_id)) as num_submissions_by_day
    FROM @consistent_hackers
    GROUP BY submission_date
)
SELECT
    sub2.submission_date, sbd.num_submissions_by_day, h.hacker_id, h.name
FROM (
    SELECT 
        submission_date, hacker_id, num_submissions,
        ROW_NUMBER() OVER (
            PARTITION BY submission_date ORDER BY submission_date, num_submissions DESC, hacker_id) AS rn
    FROM (
        SELECT 
            submission_date, hacker_id, count(hacker_id) AS num_submissions
        FROM Submissions
        GROUP BY submission_date, hacker_id
    ) sub1
) sub2
INNER JOIN Hackers h ON sub2.hacker_id = h.hacker_id
INNER JOIN submissions_by_date sbd ON sbd.submission_date = sub2.submission_date
WHERE rn = 1 