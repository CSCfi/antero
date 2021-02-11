USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]    Script Date: 20.1.2021 18:19:31 ******/
DROP TABLE IF EXISTS [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]
GO

/****** Object:  Table [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]    Script Date: 20.1.2021 18:19:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili](
	[tilv] [nvarchar](4) NULL,
	[tunn] [nvarchar](5) NULL,
	[tunn_id] [int] NULL,
	[jarj] [nvarchar](10) NULL,
	[jarj_id] [int] NULL,
	[koultyp] [nvarchar](100) NULL,
	[koultyp_jarjestys] [int] NULL,
	[muuttuja] [nvarchar](50) NOT NULL,
	[muuttuja_arvo] [nvarchar](100) NULL,
	[muuttuja_arvo_jarjestys] [int] NULL,
	[lkm_avain] [nvarchar](10) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO
use antero




