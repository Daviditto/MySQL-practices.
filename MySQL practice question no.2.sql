##The action column can have values post_enter, post_submit, or post_canceled 
##for when a user starts to write (post_enter), ends up canceling their post (post_cancel), or posts it (post_submit).
##Write a query to get the post success rate for each day in the month of January 2020.

select 
day(created_at), 
count(distinct case when action='post_enter' then user_id end) as post_enter,
count(distinct case when action='post_submit' then user_id end) as post_submit, 
post_submit/post_enter as post_success_rate
from events_table
where created_at 
between '2020-01-01' and '2020-02-01'
group by 1;