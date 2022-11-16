

## Given a users table, write a query to get the cumulative number of new users added by the day, with the total reset every month.

select 
date(created_at) as dat, 
sum(count(name)) over (partition by year(created_at),month(created_at) order by created_at) as monthly_acusum
from events 
group by created_at
order by dat;