USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_ytj_ytunnus_virheet]    Script Date: 10.1.2022 10:50:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
	(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ytj_ytunnus_virheet]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_ytj_ytunnus_virheet](
		[ytunnus] [varchar](20) NULL,
		[lataukset] [int] NOT NULL,
		[date_created] [datetime] NOT NULL,
		[last_updated] [datetime] NOT NULL,
		[username] [nvarchar](30) NULL
	) ON [PRIMARY]



	ALTER TABLE [sa].[sa_ytj_ytunnus_virheet] ADD  CONSTRAINT [DF__sa_ytj_ytunnus_virheet_lataukset]  DEFAULT ((1)) FOR [lataukset]

	ALTER TABLE [sa].[sa_ytj_ytunnus_virheet] ADD  CONSTRAINT [DF__sa_ytj_ytunnus_virheet_date_created]  DEFAULT (getdate()) FOR [date_created]

	ALTER TABLE [sa].[sa_ytj_ytunnus_virheet] ADD  CONSTRAINT [DF__sa_ytj_ytunnus_virheet_last_updated]  DEFAULT (getdate()) FOR [last_updated]

	ALTER TABLE [sa].[sa_ytj_ytunnus_virheet] ADD  CONSTRAINT [DF__sa_ytj_ytunnus_virheet_username]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]
