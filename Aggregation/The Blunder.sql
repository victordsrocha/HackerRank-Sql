-- https://www.hackerrank.com/challenges/the-blunder
-- MS SQL SERVER

select cast(ceiling(avg(cast(salary as float)) - avg(cast(replace(salary,'0','') as float))) as int) 
from employees;