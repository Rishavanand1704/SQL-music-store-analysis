--Q6: write query to return the email, first name, last name, & gener of all rock music listners.
-- return your list ordered alphbetically by email starting wit A

SELECT DISTINCT EMAIL, first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line  on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
      select track_id from track
      join genre on track.genre_id = genre.genre_id
      where genre.name = 'Rock' 
)
order by email