SELECT [category_id]
   ,MAX([list_price]) AS Gia_tri_lon_nhat
   ,MIN([list_price]) AS Gia_tri_nho_nhat
FROM [BikeStores].[production].[products]
GROUP BY [category_id]
HAVING MAX([list_price]) > 4000 AND MIN([list_price]) < 500