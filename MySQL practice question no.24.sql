##We’re given two tables, a table of notification_deliveries and a table of users with created and purchase conversion dates. If the user hasn’t purchased then the conversion_date column is NULL.
##Write a query to get the distribution of total push notifications before a user converts.

select 
count(b.user_id) as frequency,
b.puch as total_pushes
from
(select
a.user_id,
sum(case when a.m > nd.created_at then 1 else 0 end) as puch
from
(select 
nd.user_id,
max(users.conversion_date) as m
from notification_deliveries nd
left join users
on nd.user_id=users.id
group by nd.user_id)a
left join
notification_deliveries nd
on nd.user_id=a.user_id
where a.m is not null
group by 1
order by nd.user_id) b
group by total_pushes