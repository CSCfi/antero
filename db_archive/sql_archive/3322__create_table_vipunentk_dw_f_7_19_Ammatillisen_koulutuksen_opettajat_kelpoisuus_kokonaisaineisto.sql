USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:53:28 ******/
DROP TABLE IF EXISTS [dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  Table [dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:53:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[a_okieli] [nvarchar](2) NULL,
	[a_oltyp] [nvarchar](2) NULL,
	[a_maakunta] [nvarchar](2) NULL,
	[a_h11] [nvarchar](2) NULL,
	[a_sp] [nvarchar](3) NULL,
	[a_ika] [nvarchar](10) NULL,
	[a_ala] [nvarchar](2) NULL,
	[a_aine] [nvarchar](3) NULL,
	[a_ala2] [nvarchar](2) NULL,
	[a_aine2] [nvarchar](3) NULL,
	[a_ala3] [nvarchar](2) NULL,
	[a_aine3] [nvarchar](3) NULL,
	[tietolahde] [nvarchar](20) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]