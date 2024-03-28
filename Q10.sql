--Q10: we want to find out the most popular music genre for each country.
-- we determine the most popular genre as the genre with the highest amount of purchase.

with popular_genre as 
(
  select count(invoice_line.quantity) as purchase, customer.country, genre.name, genre.genre_id,
  row_number() over(partition by customer.country order by count(invoice_line.quantity)desc) as RowNo
	from invoice_line
	join invoice on invoice.invoice_id = invoice_line.invoice_id
	join customer on customer.customer_id = invoice.customer_id
	join track on track.track_id = invoice_line.track_id
	join genre on genre.genre_id = track.genre_id
	group by 2,3,4
	order by 2 asc, 1 desc
	)
	select * from popular_genre where RowNo <= 1