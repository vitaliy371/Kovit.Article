
Create table [dbo].[dnn_kovit_ArticleLocation]
(
	[ArticleLocationID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[Title] Nvarchar(510) Default '' NOT NULL,
	[Longitude] Varchar(10) Default '0' NOT NULL,
	[Latitude] Varchar(10) Default '0' NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,
	[MapProvider] Varchar(10) Default '' NOT NULL,
	[Address] Nvarchar(255) Default '' NOT NULL,
	[Size] Varchar(10) Default '' NOT NULL,
	[ZoomLevel] Varchar(10) Default '' NOT NULL,
	[MapType] Varchar(10) Default '' NOT NULL
) 
go

Alter table [dbo].[dnn_kovit_ArticleLocation] add Primary Key ([ArticleLocationID])
go



Create table [dbo].[dnn_kovit_ArticleYouTube]
(
	[ArticleYouTubeID] Integer Identity(1,1) NOT NULL,
	[ArticleID] Integer NOT NULL,
	[Title] Nvarchar(510) Default '' NOT NULL,
	[VideoID] Char(11) NOT NULL,
	[SortOrder] Integer Default 65535 NOT NULL,
	[VideoProvider] Varchar(10) Default '' NOT NULL,
	[Size] Varchar(10) Default '' NOT NULL,
	[Preview120] Varchar(2048) Default '' NOT NULL,
	[Preview320] Varchar(2048) Default '' NOT NULL,
	[Preview640] Varchar(2048) Default '' NOT NULL
) 
go

Alter table [dbo].[dnn_kovit_ArticleYouTube] add Primary Key ([ArticleYouTubeID])
go

Alter table [dbo].[dnn_kovit_ArticleLocation] add  foreign key([ArticleID]) references [dbo].[dnn_kovit_Article] ([ArticleID])  on update no action on delete no action 
go


Alter table [dbo].[dnn_kovit_ArticleYouTube] add  foreign key([ArticleID]) references [dbo].[dnn_kovit_Article] ([ArticleID])  on update no action on delete no action 
go


