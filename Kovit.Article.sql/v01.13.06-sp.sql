
 
/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGet]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGet]
(
	@ArticleAtributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAtributeID],
		[PortalID],
		[ArticleAtributeName],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[UseSearch],
		[LanguageID]
	FROM [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
		([ArticleAtributeID] = @ArticleAtributeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAll]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAtributeID],
		[PortalID],
		[ArticleAtributeName],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[UseSearch],
		[LanguageID]
	FROM [dbo].[dnn_kovit_ArticleAtribute]
	ORDER BY SortOrder

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllByLanguages]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllByLanguages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByLanguages];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByLanguages]
(
	@LanguageID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeID],
		[PortalID],
		[ArticleAtributeName],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[UseSearch],
		[LanguageID]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
	--dnn_Languages
	
		[LanguageID] = @LanguageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByLanguages Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByLanguages Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllByPortals]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortals]
(
	@PortalID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeID],
		[PortalID],
		[ArticleAtributeName],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[UseSearch],
		[LanguageID]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
	--dnn_Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeUpdate]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeUpdate]
(
	@ArticleAtributeID int,
	@PortalID int,
	@ArticleAtributeName nvarchar(128),
	@SortOrder int,
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@UseSearch bit,
	@LanguageID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleAtribute]
	SET
-- int
		[PortalID] = @PortalID,
-- nvarchar(128)
		[ArticleAtributeName] = @ArticleAtributeName,
-- int
		[SortOrder] = @SortOrder,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- bit
		[UseSearch] = @UseSearch,
-- int
		[LanguageID] = @LanguageID
	WHERE
		[ArticleAtributeID] = @ArticleAtributeID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeAdd]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeAdd]
(
	@PortalID int,
	@ArticleAtributeName nvarchar(128),
	@SortOrder int,
	@CreatedByUserID int,
	@CreatedOnDate datetime,
	@UseSearch bit,
	@LanguageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_ArticleAtribute]
	(
		[PortalID],
		[ArticleAtributeName],
		[SortOrder],
		[CreatedByUserID],
		[CreatedOnDate],
		[UseSearch],
		[LanguageID]
	)
	VALUES
	(
		@PortalID,
		isNull(@ArticleAtributeName,''),
		isNull(@SortOrder,65535),
		@CreatedByUserID,
		@CreatedOnDate,
		isNull(@UseSearch,0),
		@LanguageID
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeDelete]    Script Date: 27.06.2013 2:49:21 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeDelete]
(
	@ArticleAtributeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
		[ArticleAtributeID] = @ArticleAtributeID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeDelete Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGet]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationGet]
(
	@ArticleLocationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleLocationID],
		[ArticleID],
		[Title],
		[Longitude],
		[Latitude],
		[SortOrder]
	FROM [dbo].[dnn_kovit_ArticleLocation]
	WHERE
		([ArticleLocationID] = @ArticleLocationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAll]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleLocationID],
		[ArticleID],
		[Title],
		[Longitude],
		[Latitude],
		[SortOrder]
	FROM [dbo].[dnn_kovit_ArticleLocation]
	ORDER BY SortOrder

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAllByArticle]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleLocationID],
		[ArticleID],
		[Title],
		[Longitude],
		[Latitude],
		[SortOrder]
	FROM 
		 [dbo].[dnn_kovit_ArticleLocation]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationUpdate]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationUpdate]
(
	@ArticleLocationID int,
	@ArticleID int,
	@Title nvarchar(510),
	@Longitude varchar(10),
	@Latitude varchar(10),
	@SortOrder int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleLocation]
	SET
-- int
		[ArticleID] = @ArticleID,
-- nvarchar(510)
		[Title] = @Title,
-- varchar(10)
		[Longitude] = @Longitude,
-- varchar(10)
		[Latitude] = @Latitude,
-- int
		[SortOrder] = @SortOrder
	WHERE
		[ArticleLocationID] = @ArticleLocationID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationAdd]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationAdd]
(
	@ArticleID int,
	@Title nvarchar(510),
	@Longitude varchar(10),
	@Latitude varchar(10),
	@SortOrder int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_ArticleLocation]
	(
		[ArticleID],
		[Title],
		[Longitude],
		[Latitude],
		[SortOrder]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Title,''),
		isNull(@Longitude,0),
		isNull(@Latitude,0),
		isNull(@SortOrder,65535)
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationDelete]    Script Date: 25.06.2013 16:27:25 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationDelete]
(
	@ArticleLocationID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleLocation]
	WHERE
		[ArticleLocationID] = @ArticleLocationID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleLocationDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleLocationDelete Error on Creation'
GO



/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGet]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGet]
(
	@ArticleYouTubeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleYouTubeID],
		[ArticleID],
		[Title],
		[VideoID],
		[SortOrder]
	FROM [dbo].[dnn_kovit_ArticleYouTube]
	WHERE
		([ArticleYouTubeID] = @ArticleYouTubeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGetAll]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleYouTubeID],
		[ArticleID],
		[Title],
		[VideoID],
		[SortOrder]
	FROM [dbo].[dnn_kovit_ArticleYouTube]
	ORDER BY SortOrder

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleYouTubeID],
		[ArticleID],
		[Title],
		[VideoID],
		[SortOrder]
	FROM 
		 [dbo].[dnn_kovit_ArticleYouTube]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeUpdate]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeUpdate]
(
	@ArticleYouTubeID int,
	@ArticleID int,
	@Title nvarchar(510),
	@VideoID char(11),
	@SortOrder int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleYouTube]
	SET
-- int
		[ArticleID] = @ArticleID,
-- nvarchar(510)
		[Title] = @Title,
-- char(11)
		[VideoID] = @VideoID,
-- int
		[SortOrder] = @SortOrder
	WHERE
		[ArticleYouTubeID] = @ArticleYouTubeID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeAdd]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeAdd]
(
	@ArticleID int,
	@Title nvarchar(510),
	@VideoID char(11),
	@SortOrder int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_ArticleYouTube]
	(
		[ArticleID],
		[Title],
		[VideoID],
		[SortOrder]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Title,''),
		@VideoID,
		isNull(@SortOrder,65535)
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeDelete]    Script Date: 25.06.2013 16:33:11 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeDelete]
(
	@ArticleYouTubeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleYouTube]
	WHERE
		[ArticleYouTubeID] = @ArticleYouTubeID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleYouTubeDelete Error on Creation'
GO


