USE [dnn]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleGet]
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
		[LastModifiedOnDate]
	FROM [dbo].[kovit_Article]
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleGetAll] 
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
		[LastModifiedOnDate]
	FROM [dbo].[kovit_Article]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleGetAllByLanguages]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleGetAllByLanguages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleGetAllByLanguages];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleGetAllByLanguages]
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
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_Article]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleGetAllByPortals]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleGetAllByPortals]
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
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_Article]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleUpdate]
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
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_Article]
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
		[LastModifiedOnDate] = @LastModifiedOnDate
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




/****** Object:  StoredProcedure [dbo].[kovit_ArticleAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAdd]
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
	@LastModifiedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_Article]
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
		[LastModifiedOnDate]
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
		@LastModifiedOnDate
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleDelete]
(
	@ArticleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_Article]
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentGet]
(
	@ArticleAttachmentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAttachmentID],
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	FROM [dbo].[kovit_ArticleAttachment]
	WHERE
		([ArticleAttachmentID] = @ArticleAttachmentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAttachmentID],
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	FROM [dbo].[kovit_ArticleAttachment]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentGetAllByFiles]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentGetAllByFiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByFiles];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByFiles]
(
	@FileId int
)
AS
BEGIN
	SELECT
		[ArticleAttachmentID],
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	FROM 
		 [dbo].[kovit_ArticleAttachment]
	WHERE
	--Files
	
		[FileId] = @FileId

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByFiles Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByFiles Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentGetAllByArticle]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleAttachmentID],
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	FROM 
		 [dbo].[kovit_ArticleAttachment]
	WHERE
	--kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentGetAllByArticleAttachmentType]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentGetAllByArticleAttachmentType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByArticleAttachmentType];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentGetAllByArticleAttachmentType]
(
	@ArticleAttachmentTypeCode nvarchar(50)
)
AS
BEGIN
	SELECT
		[ArticleAttachmentID],
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	FROM 
		 [dbo].[kovit_ArticleAttachment]
	WHERE
	--kovit_ArticleAttachmentType
	
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByArticleAttachmentType Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentGetAllByArticleAttachmentType Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentUpdate]
(
	@ArticleAttachmentID int,
	@ArticleAttachmentTypeCode nvarchar(50),
	@FileId int,
	@SortOrder int,
	@ArticleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleAttachment]
	SET
-- nvarchar(50)
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode,
-- int
		[FileId] = @FileId,
-- int
		[SortOrder] = @SortOrder,
-- int
		[ArticleID] = @ArticleID
	WHERE
		[ArticleAttachmentID] = @ArticleAttachmentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentAdd]
(
	@ArticleAttachmentTypeCode nvarchar(50),
	@FileId int,
	@SortOrder int,
	@ArticleID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleAttachment]
	(
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	)
	VALUES
	(
		isNull(@ArticleAttachmentTypeCode,''),
		@FileId,
		isNull(@SortOrder,65535),
		@ArticleID
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentDelete]
(
	@ArticleAttachmentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleAttachment]
	WHERE
		[ArticleAttachmentID] = @ArticleAttachmentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentTypeGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentTypeGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentTypeGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentTypeGet]
(
	@ArticleAttachmentTypeCode nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAttachmentTypeCode],
		[ArticleAttachmentTypeName]
	FROM [dbo].[kovit_ArticleAttachmentType]
	WHERE
		([ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentTypeGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentTypeGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentTypeGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentTypeGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAttachmentTypeCode],
		[ArticleAttachmentTypeName]
	FROM [dbo].[kovit_ArticleAttachmentType]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentTypeUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentTypeUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentTypeUpdate]
(
	@ArticleAttachmentTypeCode nvarchar(50),
	@ArticleAttachmentTypeName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleAttachmentType]
	SET
-- nvarchar(50)
		[ArticleAttachmentTypeName] = @ArticleAttachmentTypeName
	WHERE
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentTypeAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentTypeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentTypeAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentTypeAdd]
(
	@ArticleAttachmentTypeCode nvarchar(50),
	@ArticleAttachmentTypeName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleAttachmentType]
	(
		[ArticleAttachmentTypeCode],
		[ArticleAttachmentTypeName]
	)
	VALUES
	(
		isNull(@ArticleAttachmentTypeCode,''),
		isNull(@ArticleAttachmentTypeName,'')
	)

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleAttachmentTypeDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleAttachmentTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleAttachmentTypeDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleAttachmentTypeDelete]
(
	@ArticleAttachmentTypeCode nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleAttachmentType]
	WHERE
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleAttachmentTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGet]
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
		[LastModifiedOnDate]
	FROM [dbo].[kovit_ArticleCategory]
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAll] 
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
		[LastModifiedOnDate]
	FROM [dbo].[kovit_ArticleCategory]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllByLanguages]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryGetAllByLanguages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByLanguages];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByLanguages]
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
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_ArticleCategory]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllByPortals]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByPortals]
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
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_ArticleCategory]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryGetAllByTabs]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryGetAllByTabs]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByTabs];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryGetAllByTabs]
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
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_ArticleCategory]
	WHERE
	--Tabs
	
		[TabID] = @TabID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByTabs Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryGetAllByTabs Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryUpdate]
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
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleCategory]
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
		[LastModifiedOnDate] = @LastModifiedOnDate
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




/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryAdd]
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
	@LastModifiedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleCategory]
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
		[LastModifiedOnDate]
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
		@LastModifiedOnDate
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryDelete]
(
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleCategory]
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

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListGet]
(
	@ArticleCategoryListID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCategoryListID],
		[ArticleID],
		[ArticleCategoryID]
	FROM [dbo].[kovit_ArticleCategoryList]
	WHERE
		([ArticleCategoryListID] = @ArticleCategoryListID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCategoryListID],
		[ArticleID],
		[ArticleCategoryID]
	FROM [dbo].[kovit_ArticleCategoryList]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListGetAllByArticle]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryListID],
		[ArticleID],
		[ArticleCategoryID]
	FROM 
		 [dbo].[kovit_ArticleCategoryList]
	WHERE
	--kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListGetAllByArticleCategory]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListGetAllByArticleCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListGetAllByArticleCategory];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListGetAllByArticleCategory]
(
	@ArticleCategoryID int
)
AS
BEGIN
	SELECT
		[ArticleCategoryListID],
		[ArticleID],
		[ArticleCategoryID]
	FROM 
		 [dbo].[kovit_ArticleCategoryList]
	WHERE
	--kovit_ArticleCategory
	
		[ArticleCategoryID] = @ArticleCategoryID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAllByArticleCategory Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListGetAllByArticleCategory Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListUpdate]
(
	@ArticleCategoryListID int,
	@ArticleID int,
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleCategoryList]
	SET
-- int
		[ArticleID] = @ArticleID,
-- int
		[ArticleCategoryID] = @ArticleCategoryID
	WHERE
		[ArticleCategoryListID] = @ArticleCategoryListID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListAdd]
(
	@ArticleID int,
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleCategoryList]
	(
		[ArticleID],
		[ArticleCategoryID]
	)
	VALUES
	(
		@ArticleID,
		@ArticleCategoryID
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCategoryListDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCategoryListDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCategoryListDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCategoryListDelete]
(
	@ArticleCategoryListID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleCategoryList]
	WHERE
		[ArticleCategoryListID] = @ArticleCategoryListID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCategoryListDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCategoryListDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentGet]
(
	@ArticleCommentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCommentID],
		[ArticleID],
		[ArticleCommentText],
		[Email],
		[Name],
		[Approved],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM [dbo].[kovit_ArticleComment]
	WHERE
		([ArticleCommentID] = @ArticleCommentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentGetAll]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCommentID],
		[ArticleID],
		[ArticleCommentText],
		[Email],
		[Name],
		[Approved],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM [dbo].[kovit_ArticleComment]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentGetAllByArticle]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleCommentID],
		[ArticleID],
		[ArticleCommentText],
		[Email],
		[Name],
		[Approved],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM 
		 [dbo].[kovit_ArticleComment]
	WHERE
	--kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentUpdate]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentUpdate]
(
	@ArticleCommentID int,
	@ArticleID int,
	@ArticleCommentText nvarchar(4000),
	@Email varchar(320),
	@Name nvarchar(50),
	@Approved bit,
	@IpAddress varchar(15),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleComment]
	SET
-- int
		[ArticleID] = @ArticleID,
-- nvarchar(4000)
		[ArticleCommentText] = @ArticleCommentText,
-- varchar(320)
		[Email] = @Email,
-- nvarchar(50)
		[Name] = @Name,
-- bit
		[Approved] = @Approved,
-- varchar(15)
		[IpAddress] = @IpAddress,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate
	WHERE
		[ArticleCommentID] = @ArticleCommentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentAdd]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentAdd]
(
	@ArticleID int,
	@ArticleCommentText nvarchar(4000),
	@Email varchar(320),
	@Name nvarchar(50),
	@Approved bit,
	@IpAddress varchar(15),
	@CreatedByUserID int,
	@CreatedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleComment]
	(
		[ArticleID],
		[ArticleCommentText],
		[Email],
		[Name],
		[Approved],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	)
	VALUES
	(
		@ArticleID,
		isNull(@ArticleCommentText,''),
		isNull(@Email,''),
		isNull(@Name,''),
		isNull(@Approved,0),
		isNull(@IpAddress,'0.0.0.0'),
		@CreatedByUserID,
		@CreatedOnDate
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleCommentDelete]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleCommentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleCommentDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleCommentDelete]
(
	@ArticleCommentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleComment]
	WHERE
		[ArticleCommentID] = @ArticleCommentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleCommentDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleCommentDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventGet]    Script Date: 15.12.2009 19:35:53 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventGet]
(
	@ArticleEventID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleEventID],
		[ArticleID],
		[Title],
		[Description],
		[StartDate],
		[EndDate]
	FROM [dbo].[kovit_ArticleEvent]
	WHERE
		([ArticleEventID] = @ArticleEventID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventGetAll]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleEventID],
		[ArticleID],
		[Title],
		[Description],
		[StartDate],
		[EndDate]
	FROM [dbo].[kovit_ArticleEvent]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventGetAllByArticle]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleEventID],
		[ArticleID],
		[Title],
		[Description],
		[StartDate],
		[EndDate]
	FROM 
		 [dbo].[kovit_ArticleEvent]
	WHERE
	--kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventUpdate]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventUpdate]
(
	@ArticleEventID int,
	@ArticleID int,
	@Title nvarchar(255),
	@Description nvarchar(4000),
	@StartDate datetime,
	@EndDate smalldatetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleEvent]
	SET
-- int
		[ArticleID] = @ArticleID,
-- nvarchar(255)
		[Title] = @Title,
-- nvarchar(4000)
		[Description] = @Description,
-- datetime
		[StartDate] = @StartDate,
-- smalldatetime
		[EndDate] = @EndDate
	WHERE
		[ArticleEventID] = @ArticleEventID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventAdd]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventAdd]
(
	@ArticleID int,
	@Title nvarchar(255),
	@Description nvarchar(4000),
	@StartDate datetime,
	@EndDate smalldatetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleEvent]
	(
		[ArticleID],
		[Title],
		[Description],
		[StartDate],
		[EndDate]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Title,''),
		isNull(@Description,''),
		isNull(@StartDate,getdate()),
		isNull(@EndDate,getdate())
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleEventDelete]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleEventDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleEventDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleEventDelete]
(
	@ArticleEventID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleEvent]
	WHERE
		[ArticleEventID] = @ArticleEventID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleEventDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleEventDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingGet]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingGet];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingGet]
(
	@ArticleRatingID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleRatingID],
		[ArticleID],
		[Rating],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM [dbo].[kovit_ArticleRating]
	WHERE
		([ArticleRatingID] = @ArticleRatingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingGetAll]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleRatingID],
		[ArticleID],
		[Rating],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM [dbo].[kovit_ArticleRating]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingGetAllByArticle]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleRatingID],
		[ArticleID],
		[Rating],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	FROM 
		 [dbo].[kovit_ArticleRating]
	WHERE
	--kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingUpdate]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingUpdate]
(
	@ArticleRatingID int,
	@ArticleID int,
	@Rating int,
	@IpAddress varchar(15),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_ArticleRating]
	SET
-- int
		[ArticleID] = @ArticleID,
-- int
		[Rating] = @Rating,
-- varchar(15)
		[IpAddress] = @IpAddress,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate
	WHERE
		[ArticleRatingID] = @ArticleRatingID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingAdd]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingAdd];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingAdd]
(
	@ArticleID int,
	@Rating int,
	@IpAddress varchar(15),
	@CreatedByUserID int,
	@CreatedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[kovit_ArticleRating]
	(
		[ArticleID],
		[Rating],
		[IpAddress],
		[CreatedByUserID],
		[CreatedOnDate]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Rating,0),
		isNull(@IpAddress,'0.0.0.0'),
		@CreatedByUserID,
		@CreatedOnDate
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_ArticleRatingDelete]    Script Date: 15.12.2009 19:35:54 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_ArticleRatingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_ArticleRatingDelete];
GO

CREATE PROCEDURE [dbo].[kovit_ArticleRatingDelete]
(
	@ArticleRatingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_ArticleRating]
	WHERE
		[ArticleRatingID] = @ArticleRatingID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_ArticleRatingDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_ArticleRatingDelete Error on Creation'
GO


