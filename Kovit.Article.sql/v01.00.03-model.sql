USE [kovit_dnn]
GO


Create table [dbo].[dnn_kovit_ArticleCategorySubscription]
(
	[ArticleCategorySubscriptionID] Integer Identity(1,1) NOT NULL,
	[ArticleCategoryID] Integer NOT NULL,
	[emailRecipientID] Integer NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Exec sp_addextendedproperty 'MS_Description', 'Category Subscription', 'user', 'dbo', 'table', 'dnn_kovit_ArticleCategorySubscription', NULL, NULL
go

Alter table [dbo].[dnn_kovit_ArticleCategorySubscription] add Primary Key ([ArticleCategorySubscriptionID])
go

Alter table [dbo].[dnn_kovit_ArticleCategorySubscription] add Constraint [FK_kovit_emailRecipient_kovit_emailSubscription] foreign key([emailRecipientID]) references [dbo].[dnn_kovit_emailRecipient] ([emailRecipientID])  on update no action on delete no action 
go

Alter table [dbo].[dnn_kovit_ArticleCategorySubscription] add Constraint [FK_kovit_ArticleCategory_kovit_emailSubscription] foreign key([ArticleCategoryID]) references [dbo].[dnn_kovit_ArticleCategory] ([ArticleCategoryID])  on update no action on delete no action 
go


/**/

Alter table [dbo].[dnn_kovit_ArticleCategory] add [RoleID] Integer NULL
go

Alter table [dbo].[dnn_kovit_ArticleCategory] add [CssClass] Varchar(128) Default '' NULL
go

Alter table [dbo].[dnn_kovit_Article] add [allowComments] Bit Default 1 NOT NULL
go

Alter table [dbo].[dnn_kovit_Article] add  [showGalleryFirst] Bit Default 0 NOT NULL
go
 
Alter table [dbo].[dnn_kovit_ArticleCategory] add Constraint [FK_Roles_kovit_ArticleCategory] foreign key([RoleID]) references [dbo].[dnn_Roles] ([RoleID])  on update no action on delete no action 
go