SELECT [order_id]
   ,[quantity] * [list_price] * (1 - discount) AS Net_value
FROM [BikeStores].[sales].[order_items]
WHERE [quantity] * [list_price] * (1 - discount) BETWEEN 19000 AND 25000