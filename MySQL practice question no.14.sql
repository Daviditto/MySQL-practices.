##Let’s say we have a table representing a company payroll schema.
##Due to an ETL error, the employees table instead of updating the salaries every year when doing compensation adjustments, did an insert instead.
##Bonus:Write a query to get the current salary for each
##employee.Note: Assume no duplicate combination of two John Smiths)

select
first_name, 
last_name, 
salary 
from employees 
where id in 
(select 
max(id) 
from employees 
group by first_name, last_name)