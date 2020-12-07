/****** DATABASE NAME DOTNET ******/

--CREATE TABLES

--CLIENTS
USE [DOTNET]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[city] [nvarchar](25) NULL,
	[phone] [nvarchar](15) NOT NULL,
	[email] [nvarchar](130) NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- PRODUCTS
USE [DOTNET]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [real] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--invoices
USE [DOTNET]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[invoices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[id_client] [int] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK_invoices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[invoices]  WITH CHECK ADD  CONSTRAINT [FK_invoices_clients] FOREIGN KEY([id_client])
REFERENCES [dbo].[clients] ([id])
GO

ALTER TABLE [dbo].[invoices] CHECK CONSTRAINT [FK_invoices_clients]
GO

--inovices_items
USE [DOTNET]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[invoice_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_invoice] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_invoice_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[invoice_items]  WITH CHECK ADD  CONSTRAINT [FK_invoice_items_invoices] FOREIGN KEY([id_invoice])
REFERENCES [dbo].[invoices] ([id])
GO

ALTER TABLE [dbo].[invoice_items] CHECK CONSTRAINT [FK_invoice_items_invoices]
GO

ALTER TABLE [dbo].[invoice_items]  WITH CHECK ADD  CONSTRAINT [FK_invoice_items_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id])
GO

ALTER TABLE [dbo].[invoice_items] CHECK CONSTRAINT [FK_invoice_items_products]
GO

-- INSET ITEMS IN TABLE ROWS
-- IN CLIENTS
USE [DOTNET]
GO

INSERT INTO [dbo].[clients]
           ([first_name]
           ,[last_name]
           ,[city]
           ,[phone]
           ,[email])
     VALUES
           ('Jan','Nowak','Warszawa','+48123456789','jan.nowak@gmail.com'),
		   ('Janina','Nowak','Poznañ','+48987654321','janina.nowak@gmail.com'),
		   ('Adam','Mickiewicz','Lublin','+48172839465','adam.mickiewicz@gmail.com'),
		   ('Henryk','Sienkiewicz','Kraków','+4878317564','henryk.sienkiewicz@gmail.com')
GO

-- IN PRODUCTS
USE [DOTNET]
GO

INSERT INTO [dbo].[products]
           ([name]
           ,[price])
     VALUES
           ('Pralka',1358),
		   ('Lodówka',3499.99),
		   ('Toster',188.88),
		   ('Opiekacz',129.12),
		   ('Mikrofalówka',512.50),
		   ('Piekarnik',1802.60),
		   ('Robot planetarny',2799.99),
		   ('Telewizor',8000.20)

GO

-- IN INVOICES
USE [DOTNET]
GO

INSERT INTO [dbo].[invoices]
           ([number]
           ,[id_client]
           ,[creation_date])
     VALUES
           ('FVAT1',1,'2020-12-01'),
		   ('FVAT2',1,'2020-12-02'),
		   ('FVAT3',1,'2020-12-03'),
		   ('FVAT4',2,'2020-12-04'),
		   ('FVAT5',2,'2020-12-05'),
		   ('FVAT6',2,'2020-12-06'),
		   ('FVAT7',3,'2020-12-07'),
		   ('FVAT8',3,'2020-12-08'),
		   ('FVAT9',3,'2020-12-09'),
		   ('FVAT10',3,'2020-12-10'),
		   ('FVAT11',3,'2020-12-11'),
		   ('FVAT12',4,'2020-12-12'),
		   ('FVAT13',4,'2020-12-13'),
		   ('FVAT14',4,'2020-12-14')

GO


-- IN INVOICES ITEMS

USE [DOTNET]
GO

INSERT INTO [dbo].[invoice_items]
           ([id_invoice]
           ,[id_product]
           ,[quantity])
     VALUES
			(1,1,1),
			(1,2,2),
			(1,3,1),
			(2,4,2),
			(2,5,1),
			(2,6,2),
			(3,7,1),
			(3,8,2),
			(3,1,1),
			(4,2,2),
			(4,3,1),
			(4,4,2),
			(5,5,1),
			(5,6,2),
			(5,7,1),
			(6,8,2),
			(6,1,1),
			(6,2,2),
			(7,3,1),
			(7,4,2),
			(7,5,1),
			(8,6,2),
			(8,7,1),
			(8,8,2),
			(9,1,1),
			(9,2,2),
			(9,3,1),
			(10,4,2),
			(10,5,1),
			(10,6,2),
			(11,7,1),
			(11,8,2),
			(11,1,1),
			(12,2,2),
			(12,3,1),
			(12,4,2),
			(13,5,1),
			(13,6,2),
			(13,7,1),
			(14,8,2),
			(14,1,1),
			(14,2,2)

GO


