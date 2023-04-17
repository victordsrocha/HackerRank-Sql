-- https://www.hackerrank.com/challenges/the-report
-- MS SQL SERVER

select 
    case 
        when grade >= 8 
            then name
        else null
    end,
    grade, 
    marks
from students as s
join grades as g on s.marks between g.min_mark and g.max_mark
order by grade desc, name asc;