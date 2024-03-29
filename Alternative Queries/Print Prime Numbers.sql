-- https://www.hackerrank.com/challenges/print-prime-numbers
-- MS SQL SERVER

CREATE TABLE Prime_Numbers (number INT);

DECLARE @nr INT;
DECLARE @divider INT;
DECLARE @prime BIT;

SELECT @nr = 1;

WHILE @nr <= 1000
    BEGIN
    SELECT @divider = @nr - 1;
    SELECT @prime = 1;
    -- Prime Number test
    WHILE @divider > 1
        BEGIN
        IF @nr % @divider = 0
            SELECT @prime = 0;
        SELECT @divider = @divider - 1         
        END
    IF @prime = 1 AND @nr <> 1
        INSERT INTO Prime_Numbers (number) VALUES (@nr);
    
    SELECT @nr = @nr + 1
    END

SELECT STRING_AGG(number,'&') FROM Prime_Numbers;