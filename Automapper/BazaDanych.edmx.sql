
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/05/2017 12:31:26
-- Generated from EDMX file: C:\Users\Lukas\Desktop\Praktyki\AutomapperProfile\Automapper\BazaDanych.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BazaSoftwarehut];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TestTable]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TestTable];
GO
IF OBJECT_ID(N'[BazaSoftwarehutModelStoreContainer].[VersionInfo]', 'U') IS NOT NULL
    DROP TABLE [BazaSoftwarehutModelStoreContainer].[VersionInfo];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TestTables'
CREATE TABLE [dbo].[TestTables] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NULL,
    [City] nvarchar(128)  NULL,
    [PostCode] varchar(8)  NULL,
    [Phone] varchar(16)  NULL,
    [Payment] decimal(19,4)  NULL,
    [IsDeleted] tinyint  NOT NULL
);
GO

-- Creating table 'VersionInfoes'
CREATE TABLE [dbo].[VersionInfoes] (
    [Version] bigint  NOT NULL,
    [AppliedOn] datetime  NULL,
    [Description] nvarchar(1024)  NULL
);
GO

-- Creating table 'TestTableOwns'
CREATE TABLE [dbo].[TestTableOwns] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MojeImie] nvarchar(max)  NOT NULL,
    [Numer] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TestTables'
ALTER TABLE [dbo].[TestTables]
ADD CONSTRAINT [PK_TestTables]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Version] in table 'VersionInfoes'
ALTER TABLE [dbo].[VersionInfoes]
ADD CONSTRAINT [PK_VersionInfoes]
    PRIMARY KEY CLUSTERED ([Version] ASC);
GO

-- Creating primary key on [Id] in table 'TestTableOwns'
ALTER TABLE [dbo].[TestTableOwns]
ADD CONSTRAINT [PK_TestTableOwns]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------