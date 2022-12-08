
##We’re given two tables. One is named projects and the other maps employees to the projects they’re working on.
##We want to select the five most expensive projects by budget to employee count ratio. But let’s say that we’ve found a bug where there exist duplicate rows in the employee_projects table.
##Write a query to account for the error and select the top five most expensive projects by budget to employee count ratio.

select 
pjs.title, 
pjs.budget/count(distinct ep.employee_id) as budget_per_employee
from projects pjs
left join employee_projects ep
on pjs.id = ep.project_id
group by 1
order by 2 desc limit 5