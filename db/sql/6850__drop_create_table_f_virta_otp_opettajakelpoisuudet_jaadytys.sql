USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet_jaadytys]    Script Date: 10.1.2023 13:48:14 ******/
DROP TABLE IF EXISTS [dw].[f_virta_otp_opettajakelpoisuudet_jaadytys]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet_jaadytys]    Script Date: 10.1.2023 13:48:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet_jaadytys](
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
	[suoritustapa] [int] NOT NULL,
	[suorituksen_koodi] [varchar](30) NULL,
	[Vuosi] [int] NULL,
	[vuosi_korkein_tutkinto] [int] NULL,
	[Status] [varchar](36) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]

