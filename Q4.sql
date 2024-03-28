--Q4: which city has the best_customer?

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
