 
BEGIN TRANSACTION
 

 

Alter table [dbo].[dnn_kovit_ArticleCategory] add [IconImage] Nvarchar(260) Default '\' NOT NULL
go


Alter table [dbo].[dnn_kovit_ArticleCategory] add [HtmlDescription] Nvarchar(max) Default '' NOT NULL
go






IF @@ERROR <> 0 ROLLBACK TRANSACTION;
ELSE COMMIT TRANSACTION;
GO
--|--------------------------------------------------------------------------------
