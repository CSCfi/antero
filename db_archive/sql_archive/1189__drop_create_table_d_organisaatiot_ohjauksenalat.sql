--
--  create table d_organisaatiot_ohjauksen_alat
--
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='d_organisaatiot_ohjauksen_alat')

BEGIN
DROP TABLE [dw].[d_organisaatiot_ohjauksen_alat]
END
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='d_organisaatiot_ohjauksen_alat')

BEGIN

CREATE TABLE [dw].[d_organisaatiot_ohjauksen_alat]
 (
	[id] [int] IDENTITY(0,1) NOT NULL,
	[Vuosi] [int] NOT NULL,
	[korkeakoulu_koodi]	[varchar](10) NOT NULL,
	[alayksikko_koodi]	[varchar](100) NOT NULL,
	[ohjauksen_ala_koodi]	[varchar](3) NOT NULL,
	[jyvitys]	[varchar](10) NOT NULL,
	[max_100_%]	[varchar](5) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	CONSTRAINT [PK__d_organisaatiot_ohjauksen_alat] PRIMARY KEY CLUSTERED
	(
	[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[d_organisaatiot_ohjauksen_alat] ADD  CONSTRAINT [DF_d_organisaatiot_ohjauksen_alat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_organisaatiot_ohjauksen_alat] ADD  CONSTRAINT [DF_d_organisaatiot_ohjauksen_alat_username]  DEFAULT (suser_sname()) FOR [username]
GO

ALTER TABLE [dw].[d_organisaatiot_ohjauksen_alat] ADD [jarjestys_korkeakoulu_koodi] AS (case when [korkeakoulu_koodi]=(-1) then '99999' else CONVERT([varchar](10),[korkeakoulu_koodi]) end)
GO
ALTER TABLE [dw].[d_organisaatiot_ohjauksen_alat] ADD [jarjestys_alayksikko_koodi]  AS (case when [alayksikko_koodi]=(-1) then 'ZzZzZ' else CONVERT([varchar](100),[alayksikko_koodi]) end)
GO
ALTER TABLE [dw].[d_organisaatiot_ohjauksen_alat] ADD [jarjestys_ohjauksen_ala_koodi]AS (case when [ohjauksen_ala_koodi]=(-1) then '999' else CONVERT([varchar](3),[ohjauksen_ala_koodi]) end)
GO
