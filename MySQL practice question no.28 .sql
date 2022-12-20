
##Given a table of song_plays and a table of users, write a query to extract the earliest date each user played their third unique song.

select
b.name,
max(case when b.rn=3 then b.min_date else null end) as date_played,
max(case when b.rn=3 then b.song_name else null end) as song_name
from
(select 
users.name as name,
min(song_plays.date_played) as min_date,
song_plays.song_name as song_name,
row_number() over(partition by users.name order by song_plays.date_played) as rn
from song_plays 
left join users
on song_plays.user_id = users.id
group by 1,3) b
group by 1