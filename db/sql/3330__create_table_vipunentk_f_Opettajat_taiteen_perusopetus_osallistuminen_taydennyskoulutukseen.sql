USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]    Script Date: 25.2.2020 20:20:28 ******/
DROP TABLE IF EXISTS [dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]    Script Date: 25.2.2020 20:20:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[tehtavatyyppi_id] [int] NULL,
	[taydennyskoulutus_osallistuminen] [int] NULL,
	[taydennyskoulutus_osaalue] [int] NULL,
	[taydennyskoulutus_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_kelp_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_kelp_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_tantaja_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_tantaja_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_muu_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_muu_oma_aika] [nvarchar](3) NULL,
	[asiantuntijavaihto_tyoaika] [nvarchar](3) NULL,
	[asiantuntijavaihto_oma_aika] [nvarchar](3) NULL,
	[koulutussuunnitelma] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[oppilaitoksen_maakunta_id] [int] NULL,
	[ika_id] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]