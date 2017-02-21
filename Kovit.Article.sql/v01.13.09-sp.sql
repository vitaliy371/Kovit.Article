/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGet]    Script Date: 30.09.2013 22:13:51 ******/
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAll]    Script Date: 30.09.2013 22:13:51 ******/
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAllByArticle]    Script Date: 30.09.2013 22:13:51 ******/
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
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


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAllByArticle]    Script Date: 30.09.2013 22:13:51 ******/
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
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


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationGetAllByArticle]    Script Date: 30.09.2013 22:13:51 ******/
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
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


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationUpdate]    Script Date: 30.09.2013 22:13:51 ******/
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
	@SortOrder int,
	@MapProvider varchar(10),
	@Address nvarchar(255),
	@Size varchar(10),
	@ZoomLevel varchar(10),
	@MapType varchar(10)
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
		[SortOrder] = @SortOrder,
-- varchar(10)
		[MapProvider] = @MapProvider,
-- nvarchar(255)
		[Address] = @Address,
-- varchar(10)
		[Size] = @Size,
-- varchar(10)
		[ZoomLevel] = @ZoomLevel,
-- varchar(10)
		[MapType] = @MapType
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




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationAdd]    Script Date: 30.09.2013 22:13:51 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleLocationAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleLocationAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleLocationAdd]
(
	@ArticleID int,
	@Title nvarchar(510),
	@Longitude varchar(10),
	@Latitude varchar(10),
	@SortOrder int,
	@MapProvider varchar(10),
	@Address nvarchar(255),
	@Size varchar(10),
	@ZoomLevel varchar(10),
	@MapType varchar(10)
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
		[SortOrder],
		[MapProvider],
		[Address],
		[Size],
		[ZoomLevel],
		[MapType]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Title,''),
		isNull(@Longitude,'0'),
		isNull(@Latitude,'0'),
		isNull(@SortOrder,65535),
		isNull(@MapProvider,''),
		isNull(@Address,''),
		isNull(@Size,''),
		isNull(@ZoomLevel,''),
		isNull(@MapType,'')
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleLocationDelete]    Script Date: 30.09.2013 22:13:51 ******/
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGet]    Script Date: 30.09.2013 22:13:52 ******/
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
		[SortOrder],
		[VideoProvider],
		[Size],
		[Preview120],
		[Preview320],
		[Preview640]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGetAll]    Script Date: 30.09.2013 22:13:52 ******/
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
		[SortOrder],
		[VideoProvider],
		[Size],
		[Preview120],
		[Preview320],
		[Preview640]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle]    Script Date: 30.09.2013 22:13:52 ******/
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
		[SortOrder],
		[VideoProvider],
		[Size],
		[Preview120],
		[Preview320],
		[Preview640]
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


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeGetAllByArticle]    Script Date: 30.09.2013 22:13:52 ******/
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
		[SortOrder],
		[VideoProvider],
		[Size],
		[Preview120],
		[Preview320],
		[Preview640]
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


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeUpdate]    Script Date: 30.09.2013 22:13:52 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeUpdate]
(
	@ArticleYouTubeID int,
	@ArticleID int,
	@Title nvarchar(510),
	@VideoID char(11),
	@SortOrder int,
	@VideoProvider varchar(10),
	@Size varchar(10),
	@Preview120 varchar(2048),
	@Preview320 varchar(2048),
	@Preview640 varchar(2048)
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
		[SortOrder] = @SortOrder,
-- varchar(10)
		[VideoProvider] = @VideoProvider,
-- varchar(10)
		[Size] = @Size,
-- varchar(2048)
		[Preview120] = @Preview120,
-- varchar(2048)
		[Preview320] = @Preview320,
-- varchar(2048)
		[Preview640] = @Preview640
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




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeAdd]    Script Date: 30.09.2013 22:13:52 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleYouTubeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleYouTubeAdd]
(
	@ArticleID int,
	@Title nvarchar(510),
	@VideoID char(11),
	@SortOrder int,
	@VideoProvider varchar(10),
	@Size varchar(10),
	@Preview120 varchar(2048),
	@Preview320 varchar(2048),
	@Preview640 varchar(2048)
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
		[SortOrder],
		[VideoProvider],
		[Size],
		[Preview120],
		[Preview320],
		[Preview640]
	)
	VALUES
	(
		@ArticleID,
		isNull(@Title,''),
		@VideoID,
		isNull(@SortOrder,65535),
		isNull(@VideoProvider,''),
		isNull(@Size,''),
		isNull(@Preview120,''),
		isNull(@Preview320,''),
		isNull(@Preview640,'')
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleYouTubeDelete]    Script Date: 30.09.2013 22:13:52 ******/
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


