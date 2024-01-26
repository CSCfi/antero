USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet]    Script Date: 23.5.2023 8:38:58 ******/
DROP TABLE [dw].[f_virta_otp_opettajakelpoisuudet]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet]    Script Date: 23.5.2023 8:38:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet](
	[KelpoisuusID] [bigint] NULL,
	[henkilo] [int] NULL,
	[d_kelpoisuus_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [bigint] NULL,
	[d_organisaatioluokitus_korkein_tutkinto_id] [bigint] NULL,
	[d_organisaatioluokitus_suoritus_id] [bigint] NULL,
	[d_kytkin_yli_asetuksen_id] [int] NULL,
	[d_kalenteri_suoritus_pvm_id] [bigint] NULL,
	[d_kytkin_yksi_org_id] [int] NULL,
	[d_kytkin_paatelty_tutkinnosta_id] [int] NULL,
	[suoritustapa] [int] NOT NULL,
	[suorituksen_koodi] [varchar](30) NULL,
	[Vuosi] [int] NULL,
	[vuosi_korkein_tutkinto] [int] NULL,
	[Status] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]