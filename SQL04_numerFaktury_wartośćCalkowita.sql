/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 

	  invoices.number AS [Numer faktury]
      --,SUM(products.price) AS [WARTOŒÆ FAKTURY]
	 ,SUM(products.price * quantity) AS [Wartoœæ faktury]
	
  FROM [DOTNET].[dbo].[invoice_items]
  INNER JOIN [DOTNET].[dbo].[invoices] ON  invoice_items.id_invoice = invoices.id
  INNER JOIN [DOTNET].[dbo].[products] ON invoice_items.id_product = products.id
  GROUP BY invoices.number