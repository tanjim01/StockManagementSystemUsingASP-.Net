
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CompanyId] [int] NULL,
	[CategoryId] [int] NULL,
	[AvailableQuantity] [int] NULL,
	[ReorderLevel] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Date] [varchar](50) NULL,
	[OutAction] [varchar](50) NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CompanyCategoryView]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CompanyCategoryView] AS
SELECT i.Id AS ItemId, c.Name AS CompanyName, i.Name AS ItemName, i.AvailableQuantity AS AvailableQuantity 
FROM Company AS c 
INNER JOIN Item AS i ON i.CompanyId=c.Id 
INNER JOIN Category AS ca ON i.CategoryId=ca.Id



GO
/****** Object:  View [dbo].[StockInView]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockInView]
AS
SELECT        i.Id AS ItemId, c.Name AS CompanyName, i.Name AS ItemName, i.AvailableQuantity
FROM            dbo.Company AS c INNER JOIN
                         dbo.Item AS i ON i.CompanyId = c.Id


GO
/****** Object:  View [dbo].[StockInView2]    Script Date: 28-Nov-18 4:48:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockInView2] AS

SELECT        dbo.Company.Id, dbo.Item.Id AS Expr1, dbo.Item.ReorderLevel, dbo.Item.AvailableQuantity
FROM            dbo.Category INNER JOIN
                         dbo.Company ON dbo.Category.Id = dbo.Company.Id INNER JOIN
                         dbo.Item ON dbo.Category.Id = dbo.Item.CategoryId AND dbo.Company.Id = dbo.Item.CompanyId INNER JOIN
                         dbo.StockOut ON dbo.Item.Id = dbo.StockOut.ItemId



GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Name], [Password]) VALUES (1, N'Admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Plastics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Drinks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Biscuit')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'RFL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'Pran')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'BRB')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Cocacola')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'Natty')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (6, N'Sony')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (7, N'Walton')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (8, N'Fulcoli')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (1, N'Wire', 3, 1, 22, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (2, N'Wire', 1, 1, 3, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (3, N'Glass', 2, 2, 5, 2)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (4, N'Pepsi', 4, 3, 1, 2)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (5, N'Switch', 3, 1, 8, 2)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (6, N'Craky Biscuit', 5, 4, 5, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (7, N'TV', 1, 1, 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (8, N'Radio', 1, 1, 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (9, N'Head Phone', 6, 1, 1, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (10, N'Camera', 6, 1, 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (11, N'Refrigerator', 7, 1, 15, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (12, N'Deep Fridge', 7, 1, 11, 2)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (13, N'Smart Watch', 6, 1, 0, 11)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (14, N'Tool Chair', 1, 2, 0, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (15, N'Salt', 5, 4, 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (16, N'Walkman', 6, 1, 28, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (17, N'TV Stand', 2, 1, 0, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (18, N'Dry Cake', 8, 4, 125, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (19, N'Dish Cable', 3, 1, 1, 1)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [AvailableQuantity], [ReorderLevel]) VALUES (20, N'Potato', 2, 4, 0, 1)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (1, 1, 2, N'2018-11-15', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (2, 3, 1, N'2018-11-20', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (3, 2, 1, N'2018-11-21', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (4, 2, 2, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (5, 3, 2, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (6, 1, 2, N'2018-11-23', N'Damage')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (7, 1, 1, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (8, 1, 2, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (9, 3, 1, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (10, 1, 2, N'2018-11-23', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (11, 2, 1, N'2018-11-24', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (12, 6, 5, N'2018-11-25', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (13, 6, 5, N'2018-11-25', N'Damage')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (14, 9, 10, N'2018-11-25', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (15, 4, 1, N'2018-11-25', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (16, 11, 10, N'2018-11-27', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (17, 12, 10, N'2018-11-27', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (18, 12, 1, N'2018-11-27', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (19, 12, 1, N'2018-11-27', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (20, 12, 10, N'2018-11-27', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (21, 18, 25, N'2018-11-28', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (22, 5, 2, N'2018-11-28', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (23, 19, 11, N'2018-11-28', N'Sell')
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Date], [OutAction]) VALUES (24, 20, 15, N'2018-11-28', N'Sell')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockInView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockInView'
GO
USE [master]
GO
ALTER DATABASE [StockManagementDB] SET  READ_WRITE 
GO
