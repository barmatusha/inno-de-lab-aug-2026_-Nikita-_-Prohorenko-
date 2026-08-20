select c.first_name, c.last_name, o.item, o.amount
from customers as c 
	join orders as o
	on o.customer_id = c.customer_id