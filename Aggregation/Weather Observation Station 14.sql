-- https://www.hackerrank.com/challenges/weather-observation-station-14
-- MS SQL SERVER

select 
    convert(decimal(10,4), round(max(LAT_N), 4, 1)) from station
where LAT_N < 137.2345;