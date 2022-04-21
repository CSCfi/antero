USE [ANTERO]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus]    Script Date: 21.4.2022 11:32:39 ******/
DROP TABLE [sa].[virta_opettajakelpoisuus]
GO

/****** Object:  Table [sa].[virta_opettajakelpoisuus]    Script Date: 21.4.2022 11:32:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[virta_opettajakelpoisuus](
	[henkilo] [int] NULL,
	[opiskelija_avain_org] [nvarchar](110) NOT NULL,
	[ika] [int] NULL,
	[sukupuoli] [smallint] NULL,
	[patevyyskoodi] [nvarchar](20) NOT NULL,
	[patevyysnimi] [nvarchar](200) NOT NULL,
	[kelpoisuus_koodi] [nvarchar](50) NULL,
	[kelpoisuus_koodi_kaikki_kelpoisuusvuosi] [varchar](30) NULL,
	[kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet] [varchar](30) NULL,
	[kelpoisuus_vuosi] [int] NULL,
	[kelpoisuuden_kk] [nvarchar](8) NOT NULL,
	[kelpoisuuden_organisaatiokoodi] [varchar](10) NULL,
	[korkeimman_tutkinnon_vuosi] [int] NULL,
	[korkeimman_tutkinnon_koulutuskoodi] [varchar](6) NULL,
	[korkeimman_tutkinnon_organisaatiokoodi] [varchar](20) NULL,
	[sektori] [varchar](5) NULL,
	[vuosi_patevyys] [int] NOT NULL,
	[vuosi_pedagogiset] [int] NULL,
	[vuosi_tutkinto] [int] NULL,
	[suoritustapa] [int] NOT NULL,
	[kelpoisuuksien_maara] [int] NULL,
	[aine] [nvarchar](200) NULL,
	[laajuus] [nvarchar](4000) NULL,
	[patevyysryhma] [nvarchar](150) NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY]

GO


USE [ANTERO]