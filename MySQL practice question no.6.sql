
select created_at, transaction_value, id
from bank_transactions
inner join
(select 
max(created_at) as last_transaction
from 
bank_transactions
group by date(created_at))a
where bank_transactions.created_at = a.last_transaction;