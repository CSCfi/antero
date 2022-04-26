USE [KOSKI_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[valpas_oppivelvollisuuden_keskeytys]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[sa_valpas_oppivelvollisuuden_keskeytys]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_valpas_oppivelvollisuuden_keskeytys]') AND type in (N'U'))

BEGIN
	CREATE TABLE [sa].[sa_valpas_oppivelvollisuuden_keskeytys](
		[id] INT IDENTITY(1,1) NOT NULL,
		[uuid] VARCHAR(200) NULL,
		[oppija_oid] VARCHAR(200) NULL,
		[alku] DATETIME NULL,
		[loppu] DATETIME NULL,
		[luotu] DATETIME NULL,
		[tekijä_oid] VARCHAR(200) NULL,
		[tekijä_organisaatio_oid] VARCHAR(200) NULL,
		[peruttu] BIT NULL,
		[source] VARCHAR(500) NULL,
		[loadtime] DATETIME NULL,
		[username] VARCHAR(30) NULL,
	 CONSTRAINT [PK__sa_valpas_oppivelvollisuuden_keskeytys] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END

GO

ALTER TABLE [sa].[sa_valpas_oppivelvollisuuden_keskeytys] ADD  CONSTRAINT [DF__sa_valpas_oppivelvollisuuden_keskeytys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_valpas_oppivelvollisuuden_keskeytys] ADD  CONSTRAINT [DF__sa_valpas_oppivelvollisuuden_keskeytys__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]
