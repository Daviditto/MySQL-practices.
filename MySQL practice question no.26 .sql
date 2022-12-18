##Given the transactions table, write a query to get the max quantity purchased for each distinct product_id, every year.
##The output should include the year, product_id, and max_ quantity for that product sorted by year and product_id ascending.

select 
year(tr.created_at) as year,
tr.product_id,
max(quantity) as max_quantity 
from transactions tr
group by 1,2
order by 1,2
