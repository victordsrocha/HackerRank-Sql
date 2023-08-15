-- https://www.hackerrank.com/challenges/harry-potter-and-wands
-- MS SQL SERVER

--- Solução com GROUP BY ---

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
INNER JOIN Wands_Property wp ON w.code = wp.code
INNER JOIN 
(
    SELECT wp.age, w.power, MIN(w.coins_needed) AS min_coins
    FROM Wands w
    INNER JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.age, w.power
) mc 
ON wp.age = mc.age AND w.power = mc.power AND w.coins_needed = mc.min_coins
ORDER BY w.power DESC, wp.age DESC;

--- Solução com PARTITION BY ---

SELECT id, age, coins_needed, power
FROM
(
    SELECT 
        w.id, 
        wp.age, 
        w.coins_needed,
        w.power,
        MIN(w.coins_needed) OVER (PARTITION BY wp.age, w.power) AS min_coins
    FROM Wands w
    INNER JOIN Wands_Property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
) sub
WHERE coins_needed = min_coins
ORDER BY power DESC, age DESC;