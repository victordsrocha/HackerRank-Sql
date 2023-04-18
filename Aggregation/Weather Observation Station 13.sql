-- https://www.hackerrank.com/challenges/weather-observation-station-13
-- MS SQL SERVER

select 
    convert(decimal(10,4), round(sum(LAT_N), 4, 1)) from station
where LAT_N > 38.7880 and LAT_N < 137.2345;