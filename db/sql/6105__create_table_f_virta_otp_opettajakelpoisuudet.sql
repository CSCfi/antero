USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opettajakelpoisuudet]') AND type in (N'U'))

BEGIN

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
	[d_virta_patevyydet_id] [bigint] NULL,
	[d_opettajapatevyys_suoritustapa_id] [int] NOT NULL,
	[kelpoinen] [int] NOT NULL,
	[patevyysryhma] [nvarchar](150) NULL,
	[aine] [nvarchar](200) NULL,
	[laajuus] [nvarchar](4000) NULL,
	[kelpoisuuksien_maara] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

