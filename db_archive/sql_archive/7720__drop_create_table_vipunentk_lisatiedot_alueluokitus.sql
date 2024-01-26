USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[alueluokitus]    Script Date: 11.5.2023 19:42:49 ******/
DROP TABLE [dbo].[alueluokitus]
GO

/****** Object:  Table [dbo].[alueluokitus]    Script Date: 11.5.2023 19:42:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[alueluokitus](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[alueluokitus_avain] [nvarchar](10) NOT NULL,
	[kunta_koodi] [nvarchar](3) NOT NULL,
	[viimeisin_tilv] [nvarchar](4) NOT NULL,
	[liitoskunta_koodi] [nvarchar](3) NULL,
	[kunta] [nvarchar](255) NOT NULL,
	[kunta_SV] [nvarchar](255) NOT NULL,
	[kunta_EN] [nvarchar](255) NOT NULL,
	[maakunta_koodi] [nvarchar](2) NOT NULL,
	[maakunta] [nvarchar](255) NOT NULL,
	[maakunta_SV] [nvarchar](255) NOT NULL,
	[maakunta_EN] [nvarchar](255) NOT NULL,
	[hyvinvointialue_koodi] [nvarchar](2) NOT NULL,
	[hyvinvointialue] [nvarchar](255) NOT NULL,
	[hyvinvointialue_SV] [nvarchar](255) NOT NULL,
	[hyvinvointialue_EN] [nvarchar](255) NOT NULL,
	[avi_koodi] [nvarchar](2) NOT NULL,
	[avi] [nvarchar](255) NOT NULL,
	[avi_SV] [nvarchar](255) NOT NULL,
	[avi_EN] [nvarchar](255) NOT NULL,
	[ely_koodi] [nvarchar](2) NOT NULL,
	[ely] [nvarchar](255) NOT NULL,
	[ely_SV] [nvarchar](255) NOT NULL,
	[ely_EN] [nvarchar](255) NOT NULL,
	[seutukunta_koodi] [nvarchar](3) NOT NULL,
	[seutukunta] [nvarchar](255) NOT NULL,
	[seutukunta_SV] [nvarchar](255) NOT NULL,
	[seutukunta_EN] [nvarchar](255) NOT NULL,
	[suuralue_koodi] [nvarchar](2) NOT NULL,
	[suuralue] [nvarchar](255) NOT NULL,
	[suuralue_SV] [nvarchar](255) NOT NULL,
	[suuralue_EN] [nvarchar](255) NOT NULL,
	[kuntaryhma_koodi] [nvarchar](2) NOT NULL,
	[kuntaryhma] [nvarchar](255) NOT NULL,
	[kuntaryhma_SV] [nvarchar](255) NOT NULL,
	[kuntaryhma_EN] [nvarchar](255) NOT NULL,
	[laani_koodi] [nvarchar](2) NOT NULL,
	[laani] [nvarchar](255) NOT NULL,
	[laani_SV] [nvarchar](255) NOT NULL,
	[laani_EN] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_koodi] [nvarchar](2) NOT NULL,
	[tyovoima_elinkeinokeskus] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_SV] [nvarchar](255) NOT NULL,
	[tyovoima_elinkeinokeskus_EN] [nvarchar](255) NOT NULL,
	[kielisuhde_koodi] [nvarchar](2) NOT NULL,
	[kielisuhde] [nvarchar](255) NOT NULL,
	[kielisuhde_SV] [nvarchar](255) NOT NULL,
	[kielisuhde_EN] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_koodi] [nvarchar](2) NOT NULL,
	[mannersuomi_ahvenanmaa] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_SV] [nvarchar](255) NOT NULL,
	[mannersuomi_ahvenanmaa_EN] [nvarchar](255) NOT NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_maakunta] [nvarchar](10) NULL,
	[jarjestys_hyvinvointialue] [nvarchar](10) NULL,
	[jarjestys_avi] [nvarchar](10) NULL,
	[jarjestys_ely] [nvarchar](10) NULL,
	[jarjestys_seutukunta] [nvarchar](10) NULL,
	[jarjestys_suuralue] [nvarchar](10) NULL,
	[jarjestys_kuntaryhma] [nvarchar](10) NULL,
	[jarjestys_laani] [nvarchar](10) NULL,
	[jarjestys_tyovoima_elinkeinokeskus] [nvarchar](10) NULL,
	[jarjestys_kielisuhde] [nvarchar](10) NULL,
	[jarjestys_mannersuomi_ahvenanmaa] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[alueluokitus] (
	[id], [luotu], [alkaa], [paattyy], [alueluokitus_avain], [kunta_koodi], [viimeisin_tilv], [liitoskunta_koodi], [kunta], [kunta_SV], [kunta_EN]
	, [maakunta_koodi], [maakunta], [maakunta_SV], [maakunta_EN], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN]
	, [avi_koodi], [avi], [avi_SV], [avi_EN], [ely_koodi], [ely], [ely_SV], [ely_EN], [seutukunta_koodi], [seutukunta], [seutukunta_SV], [seutukunta_EN]
	, [suuralue_koodi], [suuralue], [suuralue_SV], [suuralue_EN], [kuntaryhma_koodi], [kuntaryhma], [kuntaryhma_SV], [kuntaryhma_EN]
	, [laani_koodi], [laani], [laani_SV], [laani_EN]
	, [tyovoima_elinkeinokeskus_koodi], [tyovoima_elinkeinokeskus], [tyovoima_elinkeinokeskus_SV], [tyovoima_elinkeinokeskus_EN]
	, [kielisuhde_koodi], [kielisuhde], [kielisuhde_SV], [kielisuhde_EN]
	, [mannersuomi_ahvenanmaa_koodi], [mannersuomi_ahvenanmaa], [mannersuomi_ahvenanmaa_SV], [mannersuomi_ahvenanmaa_EN]
	, [SCD_alkaa], [SCD_paattyy], [jarjestys], [jarjestys_maakunta], [jarjestys_hyvinvointialue]
	, [jarjestys_avi], [jarjestys_ely], [jarjestys_seutukunta], [jarjestys_suuralue], [jarjestys_kuntaryhma], [jarjestys_laani], [jarjestys_tyovoima_elinkeinokeskus], [jarjestys_kielisuhde], [jarjestys_mannersuomi_ahvenanmaa], [virhetilanne], [tietolahde]
) 
VALUES (-1, CAST(N'2014-12-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'-1', N'2013', N'-1', N'Tuntematon', N'Okänd', N'Unknown'
	, N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown'
	, N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'-1', N'Tuntematon', N'Okänd', N'Unknown'
	, NULL, NULL, N'ööö', N'öö', N'öö', N'öö', N'öö', N'ööö', N'ööö', N'öö', N'öö', N'öö', N'ööö', N'öö', N'K', N'Manuaalinen'
)
GO

INSERT [dbo].[alueluokitus] (
	[id], [luotu], [alkaa], [paattyy], [alueluokitus_avain], [kunta_koodi], [viimeisin_tilv], [liitoskunta_koodi], [kunta], [kunta_SV], [kunta_EN]
	, [maakunta_koodi], [maakunta], [maakunta_SV], [maakunta_EN], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN]
	, [avi_koodi], [avi], [avi_SV], [avi_EN], [ely_koodi], [ely], [ely_SV], [ely_EN], [seutukunta_koodi], [seutukunta], [seutukunta_SV], [seutukunta_EN]
	, [suuralue_koodi], [suuralue], [suuralue_SV], [suuralue_EN], [kuntaryhma_koodi], [kuntaryhma], [kuntaryhma_SV], [kuntaryhma_EN]
	, [laani_koodi], [laani], [laani_SV], [laani_EN]
	, [tyovoima_elinkeinokeskus_koodi], [tyovoima_elinkeinokeskus], [tyovoima_elinkeinokeskus_SV], [tyovoima_elinkeinokeskus_EN]
	, [kielisuhde_koodi], [kielisuhde], [kielisuhde_SV], [kielisuhde_EN]
	, [mannersuomi_ahvenanmaa_koodi], [mannersuomi_ahvenanmaa], [mannersuomi_ahvenanmaa_SV], [mannersuomi_ahvenanmaa_EN]
	, [SCD_alkaa], [SCD_paattyy], [jarjestys], [jarjestys_maakunta], [jarjestys_hyvinvointialue]
	, [jarjestys_avi], [jarjestys_ely], [jarjestys_seutukunta], [jarjestys_suuralue], [jarjestys_kuntaryhma], [jarjestys_laani], [jarjestys_tyovoima_elinkeinokeskus], [jarjestys_kielisuhde], [jarjestys_mannersuomi_ahvenanmaa], [virhetilanne], [tietolahde]
)
VALUES (-2, CAST(N'2014-12-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'-2', N'2013', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred'
	, N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred'
	, N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred'
	, NULL, NULL, N'ööö2', N'öö2', N'öö2', N'öö2', N'öö2', N'ööö2', N'ööö2', N'öö2', N'öö2', N'öö2', N'ööö2', N'öö2', N'K', N'Manuaalinen'
)
GO

ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_luotu]  DEFAULT (getdate()) FOR [luotu]
GO
ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
