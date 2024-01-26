USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_alueluokitus]    Script Date: 8.5.2023 21:29:04 ******/
DROP TABLE [dbo].[d_alueluokitus]
GO

/****** Object:  Table [dbo].[d_alueluokitus]    Script Date: 8.5.2023 21:29:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_alueluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
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

ALTER TABLE [dbo].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus_luotu]  DEFAULT (getdate()) FOR [luotu]
GO

ALTER TABLE [dbo].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus_alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus_paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO


