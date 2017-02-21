use [kovit_dnn]

--|--------------------------------------------------------------------------------
--| CREATION OF Stored Procedures
--|--------------------------------------------------------------------------------
 
--==[Drop Stored Procedure [kovit_ArticleCategoryGetAllAssigned] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllAssigned]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAssigned]
GO

--==========[Create Stored Procedure [kovit_ArticleCategoryGetAllAssigned ]==========--
--==========[Create Stored Procedure [kovit_ArticleCategoryGetAllAssigned ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAssigned]
(
	@ArticleID int
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
		[LastModifiedOnDate]
		,[RoleID]
       ,[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
		[ArticleCategoryID]   in (
			select [ArticleCategoryID] 
			from [dbo].[dnn_kovit_ArticleCategoryList] 
			where ArticleID=@ArticleID)
	
		

END

GO

 
--==[Drop Stored Procedure [kovit_ArticleCategoryGetAllAvailable] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllAvailable]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllAvailable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAvailable]
GO

--==========[Create Stored Procedure [kovit_ArticleCategoryGetAllAvailable ]==========--
--==========[Create Stored Procedure [kovit_ArticleCategoryGetAllAvailable ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAvailable]
(
	@ArticleID int
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
		[LastModifiedOnDate]
       ,[RoleID]
       ,[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]

	WHERE
	--(
		    [LanguageID] =  (select [LanguageID] from [dbo].[dnn_kovit_Article] where	ArticleID=@ArticleID )
		and [PortalID] =  (select [PortalID] from [dbo].[dnn_kovit_Article] where	ArticleID=@ArticleID )
		and [ArticleCategoryID]<>[ParentCategoryID]
		and [ArticleCategoryID] not in (
			select [ArticleCategoryID] 
			from [dbo].[dnn_kovit_ArticleCategoryList] 
			where ArticleID=@ArticleID)
	--) or [ArticleCategoryID]=0
	
		

END

GO

 
--==[Drop Stored Procedure [kovit_ArticleCategorySubscriptionCheck] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionCheck]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionCheck]
GO

--==========[Create Stored Procedure [kovit_ArticleCategorySubscriptionCheck ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionCheck]
(
	@ArticleCategoryID int,
	@emailRecipientID int,
	@CreatedByUserID int,
	@CreatedOnDate datetime,
	@LastModifiedByUserID int,
	@LastModifiedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

DECLARE @ArticleCategorySubscriptionID int

SELECT @ArticleCategorySubscriptionID = [ArticleCategorySubscriptionID]      
	FROM [dbo].[dnn_kovit_ArticleCategorySubscription]
WHERE [ArticleCategoryID]=ArticleCategoryID
and [emailRecipientID]=@emailRecipientID

if @ArticleCategorySubscriptionID  is null
	begin
	INSERT
	INTO [dbo].[dnn_kovit_ArticleCategorySubscription]
	(
		[ArticleCategoryID],
		[emailRecipientID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		@ArticleCategoryID,
		@emailRecipientID,
		@CreatedByUserID,
		@CreatedOnDate,
		@LastModifiedByUserID,
		@LastModifiedOnDate
	)

	IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT   @ArticleCategorySubscriptionID = SCOPE_IDENTITY();
	end

	SELECT  @ArticleCategorySubscriptionID  as ArticleCategorySubscriptionID

	SET @Err = @@Error
	RETURN @Err
END

GO

 
--==[Drop Stored Procedure [kovit_ArticleCategorySubscriptionGetAllByArticleCategory] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]
GO

--==========[Create Stored Procedure [kovit_ArticleCategorySubscriptionGetAllByArticleCategory ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]
(
	@ArticleCategoryID int
)
AS
BEGIN
	SELECT
		[ArticleCategorySubscriptionID],
		[ArticleCategoryID],
		[emailRecipientID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategorySubscription]
	WHERE
	--kovit_ArticleCategory
	
		[ArticleCategoryID] = @ArticleCategoryID

END

GO

 
--==[Drop Stored Procedure [kovit_ArticleCategorySubscriptionUnSubscribe] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionUnSubscribe]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionUnSubscribe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionUnSubscribe]
GO

--==========[Create Stored Procedure [kovit_ArticleCategorySubscriptionUnSubscribe ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionUnSubscribe]
(
	@ArticleCategoryID int,
	@ControlKey varchar(128)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE FROM [dbo].[dnn_kovit_ArticleCategorySubscription]  
	WHERE
			[ArticleCategoryID] = @ArticleCategoryID
		and [emailRecipientID] = (SELECT [emailRecipientID] 
			from [dbo].[dnn_kovit_emailRecipient] 
			where [ControlKey]=@ControlKey)
	SET @Err = @@Error

	RETURN @Err
END

GO

 
--==[Drop Stored Procedure [kovit_ArticleCategoryUpdtedFrom] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryUpdtedFrom]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryUpdtedFrom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdtedFrom]
GO

--==========[Create Stored Procedure [kovit_ArticleCategoryUpdtedFrom ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdtedFrom]
(
	@fromDate smalldatetime
)
AS
BEGIN
SELECT distinct 
		ac.[ArticleCategoryID],
		ac.[ParentCategoryID],
		ac.[TabID],
		ac.[LanguageID],
		ac.[PortalID],
		ac.[Title],
		ac.[Description],
		ac.[KeyWord],
		ac.[ArticleCategoryURL],
		ac.[SortOrder],
		ac.[CreatedByUserID],
		ac.[CreatedOnDate],
		ac.[LastModifiedByUserID],
		ac.[LastModifiedOnDate],
		ac.[RoleID],
		ac.[CssClass]
	  FROM  [dbo].[dnn_kovit_Article] as art
inner join [dbo].[dnn_kovit_ArticleCategoryList] as acl
	on acl.[ArticleID] = art.[ArticleID]

 join [dbo].[dnn_kovit_ArticleCategory] as ac
	on acl.[ArticleCategoryID]=ac.[ArticleCategoryID]

where art.[CreatedOnDate] >@FromDate 
and [isHidden]=0



END

GO

 
--==[Drop Stored Procedure [kovit_ArticleRatingGetTotalByArticle] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingGetTotalByArticle]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingGetTotalByArticle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetTotalByArticle]
GO

--==========[Create Stored Procedure [kovit_ArticleRatingGetTotalByArticle ]==========--
--==========[Create Stored Procedure [kovit_ArticleRatingGetTotalByArticle ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetTotalByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		0  as ArticleRatingID,
		@ArticleID as ArticleID,
		isnull([dbo].[dnn_kovit_ArticleRatingTotal] ( @ArticleID),0) as [Rating],
		isnull([dbo].[dnn_kovit_ArticleRatingAverage] ( @ArticleID),'0') as [IpAddress],
		1 as [CreatedByUserID],
		Getdate() as [CreatedOnDate]
	

END

GO

 
--==[Drop Stored Procedure [kovit_ArticleSearch] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleSearch]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_ArticleSearch]
GO

--==========[Create Stored Procedure [kovit_ArticleSearch ]==========--
--==========[Create Stored Procedure [kovit_ArticleSearch ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_ArticleSearch]
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
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[dnn_kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1

 
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
		art.LanguageID = CASE WHEN @LanguageID = 0 THEN art.LanguageID ELSE @LanguageID end
	and [dbo].[dnn_[kovit_ArticleInCategory] (art.ArticleID,@CategoryID)=1

 
 
END

GO
