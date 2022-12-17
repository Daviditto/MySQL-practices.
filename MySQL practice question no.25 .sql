##We’re given two tables. One is named projects and the other maps employees to the projects they’re working on.

##Write a query to get the top five most expensive projects by budget to employee count ratio.

##Note: Exclude projects with 0 employees. Assume each employee works on only one project.


select 
pj.title,
pj.budget/count(empj.employee_id) as budget_per_employee
from projects pj
left join employee_projects empj
on pj.id=empj.project_id
group by pj.title
having count(empj.employee_id) > 0
order by 2 desc
limit 5


