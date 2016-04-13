
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2016 18:06:16
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


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
ADD CONSTRAINT [FK_FolderDoc_Folder]
    FOREIGN KEY ([Folders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Docs_Id] in table 'FolderDocs'
ALTER TABLE [dbo].[FolderDocs]
ADD CONSTRAINT [FK_FolderDoc_Doc]
    FOREIGN KEY ([Docs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderDoc_Doc'
CREATE INDEX [IX_FK_FolderDoc_Doc]
ON [dbo].[FolderDocs]
    ([Docs_Id]);
GO

-- Creating foreign key on [DocId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_DocComment]
    FOREIGN KEY ([DocId])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocComment'
CREATE INDEX [IX_FK_DocComment]
ON [dbo].[Comments]
    ([DocId]);
GO

-- Creating foreign key on [FolderId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_FolderComment]
    FOREIGN KEY ([FolderId])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderComment'
CREATE INDEX [IX_FK_FolderComment]
ON [dbo].[Comments]
    ([FolderId]);
GO

-- Creating foreign key on [AttachedDocs_Id] in table 'DocAttachments'
ALTER TABLE [dbo].[DocAttachments]
ADD CONSTRAINT [FK_DocAttachment_MainDoc]
    FOREIGN KEY ([AttachedDocs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MainDocs_Id] in table 'DocAttachments'
ALTER TABLE [dbo].[DocAttachments]
ADD CONSTRAINT [FK_DocAttachment_AttachedDoc]
    FOREIGN KEY ([MainDocs_Id])
    REFERENCES [dbo].[Docs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocAttachment_AttachedDoc'
CREATE INDEX [IX_FK_DocAttachment_AttachedDoc]
ON [dbo].[DocAttachments]
    ([MainDocs_Id]);
GO

-- Creating foreign key on [SubFolders_Id] in table 'FolderSubFolders'
ALTER TABLE [dbo].[FolderSubFolders]
ADD CONSTRAINT [FK_FolderSubFolder_ParentFolder]
    FOREIGN KEY ([SubFolders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ParentFolders_Id] in table 'FolderSubFolders'
ALTER TABLE [dbo].[FolderSubFolders]
ADD CONSTRAINT [FK_FolderSubFolder_SubFolder]
    FOREIGN KEY ([ParentFolders_Id])
    REFERENCES [dbo].[Folders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolderSubFolder_SubFolder'
CREATE INDEX [IX_FK_FolderSubFolder_SubFolder]
ON [dbo].[FolderSubFolders]
    ([ParentFolders_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------