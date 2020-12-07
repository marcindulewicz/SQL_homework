
SELECT  invoices.id AS [ID Faktury]
      ,number As [Numer faktury]
      ,creation_date AS [Data utworzenia faktury]

	  ,clients.first_name  AS [Imie klienta]
	  ,clients.last_name AS [Nazwisko klienta]

  FROM [DOTNET].[dbo].[invoices]
  INNER JOIN [DOTNET].[dbo].[clients]    ON  invoices.id_client= clients.id
