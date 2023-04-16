-- https://www.hackerrank.com/challenges/asian-population
-- MS SQL SERVER

select sum(city.population)
from city
join country on city.countrycode = country.code
where country.continent = 'Asia';