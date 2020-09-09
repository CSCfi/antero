USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]    Script Date: 26.2.2020 21:02:51 ******/
DROP TABLE IF EXISTS [dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]
GO

/****** Object:  Table [dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]    Script Date: 26.2.2020 21:02:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine](
	[tilastointivuosi] [nvarchar](4) NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[tyosuhteen_luonne_id] [int] NULL,
	[tehtavatyyppi_id] [int] NULL,
	[kelpoisuus_kunnossa_id] [int] NULL,
	[tutkinto_puuttuu_id] [int] NULL,
	[pedagogiset_opinnot_puuttuu_id] [int] NULL,
	[paaasiallinen_taso_id] [int] NULL,
	[paaasiallinen_ala_id] [int] NULL,
	[paaasiallinen_aste_id] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[oppilaitoksen_maakunta_id] [int] NULL,
	[oppilaitoksen_kuntaryhmitys] [nvarchar](2) NULL,
	[ika_id] [int] NULL,
	[koko_osa_aikainen_id] [int] NULL,
	[osa_aikaisuuden_syy_id] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]