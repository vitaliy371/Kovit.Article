USE [kovit_dnn]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGet]    Script Date: 13.11.2009 4:09:01 ******/
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
		[LastModifiedOnDate]
	FROM [dnn_kovit_Article]
	WHERE
		([ArticleID] = @ArticleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAll]    Script Date: 13.11.2009 4:09:01 ******/
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
		[LastModifiedOnDate]
	FROM [dnn_kovit_Article]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAllByLanguages]    Script Date: 13.11.2009 4:09:02 ******/
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
		[LastModifiedOnDate]
	FROM 
		[dnn_kovit_Article]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleGetAllByPortals]    Script Date: 13.11.2009 4:09:02 ******/
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
		[LastModifiedOnDate]
	FROM 
		[dnn_kovit_Article]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleUpdate]    Script Date: 13.11.2009 4:09:02 ******/
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
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dnn_kovit_Article]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAdd]    Script Date: 13.11.2009 4:09:02 ******/
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
	@LastModifiedOnDate datetime
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dnn_kovit_Article]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleDelete]    Script Date: 13.11.2009 4:09:02 ******/
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
	FROM [dnn_kovit_Article]
	WHERE
		[ArticleID] = @ArticleID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGet]
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
	FROM [dnn_kovit_ArticleAttachment]
	WHERE
		([ArticleAttachmentID] = @ArticleAttachmentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAll] 
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
	FROM [dnn_kovit_ArticleAttachment]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentGetAllByFiles]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentGetAllByFiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByFiles];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByFiles]
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
		[dnn_kovit_ArticleAttachment]
	WHERE
	--Files
	
		[FileId] = @FileId

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByFiles Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByFiles Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticle]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticle]
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
		[dnn_kovit_ArticleAttachment]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType]
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
		[dnn_kovit_ArticleAttachment]
	WHERE
	--dnn_kovit_ArticleAttachmentType
	
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentGetAllByArticleAttachmentType Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentUpdate]
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

	UPDATE [dnn_kovit_ArticleAttachment]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentAdd]
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
	INTO [dnn_kovit_ArticleAttachment]
	(
		[ArticleAttachmentTypeCode],
		[FileId],
		[SortOrder],
		[ArticleID]
	)
	VALUES
	(
		isNull(@ArticleAttachmentTypeCode,''),
		 @FileId ,
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentDelete]
(
	@ArticleAttachmentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleAttachment]
	WHERE
		[ArticleAttachmentID] = @ArticleAttachmentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentTypeGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentTypeGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeGet]
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
	FROM [dnn_kovit_ArticleAttachmentType]
	WHERE
		([ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentTypeGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentTypeGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAttachmentTypeCode],
		[ArticleAttachmentTypeName]
	FROM [dnn_kovit_ArticleAttachmentType]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentTypeUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentTypeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeUpdate]
(
	@ArticleAttachmentTypeCode nvarchar(50),
	@ArticleAttachmentTypeName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dnn_kovit_ArticleAttachmentType]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentTypeAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentTypeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeAdd]
(
	@ArticleAttachmentTypeCode nvarchar(50),
	@ArticleAttachmentTypeName nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dnn_kovit_ArticleAttachmentType]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAttachmentTypeDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAttachmentTypeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAttachmentTypeDelete]
(
	@ArticleAttachmentTypeCode nvarchar(50)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleAttachmentType]
	WHERE
		[ArticleAttachmentTypeCode] = @ArticleAttachmentTypeCode

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAttachmentTypeDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGet]    Script Date: 13.11.2009 4:09:02 ******/
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
	FROM [dnn_kovit_ArticleCategory]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAll]    Script Date: 13.11.2009 4:09:02 ******/
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
	FROM [dnn_kovit_ArticleCategory]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByLanguages]    Script Date: 13.11.2009 4:09:02 ******/
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
		[dnn_kovit_ArticleCategory]
	WHERE
	--Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryGetAllByPortals]    Script Date: 13.11.2009 4:09:02 ******/
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
		[dnn_kovit_ArticleCategory]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryUpdate]
(
	@ArticleCategoryID int,
	@ParentCategoryID int,
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

	UPDATE [dnn_kovit_ArticleCategory]
	SET
-- int
		[ParentCategoryID] = @ParentCategoryID,
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryAdd]
(
	@ParentCategoryID int,
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
	INTO [dnn_kovit_ArticleCategory]
	(
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
	)
	VALUES
	(
		@ParentCategoryID,
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryDelete]    Script Date: 13.11.2009 4:09:02 ******/
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
	FROM [dnn_kovit_ArticleCategory]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGet]
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
	FROM [dnn_kovit_ArticleCategoryList]
	WHERE
		([ArticleCategoryListID] = @ArticleCategoryListID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleCategoryListID],
		[ArticleID],
		[ArticleCategoryID]
	FROM [dnn_kovit_ArticleCategoryList]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticle]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticle]
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
		[dnn_kovit_ArticleCategoryList]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticleCategory]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListGetAllByArticleCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticleCategory];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListGetAllByArticleCategory]
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
		[dnn_kovit_ArticleCategoryList]
	WHERE
	--dnn_kovit_ArticleCategory
	
		[ArticleCategoryID] = @ArticleCategoryID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAllByArticleCategory Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListGetAllByArticleCategory Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListUpdate]
(
	@ArticleCategoryListID int,
	@ArticleID int,
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dnn_kovit_ArticleCategoryList]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListAdd]
(
	@ArticleID int,
	@ArticleCategoryID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dnn_kovit_ArticleCategoryList]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCategoryListDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCategoryListDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCategoryListDelete]
(
	@ArticleCategoryListID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleCategoryList]
	WHERE
		[ArticleCategoryListID] = @ArticleCategoryListID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCategoryListDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentGet]
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
	FROM [dnn_kovit_ArticleComment]
	WHERE
		([ArticleCommentID] = @ArticleCommentID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentGetAll] 
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
	FROM [dnn_kovit_ArticleComment]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentGetAllByArticle]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentGetAllByArticle]
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
		[dnn_kovit_ArticleComment]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentUpdate]
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

	UPDATE [dnn_kovit_ArticleComment]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentAdd]
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
	INTO [dnn_kovit_ArticleComment]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleCommentDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleCommentDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleCommentDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleCommentDelete]
(
	@ArticleCommentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleComment]
	WHERE
		[ArticleCommentID] = @ArticleCommentID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleCommentDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleCommentDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventGet]
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
	FROM [dnn_kovit_ArticleEvent]
	WHERE
		([ArticleEventID] = @ArticleEventID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventGetAll] 
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
	FROM [dnn_kovit_ArticleEvent]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventGetAllByArticle]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventGetAllByArticle]
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
		[dnn_kovit_ArticleEvent]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventUpdate]
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

	UPDATE [dnn_kovit_ArticleEvent]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventAdd]
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
	INTO [dnn_kovit_ArticleEvent]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleEventDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleEventDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleEventDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleEventDelete]
(
	@ArticleEventID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleEvent]
	WHERE
		[ArticleEventID] = @ArticleEventID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleEventDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleEventDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingGet]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingGet]
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
	FROM [dnn_kovit_ArticleRating]
	WHERE
		([ArticleRatingID] = @ArticleRatingID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingGetAll]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetAll] 
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
	FROM [dnn_kovit_ArticleRating]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingGetAllByArticle]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingGetAllByArticle]
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
		[dnn_kovit_ArticleRating]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingUpdate]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingUpdate]
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

	UPDATE [dnn_kovit_ArticleRating]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingAdd]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingAdd]
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
	INTO [dnn_kovit_ArticleRating]
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleRatingDelete]    Script Date: 13.11.2009 4:09:02 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleRatingDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleRatingDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleRatingDelete]
(
	@ArticleRatingID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dnn_kovit_ArticleRating]
	WHERE
		[ArticleRatingID] = @ArticleRatingID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleRatingDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleRatingDelete Error on Creation'
GO


