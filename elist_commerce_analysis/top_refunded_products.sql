--Are there certain products that are getting refunded more frequently than others? What are the top 3 most frequently refunded products across all years? What are the top 3 products that have the highest count of refunds


--Highest refund rates grouped by product_name
--Clean product_name column using case when statement
SELECT case when orders.product_name = '27in"" 4k gaming monitor' then '27in 4K gaming monitor' else orders.product_name end as product_clean, --for GROUP BY fxn
  sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds,
  sum(case when order_status.refund_ts is not null then 1 else 0 end) / count(distinct orders.id) * 100 as refund_rate --refund rate: (# of refunds) / (# of orders)
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.order_status AS order_status --need # of all records in orders table, and only need # of refund_ts records in order_status table
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC
;

--Highest count of refunds: order by (# of refunds) grouped by product_name
SELECT case when orders.product_name = '27in"" 4k gaming monitor' then '27in 4K gaming monitor' else orders.product_name end as product_clean, --for GROUP BY fxn
  sum(case when order_status.refund_ts is not null then 1 else 0 end) as refunds, --creating (# of refunds) column
  sum(case when order_status.refund_ts is not null then 1 else 0 end) / count(distinct orders.id) * 100 as refund_rate
FROM elist-390902.elist.orders AS orders
LEFT JOIN elist-390902.elist.order_status AS order_status --need # of all records in orders table, and only need # of refund_ts records in order_status table
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 2 DESC
;
