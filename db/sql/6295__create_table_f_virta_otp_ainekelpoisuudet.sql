USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet]    Script Date: 8.7.2022 11:03:28 ******/
DROP TABLE IF EXISTS [dw].[f_virta_otp_ainekelpoisuudet]
GO

/****** Object:  Table [dw].[f_virta_otp_ainekelpoisuudet]    Script Date: 8.7.2022 11:03:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_ainekelpoisuudet](
	[kelpoisuuden_vuosi] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [bigint] NULL,
	[d_organisaatioluokitus_korkein_tutkinto_id] [bigint] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[d_ainekelpoisuus_id] [bigint] NULL,
	[laajuus] [varchar](8000) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]