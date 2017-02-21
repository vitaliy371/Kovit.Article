use [dnn]
 /*
Created		04.11.2009
Modified		11.11.2009
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [dbo].[kovit_Article]
(
	[ArticleID] Integer Identity(1,1) NOT NULL,
	[LanguageID] Integer NOT NULL,
	[PortalID] Integer NOT NULL,
	[PublicationDate] Datetime Default getdate() NOT NULL,
	[Title] Nvarchar(128) Default '' NOT NULL,
	[Description] Nvarchar(160) Default '' NOT NULL,
	[KeyWord] Nvarchar(200) Default '' NOT NULL,
	[ArticleURL] Varchar(128) Default '' NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,
	[isHidden] Bit Default 0 NOT NULL,
	[isFeatured] Bit Default 0 NOT NULL,
	[ArticleHTML] Nvarchar(max) Default '' NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_ArticleCategory]
(
	[ArticleCategoryID] Integer Identity(1,1) NOT NULL,
	[ParentCategoryID] Integer NOT NULL,
	[LanguageID] Integer NOT NULL,
	[PortalID] Integer NOT NULL,
	[Title] Nvarchar(128) Default '' NOT NULL,
	[Description] Nvarchar(160) Default '' NOT NULL,
	[KeyWord] Nvarchar(200) Default '' NOT NULL,
	[ArticleCategoryURL] Varchar(128) Default '' NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_ArticleComment]
(
	[ArticleCommentID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[ArticleCommentText] Nvarchar(4000) Default '' NOT NULL,
	[Email] Varchar(320) Default '' NOT NULL,
	[Name] Nvarchar(50) Default '' NOT NULL,
	[Approved] Bit Default 0 NOT NULL,
	[IpAddress] Varchar(15) Default '0.0.0.0' NOT NULL Check (IpAddress like '[0-9]%.[0-9]%.[0-9]%.[0-9]%'),
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_ArticleAttachment]
(
	[ArticleAttachmentID] Integer Identity(1,1) NOT NULL,
	[ArticleAttachmentTypeCode] Nvarchar(50) Default '' NOT NULL,
	[FileId] Integer NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,
	[ArticleID] Integer NOT NULL
) 
go

Create table [dbo].[kovit_ArticleAttachmentType]
(
	[ArticleAttachmentTypeCode] Nvarchar(50) Default '' NOT NULL,
	[ArticleAttachmentTypeName] Nvarchar(50) Default '' NOT NULL
) 
go

Create table [dbo].[kovit_ArticleCategoryList]
(
	[ArticleCategoryListID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[ArticleCategoryID] Integer NOT NULL
) 
go

Create table [dbo].[kovit_ArticleRating]
(
	[ArticleRatingID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[Rating] Integer Default 0 NOT NULL,
	[IpAddress] Varchar(15) Default '0.0.0.0' NOT NULL Check (IpAddress like '[0-9]%.[0-9]%.[0-9]%.[0-9]%'),
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_ArticleEvent]
(
	[ArticleEventID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[Title] Nvarchar(255) Default '' NOT NULL,
	[Description] Nvarchar(4000) Default '' NOT NULL,
	[StartDate] Datetime Default getdate() NOT NULL,
	[EndDate] Smalldatetime Default getDate() NOT NULL 
) 
go



Exec sp_addextendedproperty 'MS_Description', 'Comments', 'user', 'dbo', 'table', 'kovit_ArticleComment', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'rating', 'user', 'dbo', 'table', 'kovit_ArticleRating', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'event', 'user', 'dbo', 'table', 'kovit_ArticleEvent', NULL, NULL
go


Alter table [dbo].[kovit_Article] add Constraint [pk_kovit_Article] Primary Key ([ArticleID])
go
Alter table [dbo].[kovit_ArticleCategory] add Constraint [pk_kovit_ArticleCategory] Primary Key ([ArticleCategoryID])
go
Alter table [dbo].[kovit_ArticleComment] add Constraint [pk_kovit_ArticleComment] Primary Key ([ArticleCommentID])
go
Alter table [dbo].[kovit_ArticleAttachment] add Constraint [pk_kovit_ArticleAttachment] Primary Key ([ArticleAttachmentID])
go
Alter table [dbo].[kovit_ArticleAttachmentType] add Constraint [pk_kovit_ArticleAttachmentType] Primary Key ([ArticleAttachmentTypeCode])
go
Alter table [dbo].[kovit_ArticleCategoryList] add Constraint [pk_kovit_ArticleCategoryList] Primary Key ([ArticleCategoryListID])
go
Alter table [dbo].[kovit_ArticleRating] add Constraint [pk_kovit_ArticleRating] Primary Key ([ArticleRatingID])
go
Alter table [dbo].[kovit_ArticleEvent] add Constraint [pk_kovit_ArticleEvent] Primary Key ([ArticleEventID])
go


Alter table [dbo].[kovit_Article] add constraint [AK_LanguageID_ArticleURL] unique ([LanguageID],[ArticleURL],[PortalID])
go


Alter table [dbo].[kovit_ArticleCategory] add constraint [AK_LanguageID_ArticleCategoryURL] unique ([LanguageID],[ArticleCategoryURL])
go


Alter table [dbo].[kovit_ArticleCategoryList] add constraint [AK_ArticleID_ArticleCategoryID] unique ([ArticleID],[ArticleCategoryID])
go


Alter table [dbo].[kovit_ArticleCategoryList] add Constraint [FK_kovit_Article_kovit_ArticleCategoryList] foreign key([ArticleID]) references [dbo].[kovit_Article] ([ArticleID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleAttachment] add Constraint [FK_kovit_Article_kovit_ArticleAttachment] foreign key([ArticleID]) references [dbo].[kovit_Article] ([ArticleID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleComment] add Constraint [FK_kovit_Article_kovit_ArticleComment] foreign key([ArticleID]) references [dbo].[kovit_Article] ([ArticleID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleRating] add Constraint [FK_kovit_Article_kovit_ArticleRating] foreign key([ArticleID]) references [dbo].[kovit_Article] ([ArticleID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleEvent] add Constraint [FK_kovit_Article_kovit_ArticleEvent] foreign key([ArticleID]) references [dbo].[kovit_Article] ([ArticleID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleCategoryList] add Constraint [FK_kovit_ArticleCategory_kovit_ArticleCategoryList] foreign key([ArticleCategoryID]) references [dbo].[kovit_ArticleCategory] ([ArticleCategoryID])  on update no action on delete cascade 
go
 
Alter table [dbo].[kovit_ArticleAttachment] add Constraint [FK_kovit_ArticleAttachmentType_kovit_ArticleAttachment] foreign key([ArticleAttachmentTypeCode]) references [dbo].[kovit_ArticleAttachmentType] ([ArticleAttachmentTypeCode])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleCategory] add  foreign key([PortalID]) references [dbo].[Portals] ([PortalID])  on update no action on delete no action 
go
 



 
Alter table [dbo].[kovit_Article] add  foreign key([PortalID]) references [dbo].[Portals] ([PortalID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleAttachment] add  foreign key([FileId]) references [dbo].[Files] ([FileId])  on update no action on delete no action 
go
Alter table [dbo].[kovit_ArticleCategory] add  foreign key([LanguageID]) references [dbo].[Languages] ([LanguageID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_Article] add  foreign key([LanguageID]) references [dbo].[Languages] ([LanguageID])  on update no action on delete no action 
go


---
SET IDENTITY_INSERT [dbo].[kovit_ArticleCategory]  ON
GO
INSERT INTO [dbo].[kovit_ArticleCategory](
	[ArticleCategoryID],[ParentCategoryID],	[Title],[LanguageID],[PortalID],[ArticleCategoryURL]) VALUES
	(0,0,'root',1,0,'root')
GO
SET IDENTITY_INSERT [dbo].[kovit_ArticleCategory] OFF

ALTER TABLE [dbo].[kovit_ArticleCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_kovit_ArticleCategory_kovit_ArticleCategory] FOREIGN KEY([ParentCategoryID])
references [dbo].[kovit_ArticleCategory] ([ArticleCategoryID]) 
NOT FOR REPLICATION   
GO


Alter table [dbo].[kovit_ArticleEvent] add constraint ChkEventDates CHECK (StartDate <= EndDate)
GO


Create table [dbo].[kovit_ArticleTabSetting]
(
	[ArticlePortalSettingID] Integer Identity(1,1) NOT NULL,
	[TabID] Integer NOT NULL,
	[ArticleCategoryID] Integer NOT NULL,
	[ItemsPerPage] Integer Default 10 NOT NULL,
	[SortMode] Integer Default 0 NOT NULL,
	[previewHeight] Integer Default 100 NOT NULL,
	[previewWidth] Integer Default 100 NOT NULL,
	[fullHeight] Integer Default 500 NOT NULL,
	[fullWidth] Integer Default 800 NOT NULL
) 
go

Exec sp_addextendedproperty 'MS_Description', 'Comments', 'user', 'dbo', 'table', 'kovit_ArticleTabSetting', NULL, NULL
go

Alter table [dbo].[kovit_ArticleTabSetting] add Primary Key ([ArticlePortalSettingID])
go

Alter table [dbo].[kovit_ArticleTabSetting] add  foreign key([ArticleCategoryID]) references [dbo].[kovit_ArticleCategory] ([ArticleCategoryID])  on update no action on delete no action 
go

Alter table [dbo].[kovit_ArticleTabSetting] add  foreign key([TabID]) references [dbo].[Tabs] ([TabID])  on update no action on delete no action 
go



Set quoted_identifier on
go


Set quoted_identifier off
go

