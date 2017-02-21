use [kovit_dnn]
go

--|--------------------------------------------------------------------------------
--| [kovit_emaillState] - Backs up all the data from a table into a SQL script.
--|--------------------------------------------------------------------------------
BEGIN TRANSACTION
	SET IDENTITY_INSERT [dbo].[dnn_kovit_emaillState] ON

INSERT INTO [dbo].[dnn_kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(1, N'In Query', NULL,NULL, NULL, NULL);
INSERT INTO [dbo].[dnn_kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(2, N'Sending', NULL, NULL, NULL, NULL);
INSERT INTO [dbo].[dnn_kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(3, N'Sent', NULL, NULL, NULL, NULL);
INSERT INTO [dbo].[dnn_kovit_emaillState]([emaillStateID], [emaillStateName], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) VALUES
	(4, N'Failured', NULL, NULL, NULL, NULL);	SET IDENTITY_INSERT [dbo].[dnn_kovit_emaillState] OFF

IF @@ERROR <> 0 ROLLBACK TRANSACTION;
ELSE COMMIT TRANSACTION;
GO
--|--------------------------------------------------------------------------------
  