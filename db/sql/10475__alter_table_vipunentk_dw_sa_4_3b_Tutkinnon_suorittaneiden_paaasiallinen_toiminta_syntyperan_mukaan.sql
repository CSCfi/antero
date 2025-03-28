USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]    Script Date: 9.1.2025 16.14.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]
GO

CREATE TABLE [dbo].[sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[suorv] [nvarchar](4) NULL,
	[sp] [nvarchar](2) NULL,
	[kansalr1] [nvarchar](2) NULL,
	[syntyp2] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[kvopisk] [nvarchar](2) NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[kouljat] [nvarchar](2) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja_tr] [nvarchar](2) NULL,
	[ptoim1r6] [nvarchar](2) NULL,
	[maassaolo] [nvarchar](2) NULL,
	[amas] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO
