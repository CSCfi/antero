USE [ANTERO]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus]    Script Date: 6.5.2022 13:33:54 ******/
DROP TABLE [sa].[virta_opettajakelpoisuus]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus]    Script Date: 6.5.2022 13:33:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[virta_opettajakelpoisuus](
	[henkilo] [int] NULL,
	[ika] [int] NULL,
	[sukupuoli] [smallint] NULL,
	[kelpoisuus_koodi] [nvarchar](50) NULL,
	[kelpoisuus_koodi_kaikki_kelpoisuusvuosi] [varchar](30) NULL,
	[kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet] [varchar](30) NULL,
	[kelpoisuus_vuosi] [int] NULL,
	[kelpoisuuden_organisaatiokoodi] [varchar](10) NULL,
	[korkeimman_tutkinnon_vuosi] [int] NULL,
	[korkeimman_tutkinnon_koulutuskoodi] [varchar](6) NULL,
	[korkeimman_tutkinnon_organisaatiokoodi] [varchar](10) NULL,
	[sektori] [varchar](5) NULL,
	[vuosi_patevyys] [int] NULL,
	[vuosi_tutkinto] [int] NULL,
	[suoritustapa] [int] NOT NULL,
	[kelpoisuuksien_maara] [int] NULL,
	[yli_asetuksen] [int] NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY]

GO

USE [ANTERO]