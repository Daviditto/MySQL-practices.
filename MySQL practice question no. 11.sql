##Given a table with event logs, find the top five users with the longest continuous streak of visiting the platform in 2020.
##Note: A continuous streak counts if the user visits the platform at least once per day on consecutive days.

with nxt_day as
(select 
distinct user_id, 
created_at, 
lead(created_at)over(partition by user_id order by created_at) as nxt_day
from events) 
select user_id,
sum(case when date_add(created_at, interval 1 day)=nxt_day then 1 else 0 end) as streak_length
from nxt_day
where year(created_at) = '2020'
group by 1
order by 2 desc
limit 5
