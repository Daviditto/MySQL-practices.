##Given tables employees, employee_projects, and projects, find the 3 lowest-paid employees that have completed at least 2 projects.
##Note: incomplete projects will have an end date of NULL in the projects table.

select
*
from
(select 
ep.employee_id,
es.salary, 
count(ep.project_id) as completed_projects
from employee_projects ep
left join employees es
on ep.employee_id = es.id 
left join projects ps
on ep.project_id = ps.id
where ps.end_date is not null
group by 1
order by es.salary) b
where b.completed_projects >=2 
order by b.salary limit 3