/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  invoices.number AS [Numer faktury]
		,SUM(quantity)
         
  FROM [DOTNET].[dbo].[invoice_items]

  INNER JOIN [DOTNET].[dbo].[invoices] ON invoices.id = invoice_items.id_invoice
  GROUP BY invoices.number
