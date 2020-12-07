/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  invoice_items.id AS [ID Pozycji]


      ,quantity AS [Iloœæ]
	  ,products.name AS [Nazwa produktu]
      ,products.price AS [Cena]


  FROM [DOTNET].[dbo].[invoice_items] 
  INNER JOIN [DOTNET].[dbo].[products] ON products.id = invoice_items.id_product