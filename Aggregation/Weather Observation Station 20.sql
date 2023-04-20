-- https://www.hackerrank.com/challenges/weather-observation-station-20
-- MS SQL SERVER

select convert(decimal(10,4), S.LAT_N) from station as S
where 
    (select count(LAT_N) from station where LAT_N < S.LAT_N) = 
    (select count(LAT_N) from station where LAT_N > S.LAT_N)