USE [dnn]
GO

/****** Object:  UserDefinedFunction [dbo].[kovit_ArticleInCategory]    Script Date: 11/13/2009 20:31:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kovit_ArticleInCategory]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[kovit_ArticleInCategory]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_kovit_ArticleRatingAverage]    Script Date: 11/13/2009 20:32:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UDF_kovit_ArticleRatingAverage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[UDF_kovit_ArticleRatingAverage]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_kovit_ArticleRatingTotal]    Script Date: 11/13/2009 20:32:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UDF_kovit_ArticleRatingTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[UDF_kovit_ArticleRatingTotal]
GO


CREATE FUNCTION [dbo].[kovit_ArticleInCategory]
( 
	@ArticleID as int,
	@CategoryID as int 
)
RETURNS bit

AS

	BEGIN
	
	DECLARE @Result bit
	
	SET @Result = CASE WHEN @CategoryID = 0 THEN 
		1
	ELSE 
		
		isnull((SELECT [ArticleID]      
					  FROM [dnn].[dbo].[kovit_ArticleCategoryList]
					  WHERE [ArticleCategoryID] =@CategoryID
						and [ArticleID]=@ArticleID),0)	 
	END
	RETURN @Result 
END
GO
 
/****** Object:  UserDefinedFunction [dbo].[UDF_kovit_ArticleRatingAverage]    Script Date: 11/13/2009 20:32:52 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/* Returns the movieRating*/ 
CREATE FUNCTION [dbo].[UDF_kovit_ArticleRatingAverage]
(
	@ArticleID int

)
RETURNS varchar(2048)
AS
BEGIN
    
DECLARE @result varchar(2048)
SELECT @result =  convert(decimal(10,1),isnull(avg(cast([Rating] as float)),0))
  FROM  [dbo].[kovit_ArticleRating]
WHERE  ArticleID=@ArticleID
and Rating<>0
RETURN @result
END
GO
 
/****** Object:  UserDefinedFunction [dbo].[UDF_kovit_ArticleRatingTotal]    Script Date: 11/13/2009 20:33:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/* Returns the movieRating*/ 
CREATE FUNCTION [dbo].[UDF_kovit_ArticleRatingTotal]
(
	@ArticleID int

)
RETURNS varchar(2048)
AS
BEGIN
    
DECLARE @result varchar(2048)
SELECT @result =  count([Rating]) 
  FROM  [dbo].[kovit_ArticleRating]
WHERE  ArticleID=@ArticleID
and Rating<>0
RETURN @result
END
GO
 
USE [dnn]
GO
/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllAssigned]    Script Date: 11/14/2009 18:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllAssigned]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryID],
		[ParentCategoryID],
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
		[LastModifiedOnDate]
	FROM 
		[kovit_ArticleCategory]
	WHERE
		[ArticleCategoryID]   in (
			select [ArticleCategoryID] 
			from [dbo].[kovit_ArticleCategoryList] 
			where ArticleID=@ArticleID)
	
		

END

 
/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllAvailable]    Script Date: 11/13/2009 20:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllAvailable]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryID],
		[ParentCategoryID],
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
		[LastModifiedOnDate]
	FROM 
		[kovit_ArticleCategory]
	WHERE
		[LanguageID] = (select [LanguageID] from [dbo].[kovit_Article] where ArticleID=@ArticleID )

		and [ArticleCategoryID] not in (
			select [ArticleCategoryID] 
			from [dbo].[kovit_ArticleCategoryList] 
			where ArticleID=@ArticleID)
	
		

END
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllByPortalLanguage]    Script Date: 11/13/2009 20:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByPortalLanguage]
(

	@PortalID int,
	@LanguageID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryID],
		[ParentCategoryID],
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
		[LastModifiedOnDate]
	FROM 
		[kovit_ArticleCategory]
	WHERE
	--Portals
		[PortalID] = @PortalID
		and [LanguageID] = @LanguageID 
	and [ArticleCategoryID]<>[ParentCategoryID]
	order by [SortOrder] asc

END
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListDeleteByArticleCategory]    Script Date: 11/13/2009 20:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListDeleteByArticleCategory]
(
	 @ArticleID int
    ,@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [kovit_ArticleCategoryList]
	WHERE
		[ArticleCategoryID] = @ArticleCategoryID
		and
		[ArticleID] = @ArticleID

	SET @Err = @@Error

	RETURN @Err
END
GO
 
/****** Object:  StoredProcedure [dbo].[kovit_ArticleSearch]    Script Date: 11/14/2009 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_ArticleSearch]
(	
	 @PortalID int,
	 @LanguageID int,
	 @CategoryID int,
	 @CurrentPage int 
	,@ItemsPerPage int
	,@SortMode int
	,@OnlyFeatured bit
	, @Total int OUTPUT
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
		WHEN @SortMode = 3 THEN (ROW_NUMBER() OVER (ORDER BY [dbo].[UDF_kovit_ArticleRatingAverage](art.ArticleID) ASC))      
	 END  as [SortRow]  
	FROM 
		[dbo].[kovit_Article] as art 
	WHERE art.[PortalID]=@PortalID
	and	art.[isHidden] = 0
	and art.[isFeatured] = CASE WHEN @OnlyFeatured = 0 THEN art.[isFeatured] ELSE 1 end
	and
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1

 
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
		[dbo].[kovit_Article] as art 
		inner join articles  on
			articles.[ArticleID]=art.[ArticleID] 
	where  SortRow BETWEEN @ItemsPerPage * (@CurrentPage-1) +1  AND @ItemsPerPage * (@CurrentPage)  
order by SortRow 
 
SELECT 
	@Total =  CEILING(count(art.[ArticleID])/@ItemsPerPage) 
	FROM 
		[dbo].[kovit_Article] as art 	
	WHERE art.[PortalID]=@PortalID
	and	art.[isHidden] = 0
	and art.[isFeatured] = CASE WHEN @OnlyFeatured = 0 THEN art.[isFeatured] ELSE 1 end
	and
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1

 
 
END
GO