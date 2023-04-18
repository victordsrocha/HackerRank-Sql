-- https://www.hackerrank.com/challenges/weather-observation-station-15
-- MS SQL SERVER

select format(round(LONG_W, 4), '#.0000') from station
where LAT_N = (select max(LAT_N) from station where LAT_N < 137.2345);