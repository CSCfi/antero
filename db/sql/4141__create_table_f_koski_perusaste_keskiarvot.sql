USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_perusaste_keskiarvot]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_koski_perusaste_keskiarvot](
	[oppija_oid] [varchar](150) NULL,
	[keskiarvo] [decimal](10, 5) NULL,
	[keskiarvo_lukuaineet] [decimal](10, 5) NULL
) ON [PRIMARY]

END

USE [ANTERO]



