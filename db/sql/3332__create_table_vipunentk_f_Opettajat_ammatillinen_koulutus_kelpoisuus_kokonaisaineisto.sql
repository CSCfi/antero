USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto]    Script Date: 1.4.2020 12:36:34 ******/
DROP TABLE IF EXISTS [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto]    Script Date: 1.4.2020 12:36:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[oppilaitostyyppi_id] [int] NULL,
	[oppilaitoksen_maakunta_id] [int] NULL,
	[eikelp_tehtavaan_id] [int] NULL,
	[eikelp_tehtavaan] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[ika_id] [int] NULL,
	[opettajan_ensin_ilmoitettu_ala_id] [int] NULL,
	[opettajan_ensin_ilmoitettu_aine_id] [int] NULL,
	[opettajan_toiseksi_ilmoitettu_ala_id] [int] NULL,
	[opettajan_toiseksi_ilmoitettu_aine_id] [int] NULL,
	[opettajan_kolmanneksi_ilmoitettu_ala_id] [int] NULL,
	[opettajan_kolmanneksi_ilmoitettu_aine_id] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]