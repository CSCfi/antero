USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet]    Script Date: 30.8.2022 10:04:06 ******/
DROP TABLE IF EXISTS [dw].[f_virta_otp_ainekelpoisuus]
GO

DROP TABLE IF EXISTS [dw].[f_virta_otp_ainekelpoisuudet]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet]    Script Date: 30.8.2022 10:04:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_ainekelpoisuudet](
	[kelpoisuuden_vuosi] [int] NULL,
	[kelpoisuuden_vuosi2] [int] NULL,
	[kelpoisuuden_vuosi3] [int] NULL,
	[henkilo] [int] NULL,
	[laajuus] [varchar](8000) NULL,
	[d_ika_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [bigint] NULL,
	[d_organisaatioluokitus_kelpoisuus2_id] [bigint] NULL,
	[d_organisaatioluokitus_korkein_tutkinto_id] [bigint] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[d_ainekelpoisuus_id] [bigint] NULL,
	[d_ainekelpoisuus2_id] [bigint] NULL,
	[d_ainekelpoisuus3_id] [bigint] NULL,
	[aine_sektori] [int] NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]
