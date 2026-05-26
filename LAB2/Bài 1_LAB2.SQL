SELECT [first_name], [last_name], [state]
FROM [BikeStores].[sales].[customers]
WHERE [state] like 'NY'
ORDER BY [first_name]