
##Given three tables, representing customer transactions and customer attributes:
##Write a query to get the average order value by gender.
##Note: We’re looking at the average order value by users that have ever placed an order. Additionally, please round your answer to two decimal places.

select 
users.sex,
round(Avg(transactions.quantity * products.price),2) as aov
from transactions
left join users
on transactions.user_id = users.id
left join products
on transactions.product_id = products.id
where users.id is not null
group by users.sex


