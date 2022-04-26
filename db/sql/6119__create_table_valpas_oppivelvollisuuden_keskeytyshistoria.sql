USE [KOSKI_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[valpas_oppivelvollisuuden_keskeytyshistoria]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[valpas_oppivelvollisuuden_keskeytyshistoria]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[valpas_oppivelvollisuuden_keskeytyshistoria]') AND type in (N'U'))

BEGIN
	CREATE TABLE [sa].[valpas_oppivelvollisuuden_keskeytyshistoria](
		[id] INT IDENTITY(1,1) NULL,
		[ov_keskeytys_uuid] VARCHAR(100) NULL,
		[muutos_tehty] VARCHAR(100) NULL,
		[muutoksen_tekija] VARCHAR(100) NULL,
		[oppija_oid] VARCHAR(100) NULL,
		[alku] DATETIME NULL,
		[loppu] DATETIME NULL,
		[luotu] DATETIME NULL,
		[tekijä_oid] VARCHAR(100) NULL,
		[tekijä_organisaatio_oid] VARCHAR(100) NULL,
		[peruttu] BIT NULL,
		[source] VARCHAR(500) NULL,
		[loadtime] DATETIME NULL,
		[username] VARCHAR(30) NULL,
	 CONSTRAINT [PK__valpas_oppivelvollisuuden_keskeytyshistoria] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END

GO

ALTER TABLE [sa].[valpas_oppivelvollisuuden_keskeytyshistoria] ADD  CONSTRAINT [DF__valpas_oppivelvollisuuden_keskeytyshistoria__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[valpas_oppivelvollisuuden_keskeytyshistoria] ADD  CONSTRAINT [DF__valpas_oppivelvollisuuden_keskeytyshistoria__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]
