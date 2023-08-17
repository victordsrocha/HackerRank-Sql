-- https://www.hackerrank.com/challenges/symmetric-pairs
-- MS SQL SERVER

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