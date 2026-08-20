select 
	concat(c.first_name, ' ', c.last_name) as full_name,
	c.country,
	count(o.order_id) as total_orders,
	sum(o.amount) as total_amounts
from
	customers as c 
join 
	orders as o on c.customer_id = o.customer_id  
join 
	shippings as s ON c.customer_id = s.customer
where 
	s.status = 'Delivered'
group by 
	c.customer_id, c.first_name, c.last_name, c.country
having count(o.order_id) >= 2
order by 
	total_orders, full_name;