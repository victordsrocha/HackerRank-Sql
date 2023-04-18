-- https://www.hackerrank.com/challenges/weather-observation-station-18
-- MS SQL SERVER

select convert(decimal(10,4), abs(a-c) + abs(b-d))
from (
    select 
        min(LAT_N) as 'a',
        min(LONG_W) as 'b',
        max(LAT_N) as 'c',
        max(LONG_W) as 'd'
    from station
) aux;