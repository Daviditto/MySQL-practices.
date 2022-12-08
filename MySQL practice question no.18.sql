##Given two tables: accounts, and downloads, find the average number of downloads for free vs paying accounts, broken down by day.
##Note: You only need to consider accounts that have had at least one download before when calculating the average.
##Note: round average_downloads to 2 decimal places.


select 
date(dls.download_date) as date, 
ats.paying_customer, 
round(AVG(dls.downloads)) as average_downloads
from accounts ats
left join downloads dls
on ats.account_id = dls.account_id
where dls.downloads>0
group by 1, 2