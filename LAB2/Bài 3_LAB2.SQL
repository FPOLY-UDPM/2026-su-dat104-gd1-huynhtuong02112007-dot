SELECT YEAR([order_date]) AS Năm,
COUNT([order_id]) AS So_don_hang
FROM [BikeStores].[sales].[orders]
GROUP BY YEAR([order_date])