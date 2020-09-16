USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:29:03 ******/
DROP TABLE IF EXISTS [dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  Table [dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:29:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_oltyp] [nvarchar](2) NULL,
	[p_virka] [nvarchar](2) NULL,
	[p_aine] [nvarchar](2) NULL,
	[p_aine2] [nvarchar](2) NULL,
	[p_aine3] [nvarchar](2) NULL,
	[p_sp] [nvarchar](10) NULL,
	[p_maakunta] [varchar](2) NULL,
	[p_okunryh] [nvarchar](10) NULL,
	[p_ika] [nvarchar](10) NULL,
	[p_kelpu] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]