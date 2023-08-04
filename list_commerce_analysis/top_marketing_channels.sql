--Which marketing channels perform the best in each region? Does the top channel differ across regions?

--Assuming "best" means amount of orders, we'll need to double join customers to orders and geo_lookup to customers:
SELECT geo_lookup.region,
  customers.marketing_channel,
  count(distinct(orders.id)) AS num_orders
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.customers AS customers
  ON orders.customer_id = customers.id
LEFT JOIN elist-390902.elist.geo_lookup AS geo_lookup
  ON customers.country_code = geo_lookup.country
GROUP BY 1, 2
ORDER BY 1, 3 DESC
;
