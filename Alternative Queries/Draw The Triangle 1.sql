-- https://www.hackerrank.com/challenges/draw-the-triangle-1
-- MS SQL SERVER

declare @counter int = 20

while (@counter > 0)
begin
    print replicate('* ', @counter)
    set @counter = @counter - 1
end;