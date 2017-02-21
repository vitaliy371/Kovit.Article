 
/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllByPortalLanguage]    Script Date: 06/27/2013 03:54:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllByPortalLanguage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortalLanguage]
GO
 

--==========[Create Stored Procedure [dnn_kovit_ArticleAtributeGetAllByPortalLanguage ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortalLanguage]
(
	@PortalID int
	,@LanguageID int
)
AS
BEGIN
 SELECT [ArticleAtributeID]
      ,[PortalID]
      ,[ArticleAtributeName]
      ,[SortOrder]
      ,[CreatedByUserID]
      ,[CreatedOnDate]
      ,[UseSearch]
      ,[LanguageID]
  FROM  [dbo].[dnn_kovit_ArticleAtribute]

	WHERE
 
		[PortalID] = @PortalID
		and [LanguageID]=@LanguageID

END



GO
 

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllForSearch]    Script Date: 06/27/2013 03:55:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllForSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllForSearch]
GO

 
 
--==========[Create Stored Procedure [dnn_kovit_ArticleAtributeGetAllForSearch]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllForSearch]
(
	@PortalID int
	,@LanguageID int
)
AS
BEGIN
 SELECT [ArticleAtributeID]
      ,[PortalID]
      ,[ArticleAtributeName]
      ,[SortOrder]
      ,[CreatedByUserID]
      ,[CreatedOnDate]
      ,[UseSearch]
      ,[LanguageID]
  FROM  [dbo].[dnn_kovit_ArticleAtribute]

	WHERE
 
		[PortalID] = @PortalID
		and [LanguageID]=@LanguageID
			and [UseSearch]=1
END




GO

