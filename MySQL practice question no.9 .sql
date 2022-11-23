##Given a table of job postings, write a query to retrieve the number of users that have posted each job only once and the number of users that have posted at least one job multiple times.
##Each user has at least one job posting. Thus the sum of single_post and multiple_posts should equal the total number of distinct user_id’s.

select 
sum(case when job_id_count=total_post_times then 1 else 0 end) as single_post,
sum(case when job_id_count<total_post_times then 1 else 0 end) as multiple_posts 
from 
(Select 
 user_id, 
 count(distinct job_id) as job_id_count, 
 count(distinct id) as total_post_times
From job_postings
group by user_id)as t