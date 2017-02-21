use [dnn]
go
 /*
Created		04.11.2009
Modified		22.03.2010
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [dbo].[kovit_emailMessage]
(
	[emailMessageID] Integer Identity(1,1) NOT NULL,
	[Subject] Nvarchar(255) Default '' NOT NULL,
	[MessageBody] Nvarchar(max) Default '' NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_emailPortal]
(
	[emailPortalID] Integer Identity(1,1) NOT NULL,
	[PortalID] Integer NOT NULL,
	[SmtpServer] Varchar(128) Default '' NOT NULL,
	[SmtpUserName] Varchar(128) Default '' NOT NULL,
	[SmtpPassword] Varchar(128) Default '' NOT NULL,
	[SmtpPort] Integer Default 25 NOT NULL,
	[UseSSL] Bit Default 0 NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_emailMessageState]
(
	[emailMessageStateID] Integer Identity(1,1) NOT NULL,
	[emailMessageID] Integer NOT NULL,
	[emailRecipientID] Integer NOT NULL,
	[emaillStateID] Integer NOT NULL,
	[emailPortalID] Integer NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_emaillState]
(
	[emaillStateID] Integer Identity(1,1) NOT NULL,
	[emaillStateName] Nvarchar(50) Default '' NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go

Create table [dbo].[kovit_emailRecipient]
(
	[emailRecipientID] Integer Identity(1,1) NOT NULL,
	[RecipientName] Nvarchar(128) Default '' NOT NULL,
	[RecipientEmail] Varchar(320) Default '' NOT NULL,
	[Active] Bit Default 1 NOT NULL,
	[ControlKey] Varchar(128) Default '' NOT NULL,
	[CreatedByUserID] Integer NULL,
	[CreatedOnDate] Datetime Default getdate() NULL,
	[LastModifiedByUserID] Integer NULL,
	[LastModifiedOnDate] Datetime Default getdate() NULL
) 
go


Exec sp_addextendedproperty 'MS_Description', ' email Message', 'user', 'dbo', 'table', 'kovit_emailMessage', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'Portal email setting', 'user', 'dbo', 'table', 'kovit_emailPortal', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'Message State', 'user', 'dbo', 'table', 'kovit_emailMessageState', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'State 1 - In Query, 2 - Sending, 3 - Sent, 4 - Failured', 'user', 'dbo', 'table', 'kovit_emaillState', NULL, NULL
go
Exec sp_addextendedproperty 'MS_Description', 'Recipient list', 'user', 'dbo', 'table', 'kovit_emailRecipient', NULL, NULL
go


Alter table [dbo].[kovit_emailMessage] add Constraint [pk_kovit_emailMessage] Primary Key ([emailMessageID])
go
Alter table [dbo].[kovit_emailPortal] add Constraint [pk_kovit_emailPortal] Primary Key ([emailPortalID])
go
Alter table [dbo].[kovit_emailMessageState] add Constraint [pk_kovit_emailMessageState] Primary Key ([emailMessageStateID])
go
Alter table [dbo].[kovit_emaillState] add Constraint [pk_kovit_emaillState] Primary Key ([emaillStateID])
go
Alter table [dbo].[kovit_emailRecipient] add Constraint [pk_kovit_emailRecipient] Primary Key ([emailRecipientID])
go


Alter table [dbo].[kovit_emailMessageState] add Constraint [FK_kovit_emailMessage_kovit_emailMessageState] foreign key([emailMessageID]) references [dbo].[kovit_emailMessage] ([emailMessageID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_emailMessageState] add Constraint [FK_kovit_emailPortal_kovit_emailMessageState] foreign key([emailPortalID]) references [dbo].[kovit_emailPortal] ([emailPortalID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_emailMessageState] add Constraint [FK_kovit_emaillState_kovit_emailMessageState] foreign key([emaillStateID]) references [dbo].[kovit_emaillState] ([emaillStateID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_emailMessageState] add Constraint [FK_kovit_emailRecipient_kovit_emailMessageState] foreign key([emailRecipientID]) references [dbo].[kovit_emailRecipient] ([emailRecipientID])  on update no action on delete no action 
go
Alter table [dbo].[kovit_emailPortal] add  Constraint [FK_Portals_kovit_emailPortal] foreign key([PortalID]) references [dbo].[Portals] ([PortalID])  on update no action on delete no action 
go

/*
Alter table [dbo].[kovit_ArticleCategorySubscription] add Constraint [FK_kovit_emailRecipient_kovit_emailSubscription] foreign key([emailRecipientID]) references [dbo].[kovit_emailRecipient] ([emailRecipientID])  on update no action on delete no action 
go*/


Set quoted_identifier on
go


Set quoted_identifier off
go


