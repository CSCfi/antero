USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_allfields_codes')
BEGIN
	DROP TABLE [sa].[sa_eter_allfields_codes];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_allfields_codes')
BEGIN

CREATE TABLE [sa].[sa_eter_allfields_codes](
	[_id] [int] NOT NULL,
	[name] [varchar](40) NULL,
	[code] [varchar](2) NULL,
	[value] [varchar](79) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL
 CONSTRAINT [PK__sa_eter_allfields_codes] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_allfields_codes] ADD  CONSTRAINT [DF__sa_eter_allfields_codes]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO