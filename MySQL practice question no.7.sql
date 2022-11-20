
##Let’s say we want to build a naive recommender. We’re given two tables, one table called friends with a user_id and friend_id columns representing each user’s friends, and another table called page_likes with a user_id and a page_id representing the page each user liked.
##Write an SQL query to create a metric to recommend pages for each user based on recommendations from their friend’s liked pages.
##Note: It shouldn’t recommend pages that the user already likes.


select user_id, page_id, count(friend_id) as num_friend_likes
from
(select friends.user_id, friends.friend_id, page_likes.page_id
from friends
left join page_likes
on friends.friend_id = page_likes.user_id
where (friends.user_id, page_id) not in (select distinct user_id, page_id from page_likes)) a
group by user_id, page_id;
