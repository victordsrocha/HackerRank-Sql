-- https://www.hackerrank.com/challenges/weather-observation-station-2
-- MS SQL SERVER

select 
    convert(decimal(10,2),sum(LAT_N)), 
    convert(decimal(10,2),sum(LONG_W))
from STATION;