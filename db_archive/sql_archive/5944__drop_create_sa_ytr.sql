USE [Koski_SA]
GO

DROP TABLE IF EXISTS [sa].[sa_ytr]
GO
/****** Object:  Table [sa].[sa_ytr]    Script Date: 25.2.2022 15:18:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ytr](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[oph_export_uuid] [varchar](100) NULL,
	[oppija_oid] [varchar](100) NULL,
	[examination_started] [varchar](20) NULL,
	[certificate] [varchar](20) NULL,
	[examination_period] [varchar](20) NULL,
	[school_ytl_number] [int] NULL,
	[school_oid] [varchar](100) NULL,
	[school_name] [varchar](500) NULL,
	[school_name_1] [varchar](500) NULL,
	[school_municipality] [int] NULL,
	[school_county] [int] NULL,
	[education] [int] NULL,
	[exam] [varchar](100) NULL,
	[grade] [varchar](100) NULL,
	[points] [int] NULL,
	[mandatory] [int] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](150) NULL,
	[source] [varchar](150) NULL,
 CONSTRAINT [PK__sa_ytr] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_ytr] ADD  CONSTRAINT [DF_sa_ytr_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_ytr] ADD  CONSTRAINT [DF_sa_ytr_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE ANTERO
