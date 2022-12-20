##We’re given three tables representing a forum of users and their comments on posts.
##Write a query to get the percentage of comments by each user where that user also upvoted their own comment.
##Note: A user that doesn’t make a comment should have a 0 percent self-upvoted.

select 
us.username,
count(cms.id) as total_comments,
case when count(cms.id)=0 then 0 else count(a.comment_id)/count(cms.id) end as percentage_self_voted
from comments cms
left join users us
on cms.user_id = us.id
left join
(select
cv.comment_id
from comments cms
left join comment_votes cv
on cms.id = cv.comment_id
where cms.user_id=cv.user_id and cv.is_upvote='True') a
on cms._id = a.comment_id
group by us.id
