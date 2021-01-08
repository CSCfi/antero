USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15] DROP CONSTRAINT [FK_f_ulkomaalaiset_d_koulutuslaji3]
GO

/****** Object:  Table [dbo].[d_koulutuslaji3]    Script Date: 7.1.2021 22:05:46 ******/
DROP TABLE [dbo].[d_koulutuslaji3]
GO

/****** Object:  Table [dbo].[d_koulutuslaji3]    Script Date: 7.1.2021 22:05:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutuslaji3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji3_koodi] [nvarchar](10) NULL,
	[koulutuslaji3] [nvarchar](250) NULL,
	[koulutuslaji3_SV] [nvarchar](250) NULL,
	[koulutuslaji3_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji3] [nvarchar](50) NULL,
	[koulutuslaji4] [nvarchar](250) NULL,
	[koulutuslaji4_SV] [nvarchar](250) NULL,
	[koulutuslaji4_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji4] [nvarchar](50) NULL,
	[jarjestamistapa] [nvarchar](250) NULL,
	[jarjestamistapa_SV] [nvarchar](250) NULL,
	[jarjestamistapa_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamistapa] [nvarchar](50) NULL,
	[jarjestamismuoto] [nvarchar](250) NULL,
	[jarjestamismuoto_SV] [nvarchar](250) NULL,
	[jarjestamismuoto_EN] [nvarchar](250) NULL,
	[jarjestys_jarjestamismuoto] [nvarchar](50) NULL,
	[tutkintotyyppi] [nvarchar](250) NULL,
	[tutkintotyyppi_SV] [nvarchar](250) NULL,
	[tutkintotyyppi_EN] [nvarchar](250) NULL,
	[jarjestys_tutkintotyyppi] [nvarchar](50) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_koulutuslaji3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15]  WITH CHECK ADD  CONSTRAINT [FK_f_ulkomaalaiset_d_koulutuslaji3] FOREIGN KEY([koulutusryhma_koulutuslaji3_id])
REFERENCES [dbo].[d_koulutuslaji3] ([id])
GO

ALTER TABLE [dbo].[f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15] CHECK CONSTRAINT [FK_f_ulkomaalaiset_d_koulutuslaji3]
GO

use antero