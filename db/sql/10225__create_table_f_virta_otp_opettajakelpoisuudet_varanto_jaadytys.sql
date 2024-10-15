USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]    Script Date: 15.10.2024 9:52:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]
GO

/****** Object:  Table [dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys]    Script Date: 15.10.2024 9:52:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet_varanto_jaadytys](
	[KelpoisuusID] [bigint] NULL,
	[henkilo] [int] NULL,
	[d_kelpoisuus_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_tilastovuonna_id] [bigint] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [bigint] NULL,
	[d_kytkin_yli_asetuksen_id] [int] NULL,
	[d_kytkin_yksi_org_id] [int] NULL,
	[d_kytkin_paatelty_tutkinnosta_id] [int] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[suoritustapa] [int] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kelpoisuuden_vuosi] [int] NULL,
	[korkeimman_tutkinnon_vuosi] [int] NULL,
	[priorisoitu_kelpoisuus] [int] NOT NULL,
	[source] [varchar](53) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]
GO

USE [ANTERO]