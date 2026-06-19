SELECT TOP 1
       s.store_name,
       COUNT(o.order_id) AS so_don_hang
FROM sales.stores s
JOIN sales.orders o
    ON s.store_id = o.store_id
WHERE YEAR(o.order_date) = 2017
GROUP BY s.store_name
ORDER BY so_don_hang DESC