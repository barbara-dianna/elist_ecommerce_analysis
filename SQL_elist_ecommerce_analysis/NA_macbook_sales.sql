--What are the monthly and quarterly sales trends for Macbooks sold in North America across all years?
  

  --GROUP BY QUARTER(purchase_ts)
SELECT
  DATE_TRUNC(orders.purchase_ts, quarter) AS quarter,
  COUNT(orders.id) AS order_count,
  ROUND(SUM(orders.usd_price),2) AS total_sales,
  ROUND(AVG(orders.usd_price),2) AS aov
FROM
  elist-390902.elist.orders AS orders
INNER JOIN
  elist-390902.elist.customers AS customers
ON
  orders.customer_id = customers.id
LEFT JOIN
  elist-390902.elist.geo_lookup AS geo_lookup
ON
  customers.country_code = geo_lookup.country
WHERE
  region = 'NA'
  AND LOWER(product_name) LIKE '%macbook%'
GROUP BY
  1
ORDER BY
  1 ASC 
;

--GROUP BY MONTH(purchase_ts)
SELECT
  DATE_TRUNC(orders.purchase_ts, month),
  COUNT(orders.id) AS order_count,
  ROUND(SUM(orders.usd_price),2) AS total_sales,
  ROUND(AVG(orders.usd_price),2) AS aov
FROM
  elist-390902.elist.orders AS orders
INNER JOIN
  elist-390902.elist.customers AS customers
ON
  orders.customer_id = customers.id
LEFT JOIN
  elist-390902.elist.geo_lookup AS geo_lookup
ON
  customers.country_code = geo_lookup.country
WHERE
  region = 'NA'
  AND LOWER(product_name) LIKE '%macbook%'
GROUP BY
  1
ORDER BY
  1 ASC ;
