select state, count(id) from people
group by state
order by count(id) desc
limit 10;
