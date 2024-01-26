USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet]    Script Date: 6.5.2022 13:35:21 ******/
DROP TABLE [dw].[f_virta_otp_opettajakelpoisuudet]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet]    Script Date: 6.5.2022 13:35:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet](
	[tilastovuosi] [int] NULL,
	[korkeimman_tutkinnon_vuosi] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_koulutusluokitus_viimeisin_tutkinto_id] [int] NULL,
	[d_organisaatio_kelpoisuus_id] [bigint] NULL,
	[d_organisaatio_tutkinto_id] [bigint] NULL,
	[d_opettajapatevyys_id] [bigint] NULL,
	[d_opettajapatevyys_kaikki_id] [bigint] NULL,
	[d_opettajapatevyys_suoritustapa_id] [int] NOT NULL,
	[kelpoinen] [int] NOT NULL,
	[kelpoisuuksien_maara] [int] NULL,
	[d_kytkin_yli_asetuksen_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]