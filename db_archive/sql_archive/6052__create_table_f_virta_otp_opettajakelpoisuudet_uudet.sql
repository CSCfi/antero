USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opettajakelpoisuudet_uudet]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[f_virta_otp_opettajakelpoisuudet_uudet](
	[tilastovuosi] [int] NULL,
	[patevyyden_vuosi] [int] NOT NULL,
	[tutkinnon_vuosi] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_koulutusluokitus_korkein_tutkinto_id] [int] NULL,
	[d_organisaatioluokitus_kelpoisuus_id] [int] NULL,
	[d_organisaatioluokitus_tutkinto_id] [int] NULL,
	[d_opettajapatevyys_kaikki_id] [int] NULL,
	[d_opettajapatevyys_id] [int] NULL,
	[d_virta_patevyydet_id] [int] NULL,
	[d_opettajapatevyys_suoritustapa_id] [int] NULL,
	[kelpoinen] [int] NULL,
	[patevyys_ryhma] [varchar](50) NULL,
	[laajuus] [varchar](50) NULL,
	[ainekelpoisuuksien_maara] [varchar](50) NULL,
	[lkm] [int] NOT NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]