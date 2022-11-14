## The schema below is for a retail online shopping company consisting of two tables, attribution and user_sessions.
##The attribution table logs a session visit for each row.
##If conversion is true, then the user converted to buying on that session.
##The channel column represents which advertising platform the user was attributed to for that specific session.
##Lastly the user_sessions table maps many to one session visits back to one user.
##First touch attribution is defined as the channel with which the converted user was associated when they first discovered the website.
##Calculate the first touch attribution for each user_id that converted.

select 
converted.channel, 
converted.user_id
from 
(select 
attribution.channel, 
user_sessions.user_id, 
ROW_NUMBER() OVER(PARTITION BY user_sessions.user_id ORDER BY user_sessions.created_at) rn
from 
attribution
inner join user_sessions 
on attribution.session_id = user_sessions.session_id
where attribution.conversion=1) converted
where converted.rn =1;