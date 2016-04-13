
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2016 19:56:24
-- Generated from EDMX file: D:\Repos\DocFolders\DocFolders.BulkLoad\Models\DocFoldersDbModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DocFoldersDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FolderDocs_Folder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FolderDocs] DROP CONSTRAINT [FK_FolderDocs_Folder];
GO
IF OBJECT_ID(N'[dbo].[FK_FolderDocs_Doc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FolderDocs] DROP CONSTRAINT [FK_FolderDocs_Doc];
GO
IF OBJECT_ID(N'[dbo].[FK_DocComments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_DocComments];
GO
IF OBJECT_ID(N'[dbo].[FK_FolderComments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_FolderComments];
GO
IF OBJECT_ID(N'[dbo].[FK_DocAttachments_MainDoc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocAttachments] DROP CONSTRAINT [FK_DocAttachments_MainDoc];
GO
IF OBJECT_ID(N'[dbo].[FK_DocAttachments_AttachedDoc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocAttachments] DROP CONSTRAINT [FK_DocAttachments_AttachedDoc];
GO
IF OBJECT_ID(N'[dbo].[FK_FolderSubFolders_ParentFolder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FolderSubFolders] DROP CONSTRAINT [FK_FolderSubFolders_ParentFolder];
GO
IF OBJECT_ID(N'[dbo].[FK_FolderSubFolders_SubFolder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FolderSubFolders] DROP CONSTRAINT [FK_FolderSubFolders_SubFolder];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Folders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Folders];
GO
IF OBJECT_ID(N'[dbo].[Docs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Docs];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[FolderDocs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FolderDocs];
GO
IF OBJECT_ID(N'[dbo].[DocAttachments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocAttachments];
GO
IF OBJECT_ID(N'[dbo].[FolderSubFolders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FolderSubFolders];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Folders'
CREATE TABLE [dbo].[Folders] (
    [Id] uniqueidentifier  NOT NULL,
    [Caption] nvarchar(max)  NOT NULL,
    [Source] nvarchar(max)  NULL
);
GO

-- Creating table 'Docs'
CREATE TABLE [dbo].[Docs] (
    [Id] uniqueidentifier  NOT NULL,
    [Caption] nvarchar(max)  NOT NULL,
    [Source] nvarchar(max)  NULL,
    [Title] nvarchar(max)  NULL,
    [Content] nvarchar(max)  NULL,
    [DateLoaded] datetime  NULL,
    [UserLoaded] nvarchar(max)  NULL,
    [DateChanged] datetime  NULL,
    [UserChanged] nvarchar(max)  NULL,
    [DateSigned] datetime  NULL,
    [DateFixed] datetime  NULL,
    [DateExpired] datetime  NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] uniqueidentifier  NOT NULL,
    [DateCreated] datetime  NULL,
    [UserCreated] nvarchar(max)  NULL,
    [Content] nvarchar(max)  NOT NULL,
    [DocId] uniqueidentifier  NOT NULL,
    [FolderId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'FolderDocs'
CREATE TABLE [dbo].[FolderDocs] (
    [Folders_Id] uniqueidentifier  NOT NULL,
    [Docs_Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'DocAttachments'
CREATE TABLE [dbo].[DocAttachments] (
    [AttachedDocs_Id] uniqueidentifier  NOT NULL,
    [MainDocs_Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'FolderSubFolders'
CREATE TABLE [dbo].[FolderSubFolders] (
    [SubFolders_Id] uniqueidentifier  NOT NULL,
    [ParentFolders_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Folders'
ALTER TABLE [dbo].[Folders]
ADD CONSTRAINT [PK_Folders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Docs'
ALTER TABLE [dbo].[Docs]
ADD CONSTRAINT [PK_Docs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Folders_Id], [Docs_Id] in table 'FolderDocs'
ALTER TABLE [dbo].[FolderDocs]
ADD CONSTRAINT [PK_FolderDocs]
    PRIMARY KEY CLUSTERED ([Folders_Id], [Docs_Id] ASC);
GO

-- Creating primary key on [AttachedDocs_Id], [MainDocs_Id] in table 'DocAttachments'
ALTER TABLE [dbo].[DocAttachments]
ADD CONSTRAINT [PK_DocAttachments]
    PRIMARY KEY CLUSTERED ([AttachedDocs_Id], [MainDocs_Id] ASC);
GO

-- Creating primary key on [SubFolders_Id], [ParentFolders_Id] in table 'FolderSubFolders'
ALTER TABLE [dbo].[FolderSubFolders]
ADD CONSTRAINT [PK_FolderSubFolders]
    PRIMARY KEY CLUSTERED ([SubFolders_Id], [ParentFolders_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Folders_Id] in table 'FolderDocs'
ALTER TABLE [dbo].[FolderDocs]
ADD CONSTRAINT [FK_FolderDocs_Folder]
    FOREIGN KEY ([Folders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Docs_Id] in table 'FolderDocs'
ALTER TABLE [dbo].[FolderDocs]
ADD CONSTRAINT [FK_FolderDocs_Doc]
    FOREIGN KEY ([Docs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderDocs_Doc'
CREATE INDEX [IX_FK_FolderDocs_Doc]
ON [dbo].[FolderDocs]
    ([Docs_Id]);
GO

-- Creating foreign key on [DocId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_DocComments]
    FOREIGN KEY ([DocId])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocComments'
CREATE INDEX [IX_FK_DocComments]
ON [dbo].[Comments]
    ([DocId]);
GO

-- Creating foreign key on [FolderId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_FolderComments]
    FOREIGN KEY ([FolderId])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderComments'
CREATE INDEX [IX_FK_FolderComments]
ON [dbo].[Comments]
    ([FolderId]);
GO

-- Creating foreign key on [AttachedDocs_Id] in table 'DocAttachments'
ALTER TABLE [dbo].[DocAttachments]
ADD CONSTRAINT [FK_DocAttachments_MainDoc]
    FOREIGN KEY ([AttachedDocs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MainDocs_Id] in table 'DocAttachments'
ALTER TABLE [dbo].[DocAttachments]
ADD CONSTRAINT [FK_DocAttachments_AttachedDoc]
    FOREIGN KEY ([MainDocs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocAttachments_AttachedDoc'
CREATE INDEX [IX_FK_DocAttachments_AttachedDoc]
ON [dbo].[DocAttachments]
    ([MainDocs_Id]);
GO

-- Creating foreign key on [SubFolders_Id] in table 'FolderSubFolders'
ALTER TABLE [dbo].[FolderSubFolders]
ADD CONSTRAINT [FK_FolderSubFolders_ParentFolder]
    FOREIGN KEY ([SubFolders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ParentFolders_Id] in table 'FolderSubFolders'
ALTER TABLE [dbo].[FolderSubFolders]
ADD CONSTRAINT [FK_FolderSubFolders_SubFolder]
    FOREIGN KEY ([ParentFolders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderSubFolders_SubFolder'
CREATE INDEX [IX_FK_FolderSubFolders_SubFolder]
ON [dbo].[FolderSubFolders]
    ([ParentFolders_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------