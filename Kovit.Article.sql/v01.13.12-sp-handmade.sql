
/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetTargetTab]    Script Date: 12/03/2013 16:27:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleGetTargetTab]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleGetTargetTab]
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetTargetTab]    Script Date: 12/03/2013 16:27:50 ******/
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleGetTargetTab]
(
	@ArticleID int 
)
AS
BEGIN

	SET NOCOUNT OFF
	 

	 SELECT top 1  isnull(ac.TabID,-1)
  FROM [dbo].[dnn_kovit_ArticleCategoryList] acl
  inner join [dbo].[dnn_kovit_ArticleCategory] ac on 
  ac.ArticleCategoryID=acl.ArticleCategoryID  
  where [ArticleID]=@ArticleID
 
 
 
	RETURN 0
END





GO







/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]    Script Date: 12/03/2013 16:26:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllByPortal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByPortal]
GO


CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByPortal]
(
	@PortalID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryID],
		[ParentCategoryID],
		[TabID],
		[LanguageID],
		[PortalID],
		[Title],
		[Description],
		[KeyWord],
		[ArticleCategoryURL],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate],
		[RoleID],
		[CssClass],
		[IconImage],
		[HtmlDescription]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--dnn_Portals
	
		[PortalID] = @PortalID

END

GO


