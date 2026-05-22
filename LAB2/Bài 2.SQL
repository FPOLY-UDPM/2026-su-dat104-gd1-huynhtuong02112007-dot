SELECT [category_id] 
     ,ROUND(AVG([list_price]),1) AS Gia_Trung_Binh
FROM [BikeStores].[production].[products]
GROUP BY [category_id]
HAVING ROUND(AVG([list_price]),1)>200