USE [ANTERO]
GO

/****** Object:  Table [dw].[f_ovara_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 5.2.2026 10.47.45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]
GO

/****** Object:  Table [dw].[f_ovara_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 5.2.2026 10.47.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot](
	[master_oid] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[d_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_muu_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_muu_tutkinto_id] [int] NULL,
	[muu_alkamispvm] [date] NULL,
	[muu_paattymispvm] [date] NULL,
	[d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_aiempi_tutkinto_id] [int] NULL,
	[aiempi_tutkinto_suorituspvm] [date] NULL,
	[op_oikeus_tai_tutkinto] [int] NOT NULL,
	[ensi_kertaa_hakeva] [int] NOT NULL,
	[vastaanottaa_paikan_3v] [int] NOT NULL,
	[muu_paattymispvm_prio] [date] NULL,
	[muu_oo_koulutusala_taso_1_sama_kuin_hakukohde] [int] NULL,
	[muu_oo_koulutusala_taso_2_sama_kuin_hakukohde] [int] NULL,
	[muu_oo_koulutusala_taso_3_sama_kuin_hakukohde] [int] NULL,
	[muu_oo_koulutusaste_taso_2_sama_kuin_hakukohde] [int] NULL,
	[muu_oo_tavoitetutkinto_sama_kuin_hakukohde] [int] NULL,
	[muu_oo_korkeakoulu_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_koulutusala_taso_1_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_koulutusala_taso_2_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_koulutusala_taso_3_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_koulutusaste_taso_2_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_tavoitetutkinto_sama_kuin_hakukohde] [int] NULL,
	[aiempi_tutk_korkeakoulu_sama_kuin_hakukohde] [int] NULL,
	[tuorein_aiempi_tutkinto_suorituspvm] [date] NULL,
	[tuorein_muu_oo_alkamispvm] [date] NULL,
	[muun_opintooikeuden_vertailu] [int] NULL,
	[aiemman_tutkinnon_vertailu] [int] NULL,
	[loadtime] [date] NULL
) ON [PRIMARY]