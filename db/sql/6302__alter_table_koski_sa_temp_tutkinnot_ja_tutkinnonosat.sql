USE [Koski_SA]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 18.7.2022 14:00:56 ******/
DROP TABLE IF EXISTS [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 18.7.2022 14:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutustoimija_oid_hist] [varchar](255) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[ylempi_opiskeluoikeus_oid] [varchar](150) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[arviointi_paiva] [datetime] NULL,
	[arviointi_paiva_muokattu] [datetime] NULL,
	[arviointi_paiva_muokattu_kuori] [datetime] NULL,
	[usean_tutkinnon_tutkinnonosa] [int] NULL,
	[usean_tutkinnon_tutkinnonosa_usea_kustannusryhma] [int] NULL,
	[minimi_kustannusryhma] [int] NULL,
	[yhteinen_tutkinnon_osa] [int] NOT NULL,
	[kuuluu_kaatoluokkaan] [int] NOT NULL,
	[koulutus_moduuli_laajuus_alle_yhden] [int] NOT NULL,
	[koulutusmoduuli_koodiarvo] [varchar](150) NULL,
	[koulutusmoduuli_koodiarvo_paataso] [varchar](6) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [int] NULL,
	[laajuus_puuttuu_eperusteista] [int] NOT NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[suorittaa_koko_tutkintoa] [int] NULL,
	[osaamisalat] [varchar](38) NULL,
 CONSTRAINT [PK_temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE ANTERO