select title, (date_part('year', now()) - "year") as age
from films
order by age asc;