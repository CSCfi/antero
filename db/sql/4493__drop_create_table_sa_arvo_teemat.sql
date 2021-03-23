USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_teemat')

BEGIN
	DROP TABLE [sa].[sa_arvo_teemat]
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_teemat')
BEGIN
	CREATE TABLE [sa].[sa_arvo_teemat](
		[id] [bigint] IDENTITY(1,1) NOT NULL,
		[koodi] [varchar](100) NULL,
		[nimi_fi] [varchar](300) NULL,
		[nimi_sv] [varchar](300) NULL,
		[nimi_en] [varchar](300) NULL,
		[lyhytnimi] [varchar](100) NULL,
		[jarjestys] [int] NULL,
		[hierarkiataso] [int] NULL,
		[status] [varchar](100) NULL,
		[alkupvm] [datetime] NULL,
		[loppupvm] [datetime] NULL,
		[luontipvm] [datetime] NULL,
		[muokkauspvm] [datetime] NULL,
		[source] [varchar](100) NULL,
		[username] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
	 CONSTRAINT [PK__sa_arvo_teemat] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_arvo_teemat] ADD  CONSTRAINT [DF__sa_arvo_teemat__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_teemat] ADD  CONSTRAINT [DF__sa_arvo_teemat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

USE ANTERO
