USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]    Script Date: 27.8.2025 12.03.58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]
GO

/****** Object:  Table [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]    Script Date: 27.8.2025 12.03.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen](
	[aloitusvuosi] [int] NULL,
	[tutkinnon_suoritusvuosi] [int] NULL,
	[vaihtovuosi] [int] NULL,
	[d_kalenteri_vaihto_alkanut_id] [bigint] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[korkeakoulun_lyhenne] [nvarchar](100) NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_aloittaessa_id] [bigint] NULL,
	[d_ika_valmistuessa_id] [bigint] NULL,
	[opintopisteet_vaihdossa] [float] NULL,
	[opintopisteet_yhteensa] [float] NULL,
	[tavoiteajassa_valmistunut] [smallint] NULL,
	[enintaan_12kk_yli_tavoitteen] [smallint] NULL,
	[yli_12kk_tavoitteesta] [smallint] NULL,
	[on_aiempi_tutkinto] [smallint] NULL,
	[vaihtojakso] [int] NOT NULL,
	[vaihtolukuvuoden_jarjestysluku] [int] NULL,
	[vaihtolukukauden_jarjestysluku] [int] NULL,
	[opiskelijaAvain] [varchar](200) NULL,
	[opiskeluoikeusAvain] [varchar](300) NULL,
	[avain] [varchar](500) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](200) NULL,
	[source] [varchar](200) NOT NULL
) ON [PRIMARY]
GO


