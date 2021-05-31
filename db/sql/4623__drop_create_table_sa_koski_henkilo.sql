USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_henkilo]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_henkilo]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_henkilo]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_henkilo](
	[oppija_oid] [varchar](50) NULL,
	[hetu] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[sukunimi] [varchar](50) NULL,
	[etunimet] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[turvakielto] [bit] NULL,
	[sukupuoli] [varchar](50) NULL,
	[kotikunta] [varchar] (50 )NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_koski_henkilo] ADD  CONSTRAINT [DF__sa_koski_henkilo_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_henkilo] ADD  CONSTRAINT [DF__sa_koski_henkilo_username]  DEFAULT (suser_sname()) FOR [username]
GO
USE [ANTERO]
