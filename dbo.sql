/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : SQL Server
 Source Server Version : 11002100
 Source Host           : DESKTOP-M0952E0\SQLEXPRESS:1433
 Source Catalog        : MvcBookStore
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11002100
 File Encoding         : 65001

 Date: 21/09/2020 10:35:19
*/


-- ----------------------------
-- Table structure for Books
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type IN ('U'))
	DROP TABLE [dbo].[Books]
GO

CREATE TABLE [dbo].[Books] (
  [BookId] int IDENTITY(1,1) NOT NULL,
  [AuthorName] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Title] nvarchar(160) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Price] numeric(10,2) NOT NULL,
  [BookCoverUrl] nvarchar(1024) COLLATE Chinese_PRC_CI_AS NULL,
  [CategoryId] int NOT NULL
)
GO

ALTER TABLE [dbo].[Books] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍ID，增量1',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'BookId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'作者姓名，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'AuthorName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书名，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍价格，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'Price'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍封面，可以为空',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'BookCoverUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类别ID,外键对应表Categories',
'SCHEMA', N'dbo',
'TABLE', N'Books',
'COLUMN', N'CategoryId'
GO


-- ----------------------------
-- Records of [Books]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Books] ON
GO

INSERT INTO [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl], [CategoryId]) VALUES (N'2', N'刘瑜，刘胜松', N'NoSQL数据库入门与实践（基于MongoDB、Redis）', N'89.00', N'https://img12.360buyimg.com/n1/jfs/t27259/192/123377539/276475/69e5af55/5b866b77Nb81370e4.jpg', N'1')
GO

INSERT INTO [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl], [CategoryId]) VALUES (N'3', N'吕思勉', N'中国简史', N'68.00', N'https://img12.360buyimg.com/n1/jfs/t23476/361/516118338/673897/2e36fadb/5b3333c3N4deb6492.jpg', N'2')
GO

INSERT INTO [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl], [CategoryId]) VALUES (N'4', N'郦道元', N'水经注', N'23.00', N'https://img14.360buyimg.com/n1/jfs/t2479/185/2742882007/366362/8253a1e6/57170392N3877a1f5.jpg', N'3')
GO

INSERT INTO [dbo].[Books] ([BookId], [AuthorName], [Title], [Price], [BookCoverUrl], [CategoryId]) VALUES (N'5', N'刘建伟，王育民', N'网络安全——技术与实践（第3版）', N'59.50', N'https://img12.360buyimg.com/n1/jfs/t4873/191/956610082/102070/77aa12e3/58eb3fc4Nadf2d41e.jpg', N'1')
GO

SET IDENTITY_INSERT [dbo].[Books] OFF
GO


-- ----------------------------
-- Table structure for Carts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND type IN ('U'))
	DROP TABLE [dbo].[Carts]
GO

CREATE TABLE [dbo].[Carts] (
  [RecordId] int IDENTITY(1,1) NOT NULL,
  [CartId] nvarchar(max) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [BookId] int NOT NULL,
  [Count] int NOT NULL,
  [DateCreated] datetime NOT NULL
)
GO

ALTER TABLE [dbo].[Carts] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'购物车条目ID，主键，增量1',
'SCHEMA', N'dbo',
'TABLE', N'Carts',
'COLUMN', N'RecordId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'购物车ID',
'SCHEMA', N'dbo',
'TABLE', N'Carts',
'COLUMN', N'CartId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍ID，外键对应表Books',
'SCHEMA', N'dbo',
'TABLE', N'Carts',
'COLUMN', N'BookId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数量',
'SCHEMA', N'dbo',
'TABLE', N'Carts',
'COLUMN', N'Count'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建日期',
'SCHEMA', N'dbo',
'TABLE', N'Carts',
'COLUMN', N'DateCreated'
GO


-- ----------------------------
-- Table structure for Categories
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type IN ('U'))
	DROP TABLE [dbo].[Categories]
GO

CREATE TABLE [dbo].[Categories] (
  [CategoryId] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Description] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[Categories] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'类别ID ，主键，增量1',
'SCHEMA', N'dbo',
'TABLE', N'Categories',
'COLUMN', N'CategoryId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类别名称',
'SCHEMA', N'dbo',
'TABLE', N'Categories',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类别描述',
'SCHEMA', N'dbo',
'TABLE', N'Categories',
'COLUMN', N'Description'
GO


-- ----------------------------
-- Records of [Categories]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Categories] ON
GO

INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (N'1', N'计算机', NULL)
GO

INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (N'2', N'历史', NULL)
GO

INSERT INTO [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (N'3', N'地理', NULL)
GO

SET IDENTITY_INSERT [dbo].[Categories] OFF
GO


-- ----------------------------
-- Table structure for OrderDetails
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type IN ('U'))
	DROP TABLE [dbo].[OrderDetails]
GO

CREATE TABLE [dbo].[OrderDetails] (
  [OrderDetailId] int IDENTITY(1,1) NOT NULL,
  [OrderId] int NOT NULL,
  [BookId] int NOT NULL,
  [Quantity] int NOT NULL,
  [UnitPrice] decimal(18,2) NOT NULL
)
GO

ALTER TABLE [dbo].[OrderDetails] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单条目ID，主键，增量1',
'SCHEMA', N'dbo',
'TABLE', N'OrderDetails',
'COLUMN', N'OrderDetailId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单ID，不能为空，外键对应表Orders',
'SCHEMA', N'dbo',
'TABLE', N'OrderDetails',
'COLUMN', N'OrderId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍ID，外键对应表Books',
'SCHEMA', N'dbo',
'TABLE', N'OrderDetails',
'COLUMN', N'BookId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数量，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'OrderDetails',
'COLUMN', N'Quantity'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条目价格，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'OrderDetails',
'COLUMN', N'UnitPrice'
GO


-- ----------------------------
-- Table structure for Orders
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type IN ('U'))
	DROP TABLE [dbo].[Orders]
GO

CREATE TABLE [dbo].[Orders] (
  [OrderId] int IDENTITY(1,1) NOT NULL,
  [Address] nvarchar(1024) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [BookId] int NOT NULL,
  [Num] int NOT NULL
)
GO

ALTER TABLE [dbo].[Orders] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单ID，增量1',
'SCHEMA', N'dbo',
'TABLE', N'Orders',
'COLUMN', N'OrderId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'货地址，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'Orders',
'COLUMN', N'Address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'书籍ID，对应Books表Books',
'SCHEMA', N'dbo',
'TABLE', N'Orders',
'COLUMN', N'BookId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'购书数量，不能为空',
'SCHEMA', N'dbo',
'TABLE', N'Orders',
'COLUMN', N'Num'
GO


-- ----------------------------
-- Primary Key structure for table Books
-- ----------------------------
ALTER TABLE [dbo].[Books] ADD CONSTRAINT [PK__Books__3DE0C20741410311] PRIMARY KEY CLUSTERED ([BookId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Carts
-- ----------------------------
ALTER TABLE [dbo].[Carts] ADD CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED ([RecordId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Categories
-- ----------------------------
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table OrderDetails
-- ----------------------------
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED ([OrderDetailId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Orders
-- ----------------------------
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderId])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Books
-- ----------------------------
ALTER TABLE [dbo].[Books] ADD CONSTRAINT [FK_Books_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([CategoryId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Carts
-- ----------------------------
ALTER TABLE [dbo].[Carts] ADD CONSTRAINT [FK_Carts_Books] FOREIGN KEY ([BookId]) REFERENCES [Books] ([BookId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table OrderDetails
-- ----------------------------
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Books] FOREIGN KEY ([BookId]) REFERENCES [Books] ([BookId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

