USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_amm]    Script Date: 13.3.2026 13.02.20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_oiva_luvat_amm]') AND type in (N'U'))
DROP TABLE [dw].[f_oiva_luvat_amm]
GO

/****** Object:  Table [dw].[f_oiva_luvat_amm]    Script Date: 13.3.2026 11.01.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_amm](
	[d_kalenteri_tarkastelupaiva] [bigint] NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_alueluokitus_toiminta_alue_kunta_id] [int] NULL,
	[d_alueluokitus_toiminta_alue_maakunta_id] [int] NULL,
	[d_kytkin_toiminta_alue_koko_maa_id] [int] NULL,
	[d_kytkin_toiminta_alue_koko_maakunta_id] [int] NULL,
	[d_koulutusluokitus_tutkinto_id] [int] NULL,
	[d_osaamisala_tutkinto_id] [int] NULL,
	[d_kieli_tutkinto_id] [bigint] NULL,
	[d_kieli_tutkinto_ja_opetus_id] [bigint] NULL,
	[d_osaamisala_luvan_rajoite_id] [int] NULL,
	[d_oppilaitoksenopetuskieli_id] [int] NULL,
	[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_id] [int] NULL,
	[d_oivakoulutukset_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[opiskelijavuodet] [int] NULL,
	[opiskelijavuodet_sisa] [int] NULL,
	[opiskelijavuodet_vet] [int] NULL,
	[opv_enim_ei_oppivelvolliset] [int] NULL
) ON [PRIMARY]
GO
