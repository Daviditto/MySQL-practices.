
##Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.


select 
users.name as customer_name
from
(select
year(created_at) as yr,
user_id
from transactions
where created_at between '2019-01-01' and '2020-12-31'
group by yr, user_id
having count(id)>3) b
left join users 
on b.user_id = users.id
group by b.user_id
having count(yr) = 2 

