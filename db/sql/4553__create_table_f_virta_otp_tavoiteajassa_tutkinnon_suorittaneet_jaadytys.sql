USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys](
	[d_ika_id] [bigint] NULL,
	[d_ika_tutkinnon_alkaessa_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_koulutuksen_kieli_id] [bigint] NULL,
	[d_koulutuksen_kunta_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_tutkintoryhma_id] [int] NULL,
	[d_rahoituslahde_id] [int] NULL,
	[d_ohjauksen_ala_id] [int] NULL,
	[d_kalenteri_tutkinnon_suoritus_id] [bigint] NULL,
	[aloituslukuvuosi] [int] NULL,
	[tutkinnon_tavoiteaika_vuosia] [float] NULL,
	[tutkinnon_tavoiteaika_lukukausia] [int] NULL,
	[tutkinnon_tavoiteaika_kuukausia] [int] NULL,
	[aiempi_korkeakoulututkinto_fi] [varchar](10) NULL,
	[tutkinto_suoritettu_maaraajassa_fi] [varchar](10) NULL,
	[enintaan_12_kk_maaraajan_jalkeen_fi] [varchar](10) NULL,
	[yli_12_kk_maaraajan_jalkeen_fi] [varchar](10) NULL,
	[aiempi_korkeakoulututkinto_sv] [varchar](18) NULL,
	[tutkinto_suoritettu_maaraajassa_sv] [varchar](18) NULL,
	[enintaan_12_kk_maaraajan_jalkeen_sv] [varchar](18) NULL,
	[yli_12_kk_maaraajan_jalkeen_sv] [varchar](18) NULL,
	[aiempi_korkeakoulututkinto_en] [varchar](19) NULL,
	[tutkinto_suoritettu_maaraajassa_en] [varchar](19) NULL,
	[enintaan_12_kk_maaraajan_jalkeen_en] [varchar](19) NULL,
	[yli_12_kk_maaraajan_jalkeen_en] [varchar](19) NULL,
	[tutkinnon_laajuus] [int] NULL,
	[koulutustyyppi_fi] [varchar](30) NULL,
	[koulutustyyppi_sv] [varchar](30) NULL,
	[koulutustyyppi_en] [varchar](30) NULL,
	[apusarake_tavoiteajassavalmistunut] [smallint] NULL,
	[apusarake_tutkinto_pisteet] [float] NULL,
	[apusarake_aiempitutkinto] [smallint] NULL,
	[apusarake_tutkinto_yli_12] [smallint] NULL,
	[apusarake_tutkinto_enintaan_12] [smallint] NULL,
	[apusarake_rahoitusmalli] [int] NULL,
	[apusarake_henkilokoodi] [varchar](220) NULL
) ON [PRIMARY]

END

GO


