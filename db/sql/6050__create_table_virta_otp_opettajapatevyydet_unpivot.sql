USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[virta_otp_opettajapatevyydet_unpivot]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[virta_otp_opettajapatevyydet_unpivot](
	[opiskelija_avain_org] [varchar](105) NOT NULL,
	[opiskelija_avain] [varchar](100) NULL,
	[vuosi] [int] NULL,
	[sukupuolikoodi] [varchar](3) NULL,
	[ika] [int] NULL,
	[organisaatiokoodi] [varchar](5) NULL,
	[patevyys_nro] [nvarchar](1) NULL,
	[patevyys_koodi] [char](2) NULL,
	[patevyys_selite] [varchar](512) NULL,
	[patevyys_vuosi] [int] NULL,
	[patevyys_oppilaitos] [varchar](6) NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[tutkinto_vuosi] [int] NULL,
	[tutkinto_oppilaitos] [varchar](6) NULL,
	[tutkinnon_yhteydessa] [int] NOT NULL,
	[erillinen] [int] NOT NULL,
	[rnk_tutkinto] [bigint] NULL,
	[rnk_patevyys] [bigint] NULL,
	[patevyysryhma1_koodi] [varchar](3) NULL,
	[patevyysryhma1_fi] [nvarchar](150) NULL,
	[organisaatio_fi] [nvarchar](255) NULL,
	[patevyys_hyvaksytaan] [int] NOT NULL
) ON [PRIMARY]


END

GO

USE [ANTERO]