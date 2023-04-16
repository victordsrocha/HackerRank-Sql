-- https://www.hackerrank.com/challenges/african-cities
-- MS SQL SERVER

select city.name
from city
join country on city.countrycode = country.code
where country.continent = 'Africa';