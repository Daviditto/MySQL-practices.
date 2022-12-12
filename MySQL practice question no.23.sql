##Write a query that creates an attribution rule for each user. If the user visited Facebook or Google at least once then the attribution is labeled as “paid.” Otherwise, the attribution is labeled as “organic.”

select 
us.user_id,
case when sum(case when attr.channel = 'Facebook' or attr.channel= 'Google' then 1 end)>=1 then 'paid' else 'organic' end as attribute
from user_sessions us
left join attribution attr
on us.session_id=attr.session_id
group by us.user_id