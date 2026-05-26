SELECT [city], COUNT([customer_id]) AS Khach_hang
FROM [BikeStores].[sales].[customers]
WHERE [state] like 'NY'
GROUP BY [city]
HAVING COUNT([customer_id])>10
ORDER BY [city] DESC