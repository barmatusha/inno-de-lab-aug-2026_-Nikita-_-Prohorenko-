select *, sum(amount) over(partition by customer_id) as total_by_customer
from 
	orders