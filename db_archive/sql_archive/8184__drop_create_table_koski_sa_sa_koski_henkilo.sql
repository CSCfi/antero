USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_koski_henkilo]    Script Date: 9.10.2023 18:12:26 ******/
DROP TABLE [sa].[sa_koski_henkilo]
GO

/****** Object:  Table [sa].[sa_koski_henkilo]    Script Date: 9.10.2023 18:12:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koski_henkilo](
	[oppija_oid] [varchar](50) NULL,
	[master_oid] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[turvakielto] [bit] NULL,
	[sukupuoli] [varchar](50) NULL,
	[kotikunta] [varchar](50) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koski_henkilo] ADD  CONSTRAINT [DF__sa_koski_henkilo_imp_created2]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_henkilo] ADD  CONSTRAINT [DF__sa_koski_henkilo_username2]  DEFAULT (suser_sname()) FOR [username]
GO

CREATE UNIQUE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_henkilo]
(
	[oppija_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF, FILLFACTOR = 90) ON [PRIMARY]
GO
