USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]    Script Date: 17.4.2024 11:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]
GO

/****** Object:  Table [dw].[f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]    Script Date: 17.4.2024 11:11:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[d_kytkin_aiempi_korkeakoulututkinto_id] [int] NULL,
	[d_kytkin_tutkinto_suoritettu_maaraajassa_id] [int] NULL,
	[d_kytkin_enintaan_12_kk_maaraajan_jalkeen_id] [int] NULL,
	[d_kytkin_yli_12_kk_maaraajan_jalkeen_id] [int] NULL,
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
	[apusarake_henkilokoodi] [varchar](220) NULL,
	[d_kytkin_aiempi_sama_koulutuskoodi_id] [int] NULL,
	[d_kytkin_kv_vaihto_id] [int] NULL,
	[d_kytkin_lyhyt_kv_vaihto_id] [int] NULL,
	[d_kytkin_pitka_kv_vaihto_id] [int] NULL,
	[d_kytkin_blended_kv_vaihto_id] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]
