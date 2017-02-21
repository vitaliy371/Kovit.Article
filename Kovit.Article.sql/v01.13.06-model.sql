Alter table [dbo].[dnn_kovit_ArticleAtribute] add [UseSearch] Bit Default 0 NOT NULL
 go

 
Alter table [dbo].[dnn_kovit_ArticleAtribute] add [LanguageID] Integer 
 go
  
 
 
 
Alter table [dbo].[dnn_kovit_ArticleAtribute] add  foreign key([LanguageID]) references [dbo].[dnn_Languages] ([LanguageID])  on update no action on delete no action 
go

 





 