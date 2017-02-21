Declare @portalid int

set @portalid = 21 -- 

DELETE FROM  [dbo].[dnn_kovit_ArticleAttachment]
      WHERE  not [FileId] in (
      SELECT [FileId] FROM [dbo].[dnn_Files]
where portalid =@portalid )

DELETE FROM [dbo].[dnn_kovit_ArticleCategorySubscription]
      WHERE  [ArticleCategoryID] in (
      select [ArticleCategoryID] from [dbo].[dnn_kovit_ArticleCategory]
      WHERE portalid <> @portalid )
UPDATE [dbo].[dnn_kovit_ArticleCategory]
   SET [TabID] = (select top 1 tabid from dnn_TabS where portalid=@portalid)      
      ,[PortalID] = @portalid      
      ,[RoleID] = (select top 1 [RoleID] from dnn_Roles where portalid=@portalid)      
 WHERE [ArticleCategoryID]=0
      
DELETE [dbo].[dnn_kovit_ArticleCategory]
      WHERE portalid <> @portalid 

DELETE FROM [dbo].[dnn_kovit_ArticleComment]
      WHERE ArticleID in (select ArticleID from dnn_kovit_Article 
      where [PortalID] <> @portalid ) 

DELETE FROM [dbo].[dnn_kovit_ArticleRating]
      WHERE ArticleID in (select ArticleID from dnn_kovit_Article 
      where [PortalID] <> @portalid ) 

DELETE FROM [dbo].[dnn_kovit_ArticleEvent]
      WHERE ArticleID in (select ArticleID from dnn_kovit_Article 
      where [PortalID] <> @portalid )       
      
DELETE FROM [dbo].[dnn_kovit_Article]
      WHERE portalid <> @portalid 
      
DELETE FROM [dbo].[dnn_kovit_emailMessageState]

      WHERE emailPortalID in (select emailPortalID from
       [dbo].[dnn_kovit_emailPortal]
       WHERE [PortalID] <> @portalid   
       )      
      
DELETE [dbo].[dnn_kovit_emailPortal]
      WHERE [PortalID] <> @portalid   
GO

      
GO


      
GO


GO

