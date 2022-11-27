##Write a query to identify the manager with the size. biggest team
##You may assume there is only one manager with the largest team size.

select 
managers.name as manager,
count(employees.id) as team_size
from employees
left join managers
on employees.manager_id = managers.id
group by employees.manager_id
order by 2 desc limit 1