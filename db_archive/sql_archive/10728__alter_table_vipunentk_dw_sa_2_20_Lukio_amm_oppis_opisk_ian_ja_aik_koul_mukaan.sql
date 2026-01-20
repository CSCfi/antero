USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 25.3.2025 17.02.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]

GO

CREATE TABLE [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oltyp] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulk_opintoala] [nvarchar](6) NULL,
	[koulk_koulutusala] [nvarchar](6) NULL,
	[koulk_koulutusaste] [nvarchar](6) NULL,
	[koulk_koulutusala_taso2] [nvarchar](6) NULL,
	[koulk_koulutusala_taso1] [nvarchar](6) NULL,
	[koulk_koulutusaste_taso2] [nvarchar](6) NULL,
	[koulk_koulutusaste_taso1] [nvarchar](6) NULL,
	[aikoul] [nvarchar](1) NULL,
	[tutktav] [nvarchar](1) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[halla] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](1) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[olosyys] [nvarchar](1) NULL,
	[ylsivx] [nvarchar](1) NULL,
	[peruskx] [nvarchar](1) NULL,
	[oalapex] [nvarchar](2) NULL,
	[oastepex] [nvarchar](1) NULL,
	[oalapeux] [nvarchar](3) NULL,
	[oalapeux_koulutusala] [nvarchar](3) NULL,
	[oastpeux] [nvarchar](2) NULL,
	[iscfinarrow_pex] [nvarchar](3) NULL,
	[kaste_t2_pex] [nvarchar](2) NULL,
	[ammvupe] [nvarchar](4) NULL,
	[nayttox] [nvarchar](1) NULL,
	[oppispex] [nvarchar](1) NULL,
	[lisakx] [nvarchar](1) NULL,
	[oalalix] [nvarchar](2) NULL,
	[oastelix] [nvarchar](1) NULL,
	[oalaliux] [nvarchar](3) NULL,
	[oalaliux_koulutusala] [nvarchar](3) NULL,
	[oastliux] [nvarchar](2) NULL,
	[iscfinarrow_lix] [nvarchar](3) NULL,
	[kaste_t2_lix] [nvarchar](2) NULL,
	[ammvuli] [nvarchar](4) NULL,
	[oppislix] [nvarchar](1) NULL,
	[alempikax] [nvarchar](1) NULL,
	[oalaakx] [nvarchar](2) NULL,
	[oasteakx] [nvarchar](1) NULL,
	[oalauakx] [nvarchar](3) NULL,
	[oalauakx_koulutusala] [nvarchar](3) NULL,
	[oasteuakx] [nvarchar](2) NULL,
	[iscfinarrow_akx] [nvarchar](3) NULL,
	[kaste_t2_akx] [nvarchar](2) NULL,
	[svuosiak] [nvarchar](4) NULL,
	[ylempikax] [nvarchar](1) NULL,
	[oalaykx] [nvarchar](2) NULL,
	[oasteykx] [nvarchar](1) NULL,
	[oalauykx] [nvarchar](3) NULL,
	[oalauykx_koulutusala] [nvarchar](3) NULL,
	[oasteuykx] [nvarchar](2) NULL,
	[iscfinarrow_ykx] [nvarchar](3) NULL,
	[kaste_t2_ykx] [nvarchar](2) NULL,
	[svuosiyk] [nvarchar](4) NULL,
	[askun] [nvarchar](3) NULL,
	[syntv] [nvarchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](100) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


