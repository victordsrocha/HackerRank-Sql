-- https://www.hackerrank.com/challenges/the-company
-- MS SQL SERVER

select
    c.company_code,
    c.founder,
    count(distinct(lm.lead_manager_code)),
    count(distinct(sm.senior_manager_code)),
    count(distinct(m.manager_code)),
    count(distinct(e.employee_code))
from company c
    join Lead_Manager lm on c.company_code = lm.company_code
    join Senior_Manager sm on c.company_code = sm.company_code
    join Manager m on c.company_code = m.company_code
    join Employee e on c.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code;