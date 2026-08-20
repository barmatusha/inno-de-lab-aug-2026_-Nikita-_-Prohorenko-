select s.status, c.first_name, c.last_name 
from customers as c
	join shippings as s 
	on c.customer_id = s.customer 