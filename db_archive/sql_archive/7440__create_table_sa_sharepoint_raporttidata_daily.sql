USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS  [sa].[sa_sharepoint_raporttidata_daily]

CREATE TABLE [sa].[sa_sharepoint_raporttidata_daily](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[Raportti] [varchar](500) NULL,
	[Kieli] [varchar](10) NULL,
	[Total] [int] NULL,
	[reportdate] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[raw] [varchar](500) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [sa].[sa_sharepoint_raporttidata_daily] ADD  CONSTRAINT [DF__sa_sharepoint_raporttidata_daily__username]  DEFAULT (suser_name()) FOR [username]
GO
