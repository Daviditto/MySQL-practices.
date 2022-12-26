##You’re given two tables: employees and managers. Find the names of all employees who joined before their manager.

select 
concat(employees.first_name,' ',employees.last_name) as employee_name
from employees 
left join managers
on employees.manager_id = managers.id
where employees.join_date<managers.join_date