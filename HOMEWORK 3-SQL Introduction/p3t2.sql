select 
	item, count(*), avg(amount)
from
	orders
group by 
	item