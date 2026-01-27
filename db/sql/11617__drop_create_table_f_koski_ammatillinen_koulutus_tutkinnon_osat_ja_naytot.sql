USE [ANTERO]
GO



/****** Object:  Table [dw].[f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]    Script Date: 27.1.2026 16.55.28 ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]
GO


/****** Object:  Table [dw].[f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]    Script Date: 27.1.2026 16.55.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
	
CREATE TABLE [dw].[f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot](
	[arviointi_paiva] [datetime] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[osasuoritus_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kytkin_oppivelvollinen_id] [int] NULL,
	[d_koski_tutkinnon_osat_id] [int] NULL,
	[d_kytkin_pakollinen_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_paikallinen_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_tunnustettu_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_yhteinen_tutkinnon_osa_id] [int] NULL,
	[d_kytkin_yhteinen_ammatillinen_valinnainen_tutkinnon_osa_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_koski_suorituksen_tyyppi_id] [bigint] NULL,
	[d_osaamisala_koodisto_id] [int] NULL,
	[d_tutkintonimike_id] [int] NULL,
	[d_suorituskieli_id] [bigint] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kytkin_tyossaoppimisen_yhteydessa_id] [int] NULL,
	[d_nayton_arvioinnista_paattaneet_id] [int] NULL,
	[d_nayton_suorituspaikka_id] [bigint] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[source] [varchar](200) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](200) NULL
) ON [PRIMARY]
GO
