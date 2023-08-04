--What was the monthly refund rate for purchases made in 2020? How many refunds did we have each month in 2021 for Apple products?

SELECT date_trunc(orders.purchase_ts, month) as month, --extract month from orders.purchase_ts for GROUP BY fxn
  sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds, --creating (# of refunds) column
  sum(case when order_status.refund_ts is not null then 1 else 0 end) / count(distinct orders.id) as refund_rate --refund rate: (# of refunds) / (# of orders)
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.order_status AS order_status --need # of all records in orders table, and only need # of refund_ts records in order_status table
  ON orders.id = order_status.order_id
GROUP BY 1 -- 1 stands for 1st column in our query, in this case it's 'month'
ORDER BY 1
;

--count # of refunds in each month in 2021 (WHERE year = 2021, WHERE product_id is like apple AND lower(%macbook%))
SELECT date_trunc(order_status.refund_ts, month) as month, --extract month from order_status.refund_ts for GROUP BY fxn
  sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds --creating (# of refunds) column
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.order_status AS order_status --need # of all records in orders table, and only need # of refund_ts records in order_status table
  ON orders.id = order_status.order_id
WHERE extract(year from order_status.refund_ts) = 2021
AND lower(orders.product_name) like '%apple%'
GROUP BY 1
ORDER BY 1;
