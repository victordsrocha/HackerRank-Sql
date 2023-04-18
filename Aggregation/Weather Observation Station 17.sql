-- https://www.hackerrank.com/challenges/weather-observation-station-17
-- MS SQL SERVER

select convert(decimal(10,4), LONG_W) from station
where LAT_N = (select min(LAT_N) from station where LAT_N > 38.7780);