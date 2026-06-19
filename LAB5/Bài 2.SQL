SELECT
       p.product_name,
       SUM(oi.quantity) AS Tong_so_luong_ban
FROM production.products p
JOIN sales.order_items oi
    ON p.product_id = oi.product_id
JOIN sales.orders o
    ON oi.order_id = o.order_id
WHERE YEAR(o.order_date) = 2017
GROUP BY p.product_name
ORDER BY tong_so_luong_ban DESC