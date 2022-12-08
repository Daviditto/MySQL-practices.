
##Given a table of account statuses, write a query to get the percentage of accounts that were active on December 31st, 2019, and closed on January 1st, 2020, over the total number of accounts that were active on December 31st. Each account has only one daily record indicating its status at the end of the day.
##Note: Round the result to 2 decimal places.

select 
round(sum(b.de)/count(b.account_id),2)as percentage_closed
from
(select 
a.account_id, 
case when max(a.open_)=1 and max(a.closed) = 1 then 1 else 0 end as de
from
(select 
acs.account_id,
acs.date,
acs.status,
case when acs.date='2019-12-31' and acs.status='open' then 1 else 0 end open_,
case when acs.date ='2020-01-01' and acs.status='closed' then 1 else 0 end closed
from 
account_status acs
where acs.date in ('2019-12-31', '2020-01-01')
group by 1,2,3
order by 1,2 asc) a
group by 1)b