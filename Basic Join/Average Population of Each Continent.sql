-- https://www.hackerrank.com/challenges/average-population-of-each-continent
-- MS SQL SERVER

select country.continent, round(avg(city.population),0)
from city
join country on city.countrycode = country.code
group by country.continent;