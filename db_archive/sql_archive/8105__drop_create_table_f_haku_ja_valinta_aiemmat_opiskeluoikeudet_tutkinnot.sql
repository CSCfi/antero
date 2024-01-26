USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 27.9.2023 15:36:52 ******/
DROP TABLE [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 27.9.2023 15:36:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot](
	[d_haku_id] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[d_hakuaika_kouta_id] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[hakemus_oid] [varchar](255) NULL,
	[hakutoive] [int] NULL,
	[d_hakukohde_1_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_1_hakukohde_id] [int] NULL,
	[d_aloitussykli_1_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_1_hakukohde_id] [bigint] NULL,
	[d_hakukohde_2_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_2_hakukohde_id] [int] NULL,
	[d_aloitussykli_2_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_2_hakukohde_id] [bigint] NULL,
	[d_hakukohde_3_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_3_hakukohde_id] [int] NULL,
	[d_aloitussykli_3_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_3_hakukohde_id] [bigint] NULL,
	[d_hakukohde_4_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_4_hakukohde_id] [int] NULL,
	[d_aloitussykli_4_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_4_hakukohde_id] [bigint] NULL,
	[d_hakukohde_5_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_5_hakukohde_id] [int] NULL,
	[d_aloitussykli_5_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_5_hakukohde_id] [bigint] NULL,
	[d_hakukohde_6_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_6_hakukohde_id] [int] NULL,
	[d_aloitussykli_6_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_6_hakukohde_id] [bigint] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[henkilo_oid] [varchar](255) NULL,
	[d_ika_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_kytkin_pohjakoulutuksen_maa_id] [int] NULL,
	[d_kytkin_pohjakoulutuksen_maa_priorisoitu_id] [int] NULL,
	[d_pohjakoulutus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[toisen_asteen_koulutuksen_suoritusvuosi] [varchar](20) NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[vastaanottaa_paikan_3v] [int] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_hakukohde_id] [bigint] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_tutkinnon_taso_hakukohde_id] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_koulutuksen_kieli_id] [bigint] NULL,
	[d_opiskelun_laajuus_id] [int] NULL,
	[d_aloitussykli_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_koulutustoimija_hakukohde_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_hakukohde_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_hakukohde_id] [bigint] NULL,
	[d_koulutusluokitus_muu_oo_id] [int] NULL,
	[muu_alkamispvm] [date] NULL,
	[muu_paattymispvm] [date] NULL,
	[muu_paattymispvm_prio] [date] NULL,
	[d_organisaatioluokitus_muu_oo_id] [int] NULL,
	[d_koulutusluokitus_aiempi_tutk_id] [int] NULL,
	[aiempi_tutkinto_suorituspvm] [date] NULL,
	[d_organisaatioluokitus_aiempi_tutk_id] [bigint] NULL,
	[ensi_kertaa_hakeva] [int] NULL,
	[aidosti_ensikertainen] [int] NOT NULL,
	[ensikertaisena_kohdeltava] [int] NOT NULL,
	[op_oikeus_tai_tutkinto] [int] NULL,
	[Valitut2] [int] NOT NULL,
	[Paikan vastaanottaneet2] [int] NOT NULL,
	[Aloittaneet2] [int] NOT NULL,
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
	[aiemman_tutkinnon_vertailu] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]