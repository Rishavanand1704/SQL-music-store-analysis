--Q8: Return all the track name that have a song length longer than the average song length.
--return the miliseconds for the average song length with the longest song listed first.

select name, milliseconds
from track
where milliseconds > (
select avg (milliseconds) as avg_track_length
from track)
order by milliseconds desc;


