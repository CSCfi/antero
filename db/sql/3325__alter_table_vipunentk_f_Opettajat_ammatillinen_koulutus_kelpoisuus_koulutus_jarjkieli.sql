USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli]    Script Date: 21.2.2020 22:00:52 ******/
DROP TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli]    Script Date: 21.2.2020 22:00:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[pääasiallinen_koulutusaste_id] [int] NULL,
	[erityisopetus] [int] NULL,
	[opinto_ohjaus] [int] NULL,
	[valma] [int] NULL,
	[telma] [int] NULL,
	[mamu] [int] NULL,
	[ammpk_valmistava] [int] NULL,
	[kotitalousopetus] [int] NULL,
	[kelp_amm] [int] NULL,
	[kelp_yht] [int] NULL,
	[kelp_opo] [int] NULL,
	[kelp_erope] [int] NULL,
	[kelp_valm] [int] NULL,
	[kelp_muu] [int] NULL,
	[eikelp_tehtavaan] [int] NULL,
	[kelp_tehtavaan_tyyppi] [int] NULL,
	[eikelp_paa] [int] NULL,
	[eikelp_pedag] [int] NULL,
	[eikelp_tyokok] [int] NULL,
	[eikelp_tieto_puuttuu] [int] NULL,
	[muukelp] [int] NULL,
	[muukelp_amm] [int] NULL,
	[muukelp_yht] [int] NULL,
	[muukelp_opo] [int] NULL,
	[muukelp_erope] [int] NULL,
	[muukelp_valm] [int] NULL,
	[muukelp_muu] [int] NULL,
	[opettajan_eniten_opettama_ala_id] [int] NULL,
	[opettajan_eniten_opettama_aine_id] [int] NULL,
	[opettajan_koulutus_id] [int] NULL,
	[koul_jarj_koko] [int] NULL,
	[koul_jarj_koko_ei_oppis_id] [int] NULL,
	[koul_jarj_koko_oppis_id] [int] NULL,
	[koul_jarj_kieli_id] [int] NULL,
	[koul_jarj_maakunta_id] [int] NULL,
	[oppilaitoksen_maakunta_id] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]