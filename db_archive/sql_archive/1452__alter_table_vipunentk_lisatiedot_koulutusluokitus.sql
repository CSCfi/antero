USE [VipunenTK_lisatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusluokitus]') AND type in (N'U'))
ALTER TABLE [dbo].[koulutusluokitus] DROP CONSTRAINT IF EXISTS [DF__koulutusluokitus_paattyy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusluokitus]') AND type in (N'U'))
ALTER TABLE [dbo].[koulutusluokitus] DROP CONSTRAINT IF EXISTS [DF__koulutusluokitus_alkaa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusluokitus]') AND type in (N'U'))
ALTER TABLE [dbo].[koulutusluokitus] DROP CONSTRAINT IF EXISTS [DF__koulutusluokitus_luotu]
GO
/****** Object:  Table [dbo].[koulutusluokitus]    Script Date: 16.3.2018 17:25:27 ******/
DROP TABLE IF EXISTS [dbo].[koulutusluokitus]
GO
/****** Object:  Table [dbo].[koulutusluokitus]    Script Date: 16.3.2018 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusluokitus](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NULL,
	[koulutusluokitus_avain] [nvarchar](10) NOT NULL,
	[koulutus_koodi] [nvarchar](6) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[koulutus] [nvarchar](255) NOT NULL,
	[koulutus_SV] [nvarchar](255) NOT NULL,
	[koulutus_EN] [nvarchar](255) NOT NULL,
	[koulutuslyhyt] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_SV] [nvarchar](50) NOT NULL,
	[koulutuslyhyt_EN] [nvarchar](50) NOT NULL,
	[taso_koodi] [nvarchar](5) NOT NULL,
	[koulutusala_koodi] [nvarchar](2) NOT NULL,
	[koulutusala] [nvarchar](255) NOT NULL,
	[koulutusala_SV] [nvarchar](255) NOT NULL,
	[koulutusala_EN] [nvarchar](255) NOT NULL,
	[koulutusaste_koodi] [nvarchar](2) NOT NULL,
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
	[koulutusaste_taso2_koodi] [nvarchar](10) NOT NULL,
	[koulutusaste_taso2] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_SV] [nvarchar](255) NOT NULL,
	[koulutusaste_taso2_EN] [nvarchar](255) NOT NULL,
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
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[koulutusluokitus] ([id], [luotu], [alkaa], [paattyy], [koulutusluokitus_avain], [koulutus_koodi], [viimeisin_tilv], [koulutus], [koulutus_SV], [koulutus_EN], [koulutuslyhyt], [koulutuslyhyt_SV], [koulutuslyhyt_EN], [taso_koodi], [koulutusala_koodi], [koulutusala], [koulutusala_SV], [koulutusala_EN], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [koulutusala2002_koodi], [koulutusala2002], [koulutusala2002_SV], [koulutusala2002_EN], [opintoala2002_koodi], [opintoala2002], [opintoala2002_SV], [opintoala2002_EN], [koulutusaste2002_koodi], [koulutusaste2002], [koulutusaste2002_SV], [koulutusaste2002_EN], [koulutusala1995_koodi], [koulutusala1995], [koulutusala1995_SV], [koulutusala1995_EN], [opintoala1995_koodi], [opintoala1995], [opintoala1995_SV], [opintoala1995_EN], [koulutusaste1995_koodi], [koulutusaste1995], [koulutusaste1995_SV], [koulutusaste1995_EN], [isclek_koodi], [isclek], [isclek_SV], [isclek_EN], [iscle_koodi], [iscle], [iscle_SV], [iscle_EN], [iscfik_koodi], [iscfik], [iscfik_SV], [iscfik_EN], [iscde_koodi], [iscde], [iscde_SV], [iscde_EN], [iscor_koodi], [iscor], [iscor_SV], [iscor_EN], [iscst_koodi], [iscst], [iscst_SV], [iscst_EN], [iscdu_koodi], [iscdu], [iscdu_SV], [iscdu_EN], [iscle2011_koodi], [iscle2011], [iscle2011_SV], [iscle2011_EN], [koulutusaste_taso2_koodi], [koulutusaste_taso2], [koulutusaste_taso2_SV], [koulutusaste_taso2_EN], [isccat2011_koodi], [isccat2011], [isccat2011_SV], [isccat2011_EN], [iscsubcat2011_koodi], [iscsubcat2011], [iscsubcat2011_SV], [iscsubcat2011_EN], [iscfi2013_koodi], [iscfi2013], [iscfi2013_SV], [iscfi2013_EN], [iscfinarrow2013_koodi], [iscfinarrow2013], [iscfinarrow2013_SV], [iscfinarrow2013_EN], [iscfibroad2013_koodi], [iscfibroad2013], [iscfibroad2013_SV], [iscfibroad2013_EN], [SCD_alkaa], [SCD_paattyy], [olo_koodi], [lakkautusvuosi], [korvaava_koulutus_koodi], [muutosvuosi], [jarjestys], [jarjestys_taso], [jarjestys_koulutusala], [jarjestys_koulutusaste], [jarjestys_koulutusala2002], [jarjestys_opintoala2002], [jarjestys_koulutusaste2002], [jarjestys_koulutusala1995], [jarjestys_opintoala1995], [jarjestys_koulutusaste1995], [jarjestys_isclek], [jarjestys_iscle], [jarjestys_iscfik], [jarjestys_iscde], [jarjestys_iscor], [jarjestys_iscst], [jarjestys_iscdu], [jarjestys_iscle2011], [jarjestys_isccat2011], [jarjestys_iscsubcat2011], [jarjestys_iscfi2013], [jarjestys_iscfinarrow2013], [jarjestys_iscfibroad2013], [virhetilanne], [tietolahde]) VALUES (-1, CAST(N'2014-12-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'-1', N'', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'-1', N'Tuntematon', N'Information saknas', N'Missing data', NULL, NULL, N'', N'', N'', N'', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'998', N'K', N'')
GO
INSERT [dbo].[koulutusluokitus] ([id], [luotu], [alkaa], [paattyy], [koulutusluokitus_avain], [koulutus_koodi], [viimeisin_tilv], [koulutus], [koulutus_SV], [koulutus_EN], [koulutuslyhyt], [koulutuslyhyt_SV], [koulutuslyhyt_EN], [taso_koodi], [koulutusala_koodi], [koulutusala], [koulutusala_SV], [koulutusala_EN], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [koulutusala2002_koodi], [koulutusala2002], [koulutusala2002_SV], [koulutusala2002_EN], [opintoala2002_koodi], [opintoala2002], [opintoala2002_SV], [opintoala2002_EN], [koulutusaste2002_koodi], [koulutusaste2002], [koulutusaste2002_SV], [koulutusaste2002_EN], [koulutusala1995_koodi], [koulutusala1995], [koulutusala1995_SV], [koulutusala1995_EN], [opintoala1995_koodi], [opintoala1995], [opintoala1995_SV], [opintoala1995_EN], [koulutusaste1995_koodi], [koulutusaste1995], [koulutusaste1995_SV], [koulutusaste1995_EN], [isclek_koodi], [isclek], [isclek_SV], [isclek_EN], [iscle_koodi], [iscle], [iscle_SV], [iscle_EN], [iscfik_koodi], [iscfik], [iscfik_SV], [iscfik_EN], [iscde_koodi], [iscde], [iscde_SV], [iscde_EN], [iscor_koodi], [iscor], [iscor_SV], [iscor_EN], [iscst_koodi], [iscst], [iscst_SV], [iscst_EN], [iscdu_koodi], [iscdu], [iscdu_SV], [iscdu_EN], [iscle2011_koodi], [iscle2011], [iscle2011_SV], [iscle2011_EN], [koulutusaste_taso2_koodi], [koulutusaste_taso2], [koulutusaste_taso2_SV], [koulutusaste_taso2_EN], [isccat2011_koodi], [isccat2011], [isccat2011_SV], [isccat2011_EN], [iscsubcat2011_koodi], [iscsubcat2011], [iscsubcat2011_SV], [iscsubcat2011_EN], [iscfi2013_koodi], [iscfi2013], [iscfi2013_SV], [iscfi2013_EN], [iscfinarrow2013_koodi], [iscfinarrow2013], [iscfinarrow2013_SV], [iscfinarrow2013_EN], [iscfibroad2013_koodi], [iscfibroad2013], [iscfibroad2013_SV], [iscfibroad2013_EN], [SCD_alkaa], [SCD_paattyy], [olo_koodi], [lakkautusvuosi], [korvaava_koulutus_koodi], [muutosvuosi], [jarjestys], [jarjestys_taso], [jarjestys_koulutusala], [jarjestys_koulutusaste], [jarjestys_koulutusala2002], [jarjestys_opintoala2002], [jarjestys_koulutusaste2002], [jarjestys_koulutusala1995], [jarjestys_opintoala1995], [jarjestys_koulutusaste1995], [jarjestys_isclek], [jarjestys_iscle], [jarjestys_iscfik], [jarjestys_iscde], [jarjestys_iscor], [jarjestys_iscst], [jarjestys_iscdu], [jarjestys_iscle2011], [jarjestys_isccat2011], [jarjestys_iscsubcat2011], [jarjestys_iscfi2013], [jarjestys_iscfinarrow2013], [jarjestys_iscfibroad2013], [virhetilanne], [tietolahde]) VALUES (-2, CAST(N'2014-12-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'-2', N'', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', NULL, NULL, N'', N'', N'', N'', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'999', N'K', N'')
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusluokitus_luotu]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusluokitus] ADD  CONSTRAINT [DF__koulutusluokitus_luotu]  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusluokitus_alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusluokitus] ADD  CONSTRAINT [DF__koulutusluokitus_alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusluokitus_paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusluokitus] ADD  CONSTRAINT [DF__koulutusluokitus_paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
USE [ANTERO]