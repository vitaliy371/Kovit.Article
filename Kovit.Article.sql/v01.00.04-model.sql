 
BEGIN TRANSACTION
 


Create table [dbo].[dnn_kovit_ArticleAtribute]
(
	[ArticleAtributeID] Integer Identity(1,1) NOT NULL,	
	[PortalID] Integer NOT NULL,
	[ArticleAtributeName] Nvarchar(128) Default '' NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,	
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL
) 
go

 

Alter table [dbo].[dnn_kovit_ArticleAtribute] add Primary Key ([ArticleAtributeID])
go


Create table [dbo].[dnn_kovit_ArticleAtributeList]
(
	[ArticleAtributeListID] Integer Identity(1,1) NOT NULL,
	[ArticleAtributeID] Integer NOT NULL,
	[ArticleID] Integer NOT NULL,
	[Value] Nvarchar(255) Default '' NOT NULL
) 
go

Alter table [dbo].[dnn_kovit_ArticleAtributeList] add Primary Key ([ArticleAtributeListID])
go

Alter table [dbo].[dnn_kovit_ArticleAtributeList] add constraint [AK_ArticleID_ArticleAtributeID] unique ([ArticleID],[ArticleAtributeID])
go

Alter table [dbo].[dnn_kovit_ArticleAtributeList] add  foreign key([ArticleAtributeID]) references [dbo].[dnn_kovit_ArticleAtribute] ([ArticleAtributeID])  on update no action on delete no action 
go

Alter table [dbo].[dnn_kovit_ArticleAtributeList] add  foreign key([ArticleID]) references [dbo].[dnn_kovit_Article] ([ArticleID])  on update no action on delete no action 
go


Alter table [dbo].[dnn_kovit_ArticleAtribute] add  foreign key([PortalID]) references [dbo].[dnn_Portals] ([PortalID])  on update no action on delete no action 
go






IF @@ERROR <> 0 ROLLBACK TRANSACTION;
ELSE COMMIT TRANSACTION;
GO
--|--------------------------------------------------------------------------------
