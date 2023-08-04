--What’s the average order value across different account creation methods in the first two months of 2022? Which method had the most new customers in this time?

SELECT customers.account_creation_method,
  avg(orders.usd_price) AS AOV,
  count(distinct(customers.id)) as num_customers
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.customers AS customers
  ON orders.customer_id = customers.id
WHERE customers.created_on between '2022-01-01' and '2022-02-28'
GROUP BY 1
ORDER BY 3 DESC
;
