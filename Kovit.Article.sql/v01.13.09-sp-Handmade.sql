 
--==========[Create Stored Procedure [dnn_kovit_ArticleCategoryGetAllByTab ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByTab]
(
	@TabID int,
	@LanguageID int
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
		[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	 [ArticleCategoryID] <> 0 and
	 [TabID] = @TabID and
	 [LanguageID] = @LanguageID

END





GO



 
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByParentWithChild]
(

	@PortalID int,
	@LanguageID int,
	@RootCategoryID int 
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
	([PortalID] = @PortalID
		and [LanguageID] = @LanguageID
				and [ArticleCategoryID]<>0
	and [ParentCategoryID] = case when @RootCategoryID > 0 then @RootCategoryID else [ParentCategoryID] end	)
	UNION
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
	[ParentCategoryID]  in 
	
	(SELECT
		[ArticleCategoryID]
	FROM 
		[dbo].[dnn_kovit_ArticleCategory]
	WHERE 
	([PortalID] = @PortalID
		and [LanguageID] = @LanguageID
				and [ArticleCategoryID]<>0
	and [ParentCategoryID] = case when @RootCategoryID > 0 then @RootCategoryID else [ParentCategoryID] end	))
	
 
	order by [SortOrder] asc, [Title] asc

END







GO




--==========[Create Stored Procedure [dnn_kovit_ArticleAtributeListGetAllByArticleAtribute ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetValues]
(
	@ArticleAtributeID int
)
AS
BEGIN
 	SELECT 		  [Value],
		[Value] + ' ('+ CONVERT(varchar, COUNT( [ArticleAtributeListID])) + ')' as Total
		

	FROM 
		 [dbo].[dnn_kovit_ArticleAtributeList] 

		 
	WHERE

[ArticleAtributeID] = @ArticleAtributeID
		 group by [Value]
		order by  [Value] asc

END



GO



/****** Object:  UserDefinedTableType [dbo].[KeyPair]    Script Date: 11/25/2013 22:50:48 ******/
CREATE TYPE [dbo].[KeyPair] AS TABLE(
	[ItemID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL
)
GO

 
 
CREATE FUNCTION [dbo].[dnn_kovit_ArticleInAttribute]
( 
	@ArticleID as int,
	@Attribute as KeyPair READONLY
)
RETURNS bit

AS
BEGIN
	
	DECLARE @Result bit
	
	SET @Result = CASE WHEN @ArticleID = null THEN 
		1
	ELSE 
		
		isnull((SELECT top 1 [ArticleID]      
					  FROM  [dbo].[dnn_kovit_ArticleAtributeList] aal
					  inner join @Attribute atr on
					  atr.[ItemID] = aal.ArticleAtributeID
					  and atr.[Name] = aal.Value
					  
					  WHERE  [ArticleID]=@ArticleID),0)	 
	END
	RETURN @Result 
END





GO


 
 
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeSearch]
(	
	 @PortalID int,
	 @LanguageID int,
	 @CategoryID int,
	 @CurrentPage int 
	,@ItemsPerPage int
	,@SortMode int
	,@OnlyFeatured bit
	,@FromDate as smalldatetime 
	,@ToDate as smalldatetime 
	,@FreeText as nvarchar(50)
	,@Atributes as KeyPair READONLY
	,@Total int OUTPUT

)
AS
BEGIN 

-- FIND THE MATCHING ROWS
;WITH articles AS (
SELECT 
	 art.ArticleID 
	--,art.Description as [ModelName]
	,CASE  -- SORTING 
		WHEN @SortMode = 0 THEN (ROW_NUMBER() OVER (ORDER BY art.[PublicationDate] DESC))
		WHEN @SortMode = 1 THEN (ROW_NUMBER() OVER (ORDER BY art.[SortOrder] ASC,art.[PublicationDate] DESC))
		WHEN @SortMode = 2 THEN (ROW_NUMBER() OVER (ORDER BY art.[Title] ASC))   
		WHEN @SortMode = 3 THEN (ROW_NUMBER() OVER (ORDER BY [dbo].[dnn_kovit_ArticleRatingAverage](art.ArticleID) DESC))      
	 END  as [SortRow]  
	FROM 
		[dbo].[dnn_kovit_Article] as art 
		
 
	
	WHERE art.[PortalID]=@PortalID
	and	art.[isHidden] = 0
	and	art.[PublicationDate] >= CASE WHEN @FromDate is null THEN art.[PublicationDate] ELSE @FromDate end
	and	art.[PublicationDate] <= CASE WHEN @ToDate is null THEN art.[PublicationDate] ELSE @ToDate end
	and art.[isFeatured] = CASE WHEN @OnlyFeatured = 0 THEN art.[isFeatured] ELSE 1 end
	and
		art.[Title] like CASE WHEN @FreeText = '' THEN art.[Title] ELSE '%'+@FreeText+'%' end
	and 
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[dnn_kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1
	and [dbo].[dnn_kovit_ArticleInAttribute](art.ArticleID,@Atributes) = 1
		
 
) 	
	SELECT
		art.[ArticleID],		
		[LanguageID],
		[PortalID],
		[PublicationDate],
		[Title],
		[Description],
		[KeyWord],
		[ArticleURL],
		[SortOrder],
		[isHidden],
		[isFeatured],
		[ArticleHTML],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate] 
		
	FROM 
		[dbo].[dnn_kovit_Article] as art 
		inner join articles  on
			articles.[ArticleID]=art.[ArticleID] 
	where  SortRow BETWEEN @ItemsPerPage * (@CurrentPage-1) +1  AND @ItemsPerPage * (@CurrentPage)  
order by SortRow 
 
SELECT 
    @Total =  ((count(art.[ArticleID])-1)/@ItemsPerPage) +1
	FROM 
		[dbo].[dnn_kovit_Article] as art 	
	WHERE art.[PortalID]=@PortalID
	and	art.[isHidden] = 0
	and	art.[PublicationDate] >= CASE WHEN @FromDate is null THEN art.[PublicationDate] ELSE @FromDate end
	and	art.[PublicationDate] <= CASE WHEN @ToDate is null THEN art.[PublicationDate] ELSE @ToDate end
	and art.[isFeatured] = CASE WHEN @OnlyFeatured = 0 THEN art.[isFeatured] ELSE 1 end
	and
		art.[Title] like CASE WHEN @FreeText = '' THEN art.[Title] ELSE '%'+@FreeText+'%' end
	and
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[dnn_kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1
	and [dbo].[dnn_kovit_ArticleInAttribute](art.ArticleID,@Atributes) = 1
 
 
END






GO


