USE [kovit_dnn]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGet]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleGet]
(
	@ArticleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleID],
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
		[LastModifiedOnDate],
		[allowComments],
		[showGalleryFirst]
	FROM [dbo].[dnn_kovit_Article]
	WHERE
		([ArticleID] = @ArticleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAll]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleID],
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
		[LastModifiedOnDate],
		[allowComments],
		[showGalleryFirst]
	FROM [dbo].[dnn_kovit_Article]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAllByLanguages]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleGetAllByLanguages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleGetAllByLanguages];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleGetAllByLanguages]
(
	@LanguageID int
)
AS
BEGIN
	SELECT
		[ArticleID],
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
		[LastModifiedOnDate],
		[allowComments],
		[showGalleryFirst]
	FROM 
		 [dbo].[dnn_kovit_Article]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAllByPortals]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleGetAllByPortals]
(
	@PortalID int
)
AS
BEGIN
	SELECT
		[ArticleID],
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
		[LastModifiedOnDate],
		[allowComments],
		[showGalleryFirst]
	FROM 
		 [dbo].[dnn_kovit_Article]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleUpdate]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleUpdate]
(
	@ArticleID int,
	@LanguageID int,
	@PortalID int,
	@PublicationDate datetime,
	@Title nvarchar(128),
	@Description nvarchar(160),
	@KeyWord nvarchar(200),
	@ArticleURL varchar(128),
	@SortOrder int,
	@isHidden bit,
	@isFeatured bit,
	@ArticleHTML nvarchar(MAX),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL,
	@allowComments bit = NULL,
	@showGalleryFirst bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_Article]
	SET
-- int
		[LanguageID] = @LanguageID,
-- int
		[PortalID] = @PortalID,
-- datetime
		[PublicationDate] = @PublicationDate,
-- nvarchar(128)
		[Title] = @Title,
-- nvarchar(160)
		[Description] = @Description,
-- nvarchar(200)
		[KeyWord] = @KeyWord,
-- varchar(128)
		[ArticleURL] = @ArticleURL,
-- int
		[SortOrder] = @SortOrder,
-- bit
		[isHidden] = @isHidden,
-- bit
		[isFeatured] = @isFeatured,
-- nvarchar(MAX)
		[ArticleHTML] = @ArticleHTML,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate,
-- bit
		[allowComments] = @allowComments,
-- bit
		[showGalleryFirst] = @showGalleryFirst
	WHERE
		[ArticleID] = @ArticleID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAdd]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAdd]
(
	@LanguageID int,
	@PortalID int,
	@PublicationDate datetime,
	@Title nvarchar(128),
	@Description nvarchar(160),
	@KeyWord nvarchar(200),
	@ArticleURL varchar(128),
	@SortOrder int,
	@isHidden bit,
	@isFeatured bit,
	@ArticleHTML nvarchar(MAX),
	@CreatedByUserID int,
	@CreatedOnDate datetime,
	@LastModifiedByUserID int,
	@LastModifiedOnDate datetime,
	@allowComments bit,
	@showGalleryFirst bit
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_Article]
	(
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
		[LastModifiedOnDate],
		[allowComments],
		[showGalleryFirst]
	)
	VALUES
	(
		@LanguageID,
		@PortalID,
		isNull(@PublicationDate,getdate()),
		isNull(@Title,''),
		isNull(@Description,''),
		isNull(@KeyWord,''),
		isNull(@ArticleURL,''),
		isNull(@SortOrder,65535),
		isNull(@isHidden,0),
		isNull(@isFeatured,0),
		isNull(@ArticleHTML,''),
		@CreatedByUserID,
		@CreatedOnDate,
		@LastModifiedByUserID,
		@LastModifiedOnDate,
		@allowComments,
		@showGalleryFirst
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleDelete]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleDelete]
(
	@ArticleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_Article]
	WHERE
		[ArticleID] = @ArticleID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGet]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM [dbo].[dnn_kovit_ArticleCategory]
	WHERE
		([ArticleCategoryID] = @ArticleCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAll]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM [dbo].[dnn_kovit_ArticleCategory]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByRoles]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--Roles
	
		[RoleID] = @RoleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByRoles Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByRoles Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByTabs]    Script Date: 25.03.2010 12:58:49 ******/
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
		[CssClass]
	FROM 
		 [dbo].[dnn_kovit_ArticleCategory]
	WHERE
	--Tabs
	
		[TabID] = @TabID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByTabs Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByTabs Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryUpdate]    Script Date: 25.03.2010 12:58:49 ******/
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
	@CssClass varchar(128) = NULL
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
		[CssClass] = @CssClass
	WHERE
		[ArticleCategoryID] = @ArticleCategoryID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryAdd]    Script Date: 25.03.2010 12:58:49 ******/
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
	@CssClass varchar(128)
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
		[CssClass]
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
		@CssClass
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryDelete]    Script Date: 25.03.2010 12:58:49 ******/
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionGet]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGet]
(
	@ArticleCategorySubscriptionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCategorySubscriptionID],
		[ArticleCategoryID],
		[emailRecipientID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[dnn_kovit_ArticleCategorySubscription]
	WHERE
		([ArticleCategorySubscriptionID] = @ArticleCategorySubscriptionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAll]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCategorySubscriptionID],
		[ArticleCategoryID],
		[emailRecipientID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[dnn_kovit_ArticleCategorySubscription]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByArticleCategory];
GO

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


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAllByArticleCategory Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAllByArticleCategory Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByEmailRecipient]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByEmailRecipient]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByEmailRecipient];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionGetAllByEmailRecipient]
(
	@emailRecipientID int
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
	--kovit_emailRecipient
	
		[emailRecipientID] = @emailRecipientID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAllByEmailRecipient Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionGetAllByEmailRecipient Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionUpdate]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionUpdate]
(
	@ArticleCategorySubscriptionID int,
	@ArticleCategoryID int,
	@emailRecipientID int,
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleCategorySubscription]
	SET
-- int
		[ArticleCategoryID] = @ArticleCategoryID,
-- int
		[emailRecipientID] = @emailRecipientID,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[ArticleCategorySubscriptionID] = @ArticleCategorySubscriptionID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionAdd]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionAdd]
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
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategorySubscriptionDelete]    Script Date: 25.03.2010 12:58:49 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategorySubscriptionDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategorySubscriptionDelete]
(
	@ArticleCategorySubscriptionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleCategorySubscription]
	WHERE
		[ArticleCategorySubscriptionID] = @ArticleCategorySubscriptionID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategorySubscriptionDelete Error on Creation'
GO


