select count(id),
substr(email, strpos(email, '@') + 1) as domain
from people
group by domain 
order by count desc;
