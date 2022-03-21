USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_demographic')
BEGIN
	DROP TABLE [sa].[sa_eter_demographic];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_demographic')
BEGIN

CREATE TABLE [sa].[sa_eter_demographic](
	[_id] [varchar](24) NOT NULL,
	[DEMO.EVENTPASTYEAR] [bigint] NULL,
	[DEMO.AFFINSTPASTYEAR] [varchar](60) NULL,
	[DEMO.EVENTREFYEAR] [varchar](1) NULL,
	[DEMO.AFFINSTREFYEAR] [varchar](22) NULL,
	[DEMO.DESCRIPTION] [varchar](203) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_demographic] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_demographic] ADD  CONSTRAINT [DF__sa_eter_demographic]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
