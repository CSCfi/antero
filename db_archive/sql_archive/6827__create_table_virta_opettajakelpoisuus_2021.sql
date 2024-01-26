USE [ANTERO]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus_2021]    Script Date: 4.1.2023 13:35:34 ******/
DROP TABLE IF EXISTS [sa].[virta_opettajakelpoisuus_2021]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus_2021]    Script Date: 4.1.2023 13:35:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[virta_opettajakelpoisuus_2021](
	[henkilo] [int] NULL,
	[ika] [int] NULL,
	[sukupuoli] [smallint] NULL,
	[kelpoisuus_koodi] [nvarchar](50) NULL,
	[kelpoisuus_koodi_kaikki_kelpoisuusvuosi] [varchar](39) NULL,
	[kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet] [varchar](39) NULL,
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