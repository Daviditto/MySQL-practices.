

##Write a query to identify the names of users who placed less than 3 orders or ordered less than $500 worth of product.


select 
a.name as users_less_than
from
(select 
users.name,
count(tr.product_id) as ct,
sum(tr.quantity * ps.price) as sm
from transactions tr
left join products ps
on tr.product_id=ps.id
left join users
on tr.user_id = users.id
group by 1) a
where a.ct<3 or a.sm<500

