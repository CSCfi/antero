USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_koodisto_koodi]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_koodisto_koodi]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_koodisto_koodi]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_koodisto_koodi](
	[koodisto_uri] [varchar](max) NULL,
	[koodiarvo] [varchar](max) NULL,
	[nimi] [varchar](max) NULL,
	[imp_created] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_koski_koodisto_koodi] ADD  CONSTRAINT [DF__sa_koski_koodisto_koodi_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO
-- missing from the table as does source
--ALTER TABLE [sa].[sa_koski_koodisto_koodi] ADD  CONSTRAINT [DF__sa_koski_koodisto_koodi_username]  DEFAULT (suser_sname()) FOR [username]
--GO
USE [ANTERO]
