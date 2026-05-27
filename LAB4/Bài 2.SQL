SELECT [category_id]
   ,AVG([list_price]) AS San_pham
FROM [BikeStores].[production].[products]
GROUP BY [category_id]
HAVING AVG([list_price]) BETWEEN 500 AND 1000