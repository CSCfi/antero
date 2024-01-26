USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[virta_opettajakelpoisuus_uudet]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[virta_opettajakelpoisuus_uudet](
	[vuosi] [int] NULL,
	[opiskelija_avain_org] [varchar](105) NOT NULL,
	[opiskelija_avain] [varchar](100) NULL,
	[sukupuoli_koodi] [varchar](3) NULL,
	[ika] [int] NULL,
	[organisaatio_fi] [nvarchar](255) NULL,
	[organisaatio_koodi] [varchar](5) NULL,
	[patevyys_nro] [nvarchar](1) NULL,
	[patevyys_koodi] [char](2) NULL,
	[kelpoisuus_koodi] [char](2) NULL,
	[kelpoisuus_priorisoitu] [nvarchar](50) NULL,
	[kelpoisuus_koodi_kaikki] [varchar](30) NULL,
	[kelpoisuus_koodi_kaikki_myos_aiemmat] [varchar](30) NULL,
	[patevyys_selite] [varchar](512) NULL,
	[patevyys_vuosi] [int] NULL,
	[patevyys_oppilaitos] [varchar](6) NULL,
	[ainekelpoisuuksien_maara] [int] NULL,
	[korkein_tutkinto] [varchar](6) NULL,
	[korkein_tutkinto_vuosi] [int] NULL,
	[korkein_tutkinto_oppilaitos] [varchar](6) NULL,
	[suoritustapa] [int] NOT NULL,
	[tutkinto_suoritettu] [int] NOT NULL,
	[pedagoginen_suoritettu] [int] NOT NULL,
	[pedagoginen_vuosi] [int] NULL,
	[patevyys_hyvaksytaan] [int] NOT NULL,
	[patevyys_ryhma] [nvarchar](150) NULL,
	[laajuus] [varchar](28) NULL,
	[rnk_kelpoisuusryhma] [bigint] NULL
) ON [PRIMARY]


END

GO

USE [ANTERO]