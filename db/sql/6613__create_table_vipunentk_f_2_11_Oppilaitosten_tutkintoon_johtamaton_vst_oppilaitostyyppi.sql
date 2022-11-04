USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]    Script Date: 3.2.2022 21:58:30 ******/
DROP TABLE IF EXISTS [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]
GO

/****** Object:  Table [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]    Script Date: 3.2.2022 21:58:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi](
	[tilv] [nvarchar](4) NULL,
	[tunn] [nvarchar](5) NULL,
	[tunn_id] [int] NULL,
	[jarj] [nvarchar](10) NULL,
	[jarj_id] [int] NULL,
	[vst_oltyp] [varchar](2) NULL,
	[vst_oltyp_id] [int] NULL,
	[lkm_brutto] [int] NULL,
	[lkm_netto] [int] NULL
) ON [PRIMARY]

GO


