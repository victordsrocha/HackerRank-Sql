-- https://www.hackerrank.com/challenges/japan-population
-- MS SQL SERVER

select sum(population) from city
where countrycode = 'JPN';