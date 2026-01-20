USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_ammatillisen_koulutuksen_arvosanat]    Script Date: 30.7.2025 8.11.52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_ammatillisen_koulutuksen_arvosanat]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_ammatillisen_koulutuksen_arvosanat]
GO

/****** Object:  Table [dw].[f_koski_ammatillisen_koulutuksen_arvosanat]    Script Date: 30.7.2025 8.11.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_ammatillisen_koulutuksen_arvosanat](
	[koulutuksen_paattymisvuosi] [int] NULL,
	[tutkinnon_osan_suoritusvuosi] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[yto] [int] NULL,
	[osasuoritus_id] [bigint] NULL,
	[osasuoritus_id_tutkinnon_osa] [bigint] NULL,
	[arvosana] [varchar](max) NULL,
	[laajuus] [float] NULL,
	[laajuus_tutkinnon_osa] [float] NULL,
	[diaarinumero] [varchar](255) NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[tutkinnonosa] [varchar](max) NULL,
	[tutkinnonosan_osaalue] [varchar](max) NULL,
	[d_kytkin_pakollinen_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_paikallinen_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_tunnustettu_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_pakollinen_tutkinnon_osan_osaalue_id] [int] NULL,
	[d_kytkin_paikallinen_tutkinnon_osan_osaalue_id] [int] NULL,
	[d_kytkin_tunnustettu_tutkinnon_osan_osaalue_id] [int] NULL,
	[d_opintojen_rahoitus_rahoitusmuoto_id] [int] NULL,
	[d_kytkin_koulutussopimus_id] [int] NULL,
	[d_kytkin_oppisopimus_id] [int] NULL,
	[d_kytkin_koulutusvienti_id] [int] NULL,
	[erityisopetus] [int] NOT NULL,
	[koulutussopimus_osuus] [float] NULL,
	[oppisopimus_osuus] [float] NULL,
	[d_ika_opiskeluoikeuden_alku_id] [bigint] NULL,
	[d_ika_opiskeluoikeuden_loppu_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kytkin_oppivelvollinen_id] [int] NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[source] [varchar](200) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


