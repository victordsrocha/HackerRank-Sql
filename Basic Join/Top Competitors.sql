-- https://www.hackerrank.com/challenges/full-score
-- MS SQL SERVER

select h.hacker_id, h.name from submissions s
    join challenges c on s.challenge_id = c.challenge_id
    join difficulty d on c.difficulty_level = d.difficulty_level
    join hackers h on s.hacker_id = h.hacker_id
where s.score = d.score
group by h.hacker_id, h.name
having count(h.hacker_id) > 1
order by count(h.hacker_id) desc, hacker_id asc