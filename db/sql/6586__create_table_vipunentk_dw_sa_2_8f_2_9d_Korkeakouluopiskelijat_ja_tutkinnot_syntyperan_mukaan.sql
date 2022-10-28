USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]    Script Date: 28.10.2022 14:46:51 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]
GO

/****** Object:  Table [dbo].[sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]    Script Date: 28.10.2022 14:46:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[ikar7] [nvarchar](2) NULL,
	[syntyp2] [nvarchar](2) NULL,
	[kansalr1] [nvarchar](2) NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[ophal] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aineisto] [nvarchar](50) NULL
) ON [PRIMARY]

GO


