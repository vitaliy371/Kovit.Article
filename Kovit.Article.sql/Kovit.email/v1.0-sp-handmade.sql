USE [dnn]
GO
/****** Object:  StoredProcedure [dbo].[emailQueryInfoGetAll]    Script Date: 03/23/2010 00:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[kovit_emailQueryInfoGetAll] 
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
		m.[Subject],
		m.[MessageBody],
		ems.[CreatedByUserID],
		ems.[CreatedOnDate],
		ems.[LastModifiedByUserID],
		ems.[LastModifiedOnDate]
	FROM [dbo].[kovit_emailMessageState] as ems
	inner join [dbo].[kovit_emailRecipient] rp 
		on  rp.[emailRecipientID]=ems.[emailRecipientID]
		and rp.Active = 1
	inner join [dbo].[kovit_emailPortal] p 
		on  p.[emailPortalID]=ems.[emailPortalID]
	inner join [dbo].[kovit_emailMessage] m 
		on  m.[emailMessageID]=ems.[emailMessageID]
	WHERE ems.emaillStateID=1 -- In Query,
	SET @Err = @@Error

	RETURN @Err
END
