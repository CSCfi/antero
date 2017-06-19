USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[_aineistot]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_aineistot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_aineistot](
	[aineistotunnus] [varchar](8) NOT NULL,
	[sanimi] [varchar](128) NULL,
	[faktanimi] [varchar](128) NULL,
	[Paivittaja] [varchar](30) NOT NULL,
	[Paivityspaivamaara] [datetime2](4) NOT NULL,
 CONSTRAINT [PK__aineistot] PRIMARY KEY CLUSTERED 
(
	[aineistotunnus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_map]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_map](
	[muuttuja] [varchar](128) NOT NULL,
	[objektinimi] [varchar](128) NULL,
	[objektityyppi] [varchar](10) NULL,
	[objektityyppitarkenne] [varchar](10) NULL,
	[tietotyyppi] [varchar](50) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[Paivittaja] [varchar](30) NOT NULL,
	[Paivityspaivamaara] [datetime2](4) NOT NULL,
	[z_okmnimi] [varchar](128) NULL,
 CONSTRAINT [PK__map] PRIMARY KEY CLUSTERED 
(
	[muuttuja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aidinkieli_versio1]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aidinkieli_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aidinkieli_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](50) NULL,
	[aidinkieli_versio1_SV] [nvarchar](50) NULL,
	[aidinkieli_versio1_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aidinkieli_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aidinkieli_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aidinkieli_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aidinkieli_versio2_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio2] [nvarchar](50) NULL,
	[aidinkieli_versio2_SV] [nvarchar](50) NULL,
	[aidinkieli_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aidinkieli_versio3]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aidinkieli_versio3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aidinkieli_versio3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aidinkieli_versio3_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio3] [nvarchar](50) NULL,
	[aidinkieli_versio3_SV] [nvarchar](50) NULL,
	[aidinkieli_versio3_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikaisemmat_tutkinnot]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikaisemmat_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikaisemmat_tutkinnot](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikaisemmat_tutkinnot_koodi] [nvarchar](2) NULL,
	[aikaisemmat_tutkinnot] [nvarchar](100) NULL,
	[aikaisemmat_tutkinnot_SV] [nvarchar](120) NULL,
	[aikaisemmat_tutkinnot_EN] [nvarchar](120) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikaisempi_korkein_tutkinto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikaisempi_korkein_tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikaisempi_korkein_tutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikaisempi_korkein_tutkinto_koodi] [nvarchar](2) NULL,
	[aikaisempi_korkein_tutkinto] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto_SV] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikalkk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikalkk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikalkk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikalkk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikamk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikamk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikamk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikamk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikamm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikamm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikamm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikamm_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikuisopiskelija]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikuisopiskelija]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikuisopiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikuisopiskelija_koodi] [nvarchar](10) NULL,
	[aikuisopiskelija] [nvarchar](250) NULL,
	[aikuisopiskelija_SV] [nvarchar](250) NULL,
	[aikuisopiskelija_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikylamk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikylamk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikylamk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikylamk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikylkk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikylkk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikylkk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikylkk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aikyotutk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aikyotutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aikyotutk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aikyotutk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aineisto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aineisto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aineisto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aineisto_koodi] [varchar](2) NULL,
	[aineisto] [nvarchar](50) NULL,
	[aineisto_SV] [nvarchar](50) NULL,
	[aineisto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aineisto_OTV]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aineisto_OTV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aineisto_OTV](
	[id] [int] NOT NULL,
	[aineisto_koodi] [nvarchar](8) NOT NULL,
	[tilastointivuosi] [nvarchar](4) NOT NULL,
	[alkaa] [datetime2](7) NOT NULL,
	[paattyy] [datetime2](7) NOT NULL,
	[aineisto] [nvarchar](150) NULL,
	[aineisto_SV] [nvarchar](150) NULL,
	[aineisto_EN] [nvarchar](150) NULL,
	[jarjestys] [smallint] NULL,
	[toisen_asteen_koulutus] [nchar](2) NULL,
	[kaikkien_asteiden_koulutus] [nchar](2) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aiopis]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aiopis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aiopis](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aiopis_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[akk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[akk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[akk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[akk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AL_alueluokitus_nykytila]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AL_alueluokitus_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AL_alueluokitus_nykytila](
	[luotu] [date] NULL,
	[vaikuttaa_K3_9_aineistoon] [char](1) NULL,
	[vaikuttaa_K3_10_aineistoon] [char](1) NULL,
	[alueluokitus_tyyppi] [varchar](10) NULL,
	[alueluokitus_koodi] [varchar](10) NULL,
	[tiedoksi_alueluokitus] [nvarchar](255) NULL,
	[alueluokitus_koodi_nykytila] [varchar](10) NULL,
	[tiedoksi_alueluokitus_nykytila] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AL_koulutuksen_jarjestaja_nykytila]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AL_koulutuksen_jarjestaja_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AL_koulutuksen_jarjestaja_nykytila](
	[luotu] [date] NULL,
	[vaikuttaa_K3_9_aineistoon] [char](1) NULL,
	[vaikuttaa_K3_10_aineistoon] [char](1) NULL,
	[koulutuksen_jarjestajakoodi] [varchar](10) NULL,
	[tiedoksi_koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[koulutuksen_jarjestajakoodi_nykytila] [varchar](10) NULL,
	[tiedoksi_koulutuksen_jarjestaja_nykytila] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AL_koulutusluokitus_nykytila]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AL_koulutusluokitus_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AL_koulutusluokitus_nykytila](
	[luotu] [date] NULL,
	[vaikuttaa_K3_9_aineistoon] [char](1) NULL,
	[vaikuttaa_K3_10_aineistoon] [char](1) NULL,
	[koulutus_koodi] [varchar](10) NULL,
	[tiedoksi_koulutusluokitus] [nvarchar](255) NULL,
	[koulutus_koodi_nykytila] [varchar](10) NULL,
	[tiedoksi_koulutusluokitus_nykytila] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[allk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[allk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[allk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[allk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[allk_kk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[allk_kk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[allk_kk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[allk_kk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aloittaneiden_lapaisy_seuranta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aloittaneiden_lapaisy_seuranta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aloittaneiden_lapaisy_seuranta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koodi] [nvarchar](255) NOT NULL,
	[selite] [nvarchar](255) NOT NULL,
	[jarjestys] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[alueluokitus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[alueluokitus]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[alueluokitus_maakunta_korjaus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[alueluokitus_maakunta_korjaus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[alueluokitus_maakunta_korjaus](
	[alueluokitus_avain] [nvarchar](10) NULL,
	[maakunta_koodi] [nvarchar](2) NULL,
	[maakunta_koodi_nykytila] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[amkkoulutyp]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[amkkoulutyp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[amkkoulutyp](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[amkkoulutyp_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[amm_mappaus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[amm_mappaus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[amm_mappaus](
	[sar1] [nvarchar](20) NULL,
	[sar2] [nvarchar](100) NULL,
	[sar3] [nvarchar](20) NULL,
	[sar4] [nvarchar](100) NULL,
	[sar5] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammatillinen_koulutus_luokittelu]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammatillinen_koulutus_luokittelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammatillinen_koulutus_luokittelu](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_avain] [nvarchar](10) NOT NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NOT NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_avain] [nvarchar](10) NOT NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8] [nvarchar](100) NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_SV] [nvarchar](100) NULL,
	[ammatillisen_koulutuksen_luokittelu_4_7_4_8_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammatillinen_peruskoulutus_lisakoulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammatillinen_peruskoulutus_lisakoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammatillinen_peruskoulutus_lisakoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_koodi] [nvarchar](2) NOT NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](50) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_SV] [nvarchar](50) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammatillisen_koulutuksen_koulutuslaji]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammatillisen_koulutuksen_koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](50) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_SV] [nvarchar](50) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](300) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_SV] [nvarchar](300) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_EN] [nvarchar](300) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammattiasema]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammattiasema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammattiasema](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiasema_koodi] [nvarchar](10) NULL,
	[ammattiasema] [nvarchar](50) NULL,
	[ammattiasema_SV] [nvarchar](50) NULL,
	[ammattiasema_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammattiluokitus_2001]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammattiluokitus_2001]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammattiluokitus_2001](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiluokitus_2001_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2001_koodi] [nvarchar](5) NULL,
	[ammattiluokitus_2001] [nvarchar](100) NULL,
	[ammattiluokitus_2001_SV] [nvarchar](100) NULL,
	[ammattiluokitus_2001_EN] [nvarchar](100) NULL,
	[taso] [nvarchar](2) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammattiluokitus_2001_2010]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammattiluokitus_2001_2010]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammattiluokitus_2001_2010](
	[ammattiluokitus_2001_avain] [nvarchar](10) NOT NULL,
	[ammattiluokitus_2010_avain] [nvarchar](10) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammattiluokitus_2010]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammattiluokitus_2010]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammattiluokitus_2010](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[ammattiluokitus_2010_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2010_5_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_5_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_5_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_5_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_4_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_4_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_3_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_3_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_2_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_2_taso_EN] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_koodi] [nvarchar](10) NULL,
	[ammattiluokitus_2010_1_taso] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_1_taso_EN] [nvarchar](150) NULL,
	[taso] [nvarchar](2) NULL,
	[jarjestys_ammattiluokitus_2010_taso5] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso4] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso3] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso2] [nvarchar](10) NULL,
	[jarjestys_ammattiluokitus_2010_taso1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammattiluokitus_2010_talteen]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammattiluokitus_2010_talteen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammattiluokitus_2010_talteen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammattiluokitus_2010_avain] [nvarchar](10) NULL,
	[ammattiluokitus_2010_koodi] [nvarchar](5) NULL,
	[ammattiluokitus_2010] [nvarchar](150) NULL,
	[ammattiluokitus_2010_SV] [nvarchar](150) NULL,
	[ammattiluokitus_2010_EN] [nvarchar](150) NULL,
	[taso] [nvarchar](2) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammoppis]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammoppis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammoppis](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammoppis_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammtutklaja]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammtutklaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammtutklaja](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammtutklaja_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ammtutktav]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ammtutktav]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ammtutktav](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ammtutktav_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[asema]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[asema](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[asema_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[asuinkunta_sama_vai_eri_kuin_aiemmin]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asuinkunta_sama_vai_eri_kuin_aiemmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[asuinkunta_sama_vai_eri_kuin_aiemmin](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_koodi] [nvarchar](2) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin] [nvarchar](100) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_SV] [nvarchar](100) NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[asuinmaakunta_sama_kuin_tyopaikan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asuinmaakunta_sama_kuin_tyopaikan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[asuinmaakunta_sama_kuin_tyopaikan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_avain] [nvarchar](2) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan] [nvarchar](255) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_SV] [nvarchar](255) NULL,
	[asuinmaakunta_sama_kuin_tyopaikan_EN] [nvarchar](255) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[avi]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[avi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[avi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[avi_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[avoinvayla]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[avoinvayla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[avoinvayla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[avoinvayla_koodi] [nvarchar](2) NULL,
	[avoinvayla] [nvarchar](50) NULL,
	[avoinvayla_SV] [nvarchar](50) NULL,
	[avoinvayla_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[edellisen_vuoden_opiskelu]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[edellisen_vuoden_opiskelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[edellisen_vuoden_opiskelu](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[edellisen_vuoden_opiskelu_avain] [nvarchar](10) NULL,
	[edellisen_vuoden_opiskelu_koulutus] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_koulutus_SV] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_koulutus_EN] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus_SV] [nvarchar](100) NULL,
	[edellisen_vuoden_opiskelu_tarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_koulutus] [nvarchar](10) NULL,
	[jarjestys_tarkennus] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[edeltavan_vuoden_asuinpaikka]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[edeltavan_vuoden_asuinpaikka]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[edeltavan_vuoden_asuinpaikka](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[edeltavan_vuoden_asuinpaikka_koodi] [nvarchar](2) NULL,
	[edeltavan_vuoden_asuinpaikka] [nvarchar](30) NULL,
	[edeltavan_vuoden_asuinpaikka_SV] [nvarchar](30) NULL,
	[edeltavan_vuoden_asuinpaikka_EN] [nvarchar](30) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[elakkeelle_siirtynyt_tai_kuollut]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[elakkeelle_siirtynyt_tai_kuollut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[elakkeelle_siirtynyt_tai_kuollut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[elakkeelle_siirtynyt_tai_kuollut_koodi] [nvarchar](10) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_EN] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ely]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ely]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ely](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ely_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ensisijainen_opintooikeus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ensisijainen_opintooikeus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ensisijainen_opintooikeus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ensisijainen_opintooikeus_koodi] [nvarchar](2) NULL,
	[ensisijainen_opintooikeus] [nvarchar](50) NULL,
	[ensisijainen_opintooikeus_SV] [nvarchar](100) NULL,
	[ensisijainen_opintooikeus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[erityisopetuksen_peruste]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[erityisopetuksen_peruste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[erityisopetuksen_peruste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[erityisopetuksen_peruste_avain] [nvarchar](10) NULL,
	[erityisopetuksen_peruste] [nvarchar](250) NULL,
	[erityisopetuksen_peruste_SV] [nvarchar](250) NULL,
	[erityisopetuksen_peruste_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[erityisoppilaan_opetusryhma]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[erityisoppilaan_opetusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[erityisoppilaan_opetusryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[erityisoppilaan_opetusryhma_avain] [nvarchar](10) NULL,
	[erityisoppilaan_opetusryhma] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_SV] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[eu_etamaat]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eu_etamaat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[eu_etamaat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[eu_etamaat_avain] [nvarchar](10) NULL,
	[eu_etamaat] [nvarchar](100) NULL,
	[eu_etamaat_SV] [nvarchar](100) NULL,
	[eu_etamaat_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hakukohde]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hakukohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hakukohde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_avain] [nvarchar](10) NULL,
	[hakukohde] [nvarchar](250) NULL,
	[hakukohde_SV] [nvarchar](250) NULL,
	[hakukohde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hakukohde_erillisvalinta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hakukohde_erillisvalinta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hakukohde_erillisvalinta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_erillisvalinta_avain] [nvarchar](10) NULL,
	[hakukohde_erillisvalinta] [nvarchar](250) NULL,
	[hakukohde_erillisvalinta_SV] [nvarchar](250) NULL,
	[hakukohde_erillisvalinta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hakukohteen_prioriteetti]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hakukohteen_prioriteetti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hakukohteen_prioriteetti](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohteen_prioriteetti_avain] [nvarchar](10) NULL,
	[hakukohteen_prioriteetti] [nvarchar](250) NULL,
	[hakukohteen_prioriteetti_SV] [nvarchar](250) NULL,
	[hakukohteen_prioriteetti_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hakukohteen_tulos]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hakukohteen_tulos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hakukohteen_tulos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_hyvaksytty_koodi] [nvarchar](10) NULL,
	[hakukohde_hyvaksytty] [nvarchar](50) NULL,
	[hakukohde_hyvaksytty_SV] [nvarchar](50) NULL,
	[hakukohde_hyvaksytty_EN] [nvarchar](50) NULL,
	[jarjestys_hyvaksytty] [nvarchar](10) NULL,
	[hakukohde_vastaanotettu_koodi] [nvarchar](10) NULL,
	[hakukohde_vastaanotettu] [nvarchar](50) NULL,
	[hakukohde_vastaanotettu_SV] [nvarchar](50) NULL,
	[hakukohde_vastaanotettu_EN] [nvarchar](50) NULL,
	[jarjestys_vastaanotettu] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hakukohteen_tutkinnon_taso]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hakukohteen_tutkinnon_taso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hakukohteen_tutkinnon_taso](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hakukohde_tutkinnon_taso_koodi] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_SV] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_EN] [nvarchar](100) NULL,
	[jarjestys_hakukohde_tutkinnon_taso] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_koodi] [nvarchar](10) NULL,
	[hakukohde_tutkinnon_taso_tarkennus] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_SV] [nvarchar](100) NULL,
	[hakukohde_tutkinnon_taso_tarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_hakukohde_tutkinnon_taso_tarkennus] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hallinnonala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hallinnonala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hallinnonala](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[hallinnonala_koodi] [nvarchar](2) NOT NULL,
	[hallinnonala] [nvarchar](200) NULL,
	[hallinnonala_SV] [nvarchar](200) NULL,
	[hallinnonala_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hallinnonala2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hallinnonala2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hallinnonala2](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[hallinnonala_koodi] [nvarchar](2) NOT NULL,
	[hallinnonala] [nvarchar](200) NULL,
	[hallinnonala_SV] [nvarchar](200) NULL,
	[hallinnonala_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[hetu_ok]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hetu_ok]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hetu_ok](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hetu_ok_avain] [nvarchar](10) NULL,
	[hetu_ok] [nvarchar](50) NULL,
	[hetu_ok_SV] [nvarchar](50) NULL,
	[hetu_ok_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ika]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ika](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[ika_avain] [nvarchar](10) NOT NULL,
	[ika_int] [int] NULL,
	[ika] [nvarchar](50) NULL,
	[ika_SV] [nvarchar](50) NULL,
	[ika_EN] [nvarchar](50) NULL,
	[ika5v_int] [int] NULL,
	[ika5v] [nvarchar](50) NULL,
	[ika5v_SV] [nvarchar](50) NULL,
	[ika5v_EN] [nvarchar](50) NULL,
	[jarjestys_ika] [nvarchar](50) NULL,
	[jarjestys_ika5v] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iscde]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iscde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iscde](
	[iscde] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iscdu]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iscdu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iscdu](
	[iscdu] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[isced_suomi_ohjauksenala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isced_suomi_ohjauksenala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[isced_suomi_ohjauksenala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[iscfi2013_koodi] [nvarchar](10) NOT NULL,
	[KTPO_ohjauksen_ala_2016] [nvarchar](255) NULL,
	[KTPO_ohjauksen_ala_2016_SV] [nvarchar](255) NULL,
	[KTPO_ohjauksen_ala_2016_EN] [nvarchar](255) NULL,
	[KTPO_ohjauksen_ala_2016_koodi] [nvarchar](10) NOT NULL,
	[jarjestys_KTPO_ohjauksen_ala_2016] [nvarchar](10) NOT NULL,
	[Yliopistot_tutkintotavoitteet] [nvarchar](255) NULL,
	[Yliopistot_tutkintotavoitteet_SV] [nvarchar](255) NULL,
	[Yliopistot_tutkintotavoitteet_EN] [nvarchar](255) NULL,
	[Yliopistot_tutkintotavoitteet_koodi] [nvarchar](10) NOT NULL,
	[jarjestys_Yliopistot_tutkintotavoitteet] [nvarchar](10) NOT NULL,
	[Ammattikorkeakoulut_tutkintotavoitteet] [nvarchar](255) NULL,
	[Ammattikorkeakoulut_tutkintotavoitteet_SV] [nvarchar](255) NULL,
	[Ammattikorkeakoulut_tutkintotavoitteet_EN] [nvarchar](255) NULL,
	[Ammattikorkeakoulut_tutkintotavoitteet_koodi] [nvarchar](10) NOT NULL,
	[jarjestys_Ammattikorkeakoulut_tutkintotavoitteet] [nvarchar](10) NOT NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iscle]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iscle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iscle](
	[iscle] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iscor]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iscor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iscor](
	[iscor] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[iscst]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iscst]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[iscst](
	[iscst] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5e] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muulla_koulutussektorilla]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muulla_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muussa_maakunnassa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muussa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muussa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muussa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5f] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[jatko_opiskelu]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jatko_opiskelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jatko_opiskelu](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatko_opiskelu_koodi] [nvarchar](10) NULL,
	[jatko_opiskelu] [nvarchar](250) NULL,
	[jatko_opiskelu_SV] [nvarchar](250) NULL,
	[jatko_opiskelu_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[joustava_perusopetus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[joustava_perusopetus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[joustava_perusopetus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[joustava_perusopetus_koodi] [nchar](2) NULL,
	[joustava_perusopetus] [nvarchar](50) NULL,
	[joustava_perusopetus_SV] [nvarchar](50) NULL,
	[joustava_perusopetus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kansalaisuus_versio1]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kansalaisuus_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kansalaisuus_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kansalaisuus_versio1_koodi] [nvarchar](2) NULL,
	[kansalaisuus_versio1] [nvarchar](50) NULL,
	[kansalaisuus_versio1_SV] [nvarchar](50) NULL,
	[kansalaisuus_versio1_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kansalaisuus_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kansalaisuus_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kansalaisuus_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kansalaisuus_versio2_koodi] [nvarchar](2) NULL,
	[kansalaisuus_versio2] [nvarchar](50) NULL,
	[kansalaisuus_versio2_SV] [nvarchar](50) NULL,
	[kansalaisuus_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kausi]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kausi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kausi](
	[kausi_id] [nvarchar](10) NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vuosi] [int] NULL,
	[vuosiselite] [nvarchar](20) NULL,
	[vuosiselite_SV] [nvarchar](20) NULL,
	[vuosiselite_EN] [nvarchar](20) NULL,
	[lukukausi] [int] NULL,
	[lukukausiselite] [nvarchar](20) NULL,
	[lukukausiselite_SV] [nvarchar](20) NULL,
	[lukukausiselite_EN] [nvarchar](20) NULL,
	[kuukausi] [int] NULL,
	[kuukausiselite] [nvarchar](20) NULL,
	[kuukausiselite_SV] [nvarchar](20) NULL,
	[kuukausiselite_EN] [nvarchar](20) NULL,
	[paiva] [int] NULL,
	[lukuvuosi] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](15) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kieli]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kieli_avain] [nvarchar](10) NULL,
	[kieli_koodi] [nvarchar](2) NULL,
	[kieli] [nvarchar](50) NULL,
	[kieli_SV] [nvarchar](50) NULL,
	[kieli_EN] [nvarchar](50) NULL,
	[iso3kirjainta_koodi] [nvarchar](3) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_iso3kirjainta] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kieli2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kieli2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kieli2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kieli_koodi] [nchar](2) NULL,
	[kieli] [nvarchar](50) NULL,
	[kieli_SV] [nvarchar](50) NULL,
	[kieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kielisuhde]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kielisuhde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kielisuhde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kielisuhde_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[korkeakoulut]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[korkeakoulut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[korkeakoulut](
	[oppilaitoskoodi] [nvarchar](10) NULL,
	[oppilaitos] [nvarchar](255) NULL,
	[oppilaitos_SV] [nvarchar](255) NULL,
	[oppilaitos_EN] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_jarjestaja]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_jarjestaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_jarjestaja](
	[id] [int] NOT NULL,
	[koulutuksen_jarjestajakoodi] [nvarchar](10) NOT NULL,
	[korvaavakoodi] [varchar](10) NULL,
	[alkaa] [datetime2](7) NULL,
	[paattyy] [datetime2](7) NULL,
	[viimeisin_tilv] [nvarchar](4) NULL,
	[koulutuksen_jarjestajaselite_FI] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_SV] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_EN] [nvarchar](255) NULL,
	[omistajatyyppikoodi] [varchar](2) NULL,
	[omistajatyyppiselite_FI] [nvarchar](255) NULL,
	[omistajatyyppiselite_SV] [nvarchar](255) NULL,
	[omistajatyyppiselite_EN] [nvarchar](255) NULL,
	[koulutuksen_jarjestajan_kielikoodi] [varchar](2) NULL,
	[koulutuksen_jarjestajan_kieliselite_FI] [nvarchar](255) NULL,
	[koulutuksen_jarjestajan_kieliselite_SV] [nvarchar](255) NULL,
	[koulutuksen_jarjestajan_kieliselite_EN] [nvarchar](255) NULL,
	[sijaintikuntakoodi] [varchar](3) NULL,
	[sijaintikuntaselite_FI] [nvarchar](255) NULL,
	[sijaintikuntaselite_SV] [nvarchar](255) NULL,
	[sijaintikuntaselite_EN] [nvarchar](255) NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_omistajatyyppi] [nvarchar](10) NULL,
	[jarjestys_koulutuksen_jarjestajan_kieli] [nvarchar](10) NULL,
	[jarjestys_sijaintikunta] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_jarjestaja_nykytila]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_jarjestaja_nykytila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_jarjestaja_nykytila](
	[koulutuksen_jarjestajakoodi] [varchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[koulutuksen_jarjestajakoodi_nykytila] [varchar](10) NULL,
	[koulutuksen_jarjestaja_nykytila] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_jarjestajan_koko]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_jarjestajan_koko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_jarjestajan_koko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koko_koodi] [nchar](2) NULL,
	[koko] [nvarchar](50) NULL,
	[koko_SV] [nvarchar](50) NULL,
	[koko_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_jarjestamismuoto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_jarjestamismuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_jarjestamismuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksen_jarjestamismuoto_koodi] [nvarchar](2) NOT NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](50) NULL,
	[koulutuksen_jarjestamismuoto_SV] [nvarchar](50) NULL,
	[koulutuksen_jarjestamismuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_kesto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_kesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_kesto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_kesto_koodi] [varchar](2) NULL,
	[koulutuksen_kesto] [nvarchar](50) NULL,
	[koulutuksen_kesto_SV] [nvarchar](50) NULL,
	[koulutuksen_kesto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_kieli_versio1]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_kieli_versio1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_kieli_versio1](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_kieli_versio1_koodi] [nvarchar](3) NULL,
	[koulutuksen_kieli_versio1] [nvarchar](250) NULL,
	[koulutuksen_kieli_versio1_SV] [nvarchar](250) NULL,
	[koulutuksen_kieli_versio1_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_paattaneiden_toiminta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_paattaneiden_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_paattaneiden_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuksen_paattaneiden_toiminta_koodi] [nvarchar](2) NULL,
	[koulutuksen_paattaneiden_toiminta] [nvarchar](250) NULL,
	[koulutuksen_paattaneiden_toiminta_SV] [nvarchar](250) NULL,
	[koulutuksen_paattaneiden_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksen_tavoite_toteuma]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksen_tavoite_toteuma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksen_tavoite_toteuma](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksen_tavoite_toteuma_koodi] [nvarchar](2) NOT NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](50) NULL,
	[koulutuksen_tavoite_toteuma_SV] [nvarchar](50) NULL,
	[koulutuksen_tavoite_toteuma_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuksesta_kulunut_aika]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuksesta_kulunut_aika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuksesta_kulunut_aika](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutuksesta_kulunut_aika_koodi] [nvarchar](20) NOT NULL,
	[koulutuksesta_kulunut_aika] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_5v_EN] [nvarchar](100) NULL,
	[jarjestys_5v] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv_SV] [nvarchar](100) NULL,
	[koulutuksesta_kulunut_aika_tthv_EN] [nvarchar](100) NULL,
	[jarjestys_tthv] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusala](
	[koulutusala] [nvarchar](20) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[selite_FI] [nvarchar](255) NULL,
	[selite_SV] [nvarchar](255) NULL,
	[selite_EN] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusala2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusala2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusala2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutusala_2002koodi] [nvarchar](10) NOT NULL,
	[koulutusala_2002] [nvarchar](250) NULL,
	[koulutusala_2002_SV] [nvarchar](250) NULL,
	[koulutusala_2002_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusaste_2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusaste_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusaste_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutusaste_2002koodi] [nvarchar](10) NOT NULL,
	[koulutusaste_2002] [nvarchar](250) NULL,
	[koulutusaste_2002_SV] [nvarchar](250) NULL,
	[koulutusaste_2002_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuskoodin_tieteenala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuskoodin_tieteenala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuskoodin_tieteenala](
	[koulutuskoodi] [nvarchar](6) NOT NULL,
	[tieteenala_avain] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuslaji]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuslaji_koodi] [nvarchar](10) NULL,
	[koulutuslaji] [nvarchar](150) NULL,
	[koulutuslaji_SV] [nvarchar](150) NULL,
	[koulutuslaji_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuslaji_okm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji_okm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuslaji_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji_okm_avain] [nvarchar](10) NULL,
	[koulutuslaji_okm] [nvarchar](100) NULL,
	[koulutuslaji_okm_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm_EN] [nvarchar](100) NULL,
	[koulutuslaji_okm2] [nvarchar](100) NULL,
	[koulutuslaji_okm2_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm2_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[jarjestys2] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuslaji2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuslaji2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji2_koodi] [nvarchar](10) NULL,
	[koulutuslaji2] [nvarchar](250) NULL,
	[koulutuslaji2_SV] [nvarchar](250) NULL,
	[koulutuslaji2_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji2] [nvarchar](50) NULL,
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
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuslaji3]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuslaji3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji3_koodi] [nvarchar](10) NULL,
	[koulutuslaji3] [nvarchar](250) NULL,
	[koulutuslaji3_SV] [nvarchar](250) NULL,
	[koulutuslaji3_EN] [nvarchar](250) NULL,
	[jarjestys_koulutuslaji3] [nvarchar](50) NULL,
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
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusluokitus]    Script Date: 19.6.2017 11:57:58 ******/
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
/****** Object:  Table [dbo].[koulutusmuoto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusmuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusmuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusmuoto_koodi] [nvarchar](2) NULL,
	[koulutusmuoto] [nvarchar](350) NULL,
	[koulutusmuoto_SV] [nvarchar](350) NULL,
	[koulutusmuoto_EN] [nvarchar](350) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusohjelma_amk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusohjelma_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusohjelma_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusohjelma_amk_koodi] [nvarchar](4) NULL,
	[koulutusohjelma_amk] [nvarchar](150) NULL,
	[koulutusohjelma_amk_SV] [nvarchar](150) NULL,
	[koulutusohjelma_amk_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusohjelma_ammpk]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusohjelma_ammpk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusohjelma_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusohjelma_ammpk_koodi] [nvarchar](4) NULL,
	[koulutusohjelma_ammpk] [nvarchar](100) NULL,
	[koulutusohjelma_ammpk_SV] [nvarchar](100) NULL,
	[koulutusohjelma_ammpk_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutusryhma]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutusryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusryhma_koodi] [nvarchar](2) NULL,
	[koulutusryhma] [nvarchar](255) NULL,
	[koulutusryhma_SV] [nvarchar](255) NULL,
	[koulutusryhma_EN] [nvarchar](255) NULL,
	[koulutusryhma2] [nvarchar](255) NULL,
	[koulutusryhma2_SV] [nvarchar](255) NULL,
	[koulutusryhma2_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutussektori]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutussektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutussektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutussektori_koodi] [nvarchar](2) NOT NULL,
	[koulutussektori] [nvarchar](50) NULL,
	[koulutussektori_SV] [nvarchar](50) NULL,
	[koulutussektori_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutustyyppi]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutustyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutustyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutustyyppi_koodi] [nvarchar](2) NULL,
	[koulutustyyppi] [nvarchar](50) NULL,
	[koulutustyyppi_SV] [nvarchar](50) NULL,
	[koulutustyyppi_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kuntaryh]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kuntaryh]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kuntaryh](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kuntaryh_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kylla_ei]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kylla_ei]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kylla_ei](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kylla_ei_koodi] [nchar](2) NULL,
	[kylla_ei] [nvarchar](20) NULL,
	[kylla_ei_SV] [nvarchar](20) NULL,
	[kylla_ei_EN] [nvarchar](20) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[laani]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[laani]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[laani](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[laani_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lahde]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[lahde_koodi] [nvarchar](10) NULL,
	[lahde] [nvarchar](250) NULL,
	[lahde_SV] [nvarchar](250) NULL,
	[lahde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lukiokoulutuksen_koulutuslaji]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lukiokoulutuksen_koulutuslaji]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lukiokoulutuksen_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[lukiokoulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](100) NULL,
	[lukiokoulutuksen_koulutuslaji_SV] [nvarchar](100) NULL,
	[lukiokoulutuksen_koulutuslaji_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lukion_ainevalinnat]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lukion_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lukion_ainevalinnat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[avain_aine] [nvarchar](50) NULL,
	[avain_laajuus] [nvarchar](50) NULL,
	[aineryhmä_jarjestys] [nvarchar](50) NULL,
	[aineryhmä] [nvarchar](50) NULL,
	[aineryhmä_SV] [nvarchar](50) NULL,
	[aineryhmä_EN] [nvarchar](50) NULL,
	[aine_jarjestys] [nvarchar](50) NULL,
	[aine] [nvarchar](50) NULL,
	[aine_SV] [nvarchar](50) NULL,
	[aine_EN] [nvarchar](50) NULL,
	[laajuus_jarjestys] [nvarchar](50) NULL,
	[laajuus] [nvarchar](50) NULL,
	[laajuus_SV] [nvarchar](50) NULL,
	[laajuus_EN] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lukion_kieltenmaara]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lukion_kieltenmaara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lukion_kieltenmaara](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[kieltenmaara_koodi] [nvarchar](10) NULL,
	[kieltenmaara] [nvarchar](50) NULL,
	[kieltenmaara_SV] [nvarchar](50) NULL,
	[kieltenmaara_EN] [nvarchar](50) NULL,
	[kieltenmaara_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[maahantulo_ja_opiskelun_aloittaminen]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maahantulo_ja_opiskelun_aloittaminen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maahantulo_ja_opiskelun_aloittaminen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[maahantulo_ja_opiskelun_aloittaminen_koodi] [nvarchar](2) NULL,
	[maahantulo_ja_opiskelun_aloittaminen] [nvarchar](255) NULL,
	[maahantulo_ja_opiskelun_aloittaminen_SV] [nvarchar](255) NULL,
	[maahantulo_ja_opiskelun_aloittaminen_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[maakunta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maakunta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maakunta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[maakunta_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[maassaolo]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maassaolo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maassaolo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[maassaolo_koodi] [nvarchar](10) NULL,
	[maassaolo] [nvarchar](60) NULL,
	[maassaolo_SV] [nvarchar](60) NULL,
	[maassaolo_EN] [nvarchar](60) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mannersu_ahvena]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mannersu_ahvena]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mannersu_ahvena](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[mannersu_ahvena_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mitenna_ammatti]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mitenna_ammatti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mitenna_ammatti](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[mitenna_ammattiryhma1_koodi] [nvarchar](20) NULL,
	[mitenna_ammattiryhma1] [nvarchar](250) NULL,
	[mitenna_ammattiryhma1_SV] [nvarchar](250) NULL,
	[mitenna_ammattiryhma1_EN] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[mitenna_ammattiryhma2] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_SV] [nvarchar](250) NULL,
	[mitenna_ammattiryhma2_EN] [nvarchar](250) NULL,
	[mitenna_ammatti_koodi] [nvarchar](20) NULL,
	[mitenna_ammatti] [nvarchar](250) NULL,
	[mitenna_ammatti_SV] [nvarchar](250) NULL,
	[mitenna_ammatti_EN] [nvarchar](250) NULL,
	[jarjestys_ammattiryhma1] [nvarchar](50) NULL,
	[jarjestys_ammattiryhma2] [nvarchar](50) NULL,
	[jarjestys_ammatti] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mitenna_toimiala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mitenna_toimiala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mitenna_toimiala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[mitenna_toimiala1_koodi] [nvarchar](20) NULL,
	[mitenna_toimiala1] [nvarchar](250) NULL,
	[mitenna_toimiala1_SV] [nvarchar](250) NULL,
	[mitenna_toimiala1_EN] [nvarchar](250) NULL,
	[mitenna_toimiala2_koodi] [nvarchar](20) NULL,
	[mitenna_toimiala2] [nvarchar](250) NULL,
	[mitenna_toimiala2_SV] [nvarchar](250) NULL,
	[mitenna_toimiala2_EN] [nvarchar](250) NULL,
	[tol_koodi] [nvarchar](20) NULL,
	[tol] [nvarchar](250) NULL,
	[tol_SV] [nvarchar](250) NULL,
	[tol_EN] [nvarchar](250) NULL,
	[jarjestys_mitenna_toimiala1] [nvarchar](50) NULL,
	[jarjestys_mitenna_toimiala2] [nvarchar](50) NULL,
	[jarjestys_tol] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[moninkertainen_haku]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[moninkertainen_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[moninkertainen_haku](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[moninkertainen_haku_koodi] [nvarchar](2) NULL,
	[moninkertainen_haku] [nvarchar](250) NULL,
	[moninkertainen_haku_SV] [nvarchar](250) NULL,
	[moninkertainen_haku_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[nuorten_aikuisten_koulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[nuorten_aikuisten_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[nuorten_aikuisten_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[nuorten_aikuisten_koulutus_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_SV] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[nuorten_aikuisten_koulutus_amm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[nuorten_aikuisten_koulutus_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[nuorten_aikuisten_koulutus_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_amm_SV] [nvarchar](50) NULL,
	[nuorten_aikuisten_koulutus_amm_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[omist]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[omist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[omist](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[omist_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajan_tehtavatyyppi_perusopetuksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajan_tehtavatyyppi_perusopetuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajankelpoisuus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajankelpoisuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajankelpoisuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opettajankelpoisuus_koodi] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](50) NULL,
	[opettajankelpoisuus_SV] [nvarchar](50) NULL,
	[opettajankelpoisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajankelpoisuus2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajankelpoisuus2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajankelpoisuus2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opettajankelpoisuus_koodi] [nvarchar](2) NULL,
	[opettajankelpoisuus] [nvarchar](50) NULL,
	[opettajankelpoisuus_SV] [nvarchar](50) NULL,
	[opettajankelpoisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_aine]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_aine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_aine](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_aine_2016]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_aine_2016]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_aine_2016](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_aine_2016_lukio]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_aine_2016_lukio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_aine_2016_lukio](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](2) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_aine_amm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_aine_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_aine_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](3) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_aine_vst]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_aine_vst]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_aine_vst](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](3) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_koko_osa_aikainen]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_koko_osa_aikainen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_koko_osa_aikainen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koko_osa_aikainen_koodi] [nvarchar](2) NULL,
	[koko_osa_aikainen] [nvarchar](255) NULL,
	[koko_osa_aikainen_SV] [nvarchar](255) NULL,
	[koko_osa_aikainen_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_koulutusaste]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_koulutusaste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_koulutusaste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_koulutusaste_amm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_koulutusaste_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_koulutusaste_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_luokka_aste]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_luokka_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_luokka_aste](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[luokka_aste_koodi] [nvarchar](2) NULL,
	[luokka_aste] [nvarchar](255) NULL,
	[luokka_aste_SV] [nvarchar](255) NULL,
	[luokka_aste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_osa_aikaisuuden_syy]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_osa_aikaisuuden_syy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_osa_aikaisuuden_syy](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[syy_koodi] [nvarchar](2) NULL,
	[syy] [nvarchar](255) NULL,
	[syy_SV] [nvarchar](255) NULL,
	[syy_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opettajat_tyosuhteen_luonne]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opettajat_tyosuhteen_luonne]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opettajat_tyosuhteen_luonne](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyosuhteen_luonne_koodi] [nvarchar](2) NULL,
	[tyosuhteen_luonne] [nvarchar](255) NULL,
	[tyosuhteen_luonne_SV] [nvarchar](255) NULL,
	[tyosuhteen_luonne_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetuksen_jarjestajan_tiedoantajatyyppi]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetuksen_jarjestajan_tiedoantajatyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetuksen_jarjestajan_tiedoantajatyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tiedonantajatyyppi_koodi] [nvarchar](10) NULL,
	[tiedonantajatyyppi] [nvarchar](250) NULL,
	[tiedonantajatyyppi_SV] [nvarchar](250) NULL,
	[tiedonantajatyyppi_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetushallinnon_koulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetushallinnon_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetushallinnon_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opetushallinnon_koulutus_koodi] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](50) NULL,
	[opetushallinnon_koulutus_SV] [nvarchar](100) NULL,
	[opetushallinnon_koulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetushallinnon_koulutusala]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetushallinnon_koulutusala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetushallinnon_koulutusala](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[koulutusala_koodi] [nvarchar](2) NULL,
	[koulutusala] [nvarchar](100) NULL,
	[koulutusala_SV] [nvarchar](100) NULL,
	[koulutusala_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolähde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetuskieli]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetuskieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetuskieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opetuskieli_koodi] [nchar](2) NULL,
	[opetuskieli] [nvarchar](50) NULL,
	[opetuskieli_SV] [nvarchar](50) NULL,
	[opetuskieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetuskieli2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetuskieli2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetuskieli2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opetuskieli_koodi] [nchar](2) NULL,
	[opetuskieli] [nvarchar](50) NULL,
	[opetuskieli_SV] [nvarchar](50) NULL,
	[opetuskieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](50) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV] [nvarchar](100) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opetustuntien_sisalto_ja_tavoiteluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opetustuntien_sisalto_ja_tavoiteluokitus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[Opetustuntikoodi] [varchar](10) NULL,
	[Koulutusala_lajittelu] [int] NULL,
	[Koulutusala] [varchar](150) NULL,
	[Koulutusala_SV] [varchar](150) NULL,
	[Koulutusala_EN] [varchar](150) NULL,
	[Opintoala_lajittelu] [int] NULL,
	[Opintoala] [varchar](150) NULL,
	[Opintoala_SV] [varchar](150) NULL,
	[Opintoala_EN] [varchar](150) NULL,
	[Koulutustyyppi_lajittelu] [int] NULL,
	[Koulutustyyppi] [varchar](150) NULL,
	[Koulutustyyppi_SV] [varchar](150) NULL,
	[Koulutustyyppi_EN] [varchar](150) NULL,
	[Opetustunti_lajittelu] [int] NULL,
	[Opetustunti] [varchar](150) NULL,
	[Opetustunti_SV] [varchar](150) NULL,
	[Opetustunti_EN] [varchar](150) NULL,
	[Sukupuoli] [varchar](20) NULL,
	[Naistenosuuskoodi] [varchar](10) NULL,
	[KuutioonKE] [char](1) NULL,
	[Mittari] [char](1) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintoala1995]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintoala1995]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintoala1995](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[opintoala_1995koodi] [nvarchar](10) NOT NULL,
	[opintoala_1995] [nvarchar](250) NULL,
	[opintoala_1995_SV] [nvarchar](250) NULL,
	[opintoala_1995_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintoala2002]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintoala2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintoala2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintoala2002_koodi] [nvarchar](3) NULL,
	[opintoala2002] [nvarchar](250) NULL,
	[opintoala2002_SV] [nvarchar](250) NULL,
	[opintoala2002_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_4a] [nvarchar](10) NULL,
	[jarjestys_4b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_4bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutusalan_2002_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutusalan_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_2a] [nvarchar](10) NULL,
	[jarjestys_2b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusalan_2002_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_2bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutusasteen_2002_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutusasteen_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutusasteen_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutusasteen_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_1a] [nvarchar](10) NULL,
	[jarjestys_1b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_koulutussektorin_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_koulutussektorin_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_koulutussektorin_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutussektorin_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutussektorin_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_koulutussektorin_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutussektorin_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_7a] [nvarchar](10) NULL,
	[jarjestys_7b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_maakunnan_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_maakunnan_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_maakunnan_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_maakunnan_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_maakunnan_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_maakunnan_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_maakunnan_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_6a] [nvarchar](10) NULL,
	[jarjestys_6b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_opintoalan_2002_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_opintoalan_2002_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_opintoala_2002_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_opintoala_2002_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_3a] [nvarchar](10) NULL,
	[jarjestys_3b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_opintoala_2002_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_3bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_oppilaitoksen_mukaan]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_oppilaitoksen_mukaan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_5a] [nvarchar](10) NULL,
	[jarjestys_5b] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_oppilaitoksen_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_5bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_koodi] [nvarchar](10) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus] [nvarchar](250) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_SV] [nvarchar](250) NULL,
	[opiskelijan_aikaisempi_yleissivistava_koulutus_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijan_fte_tieto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijan_fte_tieto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijan_fte_tieto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_fte_tieto_koodi] [nvarchar](2) NULL,
	[opiskelijan_fte_tieto] [nvarchar](50) NULL,
	[opiskelijan_fte_tieto_SV] [nvarchar](50) NULL,
	[opiskelijan_fte_tieto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijan_olo]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijan_olo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijan_olo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_olo_koodi] [nvarchar](10) NULL,
	[opiskelijan_olo] [nvarchar](250) NULL,
	[opiskelijan_olo_SV] [nvarchar](250) NULL,
	[opiskelijan_olo_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijan_olo_tamm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijan_olo_tamm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijan_olo_tamm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelijan_olo_tamm_koodi] [nvarchar](10) NULL,
	[opiskelijan_olo_tamm] [nvarchar](250) NULL,
	[opiskelijan_olo_tamm_SV] [nvarchar](250) NULL,
	[opiskelijan_olo_tamm_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelu_toiminta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelu_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelu_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[opiskelu_toiminta_koodi] [nvarchar](10) NULL,
	[opiskelu_toiminta] [nvarchar](250) NULL,
	[opiskelu_toiminta_SV] [nvarchar](250) NULL,
	[opiskelu_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys_opiskelu_toiminta] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelumuoto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelumuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelumuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opiskelumuoto_koodi] [nvarchar](2) NULL,
	[opiskelumuoto] [nvarchar](50) NULL,
	[opiskelumuoto_SV] [nvarchar](50) NULL,
	[opiskelumuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppilaitos]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppilaitos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppilaitos](
	[id] [int] NOT NULL,
	[oppilaitoskoodi] [nvarchar](5) NOT NULL,
	[korvaavakoodi] [nvarchar](5) NULL,
	[alkaa] [datetime2](7) NULL,
	[paattyy] [datetime2](7) NULL,
	[viimeisin_tilv] [nvarchar](4) NULL,
	[oppilaitosselite_FI] [nvarchar](255) NULL,
	[oppilaitosselite_SV] [nvarchar](255) NULL,
	[oppilaitosselite_EN] [nvarchar](255) NULL,
	[sairaalakoulukoodi] [nvarchar](2) NULL,
	[sairaalakouluselite_FI] [nvarchar](255) NULL,
	[sairaalakouluselite_SV] [nvarchar](255) NULL,
	[sairaalakouluselite_EN] [nvarchar](255) NULL,
	[oppilaitostyyppikoodi] [nvarchar](2) NULL,
	[oppilaitostyyppiselite_FI] [nvarchar](255) NULL,
	[oppilaitostyyppiselite_SV] [nvarchar](255) NULL,
	[oppilaitostyyppiselite_EN] [nvarchar](255) NULL,
	[peruskoulujen_ryhmityskoodi] [nvarchar](2) NULL,
	[peruskoulujen_ryhmitysselite_FI] [nvarchar](255) NULL,
	[peruskoulujen_ryhmitysselite_SV] [nvarchar](255) NULL,
	[peruskoulujen_ryhmitysselite_EN] [nvarchar](255) NULL,
	[peruskoulujen_vuosilkskoodi] [nvarchar](2) NULL,
	[peruskoulujen_vuosilksselite_FI] [nvarchar](255) NULL,
	[peruskoulujen_vuosilksselite_SV] [nvarchar](255) NULL,
	[peruskoulujen_vuosilksselite_EN] [nvarchar](255) NULL,
	[omistajatyyppikoodi] [nvarchar](2) NULL,
	[omistajatyyppiselite_FI] [nvarchar](255) NULL,
	[omistajatyyppiselite_SV] [nvarchar](255) NULL,
	[omistajatyyppiselite_EN] [nvarchar](255) NULL,
	[opetuskielikoodi] [nvarchar](2) NULL,
	[opetuskieliselite_FI] [nvarchar](255) NULL,
	[opetuskieliselite_SV] [nvarchar](255) NULL,
	[opetuskieliselite_EN] [nvarchar](255) NULL,
	[koulutuksen_jarjestajakoodi] [nvarchar](9) NULL,
	[koulutuksen_jarjestajaselite_FI] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_SV] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_EN] [nvarchar](255) NULL,
	[sijaintikuntakoodi] [nvarchar](3) NULL,
	[sijaintikuntaselite_FI] [nvarchar](255) NULL,
	[sijaintikuntaselite_SV] [nvarchar](255) NULL,
	[sijaintikuntaselite_EN] [nvarchar](255) NULL,
	[koordinaatti_itakoodi] [nvarchar](10) NULL,
	[koordinaatti_pohjoiskoodi] [nvarchar](10) NULL,
	[postinumerokoodi] [nvarchar](5) NULL,
	[SCD_alkaa] [datetime2](7) NULL,
	[SCD_paattyy] [datetime2](7) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[jarjestys_sairaalakoulu] [nvarchar](10) NULL,
	[jarjestys_oppilaitostyyppi] [nvarchar](10) NULL,
	[jarjestys_peruskoulujen_ryhmitys] [nvarchar](10) NULL,
	[jarjestys_peruskoulujen_vuosilks] [nvarchar](10) NULL,
	[jarjestys_omistajatyyppi] [nvarchar](10) NULL,
	[jarjestys_opetuskieli] [nvarchar](10) NULL,
	[jarjestys_koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[jarjestys_sijaintikunta] [nvarchar](10) NULL,
	[jarjestys_koordinaatti_ita] [nvarchar](10) NULL,
	[jarjestys_koordinaatti_pohjois] [nvarchar](10) NULL,
	[jarjestys_postinumero] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppilaitostyyppi]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppilaitostyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppilaitostyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[oppilaitostyyppi_koodi] [nchar](2) NULL,
	[oppilaitostyyppi] [nvarchar](150) NULL,
	[oppilaitostyyppi_SV] [nvarchar](150) NULL,
	[oppilaitostyyppi_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppisopimus_purkautunut]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppisopimus_purkautunut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppisopimus_purkautunut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimus_purkautunut_koodi] [nvarchar](2) NULL,
	[oppisopimus_purkautunut] [nvarchar](50) NULL,
	[oppisopimus_purkautunut_SV] [nvarchar](50) NULL,
	[oppisopimus_purkautunut_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppisopimus_yrityksen_koko]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppisopimus_yrityksen_koko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppisopimus_yrityksen_koko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimus_yrityksen_koko_koodi] [nvarchar](2) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](50) NULL,
	[oppisopimus_yrityksen_koko_SV] [nvarchar](50) NULL,
	[oppisopimus_yrityksen_koko_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppisopimuskoulutus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppisopimuskoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[oppisopimuskoulutus] [nvarchar](50) NULL,
	[oppisopimuskoulutus_SV] [nvarchar](100) NULL,
	[oppisopimuskoulutus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppis_osallis_ja_tutk_suor_koodi] [varchar](8) NULL,
	[oppis_osallis_ja_tutk_suor] [nvarchar](60) NULL,
	[oppis_osallis_ja_tutk_suor_SV] [nvarchar](60) NULL,
	[oppis_osallis_ja_tutk_suor_EN] [nvarchar](60) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[osatutkinto]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[osatutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[osatutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[osatutkinto_koodi] [nvarchar](10) NULL,
	[osatutkinto] [nvarchar](50) NULL,
	[osatutkinto_SV] [nvarchar](50) NULL,
	[osatutkinto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_ja_maasta_muuttaneet]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_ja_maasta_muuttaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_ja_maasta_muuttaneet](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_okm]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_okm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_okm_koodi] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_okm] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_okm_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_okm_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_versio2]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_versio2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_versio2_koodi] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio2] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio2_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio2_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_versio3]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_versio3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_versio3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[paaasiallinen_toiminta_versio3_avain] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusjoukko]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusjoukko]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusjoukko](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusjoukko_avain] [nvarchar](10) NULL,
	[perusjoukko] [nvarchar](250) NULL,
	[perusjoukko_SV] [nvarchar](250) NULL,
	[perusjoukko_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusjoukko_tyolliset]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusjoukko_tyolliset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusjoukko_tyolliset](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusjoukko_tyolliset_avain] [nvarchar](10) NULL,
	[perusjoukko_tyolliset] [nvarchar](250) NULL,
	[perusjoukko_tyolliset_SV] [nvarchar](250) NULL,
	[perusjoukko_tyolliset_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_ainevalinnat]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_ainevalinnat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_ainevalinnat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[aineryhmä] [nvarchar](50) NULL,
	[aineryhmä_SV] [nvarchar](50) NULL,
	[aineryhmä_EN] [nvarchar](50) NULL,
	[aine_koodi] [nvarchar](10) NULL,
	[aine] [nvarchar](250) NULL,
	[aine_SV] [nvarchar](250) NULL,
	[aine_EN] [nvarchar](250) NULL,
	[kielen_taso_koodi] [nvarchar](10) NULL,
	[kielen_taso] [nvarchar](250) NULL,
	[kielen_taso_SV] [nvarchar](250) NULL,
	[kielen_taso_EN] [nvarchar](250) NULL,
	[ainevalinta] [nvarchar](250) NULL,
	[ainevalinta_SV] [nvarchar](250) NULL,
	[ainevalinta_EN] [nvarchar](250) NULL,
	[aineryhmä_jarjestys] [nvarchar](50) NULL,
	[aine_jarjestys] [nvarchar](50) NULL,
	[kielen_taso_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_aloitusika]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_aloitusika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_aloitusika](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_aloitusika_koodi] [nchar](10) NULL,
	[perusopetuksen_aloitusika] [nvarchar](50) NULL,
	[perusopetuksen_aloitusika_SV] [nvarchar](50) NULL,
	[perusopetuksen_aloitusika_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_erityisen_tuen_paatos]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_erityisen_tuen_paatos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_erityisen_tuen_paatos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_erityisen_tuen_paatos_koodi] [nchar](2) NULL,
	[perusopetuksen_erityisen_tuen_paatos] [nvarchar](50) NULL,
	[perusopetuksen_erityisen_tuen_paatos_SV] [nvarchar](50) NULL,
	[perusopetuksen_erityisen_tuen_paatos_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_kieltenmaara]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_kieltenmaara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_kieltenmaara](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kieltenmäärä_koodi] [nvarchar](10) NULL,
	[kieltenmäärä] [nvarchar](250) NULL,
	[kieltenmäärä_SV] [nvarchar](250) NULL,
	[kieltenmäärä_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_kuljetusetuus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_kuljetusetuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_kuljetusetuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_kuljetusetuus_koodi] [nchar](2) NULL,
	[perusopetuksen_kuljetusetuus] [nvarchar](50) NULL,
	[perusopetuksen_kuljetusetuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_kuljetusetuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_majoitusetuus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_majoitusetuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_majoitusetuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_majoitusetuus_koodi] [nchar](2) NULL,
	[perusopetuksen_majoitusetuus] [nvarchar](50) NULL,
	[perusopetuksen_majoitusetuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_majoitusetuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_oppimaaran_yksilollistaminen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_oppimaaran_yksilollistaminen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_koodi] [nchar](10) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen] [nvarchar](100) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_SV] [nvarchar](100) NULL,
	[perusopetuksen_oppimaaran_yksilollistaminen_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_pidennetty_oppivelvollisuus]    Script Date: 19.6.2017 11:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_pidennetty_oppivelvollisuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_pidennetty_oppivelvollisuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_koodi] [nchar](2) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus] [nvarchar](50) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_SV] [nvarchar](50) NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_tehostettu_tuki]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_tehostettu_tuki]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_tehostettu_tuki](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_tehostettu_tuki_koodi] [nchar](10) NULL,
	[perusopetuksen_tehostettu_tuki] [nvarchar](50) NULL,
	[perusopetuksen_tehostettu_tuki_SV] [nvarchar](100) NULL,
	[perusopetuksen_tehostettu_tuki_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_tukimuoto]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_tukimuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_tukimuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_tukimuoto_koodi] [nchar](10) NULL,
	[perusopetuksen_tukimuoto] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_SV] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_vuosiluokat]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_vuosiluokat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_vuosiluokat](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vuosiluokka_koodi] [nvarchar](10) NULL,
	[vuosiluokka] [nvarchar](250) NULL,
	[vuosiluokka_SV] [nvarchar](250) NULL,
	[vuosiluokka_EN] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89_SV] [nvarchar](250) NULL,
	[luokkajako_12_36_7_89_EN] [nvarchar](250) NULL,
	[luokkajako_16_79] [nvarchar](250) NULL,
	[luokkajako_16_79_SV] [nvarchar](250) NULL,
	[luokkajako_16_79_EN] [nvarchar](250) NULL,
	[luokkajako_16_710] [nvarchar](250) NULL,
	[luokkajako_16_710_SV] [nvarchar](250) NULL,
	[luokkajako_16_710_EN] [nvarchar](250) NULL,
	[luokkajako_0_19_10] [nvarchar](250) NULL,
	[luokkajako_0_19_10_SV] [nvarchar](250) NULL,
	[luokkajako_0_19_10_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[luokkajako_12_36_7_89_jarjestys] [nvarchar](50) NULL,
	[luokkajako_16_79_jarjestys] [nvarchar](50) NULL,
	[luokkajako_16_710_jarjestys] [nvarchar](50) NULL,
	[luokkajako_0_19_10_jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[perusopetuksen_yleisopetuksen_osuus]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perusopetuksen_yleisopetuksen_osuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perusopetuksen_yleisopetuksen_osuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_yleisopetuksen_osuus_koodi] [nchar](10) NULL,
	[perusopetuksen_yleisopetuksen_osuus] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_SV] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pohjakoulutuksen_tila]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pohjakoulutuksen_tila]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pohjakoulutuksen_tila](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[pohjakoulutuksen_tila_koodi] [nvarchar](10) NULL,
	[pohjakoulutuksen_tila] [nvarchar](250) NULL,
	[pohjakoulutuksen_tila_SV] [nvarchar](250) NULL,
	[pohjakoulutuksen_tila_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pohjoismaa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pohjoismaa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pohjoismaa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[pohjoismaa_koodi] [nvarchar](2) NULL,
	[pohjoismaa] [nvarchar](50) NULL,
	[pohjoismaa_SV] [nvarchar](50) NULL,
	[pohjoismaa_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rahoituslahde]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rahoituslahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rahoituslahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoituslahde_koodi] [nvarchar](10) NULL,
	[rahoituslahde] [nvarchar](250) NULL,
	[rahoituslahde_SV] [nvarchar](250) NULL,
	[rahoituslahde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[rahoituslahde_amm]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rahoituslahde_amm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rahoituslahde_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoituslahde_amm_koodi] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](100) NULL,
	[rahoituslahde_amm_SV] [nvarchar](100) NULL,
	[rahoituslahde_amm_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sama_koulutusala]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sama_koulutusala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sama_koulutusala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[sama_koulutusala_avain] [nvarchar](100) NULL,
	[sama_koulutusala] [nvarchar](100) NULL,
	[sama_koulutusala_SV] [nvarchar](100) NULL,
	[sama_koulutusala_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sarakeleveys]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sarakeleveys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sarakeleveys](
	[Sarakeleveys] [char](1) NULL,
	[leveys] [varchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sektoritutkimuslaitos]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sektoritutkimuslaitos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sektoritutkimuslaitos](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[sektoritutkimuslaitos_avain] [nvarchar](10) NULL,
	[sektoritutkimuslaitos_lyhenne] [nvarchar](20) NULL,
	[sektoritutkimuslaitos] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_SV] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_EN] [nvarchar](250) NULL,
	[jarjestys_sektoritutkimuslaitos] [nvarchar](50) NULL,
	[sektoritutkimuslaitos_lyhenne_historia] [nvarchar](20) NULL,
	[sektoritutkimuslaitos_historia] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_historia_SV] [nvarchar](250) NULL,
	[sektoritutkimuslaitos_historia_EN] [nvarchar](250) NULL,
	[jarjestys_sektoritutkimuslaitos_historia] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[seutukunta]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[seutukunta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[seutukunta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[seutukunta_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[siirtyman_tarkastelusuunta]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[siirtyman_tarkastelusuunta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[siirtyman_tarkastelusuunta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[siirtyman_tarkastelusuunta_avain] [nvarchar](10) NULL,
	[siirtyman_tarkastelusuunta] [nvarchar](250) NULL,
	[siirtyman_tarkastelusuunta_SV] [nvarchar](250) NULL,
	[siirtyman_tarkastelusuunta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sosioekonominen_asema]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sosioekonominen_asema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sosioekonominen_asema](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[sosioekonominen_asema_koodi] [nvarchar](10) NULL,
	[sosioekonominen_asema_ryhma] [nvarchar](250) NULL,
	[sosioekonominen_asema_ryhma_SV] [nvarchar](250) NULL,
	[sosioekonominen_asema_ryhma_EN] [nvarchar](250) NULL,
	[sosioekonominen_asema] [nvarchar](250) NULL,
	[sosioekonominen_asema_SV] [nvarchar](250) NULL,
	[sosioekonominen_asema_EN] [nvarchar](250) NULL,
	[jarjestys_ryhma] [nvarchar](50) NULL,
	[jarjestys_asema] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[suhteellinen_ajankohta]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[suhteellinen_ajankohta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[suhteellinen_ajankohta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suhteellinen_ajankohta_avain] [nvarchar](10) NULL,
	[suhteellinen_ajankohta] [nvarchar](250) NULL,
	[suhteellinen_ajankohta_SV] [nvarchar](250) NULL,
	[suhteellinen_ajankohta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sukupuoli]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sukupuoli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sukupuoli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[sukupuoli_koodi] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](50) NULL,
	[sukupuoli_SV] [nvarchar](50) NULL,
	[sukupuoli_EN] [nvarchar](50) NULL,
	[sukupuoli_lapsi] [nvarchar](50) NULL,
	[sukupuoli_lapsi_SV] [nvarchar](50) NULL,
	[sukupuoli_lapsi_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[suoritettu_tutkinto]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[suoritettu_tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[suoritettu_tutkinto](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[suoritettu_tutkinto_koodi] [nvarchar](2) NULL,
	[suoritettu_tutkinto] [nvarchar](100) NULL,
	[suoritettu_tutkinto_SV] [nvarchar](100) NULL,
	[suoritettu_tutkinto_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolähde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[suorlk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[suorlk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[suorlk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suorlk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[suuntautumisvaihtoehto_amk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[suuntautumisvaihtoehto_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[suuntautumisvaihtoehto_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suuntautumisvaihtoehto_amk_koodi] [varchar](5) NULL,
	[suuntautumisvaihtoehto_amk] [nvarchar](100) NULL,
	[suuntautumisvaihtoehto_amk_SV] [nvarchar](100) NULL,
	[suuntautumisvaihtoehto_amk_EN] [nvarchar](100) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[suuralue]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[suuralue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[suuralue](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[suuralue_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tabular_prosessointi_virheet]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tabular_prosessointi_virheet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tabular_prosessointi_virheet](
	[Aika] [datetime] NULL,
	[Kanta] [nvarchar](250) NULL,
	[Virhe] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tarkastelujakso]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarkastelujakso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tarkastelujakso](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso] [nvarchar](100) NULL,
	[tarkastelujakso_SV] [nvarchar](100) NULL,
	[tarkastelujakso_EN] [nvarchar](100) NULL,
	[jaksovuosi] [int] NULL,
	[jaksokausi] [int] NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[sijoittuminen 0_5 - 5_0 vuotta] [nvarchar](100) NULL,
	[sijoittuminen 1_0 - 5_5 vuotta] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tiedekunta_yo]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tiedekunta_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tiedekunta_yo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tiedekunta_yo_koodi] [nvarchar](2) NULL,
	[tiedekunta_yo] [nvarchar](50) NULL,
	[tiedekunta_yo_SV] [nvarchar](50) NULL,
	[tiedekunta_yo_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tieteenala]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tieteenala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tieteenala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[tieteenala2007] [nvarchar](100) NULL,
	[tieteenala2007_SV] [nvarchar](100) NULL,
	[tieteenala2007_EN] [nvarchar](100) NULL,
	[jarjestys_tieteenala2007] [nvarchar](50) NULL,
	[tieteenala2010] [nvarchar](100) NULL,
	[tieteenala2010_SV] [nvarchar](100) NULL,
	[tieteenala2010_EN] [nvarchar](100) NULL,
	[jarjestys_tieteenala2010] [nvarchar](50) NULL,
	[paatieteenala2007] [nvarchar](100) NULL,
	[paatieteenala2007_SV] [nvarchar](100) NULL,
	[paatieteenala2007_EN] [nvarchar](100) NULL,
	[jarjestys_paatieteenala2007] [nvarchar](50) NULL,
	[paatieteenala2010] [nvarchar](100) NULL,
	[paatieteenala2010_SV] [nvarchar](100) NULL,
	[paatieteenala2010_EN] [nvarchar](100) NULL,
	[jarjestys_paatieteenala2010] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tietojen_ajankohta]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tietojen_ajankohta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tietojen_ajankohta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tietojen_ajankohta_koodi] [nvarchar](10) NULL,
	[tietojen_ajankohta] [nvarchar](250) NULL,
	[tietojen_ajankohta_SV] [nvarchar](250) NULL,
	[tietojen_ajankohta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tilauskoulutuksen_sijaintimaa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tilauskoulutuksen_sijaintimaa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tilauskoulutuksen_sijaintimaa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tilauskoulutuksen_sijaintimaa_koodi] [nvarchar](2) NULL,
	[tilauskoulutuksen_sijaintimaa] [nvarchar](50) NULL,
	[tilauskoulutuksen_sijaintimaa_SV] [nvarchar](50) NULL,
	[tilauskoulutuksen_sijaintimaa_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_koodi] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](50) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_SV] [nvarchar](50) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[toimiala_2008]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimiala_2008]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toimiala_2008](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[toimiala_2008_avain] [nvarchar](10) NULL,
	[toimiala_2008_koodi] [nvarchar](5) NULL,
	[toimiala_2008] [nvarchar](150) NULL,
	[toimiala_2008_SV] [nvarchar](150) NULL,
	[toimiala_2008_EN] [nvarchar](150) NULL,
	[taso] [nvarchar](2) NULL,
	[taso1] [nvarchar](2) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[jarjestys_taso1] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[toimiala_tk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimiala_tk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toimiala_tk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tol2008] [nvarchar](20) NULL,
	[toimiala1] [nvarchar](250) NULL,
	[toimiala1_SV] [nvarchar](250) NULL,
	[toimiala1_EN] [nvarchar](250) NULL,
	[toimiala2_koodi] [nvarchar](20) NULL,
	[toimiala2] [nvarchar](250) NULL,
	[toimiala2_SV] [nvarchar](250) NULL,
	[toimiala2_EN] [nvarchar](250) NULL,
	[toimiala3_koodi] [nvarchar](20) NULL,
	[toimiala3] [nvarchar](250) NULL,
	[toimiala3_SV] [nvarchar](250) NULL,
	[toimiala3_EN] [nvarchar](250) NULL,
	[toimiala4_koodi] [nvarchar](20) NULL,
	[toimiala4] [nvarchar](250) NULL,
	[toimiala4_SV] [nvarchar](250) NULL,
	[toimiala4_EN] [nvarchar](250) NULL,
	[toimiala5_koodi] [nvarchar](20) NULL,
	[toimiala5] [nvarchar](250) NULL,
	[toimiala5_SV] [nvarchar](250) NULL,
	[toimiala5_EN] [nvarchar](250) NULL,
	[toimiala6_koodi] [nvarchar](20) NULL,
	[toimiala6] [nvarchar](250) NULL,
	[toimiala6_SV] [nvarchar](250) NULL,
	[toimiala6_EN] [nvarchar](250) NULL,
	[jarjestys_toimiala1] [nvarchar](50) NULL,
	[jarjestys_toimiala2] [nvarchar](50) NULL,
	[jarjestys_toimiala3] [nvarchar](50) NULL,
	[jarjestys_toimiala4] [nvarchar](50) NULL,
	[jarjestys_toimiala5] [nvarchar](50) NULL,
	[jarjestys_toimiala6] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[toimiala_tthv]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimiala_tthv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toimiala_tthv](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv_avain] [nvarchar](2) NULL,
	[toimiala_tthv] [nvarchar](255) NULL,
	[toimiala_tthv_SV] [nvarchar](255) NULL,
	[toimiala_tthv_EN] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv_SV] [nvarchar](255) NULL,
	[toimiala_ja_tol_tthv_EN] [nvarchar](255) NULL,
	[jarjestys_toimiala_tthv] [smallint] NULL,
	[paatoimiala_tthv] [nvarchar](255) NULL,
	[paatoimiala_tthv_SV] [nvarchar](255) NULL,
	[paatoimiala_tthv_EN] [nvarchar](255) NULL,
	[jarjestys_paatoimiala_tthv] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[toimiala_tthv1_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimiala_tthv1_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toimiala_tthv1_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[toimiala_tthv1_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[toimiala_tthv2_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimiala_tthv2_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[toimiala_tthv2_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[toimiala_tthv2_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tulodesiili]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tulodesiili]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tulodesiili](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tulodesiili_koodi] [nvarchar](2) NULL,
	[tulodesiili] [nvarchar](100) NULL,
	[tulodesiili_SV] [nvarchar](100) NULL,
	[tulodesiili_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkimuksen_rahoituslahde]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkimuksen_rahoituslahde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkimuksen_rahoituslahde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[rahoituslahde_avain] [nvarchar](10) NULL,
	[rahoituslahdetarkennus] [nvarchar](50) NULL,
	[rahoituslahdetarkennus_SV] [nvarchar](100) NULL,
	[rahoituslahdetarkennus_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahdetarkennus] [nvarchar](50) NULL,
	[rahoituslahde] [nvarchar](50) NULL,
	[rahoituslahde_SV] [nvarchar](100) NULL,
	[rahoituslahde_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahde] [nvarchar](50) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys] [nvarchar](50) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys_SV] [nvarchar](100) NULL,
	[ulkopuolisen_rahoituksen_kansainvalisyys_EN] [nvarchar](100) NULL,
	[jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys] [nvarchar](50) NULL,
	[rahoituslahteen_tyyppi] [nvarchar](50) NULL,
	[rahoituslahteen_tyyppi_SV] [nvarchar](100) NULL,
	[rahoituslahteen_tyyppi_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituslahteen_tyyppi] [nvarchar](50) NULL,
	[rahoituksen_laatu] [nvarchar](50) NULL,
	[rahoituksen_laatu_SV] [nvarchar](100) NULL,
	[rahoituksen_laatu_EN] [nvarchar](100) NULL,
	[jarjestys_rahoituksen_laatu] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkimus_tehtava]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkimus_tehtava]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkimus_tehtava](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tutkimus_tehtava_avain] [nvarchar](10) NULL,
	[tutkimus_tehtava] [nvarchar](250) NULL,
	[tutkimus_tehtava_SV] [nvarchar](250) NULL,
	[tutkimus_tehtava_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkimusmenojen_kohde]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkimusmenojen_kohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkimusmenojen_kohde](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[menokohde_avain] [nvarchar](10) NULL,
	[menokohde] [nvarchar](50) NULL,
	[menokohde_SV] [nvarchar](50) NULL,
	[menokohde_EN] [nvarchar](50) NULL,
	[jarjestys_menokohde] [nvarchar](50) NULL,
	[menotyyppi] [nvarchar](50) NULL,
	[menotyyppi_SV] [nvarchar](50) NULL,
	[menotyyppi_EN] [nvarchar](50) NULL,
	[jarjestys_menotyyppi] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnon_tavoite]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnon_tavoite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnon_tavoite](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinnon_tavoite_koodi] [nvarchar](2) NULL,
	[tutkinnon_tavoite] [nvarchar](50) NULL,
	[tutkinnon_tavoite_SV] [nvarchar](50) NULL,
	[tutkinnon_tavoite_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnon_toteuma]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnon_toteuma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnon_toteuma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinnon_toteuma_koodi] [nvarchar](2) NULL,
	[tutkinnon_toteuma] [nvarchar](100) NULL,
	[tutkinnon_toteuma_SV] [nvarchar](100) NULL,
	[tutkinnon_toteuma_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_avain] [nvarchar](10) NULL,
	[tutkinto] [nvarchar](250) NULL,
	[tutkinto_SV] [nvarchar](250) NULL,
	[tutkinto_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisella_koulutusalalla_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisella_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisella_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisella_koulutusasteella_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisella_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisella_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisella_koulutussektorilla]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisella_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisella_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_koulutussektorilla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisella_opintoalalla_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisella_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisella_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisessa_maakunnassa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisessa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisessa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisessa_maakunnassa_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisessa_maakunnassa] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_maakunnassa_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_alkuperaisessa_oppilaitoksessa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_alkuperaisessa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_alkuperaisessa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisessa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5c] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_amk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_amk_koodi] [nvarchar](3) NULL,
	[tutkinto_amk] [nvarchar](100) NULL,
	[tutkinto_amk_SV] [nvarchar](100) NULL,
	[tutkinto_amk_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muulla_koulutuksen_jarjestajalla]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muulla_koulutuksen_jarjestajalla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muulla_koulutuksen_jarjestajalla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutuksen_jarjestajalla_EN] [nvarchar](100) NULL,
	[jarjestys_4d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muulla_koulutusalalla_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muulla_koulutusalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muulla_koulutusalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutusalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutusalalla_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_2d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muulla_koulutusasteella_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muulla_koulutusasteella_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muulla_koulutusasteella_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutusasteella_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutusasteella_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusasteella_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutusasteella_2002_EN] [nvarchar](100) NULL,
	[jarjestys_1d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muulla_koulutussektorilla]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muulla_koulutussektorilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muulla_koulutussektorilla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_koulutussektorilla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_koulutussektorilla] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutussektorilla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_koulutussektorilla_EN] [nvarchar](100) NULL,
	[jarjestys_7d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muulla_opintoalalla_2002]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muulla_opintoalalla_2002]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muulla_opintoalalla_2002](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_opintoalalla_2002_koodi] [nchar](2) NULL,
	[tutkinto_muulla_opintoalalla_2002] [nvarchar](100) NULL,
	[tutkinto_muulla_opintoalalla_2002_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_opintoalalla_2002_EN] [nvarchar](100) NULL,
	[jarjestys_3d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muussa_maakunnassa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muussa_maakunnassa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muussa_maakunnassa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muussa_maakunnassa_koodi] [nchar](2) NULL,
	[tutkinto_muussa_maakunnassa] [nvarchar](100) NULL,
	[tutkinto_muussa_maakunnassa_SV] [nvarchar](100) NULL,
	[tutkinto_muussa_maakunnassa_EN] [nvarchar](100) NULL,
	[jarjestys_6d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_muussa_oppilaitoksessa]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_muussa_oppilaitoksessa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_muussa_oppilaitoksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muussa_oppilaitoksessa_koodi] [nchar](2) NULL,
	[tutkinto_muussa_oppilaitoksessa] [nvarchar](100) NULL,
	[tutkinto_muussa_oppilaitoksessa_SV] [nvarchar](100) NULL,
	[tutkinto_muussa_oppilaitoksessa_EN] [nvarchar](100) NULL,
	[jarjestys_5d] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_suoritettu]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_suoritettu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_suoritettu](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[tutkinto_suoritettu_avain] [nvarchar](20) NULL,
	[tutkinto_suoritettu] [nvarchar](100) NULL,
	[tutkinto_suoritettu_SV] [nvarchar](100) NULL,
	[tutkinto_suoritettu_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinto_yo]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinto_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinto_yo](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_yo_koodi] [nvarchar](3) NULL,
	[tutkinto_yo] [nvarchar](50) NULL,
	[tutkinto_yo_SV] [nvarchar](100) NULL,
	[tutkinto_yo_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintoasetus]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintoasetus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintoasetus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoasetus_koodi] [nvarchar](10) NULL,
	[tutkintoasetus] [nvarchar](100) NULL,
	[tutkintoasetus_SV] [nvarchar](100) NULL,
	[tutkintoasetus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintojen_maara]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintojen_maara]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintojen_maara](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[tutkintojen_maara_avain] [nvarchar](20) NULL,
	[tutkintojen_maara] [nvarchar](100) NULL,
	[tutkintojen_maara_SV] [nvarchar](100) NULL,
	[tutkintojen_maara_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintolaji_tyollistymiseen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintolaji_tyollistymiseen](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintolaji_tyollistymiseen_koodi] [nvarchar](2) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_SV] [nvarchar](350) NULL,
	[tutkintolaji_tyollistymiseen_EN] [nvarchar](350) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintonimike_ammpk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintonimike_ammpk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintonimike_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintonimike_ammpk_koodi] [nvarchar](5) NULL,
	[tutkintonimike_ammpk] [nvarchar](50) NULL,
	[tutkintonimike_ammpk_SV] [nvarchar](50) NULL,
	[tutkintonimike_ammpk_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintoryhma]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintoryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintoryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoryhma_koodi] [nvarchar](10) NULL,
	[tutkintoryhma] [nvarchar](100) NULL,
	[tutkintoryhma_SV] [nvarchar](100) NULL,
	[tutkintoryhma_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkintotaso]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkintotaso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkintotaso](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tutkintotaso_koodi] [nvarchar](10) NULL,
	[tutkintotaso] [nvarchar](100) NULL,
	[tutkintotaso_SV] [nvarchar](100) NULL,
	[tutkintotaso_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[tutkintotaso_tk_henkilokunta] [nvarchar](100) NULL,
	[tutkintotaso_tk_henkilokunta_SV] [nvarchar](100) NULL,
	[tutkintotaso_tk_henkilokunta_EN] [nvarchar](100) NULL,
	[jarjestys_tk_henkilokunta] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyonantajasektori]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyonantajasektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyonantajasektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyonantajasektori_koodi] [nvarchar](10) NOT NULL,
	[tyonantajasektori] [nvarchar](250) NULL,
	[tyonantajasektori_SV] [nvarchar](250) NULL,
	[tyonantajasektori_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyonantajasektori_sama_kuin_ed_vuonna]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyonantajasektori_sama_kuin_ed_vuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyonantajasektori_sama_kuin_ed_vuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_koodi] [nvarchar](2) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna] [nvarchar](100) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_SV] [nvarchar](100) NULL,
	[tyonantajasektori_sama_kuin_ed_vuonna_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyonantajasektori2]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyonantajasektori2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyonantajasektori2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyonantajasektori2_avain] [nvarchar](2) NULL,
	[tyonantajasektori2] [nvarchar](255) NULL,
	[tyonantajasektori2_SV] [nvarchar](255) NULL,
	[tyonantajasektori2_EN] [nvarchar](255) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyopaikan_sijainti_v_tilastovuonna]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyopaikan_sijainti_v_tilastovuonna]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyopaikan_sijainti_v_tilastovuonna](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tyopaikan_sijainti_v_tilastovuonna_avain] [nvarchar](10) NULL,
	[tyopaikan_sijainti_v_tilastovuonna] [nvarchar](250) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_SV] [nvarchar](250) NULL,
	[tyopaikan_sijainti_v_tilastovuonna_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyossakayntitilaston_tyonantajasektori]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyossakayntitilaston_tyonantajasektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyossakayntitilaston_tyonantajasektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyossakayntitilaston_tyonantajasektori_koodi] [nvarchar](10) NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](50) NULL,
	[tyossakayntitilaston_tyonantajasektori_SV] [nvarchar](50) NULL,
	[tyossakayntitilaston_tyonantajasektori_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyov_elink_kesk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyov_elink_kesk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyov_elink_kesk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyov_elink_kesk_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyovoimapoliittinen]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyovoimapoliittinen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyovoimapoliittinen](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tyovoimapoliittinen_koodi] [nvarchar](2) NOT NULL,
	[tyovoimapoliittinen] [nvarchar](50) NULL,
	[tyovoimapoliittinen_SV] [nvarchar](50) NULL,
	[tyovoimapoliittinen_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tyovoimapoliittinen_koulutus]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tyovoimapoliittinen_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tyovoimapoliittinen_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tyovoimapoliittinen_koulutus_koodi] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](50) NULL,
	[tyovoimapoliittinen_koulutus_SV] [nvarchar](50) NULL,
	[tyovoimapoliittinen_koulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[uusi_vanha_opiskelija]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uusi_vanha_opiskelija]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[uusi_vanha_opiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[uusi_vanha_opiskelija_koodi] [nvarchar](2) NULL,
	[uusi_vanha_opiskelija] [nvarchar](100) NULL,
	[uusi_vanha_opiskelija_SV] [nvarchar](100) NULL,
	[uusi_vanha_opiskelija_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vahintaan_45_op_suorittanut]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vahintaan_45_op_suorittanut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vahintaan_45_op_suorittanut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vahintaan_45_op_suorittanut_koodi] [varchar](2) NULL,
	[vahintaan_45_op_suorittanut] [nvarchar](50) NULL,
	[vahintaan_45_op_suorittanut_SV] [nvarchar](50) NULL,
	[vahintaan_45_op_suorittanut_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vahintaan_55_op_suorittanut]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vahintaan_55_op_suorittanut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vahintaan_55_op_suorittanut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vahintaan_55_op_suorittanut_koodi] [varchar](2) NULL,
	[vahintaan_55_op_suorittanut] [nvarchar](50) NULL,
	[vahintaan_55_op_suorittanut_SV] [nvarchar](50) NULL,
	[vahintaan_55_op_suorittanut_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[valiaikainen_amk]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[valiaikainen_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[valiaikainen_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[valiaikainen_amk_koodi] [nvarchar](2) NULL,
	[valiaikainen_amk] [nvarchar](70) NULL,
	[valiaikainen_amk_SV] [nvarchar](70) NULL,
	[valiaikainen_amk_EN] [nvarchar](70) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[valtio]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[valtio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[valtio](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[valtio_avain] [nvarchar](10) NULL,
	[maa_koodi] [nvarchar](3) NULL,
	[maa] [nvarchar](100) NULL,
	[maa_SV] [nvarchar](100) NULL,
	[maa_EN] [nvarchar](100) NULL,
	[eumaa_koodi] [nvarchar](2) NULL,
	[eumaa] [nvarchar](50) NULL,
	[eumaa_SV] [nvarchar](50) NULL,
	[eumaa_EN] [nvarchar](50) NULL,
	[etamaa_koodi] [nvarchar](2) NULL,
	[etamaa] [nvarchar](50) NULL,
	[etamaa_SV] [nvarchar](50) NULL,
	[etamaa_EN] [nvarchar](50) NULL,
	[maanosa_koodi] [nvarchar](2) NULL,
	[maanosa] [nvarchar](50) NULL,
	[maanosa_SV] [nvarchar](50) NULL,
	[maanosa_EN] [nvarchar](50) NULL,
	[maanosa2_koodi] [nvarchar](2) NULL,
	[maanosa2] [nvarchar](50) NULL,
	[maanosa2_SV] [nvarchar](50) NULL,
	[maanosa2_EN] [nvarchar](50) NULL,
	[maanosa3_koodi] [nvarchar](3) NULL,
	[maanosa3] [nvarchar](50) NULL,
	[maanosa3_SV] [nvarchar](50) NULL,
	[maanosa3_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_eumaa] [smallint] NULL,
	[jarjestys_etamaa] [smallint] NULL,
	[jarjestys_maanosa] [smallint] NULL,
	[jarjestys_maanosa2] [smallint] NULL,
	[jarjestys_maanosa3] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[valtio_temp]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[valtio_temp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[valtio_temp](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[valtio_avain] [nvarchar](10) NULL,
	[maa_koodi] [nvarchar](3) NULL,
	[maa] [nvarchar](100) NULL,
	[maa_SV] [nvarchar](100) NULL,
	[maa_EN] [nvarchar](100) NULL,
	[eumaa_koodi] [nvarchar](2) NULL,
	[eumaa] [nvarchar](50) NULL,
	[eumaa_SV] [nvarchar](50) NULL,
	[eumaa_EN] [nvarchar](50) NULL,
	[etamaa_koodi] [nvarchar](2) NULL,
	[etamaa] [nvarchar](50) NULL,
	[etamaa_SV] [nvarchar](50) NULL,
	[etamaa_EN] [nvarchar](50) NULL,
	[maanosa_koodi] [nvarchar](2) NULL,
	[maanosa] [nvarchar](50) NULL,
	[maanosa_SV] [nvarchar](50) NULL,
	[maanosa_EN] [nvarchar](50) NULL,
	[maanosa2_koodi] [nvarchar](2) NULL,
	[maanosa2] [nvarchar](50) NULL,
	[maanosa2_SV] [nvarchar](50) NULL,
	[maanosa2_EN] [nvarchar](50) NULL,
	[maanosa3_koodi] [nvarchar](3) NULL,
	[maanosa3] [nvarchar](50) NULL,
	[maanosa3_SV] [nvarchar](50) NULL,
	[maanosa3_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_eumaa] [smallint] NULL,
	[jarjestys_etamaa] [smallint] NULL,
	[jarjestys_maanosa] [smallint] NULL,
	[jarjestys_maanosa2] [smallint] NULL,
	[jarjestys_maanosa3] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vayla_nayttotutkintoon]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vayla_nayttotutkintoon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vayla_nayttotutkintoon](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[vayla_nayttotutkintoon_koodi] [nvarchar](2) NULL,
	[vayla_nayttotutkintoon] [nvarchar](70) NULL,
	[vayla_nayttotutkintoon_SV] [nvarchar](70) NULL,
	[vayla_nayttotutkintoon_EN] [nvarchar](70) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vieraskielisyys]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vieraskielisyys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vieraskielisyys](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[vieraskielisyys_koodi] [nchar](2) NULL,
	[vieraskielisyys] [nvarchar](100) NULL,
	[vieraskielisyys_SV] [nvarchar](100) NULL,
	[vieraskielisyys_EN] [nvarchar](100) NULL,
	[vieraskielisyys_lyhyt] [nvarchar](50) NULL,
	[vieraskielisyys_lyhyt_SV] [nvarchar](50) NULL,
	[vieraskielisyys_lyhyt_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vipunen_aineisto]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_aineisto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_aineisto](
	[aineisto_nimi] [nvarchar](250) NULL,
	[aineisto_avain] [nvarchar](20) NULL,
	[aineistoryhma] [nvarchar](50) NULL,
	[aineisto_julkaisukuukausi] [nvarchar](50) NULL,
	[aineisto_tilastovuosi] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_kuutio]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_aineisto_kuutio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_aineisto_kuutio](
	[aineisto_avain] [nvarchar](10) NULL,
	[kuutio_avain] [nvarchar](20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vipunen_kuutio]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_kuutio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_kuutio](
	[kuutio_nimi] [nvarchar](250) NULL,
	[kuutio_avain] [nvarchar](20) NULL,
	[kuutio_toteutustyyppi] [nvarchar](50) NULL,
	[kuutio_projekti] [nvarchar](50) NULL,
	[kuutio_prosessointiryhma] [nvarchar](10) NULL,
	[ajotunnus] [nvarchar](15) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vipunen_raportti]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_raportti]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_raportti](
	[raportti_avain] [nvarchar](250) NULL,
	[raportti_nimi] [nvarchar](250) NULL,
	[otsikko] [nvarchar](250) NULL,
	[sektori] [nvarchar](250) NULL,
	[kokonaisuus] [nvarchar](250) NULL,
	[toteutustyyppi] [nvarchar](50) NULL,
	[kuutio_avain] [nvarchar](20) NULL,
	[raportti_paivitys] [nvarchar](50) NULL,
	[tekija] [nvarchar](250) NULL,
	[kokonaisuus_osio] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Vipunen_raportti_vanha]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_raportti_vanha]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_raportti_vanha](
	[raportti_avain] [nvarchar](20) NULL,
	[sektori_koodi] [nvarchar](10) NULL,
	[kokonaisuus_koodi] [nvarchar](10) NULL,
	[jarjestys_sivulla] [nvarchar](10) NULL,
	[nakokulma_koodi] [nvarchar](10) NULL,
	[raporttityyppi_koodi] [nvarchar](10) NULL,
	[raportti] [nvarchar](250) NULL,
	[raporttitiedoston_nimi] [nvarchar](250) NULL,
	[sektori] [nvarchar](250) NULL,
	[kokonaisuus] [nvarchar](250) NULL,
	[raportti_toteutustyyppi] [nvarchar](50) NULL,
	[kuutio_avain] [nvarchar](20) NULL,
	[raportti_paivitys] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[virkaryhma]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[virkaryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[virkaryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[virkaryhma_koodi] [nvarchar](10) NULL,
	[virkaryhma] [nvarchar](50) NULL,
	[virkaryhma_SV] [nvarchar](50) NULL,
	[virkaryhma_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ykieli]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ykieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ykieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ykieli_koodi] [nvarchar](10) NULL,
	[koodinselite] [nvarchar](250) NULL,
	[koodinselite_SV] [nvarchar](250) NULL,
	[koodinselite_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[yliopisto]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yliopisto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[yliopisto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[yliopisto_koodi] [nvarchar](2) NULL,
	[yliopisto] [nvarchar](50) NULL,
	[yliopisto_SV] [nvarchar](50) NULL,
	[yliopisto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[yllapitajan_kieli]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yllapitajan_kieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[yllapitajan_kieli](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yllapitajan_kieli_koodi] [nchar](2) NULL,
	[yllapitajan_kieli] [nvarchar](50) NULL,
	[yllapitajan_kieli_SV] [nvarchar](50) NULL,
	[yllapitajan_kieli_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[yosairaala]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yosairaala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[yosairaala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yosairaala_avain] [nvarchar](10) NULL,
	[yosairaala_lyhenne] [nvarchar](20) NULL,
	[yosairaala] [nvarchar](250) NULL,
	[yosairaala_SV] [nvarchar](250) NULL,
	[yosairaala_EN] [nvarchar](250) NULL,
	[jarjestys_yosairaala] [nvarchar](50) NULL,
	[yosairaala_lyhenne_historia] [nvarchar](20) NULL,
	[yosairaala_historia] [nvarchar](250) NULL,
	[yosairaala_historia_SV] [nvarchar](250) NULL,
	[yosairaala_historia_EN] [nvarchar](250) NULL,
	[jarjestys_yosairaala_historia] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[yrittajan_oppisopimuskoulutus]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yrittajan_oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[yrittajan_oppisopimuskoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[yrittajan_oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](50) NULL,
	[yrittajan_oppisopimuskoulutus_SV] [nvarchar](50) NULL,
	[yrittajan_oppisopimuskoulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[yrityksen_koko_tthv]    Script Date: 19.6.2017 11:57:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yrityksen_koko_tthv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[yrityksen_koko_tthv](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[yrityksen_koko_koodi] [nvarchar](10) NULL,
	[yrityksen_koko] [nvarchar](250) NULL,
	[yrityksen_koko_SV] [nvarchar](250) NULL,
	[yrityksen_koko_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aineistot_Paivittaja]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[_aineistot] ADD  CONSTRAINT [DF__aineistot_Paivittaja]  DEFAULT (suser_name()) FOR [Paivittaja]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aineistot_Paivityspaivamaara]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[_aineistot] ADD  CONSTRAINT [DF__aineistot_Paivityspaivamaara]  DEFAULT (getdate()) FOR [Paivityspaivamaara]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__map_Paivittaja]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[_map] ADD  CONSTRAINT [DF__map_Paivittaja]  DEFAULT (suser_name()) FOR [Paivittaja]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__map_Paivityspaivamaara]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[_map] ADD  CONSTRAINT [DF__map_Paivityspaivamaara]  DEFAULT (getdate()) FOR [Paivityspaivamaara]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio1__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio1] ADD  CONSTRAINT [DF__aidinkieli_versio1__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio1__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio1] ADD  CONSTRAINT [DF__aidinkieli_versio1__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio1__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio1] ADD  CONSTRAINT [DF__aidinkieli_versio1__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio2] ADD  CONSTRAINT [DF__aidinkieli_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio2] ADD  CONSTRAINT [DF__aidinkieli_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aidinkieli_versio2__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aidinkieli_versio2] ADD  CONSTRAINT [DF__aidinkieli_versio2__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisemmat_tutkinnot__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisemmat_tutkinnot] ADD  CONSTRAINT [DF__aikaisemmat_tutkinnot__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisemmat_tutkinnot__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisemmat_tutkinnot] ADD  CONSTRAINT [DF__aikaisemmat_tutkinnot__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisemmat_tutkinnot__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisemmat_tutkinnot] ADD  CONSTRAINT [DF__aikaisemmat_tutkinnot__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisempi_korkein_tutkinto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisempi_korkein_tutkinto] ADD  CONSTRAINT [DF__aikaisempi_korkein_tutkinto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisempi_korkein_tutkinto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisempi_korkein_tutkinto] ADD  CONSTRAINT [DF__aikaisempi_korkein_tutkinto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikaisempi_korkein_tutkinto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikaisempi_korkein_tutkinto] ADD  CONSTRAINT [DF__aikaisempi_korkein_tutkinto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikalkk__alkaa__3B75D760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikalkk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikalkk__paattyy__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikalkk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikalkk__tietola__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikalkk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamk__alkaa__3F466844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamk__paattyy__403A8C7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamk__tietolah__412EB0B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamm__alkaa__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamm] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamm__paattyy__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamm] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikamm__tietolah__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikamm] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikuisopi__alkaa__46E78A0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikuisopiskelija] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikuisopi__paatt__47DBAE45]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikuisopiskelija] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikuisopi__tieto__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikuisopiskelija] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylamk__alkaa__4AB81AF0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylamk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylamk__paatty__4BAC3F29]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylamk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylamk__tietol__4CA06362]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylamk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylkk__alkaa__4E88ABD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylkk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylkk__paattyy__4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylkk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikylkk__tietola__5070F446]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikylkk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikyotutk__alkaa__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikyotutk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikyotutk__paatt__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikyotutk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aikyotutk__tieto__5441852A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aikyotutk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aineisto__alkaa__23DE44F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aineisto] ADD  CONSTRAINT [DF__aineisto__alkaa__23DE44F1]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aineisto__paatty__24D2692A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aineisto] ADD  CONSTRAINT [DF__aineisto__paatty__24D2692A]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aineisto__tietol__25C68D63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aineisto] ADD  CONSTRAINT [DF__aineisto__tietol__25C68D63]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aiopis__alkaa__5AEE82B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aiopis] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aiopis__paattyy__5BE2A6F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aiopis] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aiopis__tietolah__5CD6CB2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aiopis] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__akk__alkaa__5EBF139D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[akk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__akk__paattyy__5FB337D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[akk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__akk__tietolahde__60A75C0F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[akk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk__alkaa__656C112C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk__paattyy__66603565]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk__tietolahde__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk_kk__alkaa__693CA210]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk_kk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk_kk__paattyy__6A30C649]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk_kk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__allk_kk__tietola__6B24EA82]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[allk_kk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__alueluokitus_luotu]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_luotu]  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__alueluokitus_alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__alueluokitus_paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[alueluokitus] ADD  CONSTRAINT [DF__alueluokitus_paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__amkkoulut__alkaa__72C60C4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[amkkoulutyp] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__amkkoulut__paatt__73BA3083]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[amkkoulutyp] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__amkkoulut__tieto__74AE54BC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[amkkoulutyp] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatilli__luotu__778AC167]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillinen_koulutus_luokittelu] ADD  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatilli__luotu__797309D9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillinen_peruskoulutus_lisakoulutus] ADD  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatilli__alkaa__7A672E12]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillinen_peruskoulutus_lisakoulutus] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatilli__paatt__7B5B524B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillinen_peruskoulutus_lisakoulutus] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] ADD  CONSTRAINT [DF__ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammattiasema__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammattiasema] ADD  CONSTRAINT [DF__ammattiasema__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammattiasema__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammattiasema] ADD  CONSTRAINT [DF__ammattiasema__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammattiasema__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammattiasema] ADD  CONSTRAINT [DF__ammattiasema__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammoppis__alkaa__0C85DE4D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammoppis] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammoppis__paatty__0D7A0286]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammoppis] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammoppis__tietol__0E6E26BF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammoppis] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkla__alkaa__10566F31]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutklaja] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkla__paatt__114A936A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutklaja] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkla__tieto__123EB7A3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutklaja] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkta__alkaa__14270015]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutktav] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkta__paatt__151B244E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutktav] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ammtutkta__tieto__160F4887]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ammtutktav] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__asema__alkaa__17F790F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[asema] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__asema__paattyy__18EBB532]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[asema] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__asema__tietolahd__19DFD96B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[asema] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avi__alkaa__1DB06A4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avi] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avi__paattyy__1EA48E88]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avi] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avi__tietolahde__1F98B2C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avi] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avoinvayla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avoinvayla] ADD  CONSTRAINT [DF__avoinvayla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avoinvayla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avoinvayla] ADD  CONSTRAINT [DF__avoinvayla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__avoinvayla__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[avoinvayla] ADD  CONSTRAINT [DF__avoinvayla__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ely__alkaa__282DF8C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ely] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ely__paattyy__29221CFB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ely] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ely__tietolahde__2A164134]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ely] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ensisijainen_opintooikeus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ensisijainen_opintooikeus] ADD  CONSTRAINT [DF__ensisijainen_opintooikeus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ensisijainen_opintooikeus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ensisijainen_opintooikeus] ADD  CONSTRAINT [DF__ensisijainen_opintooikeus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ensisijainen_opintooikeus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ensisijainen_opintooikeus] ADD  CONSTRAINT [DF__ensisijainen_opintooikeus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon__luotu__01892CED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala] ADD  CONSTRAINT [DF__hallinnon__luotu__01892CED]  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon__alkaa__027D5126]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala] ADD  CONSTRAINT [DF__hallinnon__alkaa__027D5126]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon__paatt__0371755F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala] ADD  CONSTRAINT [DF__hallinnon__paatt__0371755F]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon2__luotu__01892CED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__luotu__01892CED]  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon2__alkaa__027D5126]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__alkaa__027D5126]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__hallinnon2__paatt__0371755F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__paatt__0371755F]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscde__alkaa__3D2915A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscde] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscde__paattyy__3E1D39E1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscde] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscde__tietolahd__3F115E1A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscde] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscdu__alkaa__40F9A68C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscdu] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscdu__paattyy__41EDCAC5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscdu] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscdu__tietolahd__42E1EEFE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscdu] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscle__alkaa__45BE5BA9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscle] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscle__paattyy__46B27FE2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscle] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscle__tietolahd__47A6A41B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscle] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscor__alkaa__498EEC8D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscor] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscor__paattyy__4A8310C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscor] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscor__tietolahd__4B7734FF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscor] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscst__alkaa__4D5F7D71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscst] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscst__paattyy__4E53A1AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscst] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__iscst__tietolahd__4F47C5E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[iscst] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutussektorilla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutussektorilla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_koulutussektorilla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_koulutussektorilla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_koulutussektorilla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_opintoalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_opintoalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisella_opintoalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_opintoalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisessa_maakunnassa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisessa_maakunnassa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisessa_maakunnassa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_maakunnassa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisessa_maakunnassa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutusalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutusalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutusalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutusalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutusasteella_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutusasteella_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutusasteella_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutusasteella_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutusasteella_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutussektorilla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutussektorilla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutussektorilla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_koulutussektorilla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_koulutussektorilla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_koulutussektorilla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_opintoalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_opintoalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muulla_opintoalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_opintoalalla_2002] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_opintoalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muussa_maakunnassa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muussa_maakunnassa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muussa_maakunnassa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muussa_maakunnassa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muussa_maakunnassa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muussa_maakunnassa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muussa_oppilaitoksessa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muussa_oppilaitoksessa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatkaa_opiskelua_muussa_oppilaitoksessa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatkaa_opiskelua_muussa_oppilaitoksessa] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muussa_oppilaitoksessa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatko_opi__alkaa__793DFFAF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatko_opiskelu] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatko_opi__paatt__7A3223E8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatko_opiskelu] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__jatko_opi__tieto__7B264821]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[jatko_opiskelu] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio1__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio1] ADD  CONSTRAINT [DF__kansalaisuus_versio1__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio1__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio1] ADD  CONSTRAINT [DF__kansalaisuus_versio1__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio1__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio1] ADD  CONSTRAINT [DF__kansalaisuus_versio1__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio2] ADD  CONSTRAINT [DF__kansalaisuus_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio2] ADD  CONSTRAINT [DF__kansalaisuus_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kansalaisuus_versio2__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kansalaisuus_versio2] ADD  CONSTRAINT [DF__kansalaisuus_versio2__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kausi__alkaa__05A3D694]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kausi] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kausi__paattyy__0697FACD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kausi] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kausi__tietolahd__078C1F06]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kausi] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kielisuhd__alkaa__0B5CAFEA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kielisuhde] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kielisuhd__paatt__0C50D423]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kielisuhde] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kielisuhd__tieto__0D44F85C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kielisuhde] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__alkaa__10216507]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestaja] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__paatt__11158940]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestaja] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__tieto__1209AD79]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestaja] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__luotu__15DA3E5D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestamismuoto] ADD  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__alkaa__16CE6296]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestamismuoto] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__paatt__17C286CF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_jarjestamismuoto] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuksen_kesto__alkaa__23DE44F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kesto] ADD  CONSTRAINT [DF__koulutuksen_kesto__alkaa__23DE44F1]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuksen_kesto__24D2692A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kesto] ADD  CONSTRAINT [DF__koulutuksen_kesto__24D2692A]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuksen_kesto__25C68D63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kesto] ADD  CONSTRAINT [DF__koulutuksen_kesto__25C68D63]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__alkaa__68BE4A7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kieli_versio1] ADD  CONSTRAINT [DF__koulutuks__alkaa__68BE4A7A]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__paatt__69B26EB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kieli_versio1] ADD  CONSTRAINT [DF__koulutuks__paatt__69B26EB3]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__tieto__6AA692EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_kieli_versio1] ADD  CONSTRAINT [DF__koulutuks__tieto__6AA692EC]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paattanei__alkaa__2E71AD54]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_paattaneiden_toiminta] ADD  CONSTRAINT [DF__paattanei__alkaa__2E71AD54]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paattanei__paatt__2F65D18D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_paattaneiden_toiminta] ADD  CONSTRAINT [DF__paattanei__paatt__2F65D18D]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paattanei__tieto__3059F5C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_paattaneiden_toiminta] ADD  CONSTRAINT [DF__paattanei__tieto__3059F5C6]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__luotu__251C81ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_tavoite_toteuma] ADD  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__alkaa__2610A626]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_tavoite_toteuma] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__paatt__2704CA5F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksen_tavoite_toteuma] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__alkaa__28ED12D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksesta_kulunut_aika] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__paatt__29E1370A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksesta_kulunut_aika] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuks__tieto__2AD55B43]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuksesta_kulunut_aika] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusa__alkaa__2CBDA3B5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusala] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusa__paatt__2DB1C7EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusala] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusa__tieto__2EA5EC27]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusala] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuslaji__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuslaji__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuslaji__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuslaji_okm__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji_okm] ADD  CONSTRAINT [DF__koulutuslaji_okm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusl__tieto__39237A9A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji2] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusl__tieto__3B0BC30C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji3] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusmuoto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusmuoto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusmuoto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_amk__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_amk] ADD  CONSTRAINT [DF__koulutusohjelma_amk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_amk__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_amk] ADD  CONSTRAINT [DF__koulutusohjelma_amk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_amk__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_amk] ADD  CONSTRAINT [DF__koulutusohjelma_amk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_ammpk__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__koulutusohjelma_ammpk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_ammpk__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__koulutusohjelma_ammpk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutusohjelma_ammpk__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__koulutusohjelma_ammpk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutustyyppi__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutustyyppi__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutustyyppi__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kuntaryh__alkaa__51EF2864]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kuntaryh] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kuntaryh__paatty__52E34C9D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kuntaryh] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__kuntaryh__tietol__53D770D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[kuntaryh] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__laani__alkaa__56B3DD81]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[laani] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__laani__paattyy__57A801BA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[laani] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__laani__tietolahd__589C25F3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[laani] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__lukiokoulutuksen_koulutuslaji__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lukiokoulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__lukiokoulutuksen_koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__lukiokoulutuksen_koulutuslaji__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lukiokoulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__lukiokoulutuksen_koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__lukiokoulutuksen_koulutuslaji__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lukiokoulutuksen_koulutuslaji] ADD  CONSTRAINT [DF__lukiokoulutuksen_koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maakunta__alkaa__6225902D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maakunta] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maakunta__paatty__6319B466]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maakunta] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maakunta__tietol__640DD89F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maakunta] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maassaolo__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maassaolo] ADD  CONSTRAINT [DF__maassaolo__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maassaolo__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maassaolo] ADD  CONSTRAINT [DF__maassaolo__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__maassaolo__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[maassaolo] ADD  CONSTRAINT [DF__maassaolo__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__mannersu___alkaa__69C6B1F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mannersu_ahvena] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__mannersu___paatt__6ABAD62E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mannersu_ahvena] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__mannersu___tieto__6BAEFA67]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mannersu_ahvena] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__moninkertainen_haku__alkaa__65AC084E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[moninkertainen_haku] ADD  CONSTRAINT [DF__moninkertainen_haku__alkaa__65AC084E]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__moninkertainen_haku__paatty__66A02C87]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[moninkertainen_haku] ADD  CONSTRAINT [DF__moninkertainen_haku__paatty__66A02C87]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__moninkertainen_haku__tietol__679450C0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[moninkertainen_haku] ADD  CONSTRAINT [DF__moninkertainen_haku__tietol__679450C0]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__nuorten_aikuisten_koulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[nuorten_aikuisten_koulutus] ADD  CONSTRAINT [DF__nuorten_aikuisten_koulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__nuorten_aikuisten_koulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[nuorten_aikuisten_koulutus] ADD  CONSTRAINT [DF__nuorten_aikuisten_koulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__nuorten_aikuisten_koulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[nuorten_aikuisten_koulutus] ADD  CONSTRAINT [DF__nuorten_aikuisten_koulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__omist__alkaa__7814D14C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[omist] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__omist__paattyy__7908F585]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[omist] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__omist__tietolahd__79FD19BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[omist] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opettajankelpoisuus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opettajankelpoisuus] ADD  CONSTRAINT [DF__opettajankelpoisuus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opettajankelpoisuus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opettajankelpoisuus] ADD  CONSTRAINT [DF__opettajankelpoisuus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opettajankelpoisuus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opettajankelpoisuus] ADD  CONSTRAINT [DF__opettajankelpoisuus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetuksen__alkaa__0EF836A4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetuksen_jarjestajan_tiedoantajatyyppi] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetuksen__paatt__0FEC5ADD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetuksen_jarjestajan_tiedoantajatyyppi] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetuksen__tieto__10E07F16]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetuksen_jarjestajan_tiedoantajatyyppi] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetushallinnon_koulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetushallinnon_koulutus] ADD  CONSTRAINT [DF__opetushallinnon_koulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetushallinnon_koulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetushallinnon_koulutus] ADD  CONSTRAINT [DF__opetushallinnon_koulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetushallinnon_koulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetushallinnon_koulutus] ADD  CONSTRAINT [DF__opetushallinnon_koulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ADD  CONSTRAINT [DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ADD  CONSTRAINT [DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ADD  CONSTRAINT [DF__opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintoala2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintoala2002] ADD  CONSTRAINT [DF__opintoala2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintoala2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintoala2002] ADD  CONSTRAINT [DF__opintoala2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintoala2002__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintoala2002] ADD  CONSTRAINT [DF__opintoala2002__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusalan_2002_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusalan_2002_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusalan_2002_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusalan_2002_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusalan_2002_mukaan_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusalan_2002_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusalan_2002_mukaan_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusalan_2002_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusalan_2002_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusasteen_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusasteen_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusasteen_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutusasteen_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutusasteen_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutusasteen_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutussektorin_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutussektorin_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutussektorin_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_koulutussektorin_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_koulutussektorin_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_koulutussektorin_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_maakunnan_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_maakunnan_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_maakunnan_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_maakunnan_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_maakunnan_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_maakunnan_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_opintoalan_2002_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_opintoalan_2002_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_opintoalan_2002_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_opintoalan_2002_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_opintoalan_2002_mukaan_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_opintoalan_2002_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_opintoalan_2002_mukaan_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_opintoalan_2002_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_opintoalan_2002_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_oppilaitoksen_mukaan__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_oppilaitoksen_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_oppilaitoksen_mukaan__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_oppilaitoksen_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_oppilaitoksen_mukaan_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_oppilaitoksen_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opintojen_kulku_oppilaitoksen_mukaan_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opintojen_kulku_oppilaitoksen_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_oppilaitoksen_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelij__alkaa__4277DAAA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelij__paatt__436BFEE3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelij__tieto__4460231C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_aikaisempi_yleissivistava_koulutus] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelijan_fte_tieto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_fte_tieto] ADD  CONSTRAINT [DF__opiskelijan_fte_tieto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelijan_fte_tieto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_fte_tieto] ADD  CONSTRAINT [DF__opiskelijan_fte_tieto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelijan_fte_tieto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelijan_fte_tieto] ADD  CONSTRAINT [DF__opiskelijan_fte_tieto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelumuoto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelumuoto] ADD  CONSTRAINT [DF__opiskelumuoto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelumuoto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelumuoto] ADD  CONSTRAINT [DF__opiskelumuoto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__opiskelumuoto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[opiskelumuoto] ADD  CONSTRAINT [DF__opiskelumuoto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppilaito__alkaa__50C5FA01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppilaitos] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppilaito__paatt__51BA1E3A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppilaitos] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppilaito__tieto__52AE4273]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppilaitos] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_purkautunut__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_purkautunut] ADD  CONSTRAINT [DF__oppisopimus_purkautunut__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_purkautunut__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_purkautunut] ADD  CONSTRAINT [DF__oppisopimus_purkautunut__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_purkautunut__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_purkautunut] ADD  CONSTRAINT [DF__oppisopimus_purkautunut__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_yrityksen_koko__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_yrityksen_koko] ADD  CONSTRAINT [DF__oppisopimus_yrityksen_koko__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_yrityksen_koko__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_yrityksen_koko] ADD  CONSTRAINT [DF__oppisopimus_yrityksen_koko__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimus_yrityksen_koko__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimus_yrityksen_koko] ADD  CONSTRAINT [DF__oppisopimus_yrityksen_koko__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimuskoulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus] ADD  CONSTRAINT [DF__oppisopimuskoulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimuskoulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus] ADD  CONSTRAINT [DF__oppisopimuskoulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppisopimuskoulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus] ADD  CONSTRAINT [DF__oppisopimuskoulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppis_osallis_ja_tutk_suor__alkaa__23DE44F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] ADD  CONSTRAINT [DF__oppis_osallis_ja_tutk_suor__alkaa__23DE44F1]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppis_osallis_ja_tutk_suor__paatty__24D2692A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] ADD  CONSTRAINT [DF__oppis_osallis_ja_tutk_suor__paatty__24D2692A]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__oppis_osallis_ja_tutk_suor__tietol__25C68D63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] ADD  CONSTRAINT [DF__oppis_osallis_ja_tutk_suor__tietol__25C68D63]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__osatutkinto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[osatutkinto] ADD  CONSTRAINT [DF__osatutkinto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__osatutkinto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[osatutkinto] ADD  CONSTRAINT [DF__osatutkinto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__osatutkinto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[osatutkinto] ADD  CONSTRAINT [DF__osatutkinto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_okm__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_okm] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_okm__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_okm__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_okm] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_okm__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_okm__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_okm] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_okm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_versio2__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_versio2] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_versio2__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_versio2] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__paaasiallinen_toiminta_versio2__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[paaasiallinen_toiminta_versio2] ADD  CONSTRAINT [DF__paaasiallinen_toiminta_versio2__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__alkaa__75035A77]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_ainevalinnat] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__paatt__75F77EB0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_ainevalinnat] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__tieto__76EBA2E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_ainevalinnat] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__alkaa__7ABC33CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_kieltenmaara] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__paatt__7BB05806]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_kieltenmaara] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__tieto__7CA47C3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_kieltenmaara] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__alkaa__06A2E7C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_vuosiluokat] ADD  CONSTRAINT [DF__perusopet__alkaa__06A2E7C5]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__paatt__07970BFE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_vuosiluokat] ADD  CONSTRAINT [DF__perusopet__paatt__07970BFE]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__perusopet__tieto__088B3037]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[perusopetuksen_vuosiluokat] ADD  CONSTRAINT [DF__perusopet__tieto__088B3037]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjakoul__alkaa__090A5324]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjakoulutuksen_tila] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjakoul__paatt__09FE775D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjakoulutuksen_tila] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjakoul__tieto__0AF29B96]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjakoulutuksen_tila] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjoismaa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjoismaa] ADD  CONSTRAINT [DF__pohjoismaa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjoismaa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjoismaa] ADD  CONSTRAINT [DF__pohjoismaa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__pohjoismaa__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pohjoismaa] ADD  CONSTRAINT [DF__pohjoismaa__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__rahoituslahde_amm__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__rahoituslahde_amm__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__rahoituslahde_amm__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__seutukunt__alkaa__184C96B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[seutukunta] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__seutukunt__paatt__1940BAED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[seutukunta] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__seutukunt__tieto__1A34DF26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[seutukunta] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__sukupuoli__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sukupuoli] ADD  CONSTRAINT [DF__sukupuoli__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__sukupuoli__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sukupuoli] ADD  CONSTRAINT [DF__sukupuoli__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__sukupuoli__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sukupuoli] ADD  CONSTRAINT [DF__sukupuoli__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suorlk__alkaa__23BE4960]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suorlk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suorlk__paattyy__24B26D99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suorlk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suorlk__tietolah__25A691D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suorlk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suuralue__alkaa__2882FE7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suuralue] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suuralue__paatty__297722B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suuralue] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__suuralue__tietol__2A6B46EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[suuralue] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__alkaa__2D47B39A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__paatt__2E3BD7D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__tieto__2F2FFC0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tiedekunta_yo__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tiedekunta_yo] ADD  CONSTRAINT [DF__tiedekunta_yo__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tiedekunta_yo__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tiedekunta_yo] ADD  CONSTRAINT [DF__tiedekunta_yo__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tiedekunta_yo__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tiedekunta_yo] ADD  CONSTRAINT [DF__tiedekunta_yo__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tilauskoulutuksen_sijaintimaa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tilauskoulutuksen_sijaintimaa] ADD  CONSTRAINT [DF__tilauskoulutuksen_sijaintimaa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tilauskoulutuksen_sijaintimaa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tilauskoulutuksen_sijaintimaa] ADD  CONSTRAINT [DF__tilauskoulutuksen_sijaintimaa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tilauskoulutuksen_sijaintimaa__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tilauskoulutuksen_sijaintimaa] ADD  CONSTRAINT [DF__tilauskoulutuksen_sijaintimaa__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__todistus_oppisopimuskoulutuksen_suorittamisesta__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta] ADD  CONSTRAINT [DF__todistus_oppisopimuskoulutuksen_suorittamisesta__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__todistus_oppisopimuskoulutuksen_suorittamisesta__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta] ADD  CONSTRAINT [DF__todistus_oppisopimuskoulutuksen_suorittamisesta__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__todistus_oppisopimuskoulutuksen_suorittamisesta__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[todistus_oppisopimuskoulutuksen_suorittamisesta] ADD  CONSTRAINT [DF__todistus_oppisopimuskoulutuksen_suorittamisesta__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tulodesiili__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tulodesiili] ADD  CONSTRAINT [DF__tulodesiili__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tulodesiili__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tulodesiili] ADD  CONSTRAINT [DF__tulodesiili__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tulodesiili__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tulodesiili] ADD  CONSTRAINT [DF__tulodesiili__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_tavoite__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_tavoite__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_tavoite__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_toteuma__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_toteuma] ADD  CONSTRAINT [DF__tutkinnon_toteuma__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_toteuma__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_toteuma] ADD  CONSTRAINT [DF__tutkinnon_toteuma__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinnon_toteuma__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinnon_toteuma] ADD  CONSTRAINT [DF__tutkinnon_toteuma__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutuksen_jarjestajalla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutuksen_jarjestajalla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutuksen_jarjestajalla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutuksen_jarjestajalla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutusalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutusalalla_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutusalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutusalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutusalalla_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutusalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutusasteella_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutusasteella_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutusasteella_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutusasteella_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutusasteella_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutusasteella_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutussektorilla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutussektorilla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutussektorilla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_koulutussektorilla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_koulutussektorilla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_koulutussektorilla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_opintoalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_opintoalalla_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_opintoalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisella_opintoalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisella_opintoalalla_2002] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_opintoalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisessa_maakunnassa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisessa_maakunnassa] ADD  CONSTRAINT [DF__tutkinto_alkuperaisessa_maakunnassa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisessa_maakunnassa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisessa_maakunnassa] ADD  CONSTRAINT [DF__tutkinto_alkuperaisessa_maakunnassa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisessa_oppilaitoksessa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisessa_oppilaitoksessa] ADD  CONSTRAINT [DF__tutkinto_alkuperaisessa_oppilaitoksessa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_alkuperaisessa_oppilaitoksessa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_alkuperaisessa_oppilaitoksessa] ADD  CONSTRAINT [DF__tutkinto_alkuperaisessa_oppilaitoksessa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_amk__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_amk] ADD  CONSTRAINT [DF__tutkinto_amk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_amk__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_amk] ADD  CONSTRAINT [DF__tutkinto_amk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_amk__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_amk] ADD  CONSTRAINT [DF__tutkinto_amk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutuksen_jarjestajalla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutuksen_jarjestajalla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutuksen_jarjestajalla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutuksen_jarjestajalla] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutuksen_jarjestajalla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutusalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutusalalla_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutusalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutusalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutusalalla_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutusalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutusasteella_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutusasteella_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutusasteella_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutusasteella_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutusasteella_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutusasteella_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutussektorilla__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutussektorilla] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutussektorilla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_koulutussektorilla__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_koulutussektorilla] ADD  CONSTRAINT [DF__tutkinto_muulla_koulutussektorilla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_opintoalalla_2002__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_opintoalalla_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_opintoalalla_2002__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muulla_opintoalalla_2002__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muulla_opintoalalla_2002] ADD  CONSTRAINT [DF__tutkinto_muulla_opintoalalla_2002__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muussa_maakunnassa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muussa_maakunnassa] ADD  CONSTRAINT [DF__tutkinto_muussa_maakunnassa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muussa_maakunnassa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muussa_maakunnassa] ADD  CONSTRAINT [DF__tutkinto_muussa_maakunnassa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muussa_oppilaitoksessa__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muussa_oppilaitoksessa] ADD  CONSTRAINT [DF__tutkinto_muussa_oppilaitoksessa__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_muussa_oppilaitoksessa__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_muussa_oppilaitoksessa] ADD  CONSTRAINT [DF__tutkinto_muussa_oppilaitoksessa__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_yo__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_yo] ADD  CONSTRAINT [DF__tutkinto_yo__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_yo__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_yo] ADD  CONSTRAINT [DF__tutkinto_yo__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkinto_yo__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkinto_yo] ADD  CONSTRAINT [DF__tutkinto_yo__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoasetus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoasetus] ADD  CONSTRAINT [DF__tutkintoasetus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoasetus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoasetus] ADD  CONSTRAINT [DF__tutkintoasetus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoasetus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoasetus] ADD  CONSTRAINT [DF__tutkintoasetus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintolaji_tyollistymiseen__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintolaji_tyollistymiseen__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintolaji_tyollistymiseen__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__tietolahde]  DEFAULT ('OKM') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintonimike_ammpk__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintonimike_ammpk] ADD  CONSTRAINT [DF__tutkintonimike_ammpk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintonimike_ammpk__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintonimike_ammpk] ADD  CONSTRAINT [DF__tutkintonimike_ammpk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintonimike_ammpk__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintonimike_ammpk] ADD  CONSTRAINT [DF__tutkintonimike_ammpk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoryhma__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoryhma__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tutkintoryhma__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyossakayntitilaston_tyonantajasektori__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyossakayntitilaston_tyonantajasektori] ADD  CONSTRAINT [DF__tyossakayntitilaston_tyonantajasektori__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyossakayntitilaston_tyonantajasektori__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyossakayntitilaston_tyonantajasektori] ADD  CONSTRAINT [DF__tyossakayntitilaston_tyonantajasektori__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyossakayntitilaston_tyonantajasektori__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyossakayntitilaston_tyonantajasektori] ADD  CONSTRAINT [DF__tyossakayntitilaston_tyonantajasektori__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyov_elin__alkaa__190BB0C3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyov_elink_kesk] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyov_elin__paatt__19FFD4FC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyov_elink_kesk] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyov_elin__tieto__1AF3F935]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyov_elink_kesk] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimap__luotu__1CDC41A7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen] ADD  DEFAULT (getdate()) FOR [luotu]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimap__alkaa__1DD065E0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimap__paatt__1EC48A19]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimapoliittinen_koulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen_koulutus] ADD  CONSTRAINT [DF__tyovoimapoliittinen_koulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimapoliittinen_koulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen_koulutus] ADD  CONSTRAINT [DF__tyovoimapoliittinen_koulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tyovoimapoliittinen_koulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tyovoimapoliittinen_koulutus] ADD  CONSTRAINT [DF__tyovoimapoliittinen_koulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__uusi_vanha_opiskelija__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[uusi_vanha_opiskelija] ADD  CONSTRAINT [DF__uusi_vanha_opiskelija__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__uusi_vanha_opiskelija__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[uusi_vanha_opiskelija] ADD  CONSTRAINT [DF__uusi_vanha_opiskelija__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__uusi_vanha_opiskelija__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[uusi_vanha_opiskelija] ADD  CONSTRAINT [DF__uusi_vanha_opiskelija__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__valiaikainen_amk__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[valiaikainen_amk] ADD  CONSTRAINT [DF__valiaikainen_amk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__valiaikainen_amk__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[valiaikainen_amk] ADD  CONSTRAINT [DF__valiaikainen_amk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__valiaikainen_amk__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[valiaikainen_amk] ADD  CONSTRAINT [DF__valiaikainen_amk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__vayla_nayttotutkintoon__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vayla_nayttotutkintoon] ADD  CONSTRAINT [DF__vayla_nayttotutkintoon__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__vayla_nayttotutkintoon__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vayla_nayttotutkintoon] ADD  CONSTRAINT [DF__vayla_nayttotutkintoon__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__vayla_nayttotutkintoon__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vayla_nayttotutkintoon] ADD  CONSTRAINT [DF__vayla_nayttotutkintoon__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ykieli__alkaa__3A6CA48E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ykieli] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ykieli__paattyy__3B60C8C7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ykieli] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ykieli__tietolah__3C54ED00]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ykieli] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yliopisto__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yliopisto] ADD  CONSTRAINT [DF__yliopisto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yliopisto__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yliopisto] ADD  CONSTRAINT [DF__yliopisto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yliopisto__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yliopisto] ADD  CONSTRAINT [DF__yliopisto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yrittajan_oppisopimuskoulutus__alkaa]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yrittajan_oppisopimuskoulutus] ADD  CONSTRAINT [DF__yrittajan_oppisopimuskoulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yrittajan_oppisopimuskoulutus__paattyy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yrittajan_oppisopimuskoulutus] ADD  CONSTRAINT [DF__yrittajan_oppisopimuskoulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yrittajan_oppisopimuskoulutus__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yrittajan_oppisopimuskoulutus] ADD  CONSTRAINT [DF__yrittajan_oppisopimuskoulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__yrityksen__tieto__27E3DFFF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[yrityksen_koko_tthv] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO

USE [ANTERO]