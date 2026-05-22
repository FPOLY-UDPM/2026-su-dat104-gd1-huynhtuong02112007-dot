SELECT [category_id]
     ,AVG([list_price]) AS Gia_Trung_Binh
FROM [BikeStores].[production].[products]
WHERE [product_name] like '%moto%'
GROUP BY [category_id]
HAVING AVG([list_price])>200