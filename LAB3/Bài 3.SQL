SELECT MONTH([order_date]) AS Tháng,
COUNT([order_id]) AS So_don_hang
FROM [BikeStores].[sales].[orders]
WHERE [order_date] BETWEEN '2016-02-01' AND '2017-02-28'
GROUP BY MONTH([order_date])
ORDER BY So_don_hang DESC