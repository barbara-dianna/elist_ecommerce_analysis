--What’s the average time between customer registration and placing an order?

--take average of the difference between orders.purchase_ts and customers.created_on
SELECT avg(date_diff(orders.purchase_ts, customers.created_on, day)) AS average
FROM elist-390902.elist.customers AS customers
LEFT JOIN elist-390902.elist.orders AS orders
  ON customers.id = orders.customer_id
;

--using a CTE to achieve the same result
  with days_to_purchase_cte as (
    select customers.id as customer_id, 
	    orders.id as order_id,
	    customers.created_on,
	    orders.purchase_ts, 
	    date_diff(orders.purchase_ts, customers.created_on,day) as days_to_purchase
		from `elist-390902.elist.customers` customers
		left join `elist-390902.elist.orders` orders
		    on customers.id = orders.customer_id
		order by 1,2,3)

select avg(days_to_purchase) 
from days_to_purchase_cte
;
