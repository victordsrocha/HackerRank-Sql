-- https://www.hackerrank.com/challenges/binary-search-tree-1
-- MS SQL SERVER

select
    N,
    case 
        when P is null then 'Root'
    else
        case 
            when N in (select P from BST) then 'Inner'
        else 'Leaf' 
        end
    end
from BST
order by N;