USE [dnn]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[kovit_emaillStateGet]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emaillStateGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emaillStateGet];
GO

CREATE PROCEDURE [dbo].[kovit_emaillStateGet]
(
	@emaillStateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emaillStateID],
		[emaillStateName],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emaillState]
	WHERE
		([emaillStateID] = @emaillStateID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emaillStateGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emaillStateGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emaillStateGetAll]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emaillStateGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emaillStateGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_emaillStateGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emaillStateID],
		[emaillStateName],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emaillState]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emaillStateGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emaillStateGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emaillStateUpdate]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emaillStateUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emaillStateUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_emaillStateUpdate]
(
	@emaillStateID int,
	@emaillStateName nvarchar(50),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_emaillState]
	SET
-- nvarchar(50)
		[emaillStateName] = @emaillStateName,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[emaillStateID] = @emaillStateID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emaillStateUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emaillStateUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_emaillStateAdd]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emaillStateAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emaillStateAdd];
GO

CREATE PROCEDURE [dbo].[kovit_emaillStateAdd]
(
	@emaillStateName nvarchar(50),
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
	INTO [dbo].[kovit_emaillState]
	(
		[emaillStateName],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		isNull(@emaillStateName,''),
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emaillStateAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emaillStateAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emaillStateDelete]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emaillStateDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emaillStateDelete];
GO

CREATE PROCEDURE [dbo].[kovit_emaillStateDelete]
(
	@emaillStateID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_emaillState]
	WHERE
		[emaillStateID] = @emaillStateID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emaillStateDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emaillStateDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageGet]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageGet];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageGet]
(
	@emailMessageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailMessageID],
		[Subject],
		[MessageBody],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailMessage]
	WHERE
		([emailMessageID] = @emailMessageID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageGetAll]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailMessageID],
		[Subject],
		[MessageBody],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailMessage]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageUpdate]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageUpdate]
(
	@emailMessageID int,
	@Subject nvarchar(255),
	@MessageBody nvarchar(MAX),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_emailMessage]
	SET
-- nvarchar(255)
		[Subject] = @Subject,
-- nvarchar(MAX)
		[MessageBody] = @MessageBody,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[emailMessageID] = @emailMessageID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_emailMessageAdd]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageAdd];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageAdd]
(
	@Subject nvarchar(255),
	@MessageBody nvarchar(MAX),
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
	INTO [dbo].[kovit_emailMessage]
	(
		[Subject],
		[MessageBody],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		isNull(@Subject,''),
		isNull(@MessageBody,''),
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageDelete]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageDelete];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageDelete]
(
	@emailMessageID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_emailMessage]
	WHERE
		[emailMessageID] = @emailMessageID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGet]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGet];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGet]
(
	@emailMessageStateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailMessageState]
	WHERE
		([emailMessageStateID] = @emailMessageStateID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGetAll]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailMessageState]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGetAllByEmaillState]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGetAllByEmaillState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmaillState];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmaillState]
(
	@emaillStateID int
)
AS
BEGIN
	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_emailMessageState]
	WHERE
	--kovit_emaillState
	
		[emaillStateID] = @emaillStateID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmaillState Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmaillState Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGetAllByEmailMessage]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGetAllByEmailMessage]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailMessage];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailMessage]
(
	@emailMessageID int
)
AS
BEGIN
	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_emailMessageState]
	WHERE
	--kovit_emailMessage
	
		[emailMessageID] = @emailMessageID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailMessage Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailMessage Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGetAllByEmailPortal]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGetAllByEmailPortal]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailPortal];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailPortal]
(
	@emailPortalID int
)
AS
BEGIN
	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_emailMessageState]
	WHERE
	--kovit_emailPortal
	
		[emailPortalID] = @emailPortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailPortal Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailPortal Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateGetAllByEmailRecipient]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateGetAllByEmailRecipient]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailRecipient];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateGetAllByEmailRecipient]
(
	@emailRecipientID int
)
AS
BEGIN
	SELECT
		[emailMessageStateID],
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_emailMessageState]
	WHERE
	--kovit_emailRecipient
	
		[emailRecipientID] = @emailRecipientID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailRecipient Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateGetAllByEmailRecipient Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateUpdate]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateUpdate]
(
	@emailMessageStateID int,
	@emailMessageID int,
	@emailRecipientID int,
	@emaillStateID int,
	@emailPortalID int,
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_emailMessageState]
	SET
-- int
		[emailMessageID] = @emailMessageID,
-- int
		[emailRecipientID] = @emailRecipientID,
-- int
		[emaillStateID] = @emaillStateID,
-- int
		[emailPortalID] = @emailPortalID,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[emailMessageStateID] = @emailMessageStateID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateAdd]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateAdd];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateAdd]
(
	@emailMessageID int,
	@emailRecipientID int,
	@emaillStateID int,
	@emailPortalID int,
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
	INTO [dbo].[kovit_emailMessageState]
	(
		[emailMessageID],
		[emailRecipientID],
		[emaillStateID],
		[emailPortalID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		@emailMessageID,
		@emailRecipientID,
		@emaillStateID,
		@emailPortalID,
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailMessageStateDelete]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailMessageStateDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailMessageStateDelete];
GO

CREATE PROCEDURE [dbo].[kovit_emailMessageStateDelete]
(
	@emailMessageStateID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_emailMessageState]
	WHERE
		[emailMessageStateID] = @emailMessageStateID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailMessageStateDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailMessageStateDelete Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailPortalGet]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalGet];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalGet]
(
	@emailPortalID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailPortalID],
		[PortalID],
		[SmtpServer],
		[SmtpUserName],
		[SmtpPassword],
		[SmtpPort],
		[UseSSL],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailPortal]
	WHERE
		([emailPortalID] = @emailPortalID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailPortalGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailPortalGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailPortalGetAll]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailPortalID],
		[PortalID],
		[SmtpServer],
		[SmtpUserName],
		[SmtpPassword],
		[SmtpPort],
		[UseSSL],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailPortal]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailPortalGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailPortalGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailPortalGetAllByPortals]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalGetAllByPortals]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalGetAllByPortals];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalGetAllByPortals]
(
	@PortalID int
)
AS
BEGIN
	SELECT
		[emailPortalID],
		[PortalID],
		[SmtpServer],
		[SmtpUserName],
		[SmtpPassword],
		[SmtpPort],
		[UseSSL],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM 
		 [dbo].[kovit_emailPortal]
	WHERE
	--Portals
	
		[PortalID] = @PortalID

END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailPortalGetAllByPortals Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailPortalGetAllByPortals Error on Creation'
GO


/****** Object:  StoredProcedure [dbo].[kovit_emailPortalUpdate]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalUpdate]
(
	@emailPortalID int,
	@PortalID int,
	@SmtpServer varchar(128),
	@SmtpUserName varchar(128),
	@SmtpPassword varchar(128),
	@SmtpPort int,
	@UseSSL bit,
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_emailPortal]
	SET
-- int
		[PortalID] = @PortalID,
-- varchar(128)
		[SmtpServer] = @SmtpServer,
-- varchar(128)
		[SmtpUserName] = @SmtpUserName,
-- varchar(128)
		[SmtpPassword] = @SmtpPassword,
-- int
		[SmtpPort] = @SmtpPort,
-- bit
		[UseSSL] = @UseSSL,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[emailPortalID] = @emailPortalID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailPortalUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailPortalUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_emailPortalAdd]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalAdd];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalAdd]
(
	@PortalID int,
	@SmtpServer varchar(128),
	@SmtpUserName varchar(128),
	@SmtpPassword varchar(128),
	@SmtpPort int,
	@UseSSL bit,
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
	INTO [dbo].[kovit_emailPortal]
	(
		[PortalID],
		[SmtpServer],
		[SmtpUserName],
		[SmtpPassword],
		[SmtpPort],
		[UseSSL],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		@PortalID,
		isNull(@SmtpServer,''),
		isNull(@SmtpUserName,''),
		isNull(@SmtpPassword,''),
		isNull(@SmtpPort,25),
		isNull(@UseSSL,0),
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailPortalAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailPortalAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailPortalDelete]    Script Date: 22.03.2010 21:12:16 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailPortalDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailPortalDelete];
GO

CREATE PROCEDURE [dbo].[kovit_emailPortalDelete]
(
	@emailPortalID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_emailPortal]
	WHERE
		[emailPortalID] = @emailPortalID

	SET @Err = @@Error

	RETURN @Err
END
GO

 
/****** Object:  StoredProcedure [dbo].[kovit_emailRecipientGet]    Script Date: 06.04.2010 17:49:07 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailRecipientGet]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailRecipientGet];
GO

CREATE PROCEDURE [dbo].[kovit_emailRecipientGet]
(
	@emailRecipientID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailRecipientID],
		[RecipientName],
		[RecipientEmail],
		[Active],
		[ControlKey],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailRecipient]
	WHERE
		([emailRecipientID] = @emailRecipientID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailRecipientGet Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailRecipientGet Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailRecipientGetAll]    Script Date: 06.04.2010 17:49:07 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailRecipientGetAll]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailRecipientGetAll];
GO

CREATE PROCEDURE [dbo].[kovit_emailRecipientGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[emailRecipientID],
		[RecipientName],
		[RecipientEmail],
		[Active],
		[ControlKey],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	FROM [dbo].[kovit_emailRecipient]
	
	
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailRecipientGetAll Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailRecipientGetAll Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailRecipientUpdate]    Script Date: 06.04.2010 17:49:07 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailRecipientUpdate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailRecipientUpdate];
GO

CREATE PROCEDURE [dbo].[kovit_emailRecipientUpdate]
(
	@emailRecipientID int,
	@RecipientName nvarchar(128),
	@RecipientEmail varchar(320),
	@Active bit,
	@ControlKey varchar(128),
	@CreatedByUserID int = NULL,
	@CreatedOnDate datetime = NULL,
	@LastModifiedByUserID int = NULL,
	@LastModifiedOnDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [dbo].[kovit_emailRecipient]
	SET
-- nvarchar(128)
		[RecipientName] = @RecipientName,
-- varchar(320)
		[RecipientEmail] = @RecipientEmail,
-- bit
		[Active] = @Active,
-- varchar(128)
		[ControlKey] = @ControlKey,
-- int
		[CreatedByUserID] = @CreatedByUserID,
-- datetime
		[CreatedOnDate] = @CreatedOnDate,
-- int
		[LastModifiedByUserID] = @LastModifiedByUserID,
-- datetime
		[LastModifiedOnDate] = @LastModifiedOnDate
	WHERE
		[emailRecipientID] = @emailRecipientID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailRecipientUpdate Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailRecipientUpdate Error on Creation'
GO




/****** Object:  StoredProcedure [dbo].[kovit_emailRecipientAdd]    Script Date: 06.04.2010 17:49:07 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailRecipientAdd]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailRecipientAdd];
GO

CREATE PROCEDURE [dbo].[kovit_emailRecipientAdd]
(
	@RecipientName nvarchar(128),
	@RecipientEmail varchar(320),
	@Active bit,
	@ControlKey varchar(128),
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
	INTO [dbo].[kovit_emailRecipient]
	(
		[RecipientName],
		[RecipientEmail],
		[Active],
		[ControlKey],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	)
	VALUES
	(
		isNull(@RecipientName,''),
		isNull(@RecipientEmail,''),
		isNull(@Active,1),
		isNull(@ControlKey,''),
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
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailRecipientAdd Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailRecipientAdd Error on Creation'
GO

/****** Object:  StoredProcedure [dbo].[kovit_emailRecipientDelete]    Script Date: 06.04.2010 17:49:07 ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[kovit_emailRecipientDelete]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[kovit_emailRecipientDelete];
GO

CREATE PROCEDURE [dbo].[kovit_emailRecipientDelete]
(
	@emailRecipientID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [dbo].[kovit_emailRecipient]
	WHERE
		[emailRecipientID] = @emailRecipientID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: kovit_emailRecipientDelete Succeeded'
ELSE PRINT 'Procedure Creation: kovit_emailRecipientDelete Error on Creation'
GO


