

## solution 1
select
sum(case when number_of_purchase_in_different_day>1 then 1 else 0 end) as num_of_upsold_customers
from
(select 
count(a.d) as number_of_purchase_in_different_day
from 
(select month(created_at), day(created_at) as d, user_id
from transactions
group by month(created_at),day(created_at), user_id
order by month(created_at),day(created_at)) a 
group by a.user_id) b;

## solution 2
select count(*) as num_of_upsold_customers from 
(select user_id
	from transactions
	group by user_id
	having COUNT(distinct data(created_at)) > 1) t;