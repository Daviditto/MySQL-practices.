select * from emp;
select * from dept;

select 
dept.dname, a.numbers_of_employees ,a.pct_over_2500
from
(select 
sum(case when t.sal is null then 0 else 1 end)/count(emp.sal) as pct_over_2500,
emp.deptno, 
count(emp.ename) as numbers_of_employees
from emp 
left join
(select  deptno, ename, sal
from emp
where sal > 2500) as t
on emp.ename = t.ename
group by 2) a inner join dept
on a.deptno=dept.deptno
order by 3 desc;



