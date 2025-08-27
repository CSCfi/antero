USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]    Script Date: 13.1.2025 12.53.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]
GO

CREATE TABLE [dbo].[f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[aineisto] [nvarchar](50) NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[sektori] [nvarchar](1) NULL,
	[sektori_id] [int] NULL,
	[ikar7] [nvarchar](2) NULL,
	[ikar7_id] [int] NULL,
	[sp] [nvarchar](2) NULL,
	[sp_id] [int] NULL,
	[kansalr1] [nvarchar](2) NULL,
	[kansalr1_id] [int] NULL,
	[syntyp2] [nvarchar](2) NULL,
	[syntyp2_id] [int] NULL,
	[ophal] [nvarchar](2) NULL,
	[ophal_id] [int] NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[rahlahde_v2_id] [int] NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[iscfi2013_id] [int] NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[kaste_t2_id] [int] NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](2) NULL,
	[allk_id] [int] NULL,
	[kvopisk] [nvarchar](2) NULL,
	[kvopisk_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


