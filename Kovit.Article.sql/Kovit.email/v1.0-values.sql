use [dnn]
go

--|--------------------------------------------------------------------------------
--| [kovit_emaillState] - Backs up all the data from a table into a SQL script.
--|--------------------------------------------------------------------------------
BEGIN TRANSACTION
	SET IDENTITY_INSERT [kovit_emaillState] ON

INSERT INTO [dbo].[kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(1, N'In Query', NULL, '03/18/2010 23:47:38', NULL, '03/18/2010 23:47:38');
INSERT INTO [dbo].[kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(2, N'Sending', NULL, '03/18/2010 23:47:46', NULL, '03/18/2010 23:47:46');
INSERT INTO [dbo].[kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(3, N'Sent', NULL, '03/18/2010 23:47:53', NULL, '03/18/2010 23:47:53');
INSERT INTO [dbo].[kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(4, N'Failured', NULL, '03/18/2010 23:47:58', NULL, '03/18/2010 23:47:58');	SET IDENTITY_INSERT [kovit_emaillState] OFF

IF @@ERROR <> 0 ROLLBACK TRANSACTION;
ELSE COMMIT TRANSACTION;
GO
--|--------------------------------------------------------------------------------

--|--------------------------------------------------------------------------------
--| [kovit_emailRecipient] - Backs up all the data from a table into a SQL script.
--|--------------------------------------------------------------------------------
BEGIN TRANSACTION
	SET IDENTITY_INSERT [kovit_emailRecipient] ON

INSERT INTO [dbo].[kovit_emailRecipient]([emailRecipientID], [RecipientName], [RecipientEmail], [Active], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(1, N'Vitaliy ', 'vitaliy371@ua.fm', 1, NULL, '03/19/2010 09:38:11', NULL, '03/19/2010 09:38:11');
INSERT INTO [dbo].[kovit_emailRecipient]([emailRecipientID], [RecipientName], [RecipientEmail], [Active], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(2, N'Vitaliy ', 'vitaliy.kovalchook@gmail.com', 1, NULL, '03/19/2010 09:38:42', NULL, '03/19/2010 09:38:42');
INSERT INTO [dbo].[kovit_emailRecipient]([emailRecipientID], [RecipientName], [RecipientEmail], [Active], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(3, N'hren naydesh', 'bb@aaa...ccc', 1, NULL, '03/19/2010 10:50:37', NULL, '03/19/2010 10:50:37');	SET IDENTITY_INSERT [kovit_emailRecipient] OFF

IF @@ERROR <> 0 ROLLBACK TRANSACTION;
ELSE COMMIT TRANSACTION;
GO
--|--------------------------------------------------------------------------------
