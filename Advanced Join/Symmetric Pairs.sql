-- https://www.hackerrank.com/challenges/symmetric-pairs
-- MS SQL SERVER

-- Primeira solução

SELECT 
    X, Y 
FROM Functions f1
WHERE X=Y
GROUP BY X, Y
HAVING COUNT(*) > 1

UNION

SELECT 
    * 
FROM Functions f1
WHERE EXISTS (SELECT * FROM Functions f2 WHERE f1.X=f2.Y AND f2.X=f1.Y)
    AND X<Y

ORDER BY X, Y

-- Segunda solução

WITH Enumerate AS (
    SELECT
        X, Y,
        ROW_NUMBER() OVER(ORDER BY X, Y) AS rn
    FROM
        Functions
)
SELECT
    DISTINCT e1.X, e1.Y
FROM
    Enumerate e1
INNER JOIN
    Enumerate e2 ON e1.X=e2.Y AND e2.X=e1.Y AND e1.rn <> e2.rn
WHERE e1.X <= e1.Y
ORDER BY e1.X, e1.Y