--Q3: write a query that determines the customer that has spent the most on music for each country .
-- write a query that returns the country along with the top customers and how much they spent.
-- for countries where the top amount spent is shared, provide all customers who spent this amount.

--RECURSIVE METHOD
with recursive 
customer_with_country as (
select customer.customer_id, first_name, last_name, billing_country, sum(total) as total_spending
from invoice
join customer on customer.customer_id = invoice.customer_id
group by 1,2,3,4
order by 1,5 desc),

country_max_spending as(
select billing_country, max(total_spending) as max_spending
from customer_with_country
group by billing_country)

select cc.billing_country, cc.total_spending, cc.first_name, cc.last_name, cc.customer_id
from customer_with_country cc
join country_max_spending ms
on cc.billing_country = ms.billing_country
where cc.total_spending =ms.max_spending
order by 1;

--CTE metod
with customer_with_country as (
select customer.customer_id, first_name, last_name, billing_country, sum(total) as total_spending,
row_number() over(partition by billing_country order by sum (total)desc) as RowNo
from invoice
join customer on customer.customer_id = invoice.customer_id
group by 1,2,3,4
order by 4 asc,5 desc)
select * from customer_with_country where RowNo <= 1
