-- https://www.hackerrank.com/challenges/sql-projects
-- MS SQL SERVER

WITH Project_Start_Date AS (
    SELECT
        Start_Date,
        RANK() OVER(ORDER BY Start_Date) AS Rank_Start
    FROM Projects
    WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
),
Project_End_Date AS (
    SELECT
        End_Date,
        RANK() OVER(ORDER BY End_Date) AS Rank_End
    FROM Projects
    WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
)
SELECT
    psd.Start_Date,
    ped.End_Date
FROM Project_Start_Date psd
INNER JOIN Project_End_Date ped ON psd.Rank_Start = ped.Rank_End
ORDER BY 
    DATEDIFF(day, psd.Start_Date, ped.End_Date),
    psd.Start_Date;