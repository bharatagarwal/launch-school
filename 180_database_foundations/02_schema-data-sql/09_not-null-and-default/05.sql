select date, ((low + high)/2.0)::decimal(3,1) as average
from temperatures
where date between '2016-03-02' and '2016-03-08'
-- order by date;
;