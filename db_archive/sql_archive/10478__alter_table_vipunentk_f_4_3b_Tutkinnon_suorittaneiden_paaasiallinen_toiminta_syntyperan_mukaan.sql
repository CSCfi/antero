USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]    Script Date: 9.1.2025 16.34.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]
GO

CREATE TABLE [dbo].[f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[suorv] [nvarchar](4) NULL,
	[sp] [nvarchar](2) NULL,
	[sp_id] [int] NULL,
	[kansalr1] [nvarchar](2) NULL,
	[kansalr1_id] [int] NULL,
	[syntyp2] [nvarchar](2) NULL,
	[syntyp2_id] [int] NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[tilvasmaak_id] [int] NULL,
	[tilvasmaak_historia_id] [int] NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[tutkmaak_id] [int] NULL,
	[tutkmaak_historia_id] [int] NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[iscfi2013_id] [int] NULL,
	[iscfi2013_historia_id] [int] NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[kaste_t2_id] [int] NULL,
	[kaste_t2_historia_id] [int] NULL,
	[kouljat] [nvarchar](2) NULL,
	[kouljat_id] [int] NULL,
	[oppis] [nvarchar](2) NULL,
	[oppis_id] [int] NULL,
	[tutklaja_tr] [nvarchar](2) NULL,
	[tutklaja_tr_id] [int] NULL,
	[ptoim1r6] [nvarchar](2) NULL,
	[ptoim1r6_id] [int] NULL,
	[maassaolo] [nvarchar](2) NULL,
	[maassaolo_id] [int] NULL,
	[amas] [nvarchar](2) NULL,
	[amas_id] [int] NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](2) NULL,
	[tutkintolaji_tyollistymiseen_id] [int] NULL,
	[sijoittuminen_1v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_3v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_5v_tutkinnon_jalkeen] [int] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_id] [int] NULL,
	[paaasiallinen_toiminta_okm_id] [int] NULL,
	[sektori] [nvarchar](2) NULL,
	[sektori_id] [int] NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[rahlahde_v2_id] [int] NULL,
	[kvopisk] [nvarchar](2) NULL,
	[kvopisk_id] [int] NULL
) ON [PRIMARY]
GO


