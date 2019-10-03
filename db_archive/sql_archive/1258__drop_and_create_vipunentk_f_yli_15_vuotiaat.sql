USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 22.2.2018 10:43:09 ******/
DROP TABLE [dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]
GO

/****** Object:  Table [dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 22.2.2018 10:43:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan](
	[tilv] [varchar](4) NULL,
	[aidinkieli_I_id] [int] NULL,
	[aidinkieli_II_id] [int] NULL,
	[alueluokitus_id] [int] NULL,
	[ika_id] [int] NULL,
	[koulutusala_id] [int] NULL,
	[koulutusaste_id] [int] NULL,
	[koulutusala_taso1_id] [int] NULL,
	[koulutusaste_taso2_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]

