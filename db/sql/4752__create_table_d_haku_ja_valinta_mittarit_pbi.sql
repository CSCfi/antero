USE [ANTERO]
GO

/****** Object:  Table [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 22.6.2020 16:36:52 ******/
DROP TABLE IF EXISTS [ANTERO].[dw].[d_haku_ja_valinta_mittarit_pbi]
GO

/****** Object:  Table [dbo].[pbi_dataset_tabular]    Script Date: 11.8.2021 7:55:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_haku_ja_valinta_mittarit_pbi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mittari] [nvarchar](100) NULL,
) ON [PRIMARY]

GO
