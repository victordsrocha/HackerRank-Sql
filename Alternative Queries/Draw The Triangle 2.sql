-- https://www.hackerrank.com/challenges/draw-the-triangle-2
-- MS SQL SERVER

declare @counter int = 1

while (@counter <= 20)
begin
    print replicate('* ', @counter)
    set @counter = @counter + 1
end;