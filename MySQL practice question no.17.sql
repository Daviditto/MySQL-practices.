
##You’re given two tables, users and events. The events table holds values of all of the user events in the action column (‘like’, ‘comment’, or ‘post’).
##Write a query to get the percentage of users that have never liked or commented. Round to two decimal places.


select
round(sum(case when b.t=0 then 1 else null end)/count(b.id),2) as percent_never
from
(select 
a.id, 
max(case when a.action='like' or a.action='comment' then 1 else 0 end) as t
from
(select 
us.id, 
ev.action
from users us
left join events ev
on us.id=ev.user_id)a
group by a.id)b