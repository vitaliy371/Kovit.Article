Use [kovit_dnn]
--|--------------------------------------------------------------------------------
--| CREATION OF Stored Procedures
--|--------------------------------------------------------------------------------
 
--==[Drop Stored Procedure [kovit_emailPortalGetByPortalID] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_emailPortalGetByPortalID]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_emailPortalGetByPortalID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_emailPortalGetByPortalID]
GO

--==========[Create Stored Procedure [kovit_emailPortalGetByPortalID ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_emailPortalGetByPortalID]
(
	@PortalID int
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
	FROM [dbo].[dnn_kovit_emailPortal]
	WHERE
		([PortalID] = @PortalID)

	SET @Err = @@Error

	RETURN @Err
END

GO

 
--==[Drop Stored Procedure [kovit_emailQueryInfoGetAll] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_emailQueryInfoGetAll]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_emailQueryInfoGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_emailQueryInfoGetAll]
GO

--==========[Create Stored Procedure [kovit_emailQueryInfoGetAll ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_emailQueryInfoGetAll] 
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		ems.[emailMessageStateID],
		ems.[emailMessageID],
		ems.[emailRecipientID],
		ems.[emaillStateID],
		ems.[emailPortalID],
		p.[smtpServer],
        p.[smtpUserName],
        p.[smtpPassword],
        p.[smtpPort],
        p.[UseSSL],
		rp.[recipientName], 
        rp.[recipientEmail],
		rp.[ControlKey],
		m.[Subject],
		m.[MessageBody],
		ems.[CreatedByUserID],
		ems.[CreatedOnDate],
		ems.[LastModifiedByUserID],
		ems.[LastModifiedOnDate]
	FROM [dbo].[dnn_kovit_emailMessageState] as ems
	inner join [dbo].[dnn_kovit_emailRecipient] rp 
		on  rp.[emailRecipientID]=ems.[emailRecipientID]
		and rp.Active = 1
	inner join [dbo].[dnn_kovit_emailPortal] p 
		on  p.[emailPortalID]=ems.[emailPortalID]
	inner join [dbo].[dnn_kovit_emailMessage] m 
		on  m.[emailMessageID]=ems.[emailMessageID]
	WHERE ems.emaillStateID=1 -- In Query,
	SET @Err = @@Error

	RETURN @Err
END

GO

 
--==[Drop Stored Procedure [kovit_emailRecipientCheck] if already exists in database ]==--

/****** Object:  StoredProcedure [dbo].[dnn_kovit_emailRecipientCheck]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dnn_kovit_emailRecipientCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dnn_kovit_emailRecipientCheck]
GO

--==========[Create Stored Procedure [kovit_emailRecipientCheck ]==========--
CREATE PROCEDURE [dbo].[dnn_kovit_emailRecipientCheck]
(
	@RecipientName nvarchar(128),
	@RecipientEmail varchar(320),
	@ControlKey Varchar(128)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int
	DECLARE @emailRecipientID int
	DECLARE @key Varchar(128)

SELECT @emailRecipientID = [emailRecipientID]      
  FROM [dbo].[dnn_kovit_emailRecipient]
WHERE [RecipientEmail]=@RecipientEmail


if @emailRecipientID  is null
	begin
		-- Recipient don't exist
		INSERT INTO [dbo].[dnn_kovit_emailRecipient]
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
			1,
			@ControlKey,
			-1,
			Getdate(),
			-1,
			Getdate()
		)

		IF @@ROWCOUNT > 0 AND @@ERROR=0
 			SELECT   @emailRecipientID = SCOPE_IDENTITY();	
		end
	SELECT  @emailRecipientID  as emailRecipientID

	SET @Err = @@Error
	RETURN @Err
END

GO


