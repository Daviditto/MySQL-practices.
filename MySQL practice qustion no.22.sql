

##We’re given two tables. friend_requests holds all the friend requests made and friend_accepts is all of the acceptances.
##Write a query to find the overall acceptance rate of friend requests. Note: Round results to 4 decimal places
select 
round(count(fa.acceptor_id)/count(fr.requester_id), 4) as acceptance
from friend_requests fr
left join friend_accepts fa
on fr.requester_id = fa.requester_id
and fr.requested_id = fa.acceptor_id