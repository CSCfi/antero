USE [VipunenTK_DW]
GO

ALTER TABLE [dbo].[d_koulutusluokitus] DROP CONSTRAINT [DF__d_koulutusluokitus_paattyy]
GO

ALTER TABLE [dbo].[d_koulutusluokitus] DROP CONSTRAINT [DF__d_koulutusluokitus_alkaa]
GO

ALTER TABLE [dbo].[d_koulutusluokitus] DROP CONSTRAINT [DF__d_koulutusluokitus_luotu]
GO

/****** Object:  Table [dbo].[d_koulutusluokitus]    Script Date: 27.6.2017 17:28:32 ******/
DROP TABLE [dbo].[d_koulutusluokitus]
GO

/****** Object:  Table [dbo].[d_koulutusluokitus]    Script Date: 27.6.2017 17:28:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutusluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NULL,
	[koulutusluokitus_avain] [nvarchar](10) NOT NULL,
	[koulutus_koodi] [nvarchar](6) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[koulutus] [nvarchar](255) NOT NULL,
	[koulutus_SV] [nvarchar](255) NOT NULL,
	[koulutus_EN] [nvarchar](255) NOT NULL,
	[koulutuslyhyt] [nvarchar](50) NULL,
	[koulutuslyhyt_SV] [nvarchar](50) NULL,
	[koulutuslyhyt_EN] [nvarchar](50) NULL,
	[taso_koodi] [nvarchar](5) NOT NULL,
	[koulutusala_koodi] [nvarchar](2) NULL,
	[koulutusala] [nvarchar](255) NOT NULL,
	[koulutusala_SV] [nvarchar](255) NOT NULL,
	[koulutusala_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NOT NULL,
	[koulutusaste_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_EN] [nvarchar](255) NOT NULL,
	[koulutusala2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusala2002] [nvarchar](255) NOT NULL,
	[koulutusala2002_SV] [nvarchar](255) NOT NULL,
	[koulutusala2002_EN] [nvarchar](255) NOT NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[opintoala2002] [nvarchar](255) NOT NULL,
	[opintoala2002_SV] [nvarchar](255) NOT NULL,
	[opintoala2002_EN] [nvarchar](255) NOT NULL,
	[koulutusaste2002_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste2002] [nvarchar](255) NOT NULL,
	[koulutusaste2002_SV] [nvarchar](255) NOT NULL,
	[koulutusaste2002_EN] [nvarchar](255) NOT NULL,
	[koulutusala1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusala1995] [nvarchar](255) NOT NULL,
	[koulutusala1995_SV] [nvarchar](255) NOT NULL,
	[koulutusala1995_EN] [nvarchar](255) NOT NULL,
	[opintoala1995_koodi] [nvarchar](3) NOT NULL,
	[opintoala1995] [nvarchar](255) NOT NULL,
	[opintoala1995_SV] [nvarchar](255) NOT NULL,
	[opintoala1995_EN] [nvarchar](255) NOT NULL,
	[koulutusaste1995_koodi] [nvarchar](2) NOT NULL,
	[koulutusaste1995] [nvarchar](255) NOT NULL,
	[koulutusaste1995_SV] [nvarchar](255) NOT NULL,
	[koulutusaste1995_EN] [nvarchar](255) NOT NULL,
	[isclek_koodi] [nvarchar](2) NOT NULL,
	[isclek] [nvarchar](255) NOT NULL,
	[isclek_SV] [nvarchar](255) NOT NULL,
	[isclek_EN] [nvarchar](255) NOT NULL,
	[iscle_koodi] [nvarchar](2) NOT NULL,
	[iscle] [nvarchar](255) NOT NULL,
	[iscle_SV] [nvarchar](255) NOT NULL,
	[iscle_EN] [nvarchar](255) NOT NULL,
	[iscfik_koodi] [nvarchar](3) NOT NULL,
	[iscfik] [nvarchar](255) NOT NULL,
	[iscfik_SV] [nvarchar](255) NOT NULL,
	[iscfik_EN] [nvarchar](255) NOT NULL,
	[iscde_koodi] [nvarchar](2) NOT NULL,
	[iscde] [nvarchar](255) NOT NULL,
	[iscde_SV] [nvarchar](255) NOT NULL,
	[iscde_EN] [nvarchar](255) NOT NULL,
	[iscor_koodi] [nvarchar](2) NOT NULL,
	[iscor] [nvarchar](255) NOT NULL,
	[iscor_SV] [nvarchar](255) NOT NULL,
	[iscor_EN] [nvarchar](255) NOT NULL,
	[iscst_koodi] [nvarchar](2) NOT NULL,
	[iscst] [nvarchar](255) NOT NULL,
	[iscst_SV] [nvarchar](255) NOT NULL,
	[iscst_EN] [nvarchar](255) NOT NULL,
	[iscdu_koodi] [nvarchar](2) NOT NULL,
	[iscdu] [nvarchar](255) NOT NULL,
	[iscdu_SV] [nvarchar](255) NOT NULL,
	[iscdu_EN] [nvarchar](255) NOT NULL,
	[iscle2011_koodi] [nvarchar](10) NOT NULL,
	[iscle2011] [nvarchar](255) NOT NULL,
	[iscle2011_SV] [nvarchar](255) NOT NULL,
	[iscle2011_EN] [nvarchar](255) NOT NULL,
	[isccat2011_koodi] [nvarchar](10) NOT NULL,
	[isccat2011] [nvarchar](255) NOT NULL,
	[isccat2011_SV] [nvarchar](255) NOT NULL,
	[isccat2011_EN] [nvarchar](255) NOT NULL,
	[iscsubcat2011_koodi] [nvarchar](10) NOT NULL,
	[iscsubcat2011] [nvarchar](255) NOT NULL,
	[iscsubcat2011_SV] [nvarchar](255) NOT NULL,
	[iscsubcat2011_EN] [nvarchar](255) NOT NULL,
	[iscfi2013_koodi] [nvarchar](10) NOT NULL,
	[iscfi2013] [nvarchar](255) NOT NULL,
	[iscfi2013_SV] [nvarchar](255) NOT NULL,
	[iscfi2013_EN] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_koodi] [nvarchar](10) NOT NULL,
	[iscfinarrow2013] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_SV] [nvarchar](255) NOT NULL,
	[iscfinarrow2013_EN] [nvarchar](255) NOT NULL,
	[iscfibroad2013_koodi] [nvarchar](10) NOT NULL,
	[iscfibroad2013] [nvarchar](255) NOT NULL,
	[iscfibroad2013_SV] [nvarchar](255) NOT NULL,
	[iscfibroad2013_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_koodi] [nvarchar](10) NOT NULL,
	[koulutusaste_taso2] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[olo_koodi] [nvarchar](20) NULL,
	[lakkautusvuosi] [nvarchar](20) NULL,
	[korvaava_koulutus_koodi] [nvarchar](6) NULL,
	[muutosvuosi] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_taso] [nvarchar](10) NULL,
	[jarjestys_koulutusala] [nvarchar](10) NULL,
	[jarjestys_koulutusaste] [nvarchar](10) NULL,
	[jarjestys_koulutusala2002] [nvarchar](10) NULL,
	[jarjestys_opintoala2002] [nvarchar](10) NULL,
	[jarjestys_koulutusaste2002] [nvarchar](10) NULL,
	[jarjestys_koulutusala1995] [nvarchar](10) NULL,
	[jarjestys_opintoala1995] [nvarchar](10) NULL,
	[jarjestys_koulutusaste1995] [nvarchar](10) NULL,
	[jarjestys_isclek] [nvarchar](10) NULL,
	[jarjestys_iscle] [nvarchar](10) NULL,
	[jarjestys_iscfik] [nvarchar](10) NULL,
	[jarjestys_iscde] [nvarchar](10) NULL,
	[jarjestys_iscor] [nvarchar](10) NULL,
	[jarjestys_iscst] [nvarchar](10) NULL,
	[jarjestys_iscdu] [nvarchar](10) NULL,
	[jarjestys_iscle2011] [nvarchar](10) NULL,
	[jarjestys_isccat2011] [nvarchar](10) NULL,
	[jarjestys_iscsubcat2011] [nvarchar](10) NULL,
	[jarjestys_iscfi2013] [nvarchar](10) NULL,
	[jarjestys_iscfinarrow2013] [nvarchar](10) NULL,
	[jarjestys_iscfibroad2013] [nvarchar](10) NULL,
	[jarjestys_koulutusaste_taso2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus_luotu]  DEFAULT (getdate()) FOR [luotu]
GO

ALTER TABLE [dbo].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus_alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus_paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO


USE [ANTERO]