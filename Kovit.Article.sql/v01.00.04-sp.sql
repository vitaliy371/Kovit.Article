USE [1gb_kovit_dnn]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGet]    Script Date: 26.07.2012 13:41:45 ******/
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
		[CreatedOnDate]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAll]    Script Date: 26.07.2012 13:41:45 ******/
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
		[CreatedOnDate]
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]
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
		[CreatedOnDate]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
	--dnn_Portal
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortal Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortal Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeGetAllByPortal]
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
		[CreatedOnDate]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtribute]
	WHERE
	--dnn_Portal
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortal Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeGetAllByPortal Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeUpdate]    Script Date: 26.07.2012 13:41:46 ******/
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
	@CreatedOnDate datetime = NULL
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
		[CreatedOnDate] = @CreatedOnDate
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




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeAdd]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeAdd]
(
	@PortalID int,
	@ArticleAtributeName nvarchar(128),
	@SortOrder int,
	@CreatedByUserID int,
	@CreatedOnDate datetime
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
		[CreatedOnDate]
	)
	VALUES
	(
		@PortalID,
		isNull(@ArticleAtributeName,''),
		isNull(@SortOrder,65535),
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
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeDelete]    Script Date: 26.07.2012 13:41:46 ******/
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

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGet]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGet];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGet]
(
	@ArticleAtributeListID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
		([ArticleAtributeListID] = @ArticleAtributeListID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGet Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGetAll]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAll];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM [dbo].[dnn_kovit_ArticleAtributeList]
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAll Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticle]
(
	@ArticleID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
	--dnn_kovit_Article
	
		[ArticleID] = @ArticleID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticle Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticle Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]
(
	@ArticleAtributeID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
	--dnn_kovit_ArticleAtribute
	
		[ArticleAtributeID] = @ArticleAtributeID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticleAtribute Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticleAtribute Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListGetAllByArticleAtribute]
(
	@ArticleAtributeID int
)
AS
BEGIN
	SELECT
		[ArticleAtributeListID],
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	FROM 
		 [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
	--dnn_kovit_ArticleAtribute
	
		[ArticleAtributeID] = @ArticleAtributeID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticleAtribute Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListGetAllByArticleAtribute Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListUpdate]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListUpdate];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListUpdate]
(
	@ArticleAtributeListID int,
	@ArticleAtributeID int,
	@ArticleID int,
	@Value nvarchar(255)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[dnn_kovit_ArticleAtributeList]
	SET
-- int
		[ArticleAtributeID] = @ArticleAtributeID,
-- int
		[ArticleID] = @ArticleID,
-- nvarchar(255)
		[Value] = @Value
	WHERE
		[ArticleAtributeListID] = @ArticleAtributeListID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListUpdate Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListAdd]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListAdd];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListAdd]
(
	@ArticleAtributeID int,
	@ArticleID int,
	@Value nvarchar(255)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [dbo].[dnn_kovit_ArticleAtributeList]
	(
		[ArticleAtributeID],
		[ArticleID],
		[Value]
	)
	VALUES
	(
		@ArticleAtributeID,
		@ArticleID,
		isNull(@Value,'')
	)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 		 	SELECT  SCOPE_IDENTITY();

	SET @Err = @@Error
	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListAdd Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[dnn_kovit_ArticleAtributeListDelete]    Script Date: 26.07.2012 13:41:46 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[dnn_kovit_ArticleAtributeListDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListDelete];
GO

CREATE PROCEDURE [dbo].[dnn_kovit_ArticleAtributeListDelete]
(
	@ArticleAtributeListID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[dnn_kovit_ArticleAtributeList]
	WHERE
		[ArticleAtributeListID] = @ArticleAtributeListID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListDelete Succeeded'
ELSE PRINT 'Procedure Creation: dnn_kovit_ArticleAtributeListDelete Error on Creation'
GO


