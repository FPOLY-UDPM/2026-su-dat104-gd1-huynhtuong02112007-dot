SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(o.order_id) AS So_don_hang
FROM sales.customers c
JOIN sales.orders o
    ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2018
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) >= 2