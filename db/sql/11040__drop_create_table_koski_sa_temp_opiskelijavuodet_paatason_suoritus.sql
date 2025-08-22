USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paatason_suoritus]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_paatason_suoritus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_paatason_suoritus](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[tutkinto_koodiarvo] [varchar](max) NULL,
	[osaamisala_koodiarvo] [varchar](max) NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[koulutusluokitus_koodi] [varchar](max) NULL,
	[kustannusryhma_oa] [nvarchar](10) NULL,
	[kustannusryhma_tutk] [nvarchar](10) NULL,
	[kustannusryhma_oa_uusi] [nvarchar](10) NULL,
	[kustannusryhma_tutk_uusi] [nvarchar](10) NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[perusteenDiaarinumero] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
