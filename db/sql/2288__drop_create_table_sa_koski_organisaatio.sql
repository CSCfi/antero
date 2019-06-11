USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_organisaatio]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_organisaatio]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_organisaatio]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_organisaatio](
	[organisaatio_oid] [varchar](max) NULL,
	[nimi] [varchar](max) NULL,
	[organisaatiotyypit] [varchar](max) NULL,
	[oppilaitostyyppi] [varchar](max) NULL,
	[oppilaitosnumero] [varchar](max) NULL,
	[kotipaikka] [varchar](max) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_koski_organisaatio] ADD  CONSTRAINT [DF__sa_koski_organisaatio_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_organisaatio] ADD  CONSTRAINT [DF__sa_koski_organisaatio_username]  DEFAULT (suser_sname()) FOR [username]
GO
USE [ANTERO]
