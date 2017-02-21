

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGet]    Script Date: 13.05.2013 1:40:52 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGet]
(
	@ArticleCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

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
	FROM [dbo].[dnn_kovit_ArticleCategory]
	WHERE
		([ArticleCategoryID] = @ArticleCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAll]    Script Date: 13.05.2013 1:40:52 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

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
	FROM [dbo].[dnn_kovit_ArticleCategory]
	ORDER BY SortOrder

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages]
(
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
		[CssClass],
		[IconImage],
		[HtmlDescription]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--dnn_Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]
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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByRoles]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllByRoles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByRoles];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByRoles]
(
	@RoleID int
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
	--dnn_Roles
	
		[RoleID] = @RoleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByRoles Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByRoles Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByTabs]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryGetAllByTabs]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByTabs];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByTabs]
(
	@TabID int
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
	--dnn_Tabs
	
		[TabID] = @TabID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByTabs Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByTabs Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryUpdate]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdate]
(
	@ArticleCategoryID int,
	@ParentCategoryID int,
	@TabID int,
	@LanguageID int,
	@PortalID int,
	@Title nvarchar(128),
	@Description nvarchar(160),
	@KeyWord nvarchar(200),
	@ArticleCategoryURL varchar(128),
	@SortOrder int,
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL,
	@RoleID int = NULL,
	@CssClass varchar(128) = NULL,
	@IconImage nvarchar(260),
	@HtmlDescription nvarchar(MAX)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleCategory]
	SET
-- int
		[ParentCategoryID] = @ParentCategoryID,
-- int
		[TabID] = @TabID,
-- int
		[LanguageID] = @LanguageID,
-- int
		[PortalID] = @PortalID,
-- nvarchar(128)
		[Title] = @Title,
-- nvarchar(160)
		[Description] = @Description,
-- nvarchar(200)
		[KeyWord] = @KeyWord,
-- varchar(128)
		[ArticleCategoryURL] = @ArticleCategoryURL,
-- int
		[SortOrder] = @SortOrder,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate,
-- int
		[RoleID] = @RoleID,
-- varchar(128)
		[CssClass] = @CssClass,
-- nvarchar(260)
		[IconImage] = @IconImage,
-- nvarchar(MAX)
		[HtmlDescription] = @HtmlDescription
	WHERE
		[ArticleCategoryID] = @ArticleCategoryID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryAdd]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryAdd]
(
	@ParentCategoryID int,
	@TabID int,
	@LanguageID int,
	@PortalID int,
	@Title nvarchar(128),
	@Description nvarchar(160),
	@KeyWord nvarchar(200),
	@ArticleCategoryURL varchar(128),
	@SortOrder int,
	@CreatedByUserID int,
	@CreatedOnDate datetime,
	@LastModifiedByUserID int,
	@LastModifiedOnDate datetime,
	@RoleID int,
	@CssClass varchar(128),
	@IconImage nvarchar(260),
	@HtmlDescription nvarchar(MAX)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_ArticleCategory]
	(
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
	)
	VALUES
	(
		@ParentCategoryID,
		@TabID,
		@LanguageID,
		@PortalID,
		isNull(@Title,''),
		isNull(@Description,''),
		isNull(@KeyWord,''),
		isNull(@ArticleCategoryURL,''),
		isNull(@SortOrder,65535),
		@CreatedByUserID,
		@CreatedOnDate,
		@LastModifiedByUserID,
		@LastModifiedOnDate,
		@RoleID,
		@CssClass,
		isNull(@IconImage,'\'),
		isNull(@HtmlDescription,'')
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryDelete]    Script Date: 13.05.2013 1:40:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryDelete]
(
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleCategory]
	WHERE
		[ArticleCategoryID] = @ArticleCategoryID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryDelete Error on Creation'
GO

-- ================== ALTER SECTION
 

--==========[Create Stored Procedure [dnn_kovit_ArticleCategoryGetAllAssigned ]==========--
ALTER PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAssigned]
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
		[LastModifiedOnDate],
		[RoleID],
        [CssClass],
       	[IconImage],
		[HtmlDescription]
	FROM 
		[dnn_kovit_ArticleCategory]
	WHERE
		[ArticleCategoryID]   in (
			select [ArticleCategoryID] 
			from [dbo].[dnn_kovit_ArticleCategoryList] 
			where ArticleID=@ArticleID)
	
		

END





GO


--==========[Create Stored Procedure [dnn_kovit_ArticleCategoryGetAllAvailable ]==========--
ALTER PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllAvailable]
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
		[LastModifiedOnDate],
		[RoleID],
        [CssClass],
       	[IconImage],
		[HtmlDescription]
	FROM 
		[dnn_kovit_ArticleCategory]

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

--==========[Create Stored Procedure [dnn_kovit_ArticleCategoryGetAllByPortalLanguage ]==========--
ALTER PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByPortalLanguage]
(

	@PortalID int,
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
        [CssClass],
       	[IconImage],
		[HtmlDescription]
	FROM 
		[dnn_kovit_ArticleCategory]
	WHERE
	--Portals
	([PortalID] = @PortalID
		and [LanguageID] = @LanguageID)
	or [ArticleCategoryID]=0
	order by [SortOrder] asc

END





GO


--==========[Create Stored Procedure [dnn_kovit_ArticleCategoryGetAllByPortalLanguage ]==========--
ALTER PROCEDURE [dbo].[dnn_kovit_ArticleCategoryGetAllByParent]
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
 
	order by [SortOrder] asc

END





GO


