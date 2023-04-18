-- https://www.hackerrank.com/challenges/weather-observation-station-16
-- MS SQL SERVER

select convert(decimal(10,4), min(LAT_N)) from station
where LAT_N > 38.7780;