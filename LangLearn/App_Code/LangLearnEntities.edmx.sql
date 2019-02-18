
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/17/2019 18:16:29
-- Generated from EDMX file: C:\Users\Brian\source\repos\WebFormsGames\cs295nDemo-BirdsWords\LangLearn\App_Code\LangLearnEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LangLearn];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Spanish_ToEnglish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Spanishes] DROP CONSTRAINT [FK_Spanish_ToEnglish];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Englishes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Englishes];
GO
IF OBJECT_ID(N'[dbo].[Spanishes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Spanishes];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Englishes'
CREATE TABLE [dbo].[Englishes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Word] nvarchar(30)  NOT NULL,
    [Picture] nvarchar(20)  NULL,
    [PartOfSpeech] nvarchar(15)  NULL
);
GO

-- Creating table 'Spanishes'
CREATE TABLE [dbo].[Spanishes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Word] nvarchar(30)  NOT NULL,
    [EnglishId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nchar(25)  NOT NULL,
    [QuizScore] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Englishes'
ALTER TABLE [dbo].[Englishes]
ADD CONSTRAINT [PK_Englishes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Spanishes'
ALTER TABLE [dbo].[Spanishes]
ADD CONSTRAINT [PK_Spanishes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EnglishId] in table 'Spanishes'
ALTER TABLE [dbo].[Spanishes]
ADD CONSTRAINT [FK_Spanish_ToEnglish]
    FOREIGN KEY ([EnglishId])
    REFERENCES [dbo].[Englishes]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Spanish_ToEnglish'
CREATE INDEX [IX_FK_Spanish_ToEnglish]
ON [dbo].[Spanishes]
    ([EnglishId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------