##Let’s say we have two tables, transactions and products. Hypothetically the transactions table consists of over a billion rows of purchases bought by users.
##We are trying to find paired products that are often purchased together by the same user, such as wine and bottle openers, chips and beer, etc..
##Write a query to find the top five paired products and their names.
##Notes: For the purposes of satisfying the test case, P1 should be the item that comes first in the alphabet.

select 
b.p1,
b.p2, 
count(b.user_id) as qty
from 
(select
max(case when a.rn=1 then a.name else null end) as p1,
max(case when a.rn=2 then a.name else null end) as p2,
a.user_id
from
(select 
ts.user_id, 
p.name, 
row_number() over (partition by ts.user_id order by p.name) as rn
from transactions ts
left join products p
on ts.product_id = p.id
group by ts.user_id, p.name) a
group by 3) b
group by b.p1, b.p2
order by 3 desc
