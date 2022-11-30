##Given a table of transactions and products, write a function to get the month_over_month change in revenue for the year 2019. 
##Make sure to round month_over_month to 2 decimal places.

select 
b.month, 
round((b.revenue-b.last_month)/b.last_month, 2) as month_over_month
from
(select 
a.month,
a.revenue, 
lag(a.revenue) over () as last_month
from
(select 
month(ts.created_at) as month,
sum(ts.quantity*p.price) as revenue 
from transactions ts
left join products p
on ts.product_id=p.id
where year(ts.created_at)=2019
group by 1
order by 1)a)b
