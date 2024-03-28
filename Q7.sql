--Q7: Let's invite the artist who have written the most rock music in our databset.
--write a query that returns the artist name and total track count of the 10 rock bands

select artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs 
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;

select * from invoice