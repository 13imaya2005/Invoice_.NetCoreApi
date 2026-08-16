USE [INVOICE]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Update]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Insert]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_GetPaged]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetById]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_GetById]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Delete]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Vendor_Delete]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Update]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Insert]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_GetPaged]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetById]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_GetById]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Delete]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Users_Delete]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Update]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Insert]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_GetPaged]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetById]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_GetById]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Delete]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Itemmaster_Delete]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Update]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Insert]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_GetPaged]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetById]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_GetById]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Delete]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Customer_Delete]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Update]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Insert]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetPaged]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetById]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetById]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Delete]    Script Date: 02-08-2026 20:14:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Delete]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Itemmaster]') AND type in (N'U'))
ALTER TABLE [dbo].[Itemmaster] DROP CONSTRAINT IF EXISTS [FK_Itemmaster_Category]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
ALTER TABLE [dbo].[Vendor] DROP CONSTRAINT IF EXISTS [DF__Vendor__CreatedD__75C27486]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
ALTER TABLE [dbo].[Vendor] DROP CONSTRAINT IF EXISTS [DF__Vendor__IsDelete__74CE504D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
ALTER TABLE [dbo].[Vendor] DROP CONSTRAINT IF EXISTS [DF__Vendor__IsActive__73DA2C14]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF__Users__CreatedDa__38EE7070]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF__Users__IsDeleted__37FA4C37]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF__Users__IsActive__370627FE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Itemmaster]') AND type in (N'U'))
ALTER TABLE [dbo].[Itemmaster] DROP CONSTRAINT IF EXISTS [DF_Itemmaster_CategoryId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT IF EXISTS [DF__Customer__Create__75F77EB0]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT IF EXISTS [DF__Customer__IsDele__75035A77]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT IF EXISTS [DF__Customer__IsActi__740F363E]
GO
/****** Object:  Index [UQ__Vendor__10C18F5C54D24059]    Script Date: 02-08-2026 20:14:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
ALTER TABLE [dbo].[Vendor] DROP CONSTRAINT IF EXISTS [UQ__Vendor__10C18F5C54D24059]
GO
/****** Object:  Index [UQ__Customer__06678521706D57DE]    Script Date: 02-08-2026 20:14:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT IF EXISTS [UQ__Customer__06678521706D57DE]
GO
/****** Object:  Index [UQ_Category_Code]    Script Date: 02-08-2026 20:14:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
ALTER TABLE [dbo].[Category] DROP CONSTRAINT IF EXISTS [UQ_Category_Code]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 02-08-2026 20:14:00 ******/
DROP TABLE IF EXISTS [dbo].[Vendor]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-08-2026 20:14:00 ******/
DROP TABLE IF EXISTS [dbo].[Users]
GO
/****** Object:  Table [dbo].[Itemmaster]    Script Date: 02-08-2026 20:14:00 ******/
DROP TABLE IF EXISTS [dbo].[Itemmaster]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02-08-2026 20:14:00 ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-08-2026 20:14:00 ******/
DROP TABLE IF EXISTS [dbo].[Category]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Description] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](20) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[MobileNo] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](20) NULL,
	[ZipCode] [varchar](20) NULL,
	[GstNo] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[Updateddate] [datetime] NULL,
 CONSTRAINT [PK__Customer__3214EC0767F2DCCD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itemmaster]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itemmaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemBarCode] [varchar](25) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Itemcode] [varchar](10) NOT NULL,
	[Itemname] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
	[Uom] [varchar](3) NOT NULL,
	[Rate] [decimal](18, 2) NULL,
	[Minimumstock] [decimal](18, 2) NULL,
	[Maximumstock] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[Createdby] [varchar](100) NULL,
	[Createddate] [datetime] NULL,
	[Updatedby] [varchar](100) NULL,
	[Updateddate] [datetime] NULL,
 CONSTRAINT [PK__Itemmast__3214EC078A8AD92A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
	[AlternatePhone] [nvarchar](25) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorCode] [varchar](20) NOT NULL,
	[VendorName] [nvarchar](100) NOT NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[MobileNo] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[ZipCode] [varchar](20) NULL,
	[GstNo] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__Vendor__3214EC076222028C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'RI001', N'Rice', N'All types of rice', 1, N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime), N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'VE001', N'Vegitables', N'All types of vegitables', 1, N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime), N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'SN001', N'Snacks', N'All types of snacks', 1, N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime), N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'OI001', N'Oil', N'All types of oils', 1, N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime), N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'SO001', N'Soap', N'All types of soaps', 1, N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime), N'sa', CAST(N'2026-08-02T17:41:39.503' AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'GN001', N'General', N'General Stores', 1, N'sa', CAST(N'2026-08-02T18:10:22.217' AS DateTime), N'sa', CAST(N'2026-08-02T18:10:22.217' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (30, N'C002', N'XYZ Agencies', N'Suresh', N'9876543211', N'xyz@gmail.com', N'Anna Nagar', N'Near Park', N'Madurai', N'Tamil Nadu', N'India', N'625001', N'33AAAAA1111A1Z5', 1, 0, N'sa', CAST(N'2026-06-28T17:59:23.590' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (31, N'C003', N'Global Stores', N'Karthik', N'9876543212', N'global@gmail.com', N'MG Road', N'Near Bus Stand', N'Coimbatore', N'Tamil Nadu', N'India', N'641001', N'33BBBBB2222B1Z5', 1, 0, N'sa', CAST(N'2026-06-28T17:59:23.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (35, N'C007', N'Royal Traders', N'Senthil', N'9876543216', N'royal@gmail.com', N'South Street', N'Near College', N'Vellore', N'Tamil Nadu', N'India', N'632001', N'33FFFFF6666F1Z5', 1, 0, N'sa', CAST(N'2026-06-28T17:59:23.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (36, N'C008', N'Green Foods', N'Arun', N'9876543217', N'green@gmail.com', N'Lake View', N'Near Park', N'Tirunelveli', N'Tamil Nadu', N'India', N'627001', N'33GGGGG7777G1Z5', 1, 0, N'sa', CAST(N'2026-06-28T17:59:23.593' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (48, N'jio trader', N'string', N'string', N'string', N'vivek@gmail.com', N'string', N'', N'string', N'string', N'', N'string', N'string', 1, 0, N'sa', CAST(N'2026-07-04T12:14:15.450' AS DateTime), N'Z14-55M\acer', CAST(N'2026-07-08T12:47:08.563' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (100, N'C001', N'ABC Traders', N'Ramesh', N'9876543210', N'abc@gmail.com', N'12 Main Road', N'Near Bus Stand', N'Chennai', N'Tamil Nadu', N'India', N'600001', N'33ABCDE1234F1Z5', 1, 0, N'sa', CAST(N'2026-07-08T10:03:19.550' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (105, N'C006', N'City Distributors', N'Ganesh', N'9876543215', N'city@gmail.com', N'North Street', N'Near Hospital', N'Erode', N'Tamil Nadu', N'India', N'638001', N'33EEEEE5555E1Z5', 1, 0, N'sa', CAST(N'2026-07-08T10:03:19.570' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (134, N'C004', N'Fresh Mart', N'Prakash', N'9876543213', N'fresh@gmail.com', N'Market Road', N'Near Temple', N'Salem', N'Tamil Nadu', N'India', N'636001', N'33CCCCC3333C1Z5', 1, 0, N'sa', CAST(N'2026-07-08T11:12:55.690' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Customer] ([Id], [CustomerCode], [CustomerName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (135, N'C005', N'Star Enterprises', N'Vijay', N'9876543214', N'star@gmail.com', N'Gandhi Road', N'Near Signal', N'Trichy', N'Tamil Nadu', N'India', N'620001', N'33DDDDD4444D1Z5', 1, 0, N'sa', CAST(N'2026-07-08T11:12:55.693' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Itemmaster] ON 
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (82, N'Bar002', 4, N'Oil0003', N'Fortune', N'Cooking Oil', N'Lit', CAST(120.55 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 1, N'Valavan', CAST(N'2026-06-23T10:39:42.557' AS DateTime), N'Valavan', CAST(N'2026-06-23T10:39:42.557' AS DateTime))
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (83, N'Bar002', 6, N'Rice000002', N'pasmathi', N'food', N'No', CAST(120.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.280' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (84, N'Bar005', 6, N'Fruit00005', N'Apple', N'Red Apple', N'Kg', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.280' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (85, N'Bar005', 4, N'Oil00005', N'Cocanet Oil', N'Hair Growth', N'Lit', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.280' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (86, N'Bar005', 6, N'Oil00005', N'Svs', N'Food Incrident', N'Lit', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (87, N'Bar005', 6, N'Bread00005', N'Bread', N'Food', N'Pac', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (88, N'Bar005', 6, N'Jam00005', N'Jam', N'Food Incredient', N'Pac', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (89, N'Bar005', 5, N'soap00005', N'Arasan', N'Cloth Wash', N'Pac', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.283' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Itemmaster] ([Id], [ItemBarCode], [CategoryId], [Itemcode], [Itemname], [Description], [Uom], [Rate], [Minimumstock], [Maximumstock], [IsActive], [Createdby], [Createddate], [Updatedby], [Updateddate]) VALUES (90, N'Bar005', 5, N'Soap00005', N'Vim', N'Wesal Washing', N'Pac', CAST(150.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, N'sa', CAST(N'2026-06-23T10:40:14.283' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Itemmaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FirstName], [MiddleName], [LastName], [DisplayName], [PhoneNumber], [AlternatePhone], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [DateOfBirth], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (333, N'revathi_p', N'revathi.p@gmail.com', N'Pass@1234', N'Revathi', N'v', N'Devi', N'Revathi Devi', N'9876500112', N'9123401112', N'64 Hill View', N'Block C', N'Coimbatore', N'Tamil Nadu', N'641002', N'India', CAST(N'1994-12-19' AS Date), 1, 0, N'sa', CAST(N'2026-07-09T10:36:48.443' AS DateTime), N'Z14-55M\acer', CAST(N'2026-08-02T13:23:24.480' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FirstName], [MiddleName], [LastName], [DisplayName], [PhoneNumber], [AlternatePhone], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [DateOfBirth], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (336, N'ganesh_m', N'ganesh.m@gmail.com', N'Pass@1234', N'Ganesh', N'M', N'Kumar', N'Ganesh Kumar', N'9876500115', N'9123401115', N'41 City Center', N'Near Bus Stand', N'Trichy', N'Tamil Nadu', N'620002', N'India', CAST(N'1991-03-17' AS Date), 1, 0, N'sa', CAST(N'2026-07-09T10:36:48.447' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FirstName], [MiddleName], [LastName], [DisplayName], [PhoneNumber], [AlternatePhone], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [DateOfBirth], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (342, N'ilakya', N'14ilakya2004@gmail.com', N'fgjhu', N'ilakya', N'M', N'B', N'Iakiya', N'8976596758', N'5677470993', N'159 villupuram', N'167 chennai', N'chennai', N'chennai', N'378 987', N'india', CAST(N'2005-12-12' AS Date), 1, 0, N'Z14-55M\acer', CAST(N'2026-08-02T13:27:41.437' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'V001', N'ABC Traders Pvt Ltd', N'Ramesh Kumar', N'9876543210', N'abc@gmail.com', N'No.11 MG Road', N'Near Bus Stand', N'Chennai', N'Tamil Nadu', N'India', N'600001', N'33ABCDE1234F1Z5', 1, 0, N'Admin', CAST(N'2026-07-11T12:06:14.430' AS DateTime), N'sa', CAST(N'2026-07-11T13:13:04.133' AS DateTime))
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'V002', N'ABC Traders', N'Ramesh', N'9876543210', N'abc@gmail.com', N'No.10 MG Road', N'Near Bus Stand', N'Chennai', N'Tamil Nadu', N'India', N'600001', N'33ABCDE1234F1Z5', 1, 0, N'Admin', CAST(N'2026-07-11T12:20:55.237' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'V003', N'Sri Trader', N'Kumar', N'9876543212', N'sri@gmail.com', N'No.15 Gandhi Road', N'Opp Bus Stand', N'Madurai', N'Tamil Nadu', N'India', N'625001', N'33ABCDE9876F1Z7', 1, 0, N'sa', CAST(N'2026-07-11T13:05:42.650' AS DateTime), N'Z14-55M\acer', CAST(N'2026-07-12T10:14:28.597' AS DateTime))
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'V004', N'Modern Suppliers', N'Ganesh', N'9876543213', N'modern@gmail.com', N'No.5 Market Road', N'Near Temple', N'Salem', N'Tamil Nadu', N'India', N'636001', N'33ABCDE2222F1Z8', 1, 0, N'sa', CAST(N'2026-07-11T13:05:42.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'V005', N'Star Distributors', N'Raj', N'9876543214', N'star@gmail.com', N'No.45 Cross Street', N'Near Hospital', N'Trichy', N'Tamil Nadu', N'India', N'620001', N'33ABCDE3333F1Z9', 1, 0, N'sa', CAST(N'2026-07-11T13:05:42.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, N'V006', N'City Enterprises', N'Mohan', N'9876543215', N'city@gmail.com', N'No.12 Lake View', N'Near Park', N'Erode', N'Tamil Nadu', N'India', N'638001', N'33ABCDE4444F1Z1', 1, 0, N'sa', CAST(N'2026-07-11T13:05:42.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, N'V007', N'Green Suppliers', N'Arun', N'9876543216', N'green@gmail.com', N'No.8 Main Road', N'Near School', N'Vellore', N'Tamil Nadu', N'India', N'632001', N'33ABCDE5555F1Z2', 1, 0, N'sa', CAST(N'2026-07-11T13:05:42.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, N'V008', N'Quality Traders', N'Prakash', N'9876543217', N'quality@gmail.com', N'No.90 Bazaar Street', N'Near College', N'Tirunelveli', N'Tamil Nadu', N'India', N'627001', N'33ABCDE6666F1Z3', 1, 0, N'sa', CAST(N'2026-07-11T13:05:51.520' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, N'v035', N'saran', N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'string', 1, 0, N'sa', CAST(N'2026-07-11T13:05:56.543' AS DateTime), N'Z14-55M\acer', CAST(N'2026-07-11T18:28:34.400' AS DateTime))
GO
INSERT [dbo].[Vendor] ([Id], [VendorCode], [VendorName], [ContactPerson], [MobileNo], [Email], [Address1], [Address2], [City], [State], [Country], [ZipCode], [GstNo], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, N'V010', N'Prime Distributors', N'Vijay', N'9876543219', N'prime@gmail.com', N'No.30 East Road', N'Near Market', N'Karur', N'Tamil Nadu', N'India', N'639001', N'33ABCDE8888F1Z5', 1, 0, N'sa', CAST(N'2026-07-11T13:06:00.067' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Category_Code]    Script Date: 02-08-2026 20:14:00 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ_Category_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__06678521706D57DE]    Script Date: 02-08-2026 20:14:00 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__06678521706D57DE] UNIQUE NONCLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vendor__10C18F5C54D24059]    Script Date: 02-08-2026 20:14:00 ******/
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [UQ__Vendor__10C18F5C54D24059] UNIQUE NONCLUSTERED 
(
	[VendorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__IsActi__740F363E]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__IsDele__75035A77]  DEFAULT ((1)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Create__75F77EB0]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Itemmaster] ADD  CONSTRAINT [DF_Itemmaster_CategoryId]  DEFAULT ((1)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsActive__370627FE]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsDeleted__37FA4C37]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreatedDa__38EE7070]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF__Vendor__IsActive__73DA2C14]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF__Vendor__IsDelete__74CE504D]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF__Vendor__CreatedD__75C27486]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Itemmaster]  WITH CHECK ADD  CONSTRAINT [FK_Itemmaster_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Itemmaster] CHECK CONSTRAINT [FK_Itemmaster_Category]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Delete]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_Delete]

(

    @Id INT

)

AS

BEGIN

    DELETE FROM Category

    WHERE Id = @Id

END
 
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_GetAll]

AS

BEGIN

    SELECT

        Id,

        Code,

        Name,

        Description,

        IsActive,

        CreatedBy,

        CreatedDate,

        UpdatedBy,

        UpdatedDate

    FROM Category

    ORDER BY Id DESC

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetById]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_GetById]

(

    @Id INT

)

AS

BEGIN

    SELECT

        Id,

        Code,

        Name,

        Description,

        IsActive,

        CreatedBy,

        CreatedDate,

        UpdatedBy,

        UpdatedDate

    FROM Category

    WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_GetPaged]
 
    @Code        VARCHAR(5) = NULL,

    @Name        VARCHAR(25) = NULL,

    @IsActive    BIT = NULL,

    @PageNumber  INT = 1,

    @PageSize    INT = 10
 
AS

BEGIN

    SET NOCOUNT ON;
 
    IF (@PageNumber <= 0) SET @PageNumber = 1;

    IF (@PageSize <= 0) SET @PageSize = 10;
 
    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;
 
    SELECT
 
        Id,

        Code,

        Name,

        Description,

        IsActive,

        CreatedBy,

        CreatedDate,

        UpdatedBy,

        UpdatedDate,
 
        COUNT(*) OVER() AS TotalRecords
 
    FROM Category
 
    WHERE
 
        (@Code IS NULL OR Code LIKE '%' + @Code + '%')
 
        AND (@Name IS NULL OR Name LIKE '%' + @Name + '%')
 
        AND (@IsActive IS NULL OR IsActive = @IsActive)
 
    ORDER BY Id ASC

    OFFSET @Offset ROWS

    FETCH NEXT @PageSize ROWS ONLY;
 
    SELECT
 
        COUNT(1) AS TotalRecords
 
    FROM Category
 
    WHERE
 
        (@Code IS NULL OR Code LIKE '%' + @Code + '%')
 
        AND (@Name IS NULL OR Name LIKE '%' + @Name + '%')
 
        AND (@IsActive IS NULL OR IsActive = @IsActive);
 
END
 
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Insert]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_Insert]

(

    @Code VARCHAR(5),

    @Name VARCHAR(25),

    @Description VARCHAR(100),

    @IsActive BIT

 

)

AS

BEGIN

    INSERT INTO Category

    (

        Code,

        Name,

        Description,

        IsActive,

        CreatedBy,

        CreatedDate

    )

    VALUES

    (

        @Code,

        @Name,

        @Description,

        @IsActive,

        SYSTEM_USER,

        GETDATE()

    )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Update]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_Update]

(

    @Id INT,

    @Code VARCHAR(5),

    @Name VARCHAR(25),

    @Description VARCHAR(100),

    @IsActive BIT

    

)

AS

BEGIN

    UPDATE Category

    SET

        Code = @Code,

        Name = @Name,

        Description = @Description,

        IsActive = @IsActive,

        UpdatedBy = SYSTEM_USER,

        UpdatedDate = GETDATE()

    WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Delete]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_Delete]
(
    @Id INT
)
AS
BEGIN
    SET NOCOUNT OFF;

    DELETE FROM Customer
    WHERE Id = @Id;

    SELECT @@ROWCOUNT AS AffectedRows;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_GetAll]
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        Id,
        CustomerCode,
        CustomerName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM Customer
    ORDER BY Id DESC;

END

GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetById]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_GetById]
(
    @Id INT
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        Id,
        CustomerCode,
        CustomerName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM Customer
    WHERE Id = @Id;

END

GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_GetPaged]

    @CustomerCode VARCHAR(20) = NULL,
    @CustomerName NVARCHAR(100) = NULL,
    @IsActive BIT = NULL,
    @PageNumber INT = 1,
    @PageSize INT = 10

AS
BEGIN

    SET NOCOUNT ON;

    IF (@PageNumber <= 0) SET @PageNumber = 1;
    IF (@PageSize <= 0) SET @PageSize = 10;

    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;

    SELECT

        Id,
        CustomerCode,
        CustomerName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate,

        COUNT(*) OVER() AS TotalRecords

    FROM Customer

    WHERE

        (@CustomerCode IS NULL OR CustomerCode LIKE '%' + @CustomerCode + '%')

        AND (@CustomerName IS NULL OR CustomerName LIKE '%' + @CustomerName + '%')

        AND (@IsActive IS NULL OR IsActive = @IsActive)

    ORDER BY Id ASC

    OFFSET @Offset ROWS

    FETCH NEXT @PageSize ROWS ONLY;

    SELECT

        COUNT(1) AS TotalRecords

    FROM Customer

    WHERE

        (@CustomerCode IS NULL OR CustomerCode LIKE '%' + @CustomerCode + '%')

        AND (@CustomerName IS NULL OR CustomerName LIKE '%' + @CustomerName + '%')

        AND (@IsActive IS NULL OR IsActive = @IsActive);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Insert]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Customer_Insert]
(
    @CustomerCode VARCHAR(20),
    @CustomerName NVARCHAR(100),
    @ContactPerson NVARCHAR(100),
    @MobileNo VARCHAR(20),
    @Email VARCHAR(100),
    @Address1 NVARCHAR(200),
    @Address2 NVARCHAR(200),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @Country NVARCHAR(100),
    @ZipCode VARCHAR(20),
    @GstNo VARCHAR(50)
)
AS
BEGIN

    INSERT INTO Customer
    (
        CustomerCode,
        CustomerName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    )
    VALUES
    (
        @CustomerCode,
        @CustomerName,
        @ContactPerson,
        @MobileNo,
        @Email,
        @Address1,
        @Address2,
        @City,
        @State,
        @Country,
        @ZipCode,
        @GstNo,
        1,
        0,
        SYSTEM_USER,
        GETDATE(),
        NULL,
        NULL
    );

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Update]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Customer_Update]
(
    @Id INT,
    @CustomerCode VARCHAR(20),
    @CustomerName NVARCHAR(100),
    @ContactPerson NVARCHAR(100) = NULL,
    @MobileNo VARCHAR(20) = NULL,
    @Email VARCHAR(100) = NULL,
    @Address1 NVARCHAR(200) = NULL,
    @Address2 NVARCHAR(200) = NULL,
    @City NVARCHAR(100) = NULL,
    @State NVARCHAR(100) = NULL,
    @Country NVARCHAR(100) = NULL,
    @ZipCode VARCHAR(20) = NULL,
    @GstNo VARCHAR(50) = NULL,
    @IsActive BIT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Customer
    SET
        CustomerCode = @CustomerCode,
        CustomerName = @CustomerName,
        ContactPerson = @ContactPerson,
        MobileNo = @MobileNo,
        Email = @Email,
        Address1 = @Address1,
        Address2 = @Address2,
        City = @City,
        State = @State,
        Country = @Country,
        ZipCode = @ZipCode,
        GstNo = @GstNo,
        IsActive = @IsActive,
        UpdatedBy = SYSTEM_USER,
        UpdatedDate = GETDATE()
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Delete]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_Delete]

(

    @Id INT

)

AS

BEGIN

    DELETE FROM Itemmaster

    WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_GetAll]
AS
BEGIN
    SELECT
        Id,
        CatCode,
        ItemBarCode,
        ItemCode,
        ItemName,
        Description,
        Uom,
        Rate,
        MinimumStock,
        MaximumStock,
        IsActive,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM Itemmaster
    ORDER BY Id DESC
END

exec sp_Itemmaster_GetAll
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetById]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_GetById]

(
 @Id INT
 )
 AS

BEGIN

    SELECT Id, CatCode,ItemBarCode, ItemCode, Itemname,
    Description, Uom, Rate,
    MinimumStock,MaximumStock,
    IsActive, Createdby, Createddate,
    Updatedby, Updateddate FROM Itemmaster
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_GetPaged]
	@CatCode	VARCHAR(5) = NULL,
	@ItemName	VARCHAR(100) = NULL,
	@Uom		VARCHAR(3) = NULL,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS
BEGIN
    SET NOCOUNT ON;
 
    -- Default paging
    IF (@PageNumber <= 0) SET @PageNumber = 1;
    IF (@PageSize <= 0) SET @PageSize = 10;
 
    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;
 
    -- Main data
	SELECT 
		Id,
		CatCode,
		ItemBarCode,
		Itemcode,
		Itemname,
		Description,
		Uom,
		Rate,
		Minimumstock,
		Maximumstock,
		IsActive,
		Createdby,
		Createddate,
		Updatedby,
		Updateddate,
		COUNT(*) OVER() AS TotalRecords
	FROM dbo.Itemmaster
	WHERE 
		(@CatCode IS NULL OR CatCode LIKE '%' + @CatCode + '%')
		AND (@ItemName IS NULL OR ItemName LIKE '%' + @ItemName + '%')
		AND (@Uom IS NULL OR Uom LIKE '%' + @Uom + '%')
	ORDER BY Id ASC
	OFFSET @Offset ROWS
	FETCH NEXT @PageSize ROWS ONLY;
 
	 -- Total count (for pagination UI)
SELECT 
     COUNT(1) AS TotalRecords
FROM dbo.Itemmaster
WHERE 
     (@CatCode IS NULL OR CatCode LIKE '%' + @CatCode + '%')
     AND (@ItemName IS NULL OR ItemName LIKE  '%'+@ItemName+'%')
     AND (@Uom IS NULL OR Uom LIKE '%'+@Uom+'%');
 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Insert]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_Insert]

(

    @CatCode VARCHAR(5),

    @ItemBarCode VARCHAR(25),

    @Itemcode VARCHAR(10),

    @Itemname VARCHAR(100),

    @Description VARCHAR(250),

    @Uom VARCHAR(3),

    @Rate DECIMAL(18,2),

    @Minimumstock DECIMAL(18,2),

    @Maximumstock DECIMAL(18,2),

    @IsActive BIT

   

)

AS

BEGIN

    INSERT INTO Itemmaster

    (

        CatCode, ItemBarCode, Itemcode, Itemname,

        Description, Uom, Rate,

        Minimumstock, Maximumstock,

        IsActive, Createdby, Createddate,

        Updatedby, Updateddate

    )

    VALUES

    (

        @CatCode, @ItemBarCode, @Itemcode, @Itemname,

        @Description, @Uom, @Rate,

        @Minimumstock, @Maximumstock,

        @IsActive, system_user,  GETDATE(),

        NULL, NULL

    )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Itemmaster_Update]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Itemmaster_Update]
(
    @Id INT,
    @CatCode VARCHAR(5),
    @ItemBarCode VARCHAR(25),
    @Itemcode VARCHAR(10),
    @Itemname VARCHAR(100),
    @Description VARCHAR(250),
    @Uom VARCHAR(3),
    @Rate DECIMAL(18,2),
    @Minimumstock DECIMAL(18,2),
    @Maximumstock DECIMAL(18,2),
    @IsActive BIT
    
)
AS
BEGIN
    UPDATE Itemmaster
    SET
        CatCode = @CatCode,
        ItemBarCode = @ItemBarCode,
        Itemcode = @Itemcode,
        Itemname = @Itemname,
        Description = @Description,
        Uom = @Uom,
        Rate = @Rate,
        Minimumstock = @Minimumstock,
        Maximumstock = @Maximumstock,
        IsActive = @IsActive,
        Updatedby = SYSTEM_USER,
        Updateddate = GETDATE()
    WHERE Id = @Id
END
 
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Delete]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Users_Delete]
    @Id INT
AS
BEGIN
    --SET NOCOUNT ON;

    DELETE FROM Users
    WHERE Id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Users_GetAll]
AS
BEGIN
    SELECT Id,UserName,Email,Password,FirstName,MiddleName,LastName,DisplayName,PhoneNumber,AlternatePhone,AddressLine1,AddressLine2,City,State,ZipCode,Country,DateOfBirth,IsActive,IsDeleted,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate
    FROM Users;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetById]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Users_GetById]
    @Id INT
AS
BEGIN
    SELECT *
    FROM Users
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Users_GetPaged] 
(
    @UserName      NVARCHAR(100) = NULL,
    @FirstName     NVARCHAR(100) = NULL,
    @LastName      NVARCHAR(100) = NULL,
    @Email         NVARCHAR(150) = NULL,
    @PhoneNumber   NVARCHAR(20)  = NULL,
    @City          NVARCHAR(100) = NULL,
    @DateOfBirth   DATE          = NULL,
    @IsActive      BIT           = NULL,

    @PageNumber    INT = 1,
    @PageSize      INT = 10
    )
AS
BEGIN
SET NOCOUNT ON;
IF (@PageNumber <=0) SET @PageNumber =1;
IF (@PageSize <=0) SET @PageSize =0;
DECLARE @offset INT = (@PageNumber -1) * @PageSize;
    SELECT
 
Id,UserName,Email,Password,FirstName,MiddleName,LastName,DisplayName,PhoneNumber,AlternatePhone,AddressLine1,AddressLine2,City,
 
State,ZipCode,Country,DateOfBirth,IsActive,IsDeleted,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,

COUNT(*) OVER() AS TotalRecords

FROM Users

WHERE

(@UserName IS NULL OR Username LIKE '%' + @UserName +'%')
 
AND (@FirstName IS NULL OR FirstName LIKE '%' + @FirstName +'%')
 
AND(@LastName IS NULL OR LastName LIKE '%' + @LastName +'%')

AND(@Email IS NULL OR Email LIKE '%' + @Email +'%')
 
AND(@PhoneNumber IS NULL OR PhoneNumber LIKE '%' + @PhoneNumber +'%')
 
AND(@City IS NULL OR City LIKE '%' + @City + '%')
 
AND(@DateOfBirth IS NULL OR DateOfBirth = @DateOfBirth)
 
AND (@IsActive IS NULL OR IsActive =@IsActive)

ORDER BY Id ASC
 
OFFSET @offset ROWS

FETCH NEXT @PageSize ROWS ONLY;

SELECT

COUNT (1) AS TotalRecords

FROM Users

WHERE

(@UserName IS NULL OR Username LIKE '%' + @UserName +'%')
 
AND (@FirstName IS NULL OR FirstName LIKE '%' + @FirstName +'%')
 
AND(@LastName IS NULL OR LastName LIKE '%' + @LastName +'%')

AND(@Email IS NULL OR Email LIKE '%' + @Email +'%')
 
AND(@PhoneNumber IS NULL OR PhoneNumber LIKE '%' + @PhoneNumber +'%')
 
AND(@City IS NULL OR City LIKE '%' + @City + '%')
 
AND(@DateOfBirth IS NULL OR DateOfBirth = @DateOfBirth)
 
AND (@IsActive IS NULL OR IsActive =@IsActive)

END;

 
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Insert]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Users_Insert]
(
    @UserName NVARCHAR(100),
    @Email NVARCHAR(255),
    @Password NVARCHAR(500),
    @FirstName NVARCHAR(100),
    @MiddleName Nvarchar(100),
    @LastName NVARCHAR(100),
    @DisplayName NVARCHAR(200),
    @PhoneNumber NVARCHAR(25),
    @AlternatePhone NVARCHAR(25),
    @AddressLine1 NVARCHAR(255),
    @AddressLine2 NVARCHAR(255),
    @City NVARChAR(100),
    @State NVARCHAr(100),
    @ZipCode NVARCHAR(20),
    @Country NVARCHAr(100),
    @dateOfBirth Date

)
AS
BEGIN
    INSERT INTO USERS
    (
        UserName,
        Email,
        Password,
        FirstName,
        MiddleName,
        LastName,
        DisplayName,
        PhoneNumber,
        AlternatePhone,
        AddressLine1,
        AddressLine2,
        City,
        State,
        ZipCode,
        Country,
        DateOfBirth,
        CreatedBy,
        UpdatedBy,
        UpdatedDate

    )
    VALUES
    (
        @UserName,
        @Email,
        @Password,
        @FirstName,
        @MiddleName,
        @LastName,
        @DisplayName,
        @PhoneNumber,
        @AlternatePhone,
        @AddressLine1,
        @AddressLine2,
        @City,
        @State,
        @ZipCode,
        @Country,
        @DateOfBirth,
        SYSTEM_USER,
        null,
        null
      
      );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_Update]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Users_Update]
    @Id int,
    @UserName NVARCHAR(100),
    @Email NVARCHAR(255),
    @Password NVARCHAR(500),
    @FirstName NVARCHAR(100),
    @MiddleName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @DisplayName NVARCHAR(200),
    @PhoneNumber NVARCHAR(25),
    @AlternatePhone NVARCHAR(25),
    @AddressLine1 NVARCHAR(255),
    @AddressLine2 NVARCHAR(255),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @ZipCode NVARCHAR(20),
    @Country NVARCHAR(100),
    @dateOfBirth Date
AS
BEGIN
     UPDATE Users
SET
    UserName = @UserName,
    Email = @Email,
    Password = @Password,
    FirstName = @FirstName,
    MiddleName = @MiddleName,
    LastName = @LastName,
    DisplayName = @DisplayName,
    PhoneNumber = @PhoneNumber,
    AlternatePhone = @AlternatePhone,
    AddressLine1 = @AddressLine1,
    AddressLine2 = @AddressLine2,
    City = @City,
    State = @State,
    ZipCode = @ZipCode,
    Country = @Country,
    DateOfBirth = @DateOfBirth,
    UpdatedBy = SYSTEM_USER,
    UpdatedDate = GETDATE()
WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Delete]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Vendor_Delete]
(
    @Id INT
)
AS
BEGIN

    DELETE FROM Vendor
    WHERE Id = @Id;

END

GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetAll]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Vendor_GetAll]

AS

BEGIN

    SELECT

        Id,
        VendorCode,
        VendorName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate

    FROM Vendor

    ORDER BY Id DESC

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetById]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Vendor_GetById]

(
 @Id INT
)

AS

BEGIN

    SELECT

        Id,
        VendorCode,
        VendorName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate

    FROM Vendor

    WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_GetPaged]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Vendor_GetPaged]
(
    @VendorCode VARCHAR(20) = NULL,
    @VendorName NVARCHAR(100) = NULL,
    @ContactPerson NVARCHAR(100) = NULL,
    @MobileNo VARCHAR(20) = NULL,
    @Email VARCHAR(100) = NULL,
    @City NVARCHAR(100) = NULL,
    @IsActive BIT = NULL,
    @PageNumber INT = 1,
    @PageSize INT = 10
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Id,
        VendorCode,
        VendorName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        IsDeleted,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    FROM Vendor
    WHERE
        (@VendorCode IS NULL OR VendorCode LIKE '%' + @VendorCode + '%')
        AND (@VendorName IS NULL OR VendorName LIKE '%' + @VendorName + '%')
        AND (@ContactPerson IS NULL OR ContactPerson LIKE '%' + @ContactPerson + '%')
        AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
        AND (@Email IS NULL OR Email LIKE '%' + @Email + '%')
        AND (@City IS NULL OR City LIKE '%' + @City + '%')
        AND (@IsActive IS NULL OR IsActive = @IsActive)
        AND IsDeleted = 0
    ORDER BY Id DESC
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;

    SELECT COUNT(*) AS TotalRecords
    FROM Vendor
    WHERE
        (@VendorCode IS NULL OR VendorCode LIKE '%' + @VendorCode + '%')
        AND (@VendorName IS NULL OR VendorName LIKE '%' + @VendorName + '%')
        AND (@ContactPerson IS NULL OR ContactPerson LIKE '%' + @ContactPerson + '%')
        AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
        AND (@Email IS NULL OR Email LIKE '%' + @Email + '%')
        AND (@City IS NULL OR City LIKE '%' + @City + '%')
        AND (@IsActive IS NULL OR IsActive = @IsActive)
        AND IsDeleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Insert]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Vendor_Insert]
(
    @VendorCode VARCHAR(20),
    @VendorName NVARCHAR(100),
    @ContactPerson NVARCHAR(100),
    @MobileNo VARCHAR(20),
    @Email VARCHAR(100),
    @Address1 NVARCHAR(200),
    @Address2 NVARCHAR(200),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @Country NVARCHAR(100),
    @ZipCode VARCHAR(20),
    @GstNo VARCHAR(50),
    @IsActive BIT
)
AS
BEGIN

    INSERT INTO Vendor
    (
        VendorCode,
        VendorName,
        ContactPerson,
        MobileNo,
        Email,
        Address1,
        Address2,
        City,
        State,
        Country,
        ZipCode,
        GstNo,
        IsActive,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate
    )
    VALUES
    (
        @VendorCode,
        @VendorName,
        @ContactPerson,
        @MobileNo,
        @Email,
        @Address1,
        @Address2,
        @City,
        @State,
        @Country,
        @ZipCode,
        @GstNo,
        @IsActive,
        SYSTEM_USER,
        GETDATE(),
        NULL,
        NULL
    );

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Update]    Script Date: 02-08-2026 20:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Vendor_Update]
(
    @Id INT,
    @VendorCode VARCHAR(20),
    @VendorName NVARCHAR(100),
    @ContactPerson NVARCHAR(100),
    @MobileNo VARCHAR(20),
    @Email VARCHAR(100),
    @Address1 NVARCHAR(200),
    @Address2 NVARCHAR(200),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @Country NVARCHAR(100),
    @ZipCode VARCHAR(20),
    @GstNo VARCHAR(50),
    @IsActive BIT
)
AS
BEGIN

    UPDATE Vendor
    SET
        VendorCode = @VendorCode,
        VendorName = @VendorName,
        ContactPerson = @ContactPerson,
        MobileNo = @MobileNo,
        Email = @Email,
        Address1 = @Address1,
        Address2 = @Address2,
        City = @City,
        State = @State,
        Country = @Country,
        ZipCode = @ZipCode,
        GstNo = @GstNo,
        IsActive = @IsActive,
        UpdatedBy = SYSTEM_USER,
        UpdatedDate = GETDATE()
    WHERE Id = @Id;

END
GO
