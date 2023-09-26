USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet_jaadytys]    Script Date: 26.9.2023 13:41:03 ******/
DROP TABLE [dw].[f_virta_otp_ainekelpoisuudet_jaadytys]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet_jaadytys]    Script Date: 26.9.2023 13:41:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_ainekelpoisuudet_jaadytys](
	[kelpoisuuden_vuosi] [int] NULL,
	[kelpoisuuden_vuosi2] [int] NULL,
	[kelpoisuuden_vuosi3] [int] NULL,
	[henkilo] [int] NULL,
	[laajuus] [varchar](8000) NULL,
	[laajuus2] [varchar](8000) NULL,
	[laajuus3] [varchar](8000) NULL,
	[d_ika_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [bigint] NULL,
	[d_organisaatioluokitus_kelpoisuus2_id] [bigint] NULL,
	[d_organisaatioluokitus_kelpoisuus3_id] [bigint] NULL,
	[d_organisaatioluokitus_korkein_tutkinto_id] [bigint] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[d_kytkin_paatelty_tutkinnosta_id] [int] NULL,
	[d_ainekelpoisuus_id] [bigint] NULL,
	[d_ainekelpoisuus2_id] [bigint] NULL,
	[d_ainekelpoisuus3_id] [bigint] NULL,
	[aine_sektori] [int] NOT NULL,
	[suoritustapa] [int] NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]