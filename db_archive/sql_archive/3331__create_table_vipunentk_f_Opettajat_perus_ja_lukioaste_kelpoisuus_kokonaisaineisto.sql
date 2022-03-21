USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto]    Script Date: 1.4.2020 12:33:07 ******/
DROP TABLE IF EXISTS [dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  Table [dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto]    Script Date: 1.4.2020 12:33:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[oppilaitostyyppi_id] [int] NULL,
	[kuntaryhmitys_oppilaitos_id] [int] NULL,
	[maakunta_oppilaitos_id] [int] NULL,
	[tehtavatyyppi_perusopetuksessa_id] [int] NULL,
	[kelp_tehtavaan_id] [int] NULL,
	[kelp_tehtavaan] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[ika_id] [int] NULL,
	[opettajan_ensin_ilmoitettu_aine_id] [int] NULL,
	[opettajan_toiseksi_ilmoitettu_aine_id] [int] NULL,
	[opettajan_kolmanneksi_ilmoitettu_aine_id] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]