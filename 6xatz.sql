/*
Navicat SQL Server Data Transfer

Source Server         : LocalSQL
Source Server Version : 140000
Source Host           : DESKTOP-ONBJ0AK:1433
Source Database       : 6xatz
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 140000
File Encoding         : 65001

Date: 2025-10-08 11:13:50
*/


-- ----------------------------
-- Table structure for Products
-- ----------------------------
DROP TABLE [dbo].[Products]
GO
CREATE TABLE [dbo].[Products] (
[Id] int NOT NULL IDENTITY(1,1) ,
[Name] nvarchar(100) NULL ,
[Price] decimal(10,2) NULL 
)


GO

-- ----------------------------
-- Records of Products
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Products] ON
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[Id] int NOT NULL IDENTITY(1,1) ,
[Username] nvarchar(50) NULL ,
[Password] nvarchar(50) NULL 
)


GO

-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO
INSERT INTO [dbo].[Users] ([Id], [Username], [Password]) VALUES (N'1', N'6xatz', N'0000')
GO
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

-- ----------------------------
-- Indexes structure for table Products
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Products
-- ----------------------------
ALTER TABLE [dbo].[Products] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Table structure for Books (Fii's Book)
-- ----------------------------
IF OBJECT_ID(N'[dbo].[Books]', N'U') IS NOT NULL DROP TABLE [dbo].[Books]
GO
CREATE TABLE [dbo].[Books] (
  [Id] int NOT NULL IDENTITY(1,1),
  [Title] nvarchar(200) NOT NULL,
  [Author] nvarchar(150) NULL,
  [PublishedYear] int NULL,
  [Description] nvarchar(1000) NULL
)
GO
ALTER TABLE [dbo].[Books] ADD CONSTRAINT PK_Books PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Table structure for Members
-- ----------------------------
IF OBJECT_ID(N'[dbo].[Members]', N'U') IS NOT NULL DROP TABLE [dbo].[Members]
GO
CREATE TABLE [dbo].[Members] (
  [Id] int NOT NULL IDENTITY(1,1),
  [Name] nvarchar(150) NOT NULL,
  [Email] nvarchar(200) NULL,
  [Phone] nvarchar(50) NULL,
  [JoinedAt] datetime NULL DEFAULT(GETDATE())
)
GO
ALTER TABLE [dbo].[Members] ADD CONSTRAINT PK_Members PRIMARY KEY ([Id])
GO

-- Add new columns to Books table
ALTER TABLE [dbo].[Books] 
ADD [ImageUrl] nvarchar(500) NULL,
    [AddedByMemberId] int NULL,
    [AddedAt] datetime NULL DEFAULT(GETDATE())
GO

-- Add foreign key constraint to Members table
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT FK_Books_Members 
FOREIGN KEY ([AddedByMemberId]) REFERENCES [dbo].[Members]([Id])
GO

PRINT 'Migration completed successfully!'
PRINT 'Books table now has ImageUrl, AddedByMemberId, and AddedAt columns.'
GO
