USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT IF EXISTS [DF__tutkintolaji_tyollistymiseen__tietolahde]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT IF EXISTS [DF__tutkintolaji_tyollistymiseen__paattyy]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT IF EXISTS [DF__tutkintolaji_tyollistymiseen__alkaa]
GO
ALTER TABLE [dbo].[koulutuslaji3] DROP CONSTRAINT IF EXISTS [DF__koulutusl__tieto__70547F4A]
GO
ALTER TABLE [dbo].[koulutuslaji2] DROP CONSTRAINT IF EXISTS [DF__koulutusl__tieto__6F605B11]
GO
ALTER TABLE [dbo].[koulutuslaji3] DROP CONSTRAINT IF EXISTS [DF__koulutusl__tieto__0915401C]
GO
ALTER TABLE [dbo].[koulutuslaji2] DROP CONSTRAINT IF EXISTS [DF__koulutusl__tieto__08211BE3]
GO
ALTER TABLE [dbo].[koulutuslaji_okm] DROP CONSTRAINT [DF__koulutuslaji_okm__tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__paattyy]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__alkaa]
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[tutkintolaji_tyollistymiseen]
GO
/****** Object:  Table [dbo].[koulutusryhma]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[koulutusryhma]
GO
/****** Object:  Table [dbo].[koulutuslaji3]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[koulutuslaji3]
GO
/****** Object:  Table [dbo].[koulutuslaji2]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[koulutuslaji2]
GO
/****** Object:  Table [dbo].[koulutuslaji_okm]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[koulutuslaji_okm]
GO
/****** Object:  Table [dbo].[koulutuslaji]    Script Date: 25.10.2019 19:26:58 ******/
DROP TABLE [dbo].[koulutuslaji]
GO
/****** Object:  Table [dbo].[koulutuslaji]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[koulutuslaji_okm]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[koulutuslaji2]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[koulutuslaji3]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[koulutusryhma]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 25.10.2019 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (190, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Lukiokoulutus, nuorten OPS (oppilaitoksen määrittelemä tieto)', N'Gymnasieutbildning, LP för unga (uppgift som läroanstalten fastställt)', N'Upper secondary general education, curriculum for young people (data provided by the educational institution)', N'21', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (191, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Lukiokoulutus, aikuisten OPS (oppilaitoksen määrittelemä tieto)', N'Gymnasieutbildning, LP för vuxna (uppgift som läroanstalten fastställt)', N'Upper secondary general education, curriculum for adults (data provided by the educational institution)', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (192, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'31', N'OPS-perusteinen ammatillinen peruskoulutus (ei oppisopimuskoulutus)', N'LP-baserad grundläggande yrkesutbildning (ej läroavtalsutbildning)', N'Curriculum-based vocational upper secondary education and training (not apprenticeship training)', N'31', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (193, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'32', N'Näyttötutkintoon valmistava koulutus: perustutkinnot (ei oppisop. koul.)', N'Förberedande utbildning för fristående examen: grundexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications (not apprenticeship training)', N'32', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (194, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'33', N'Näyttötutkintoon valmistava koulutus: ammattitutkinnot (ei oppisop.koul.)', N'Förberedande utbildning för fristående examen: yrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: further vocational qualifications (not apprenticeship training)', N'33', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (195, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'34', N'Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot (ei oppisop.k.)', N'Förberedande utbildning för fristående examen: specialyrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: specialist vocational qualifications (not apprenticeship training)', N'34', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (196, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'35', N'OPS-perusteinen ammatillinen peruskoulutus (oppisopimuskoulutus)', N'LP-baserad grundläggande yrkesutbildning (läroavtalsutbildning)', N'Curriculum-based vocational upper secondary education and training (apprenticeship training)', N'35', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (197, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'36', N'Näyttötutkintoon valmistava koulutus: perustutkinnot (oppisopimuskoulutus)', N'Förberedande utbildning för fristående examen: grundexamina (läroavtalsutbildning)', N'Preparatory training for competence-based qualifications: vocational qualifications (apprenticeship training)', N'36', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (198, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'37', N'Näyttötutkintoon valmistava koulutus: ammattitutkinnot (oppisopimuskoulutus)', N'Förberedande utbildning för fristående examen: yrkesexamina (läroavtalsutbildning)', N'Preparatory training for competence-based qualifications: further vocational qualifications (apprenticeship training)', N'37', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (199, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'38', N'Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot (oppisop.koul.)', N'Förberedande utbildning för fristående examen: specialyrkesexamina (läroavtalsutb.)', N'Preparatory training for competence-based qualifications: specialist vocational qualifications (apprenticeship training)', N'38', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (200, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'41', N'Ammattikorkeakoulututkinto, päivätoteutus', N'Yrkeshögskoleexamen, dagstudier', N'UAS degree, daytime studies', N'41', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (201, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'42', N'Ammattikorkeakoulututkinto, monimuotototeutus', N'Yrkeshögskoleexamen, flerformsstudier', N'UAS degree, multiform studies', N'42', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (202, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'46', N'Ylempään AMK-tutkintoon tähtäävä koulutus', N'Utbildning för högre YH-examen', N'Education leading to a UAS Master''s degree', N'46', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (203, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'51', N'Alempaan ja ylempään korkeakoulututkintoon tähtäävä koulutus', N'Utbildning för lägre och högre högskoleexamen', N'Education leading to a Bachelor''s and Master’s degree', N'51', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (204, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'52', N'Lisensiaatinkoulutus, tohtorinkoulutus ja lääkärien erik.koul.', N'Licentiatutbildning, doktorsutbildning och specialiseringsutb. för läkare', N'Licentiate education, postgraduate education and specialist degrees in medicine', N'52', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-13' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-13' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-13' AS Date), N'1', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', N'10', N'10', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-13' AS Date), N'2', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', N'11', N'11', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-13' AS Date), N'3', N'Lukiokoulutus (nuorten opetussuunnitelma)', N'Gymnasieutbildning (läroplan för unga)', N'General upper secondary education (curriculum for young people)', N'Lukiokoulutus (nuorten opetussuunnitelma)', N'Gymnasieutbildning (läroplan för unga)', N'General upper secondary education (curriculum for young people)', N'12', N'12', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-13' AS Date), N'4', N'Lukiokoulutus (aikuisten opetussuunnitelma)', N'Gymnasieutbildning (läroplan för vuxna)', N'General upper secondary general education (curriculum for adults)', N'Lukiokoulutus (aikuisten opetussuunnitelma)', N'Gymnasieutbildning (läroplan för vuxna)', N'General upper secondary general education (curriculum for adults)', N'13', N'13', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-13' AS Date), N'5', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (i läroanstaltsform, läroplansbaserad)', N'Vocational upper secondary qualification (institution-based, curriculum-based)', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (i läroanstaltsform, läroplansbaserad)', N'Vocational upper secondary qualification (institution-based, curriculum-based)', N'14', N'14', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-13' AS Date), N'6', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)', N'Grundläggande yrkesexamen (i läroanstaltsform, fristående examen)', N'Vocational upper secondary qualification (institution-based, competence-based)', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)', N'Grundläggande yrkesexamen (i läroanstaltsform, fristående examen)', N'Vocational upper secondary qualification (institution-based, competence-based)', N'15', N'15', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-13' AS Date), N'7', N'Ammattitutkinto (oppilaitosmuotoinen)', N'Yrkesexamen (i läroanstaltsform)', N'Further vocational qualification (institution-based)', N'Ammattitutkinto (oppilaitosmuotoinen)', N'Yrkesexamen (i läroanstaltsform)', N'Further vocational qualification (institution-based)', N'16', N'16', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-05-13' AS Date), N'8', N'Erikoisammattitutkinto  (oppilaitosmuotoinen)', N'Specialyrkesexamen (i läroanstaltsform)', N'Specialist vocational qualification (institution-based)', N'Erikoisammattitutkinto  (oppilaitosmuotoinen)', N'Specialyrkesexamen (i läroanstaltsform)', N'Specialist vocational qualification (institution-based)', N'17', N'17', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2015-05-13' AS Date), N'9', N'Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (läroavtalsutbildning, läroplansbaserad)', N'Vocational upper secondary qualification (apprenticeship training, curriculum-based)', N'Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (läroavtalsutbildning, läroplansbaserad)', N'Vocational upper secondary qualification (apprenticeship training, curriculum-based)', N'18', N'18', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2015-05-13' AS Date), N'10', N'Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)', N'Grundläggande yrkesexamen (läroavtalsutbildning, fristående examen)', N'Vocational upper secondary qualification (apprenticeship training, competence-based)', N'Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)', N'Grundläggande yrkesexamen (läroavtalsutbildning, fristående examen)', N'Vocational upper secondary qualification (apprenticeship training, competence-based)', N'19', N'19', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2015-05-13' AS Date), N'19', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'28', N'28', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2015-05-13' AS Date), N'20', N'Tohtorintutkinto', N'Doktorsexamen', N'Doctoral degree', N'Tohtorintutkinto', N'Doktorsexamen', N'Doctoral degree', N'29', N'29', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2015-05-13' AS Date), N'11', N'Ammattitutkinto (oppisopimuskoulutus)', N'Yrkesexamen (läroavtalsutbildning)', N'Further vocational qualification (apprenticeship training)', N'Ammattitutkinto (oppisopimuskoulutus)', N'Yrkesexamen (läroavtalsutbildning)', N'Further vocational qualification (apprenticeship training)', N'20', N'20', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2015-05-13' AS Date), N'12', N'Erikoisammattitutkinto (oppisopimuskoulutus)', N'Specialyrkesexamen (läroavtalsutbildning)', N'Specialist vocational qualification (apprenticeship training)', N'Erikoisammattitutkinto (oppisopimuskoulutus)', N'Specialyrkesexamen (läroavtalsutbildning)', N'Specialist vocational qualification (apprenticeship training)', N'21', N'21', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2015-05-13' AS Date), N'13', N'Ammattikorkeakoulututkinto (päivätoteutus)', N'Yrkeshögskoleexamen (dagstudier)', N'UAS degree (daytime studies)', N'Ammattikorkeakoulututkinto', N'Yrkeshögskoleexamen', N'UAS degree', N'22', N'22', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2015-05-13' AS Date), N'14', N'Ammattikorkeakoulututkinto (monimuotototeutus)', N'Yrkeshögskoleexamen (flerformsstudier)', N'UAS degree (multiform studies)', N'Ammattikorkeakoulututkinto', N'Yrkeshögskoleexamen', N'UAS degree', N'23', N'22', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2015-05-13' AS Date), N'15', N'Ylempi ammattikorkeakoulututkinto  ', N'Högre yrkeshögskoleexamen  ', N'UAS Master''s degree  ', N'Ylempi ammattikorkeakoulututkinto  ', N'Högre yrkeshögskoleexamen  ', N'UAS Master''s degree  ', N'24', N'24', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2015-05-13' AS Date), N'16', N'Alempi korkeakoulututkinto  ', N'Lägre högskoleexamen  ', N'Bachelor''s degree  ', N'Alempi korkeakoulututkinto  ', N'Lägre högskoleexamen  ', N'Bachelor''s degree  ', N'25', N'25', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2015-05-13' AS Date), N'17', N'Ylempi korkeakoulututkinto  ', N'Högre högskoleexamen  ', N'Master''s degree  ', N'Ylempi korkeakoulututkinto  ', N'Högre högskoleexamen  ', N'Master''s degree  ', N'26', N'26', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2015-05-13' AS Date), N'18', N'Lääkärien erikoistumiskoulutus', N'Läkarnas specialiseringsutbildning', N'Specialist degree in medicine', N'Lääkärien erikoistumiskoulutus', N'Läkarnas specialiseringsutbildning', N'Specialist degree in medicine', N'27', N'27', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2013-06-10' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'K', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2013-06-10' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2013-06-10' AS Date), N'21', N'Lukiokoulutus, nuorten OPS', N'Gymnasieutbildning, LP för unga', N'General upper secondary education, curriculum for young people', N'21', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2013-06-10' AS Date), N'22', N'Lukiokoulutus, aikuisten OPS', N'Gymnasieutbildning, LP för vuxna', N'General upper secondary education, curriculum for adults', N'22', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2013-06-10' AS Date), N'31', N'OPS-perusteinen ammatillinen peruskoulutus (ei oppisopimuskoulutus)', N'LP-baserad grundläggande yrkesutbildning (ej läroavtalsutbildning)', N'Curriculum-based vocational upper secondary education and training (not apprenticeship training)', N'31', N'opetussuunnitelmaperusteinen koulutus/tutkinto', N'läroplansbaserad utbildning/examen', N'curriculum-based education/qualification', N'1', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'1', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'1', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2013-06-10' AS Date), N'32', N'Näyttötutkintoon valmistava koulutus: perustutkinnot (ei oppisop. koul.)', N'Förberedande utbildning för fristående examen: grundexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications (not apprenticeship training)', N'32', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'1', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'1', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2013-06-10' AS Date), N'33', N'Näyttötutkintoon valmistava koulutus: ammattitutkinnot (ei oppisop.koul.)', N'Förberedande utbildning för fristående examen: yrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: further vocational qualifications (not apprenticeship training)', N'33', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'1', N'ammattitutkinto', N'yrkesexamen', N'further vocational qualification', N'2', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2013-06-10' AS Date), N'34', N'Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot (ei oppisop.k.)', N'Förberedande utbildning för fristående examen: specialyrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: specialist vocational qualifications (not apprenticeship training)', N'34', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'1', N'erikoisammattitutkinto', N'specialyrkesexamen', N'specialist vocational qualification', N'3', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2013-06-10' AS Date), N'35', N'OPS-perusteinen ammatillinen peruskoulutus (oppisopimuskoulutus)', N'LP-baserad grundläggande yrkesutbildning (läroavtalsutbildning)', N'Curriculum-based vocational upper secondary education and training (apprenticeship training)', N'35', N'opetussuunnitelmaperusteinen koulutus/tutkinto', N'läroplansbaserad utbildning/examen', N'curriculum-based education/qualification', N'1', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'2', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'1', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2013-06-10' AS Date), N'36', N'Näyttötutkintoon valmistava koulutus: perustutkinnot (oppisopimuskoulutus)', N'Förberedande utbildning för fristående examen: grundexamina (läroavtalsutb.)', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications (apprenticeship training)', N'36', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'2', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'1', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2013-06-10' AS Date), N'37', N'Näyttötutkintoon valmistava koulutus: ammattitutkinnot (oppisopimuskoulutus)', N'Förberedande utbildning för fristående examen: yrkesexamina (läroavtalsutb.)', N'Preparatory training for competence-based qualifications: further vocational qualifications (apprenticeship training)', N'37', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'2', N'ammattitutkinto', N'yrkesexamen', N'further vocational qualification', N'2', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2013-06-10' AS Date), N'38', N'Näyttötutkintoon valmistava koulutus: erikoisammattitutkinnot (oppisop.koul.)', N'Förberedande utbildning för fristående examen: specialyrkesexamina (läroavtalsutb.)', N'Preparatory training for competence-based qualifications: specialist vocational qualifications (apprenticeship training)', N'38', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'2', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'2', N'erikoisammattitutkinto', N'specialyrkesexamen', N'specialist vocational qualification', N'3', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2013-06-10' AS Date), N'41', N'Ammattikorkeakoulututkinto, päivätoteutus', N'Yrkeshögskoleexamen, dagstudier', N'Polytechnic degree, daytime studies', N'41', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2013-06-10' AS Date), N'42', N'Ammattikorkeakoulututkinto, monimuotototeutus', N'Yrkeshögskoleexamen, flerformsstudier', N'Polytechnic degree, multiform studies', N'42', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2013-06-10' AS Date), N'46', N'Ylempään AMK-tutkintoon tähtäävä koulutus', N'Utbildning för högre YH-examen', N'Education leading to UAS Master''s degree', N'46', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2013-06-10' AS Date), N'51a', N'Alempaan korkeakoulututkintoon tähtäävä koulutus', N'Utbildning för lägre högskoleexamen', N'Education leading to Bachelor''s degree', N'51a', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2013-06-10' AS Date), N'51b', N'Ylempään korkeakoulututkintoon tähtäävä koulutus', N'Utbildning för högre högskoleexamen', N'Education leading to Master''s degree', N'51b', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji2] ([id], [luotu], [koulutuslaji2_koodi], [koulutuslaji2], [koulutuslaji2_SV], [koulutuslaji2_EN], [jarjestys_koulutuslaji2], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2013-06-10' AS Date), N'52', N'Lisensiaatinkoulutus, tohtorinkoulutus ja lääkärien erik.koul.', N'Licentiatutbildning, doktorsutbildning och specialiseringsutb. för läkare', N'Licentiate education, postgraduate education and specialist degrees in medicine', N'52', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-28' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'K', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-28' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N'0', N'Manuaalinen', N'')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-28' AS Date), N'21', N'Lukiokoulutus, nuorten OPS', N'Gymnasieutbildning, ungdomar LP-baserad', N'General upper secondary education, curriculum for young people', N'21', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-28' AS Date), N'22', N'Lukiokoulutus, aikuisten OPS', N'Gymnasieutbildning, vuxna LP-baserad', N'General upper secondary education, curriculum for adults', N'22', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-28' AS Date), N'31', N'OPS-perusteinen ammatillinen peruskoulutus (ei oppisop.koul.)', N'LP-baserad grundläggande yrkesutbildning (ej läroavtalsutbildning)', N'Curriculum-based vocational upper secondary education and training (not apprenticeship training)', N'31', N'opetussuunnitelmaperusteinen koulutus/tutkinto', N'läroplansbaserad utbildning/examen', N'curriculum-based education/qualification', N'01', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'01', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'01', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-28' AS Date), N'32', N'Näyttötutkintoon valmistava koulutus: perustutkinnot (ei oppisop. koul.)', N'Förberedande utbildning för fristående examen: grundexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications (not apprenticeship training)', N'32', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'02', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'01', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'01', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-28' AS Date), N'33', N'Näyttötutkintoon valmistava koulutus: ammattitutkinnot (ei oppisop.koul.)', N'Förberedande utbildning för fristående examen: yrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: further vocational qualifications (not apprenticeship training)', N'33', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'02', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'01', N'ammattitutkinto', N'yrkesexamen', N'further vocational qualification', N'02', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-28' AS Date), N'34', N'Näyttötutkintoon valmistava koulutus: erikoisammattitutk. (ei oppisop.koul.)', N'Förberedande utbildning för fristående examen: specialyrkesexamina (ej läroavtalsutb.)', N'Preparatory training for competence-based qualifications: specialist vocational qualifications (not apprenticeship training) ', N'34', N'näyttötutkintoon valmistava koulutus/tutkinto', N'Förberedande utbildning för fristående examen/examen', N'preparatory training/qualification for competence-based qualifications', N'02', N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', N'01', N'erikoisammattitutkinto', N'specialyrkesexamen', N'specialist vocational qualification', N'03', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-28' AS Date), N'35', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'35', N'opetussuunnitelmaperusteinen koulutus/tutkinto', N'läroplansbaserad utbildning/examen', N'curriculum-based education/qualification', N'01', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'02', N'ammatillinen peruskoulutus', N'grundläggande yrkesutbildning', N'vocational upper secondary education and training', N'01', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2015-05-28' AS Date), N'41', N'AMK-tutkinto, päivätoteutus', N'YH-examen, dagstudier', N'UAS degree, daytime studies', N'41', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2015-05-28' AS Date), N'42', N'AMK-tutkinto, monimuotototeutus', N'YH-examen, flerformsstudier', N'UAS degree, multiform studies', N'42', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2015-05-28' AS Date), N'46', N'Ylempi AMK-tutkintokoulutus', N'Utbildning för högre YH-examen', N'UAS Master''s degree education', N'46', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2015-05-28' AS Date), N'51', N'Alemmat ja ylemmät korkeakoulututkinnot', N'Lägre och högre yrkeshögskoleexamina', N'Bachelor''s and Master''s degrees', N'51', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutuslaji3] ([id], [luotu], [koulutuslaji3_koodi], [koulutuslaji3], [koulutuslaji3_SV], [koulutuslaji3_EN], [jarjestys_koulutuslaji3], [jarjestamistapa], [jarjestamistapa_SV], [jarjestamistapa_EN], [jarjestys_jarjestamistapa], [jarjestamismuoto], [jarjestamismuoto_SV], [jarjestamismuoto_EN], [jarjestys_jarjestamismuoto], [tutkintotyyppi], [tutkintotyyppi_SV], [tutkintotyyppi_EN], [jarjestys_tutkintotyyppi], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2015-05-28' AS Date), N'52', N'Lisensiaatin-, tohtorin- ja lääkärien erikoistumiskoulutus', N'Licentiat- och doktorsutbildning, specialiseringsutbildning för läkare', N'Licentiate and doctoral education and specialist degree in medicine', N'52', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'E', N'0', N'Manuaalinen', N'Järjestämistapa-, muoto ja tutkintotyyppi kopioitu koulutuslaji2:sta')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-12-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-12-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-12-01' AS Date), N'21', N'Lukiokoulutus, nuorten OPS', N'Gymnasieutbildning, LP för unga', N'General upper secondary education, curriculum for young people', N'Lukiokoulutus (nuorten opetussuunnitelma)', N'Gymnasieutbildning, LP för unga', N'General upper secondary education, curriculum for young people', N'1020', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-12-01' AS Date), N'22', N'Lukiokoulutus, aikuisten OPS', N'Gymnasieutbildning, LP för vuxna', N'General upper secondary education, curriculum for adults', N'Lukiokoulutus (aikuisten opetussuunnitelma)', N'Gymnasieutbildning, LP för vuxna', N'General upper secondary education, curriculum for adults', N'1030', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-12-01' AS Date), N'31', N'OPS-perusteinen ammatillinen peruskoulutus*', N'LP-grundad grundläggande yrkesutbildning*', N'Curriculum-based vocational upper secondary education and training*', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)', N'LP-grundad grundläggande yrkesutbildning*', N'Curriculum-based vocational upper secondary education and training*', N'1040', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2014-12-01' AS Date), N'32', N'Näyttötutkintoon valmistava koulutus: perustutkinnot*', N'Förberedande utbildning för fristående examen: grundexamina*', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications*', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)', N'Förberedande utbildning för fristående examen: grundexamina*', N'Preparatory training for competence-based qualifications: vocational upper secondary qualifications*', N'1050', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2014-12-01' AS Date), N'33', N'Näyttötutkintoon valmistava koulutus: ammatti- ja erikoisammattitutkinnot*', N'Förberedande utbildning för fristående examen: yrkes- och specialyrkesexamina*', N'Preparatory training for competence-based qualifications:  further and specialist vocational qualifications*', N'Ammatti- ja erikoisammattitutkinto (oppilaitosmuotoinen)', N'Förberedande utbildning för fristående examen: yrkes- och specialyrkesexamina*', N'Preparatory training for competence-based qualifications:  further and specialist vocational qualifications*', N'1060', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2014-12-01' AS Date), N'35', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'1070', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2014-12-01' AS Date), N'41', N'AMK-tutkinto, päivätoteutus', N'YH-examen, dagstudier', N'UAS degree, daytime studies', N'Ammattikorkeakoulututkinto', N'YH-examen', N'UAS degree', N'1080', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2014-12-01' AS Date), N'42', N'AMK-tutkinto, monimuotototeutus', N'YH-examen, flerformsstudier', N'UAS degree, multiform studies', N'Ammattikorkeakoulututkinto', N'YH-examen', N'UAS degree', N'1090', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2014-12-01' AS Date), N'46', N'Ylempi AMK-tutkinto', N'Högre YH-examen', N'UAS Master''s degree', N'Ylempi ammattikorkeakoulututkinto', N'Högre YH-examen', N'UAS Master''s degree', N'1100', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2014-12-01' AS Date), N'51', N'Alemmat ja ylemmät korkeakoulututkinnot', N'Lägre och högre högskoleexamina', N'Bachelor''s and Master''s degrees', N'Alempi ja ylempi korkeakoulututkinto', N'Lägre och högre högskoleexamina', N'Bachelor''s and Master''s degrees', N'1110', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[koulutusryhma] ([id], [luotu], [koulutusryhma_koodi], [koulutusryhma], [koulutusryhma_SV], [koulutusryhma_EN], [koulutusryhma2], [koulutusryhma2_SV], [koulutusryhma2_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2014-12-01' AS Date), N'52', N'Lisensiaatin- ja tohtorintutkinnot sekä lääkärien erikoistumiskoulutus', N'Licentiat- och doktorsexamina samt specialiseringsutbildning för läkare', N'Licentiate and doctoral degrees and specialist degrees in medicine', N'Lisensiaatin- ja tohtorintutkinto sekä lääkärien erikoistumiskoulutus', N'Licentiat- och doktorsexamina samt specialiseringsutbildning för läkare', N'Licentiate and doctoral degrees and specialist degrees in medicine', N'1120', N'E         ', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Perusopetuksen päättäneet', N'Avslutad grundläggande utbildning', N'Completed basic education', N'01', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Ylioppilastutkinto, nuorten opetussuunnitelma', N'Studentexamen, läroplan för unga', N'Matriculation examination, curriculum for young people', N'02', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Ylioppilastutkinto, aikuisten opetussuunnitelma', N'Studentexamen, läroplan för vuxna', N'Matriculation examination, curriculum for adults', N'03', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Ammatillinen perustutkinto (opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (läroplansgrundad)', N'Vocational upper secondary qualification (curriculum-based)', N'04', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Ammatillinen perustutkinto (näyttötutkinto)', N'Grundläggande yrkesexamen', N'Vocational upper secondary qualification', N'05', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'06', N'Ammattitutkinto', N'Yrkesexamen', N'Further vocational qualification', N'06', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'07', N'Erikoisammattitutkinto', N'Specialyrkesexamen', N'Specialist vocational qualification', N'07', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Opistoasteen tai ammatillisen korkea-asteen tutkinto', N'Examen på institutnivå eller yrkesinriktad lägsta högre nivå', N'Post-secondary level or higher vocational education', N'08', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Ammattikorkeakoulututkinto, päivätoteutus', N'Yrkeshögskoleexamen, dagstudier', N'UAS degree, daytime studies', N'09', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Ammattikorkeakoulututkinto, monimuotototeutus', N'Yrkeshögskoleexamen, flerformsstudier', N'UAS degree, multiform studies', N'10', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'Ylempi ammattikorkeakoulututkinto', N'Högre yrkeshögskoleexamen', N'UAS Master''s degree', N'11', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'Alempi korkeakoulututkinto', N'Lägre högskoleexamen', N'Bachelor''s degree', N'12', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13', N'Ylempi korkeakoulututkinto', N'Högre högskoleexamen', N'Master''s degree', N'13', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14', N'Lääkärien erikoistumiskoulutus', N'Specialiseringsutbildning för läkare', N'Specialist degree in medicine', N'14', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'15', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'15', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'16', N'Tohtoritutkinto', N'Doktorsexamen', N'Doctoral degree', N'16', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'17', N'Muu tai tuntematon', N'Annan eller okänd', N'Other or unknown', N'17', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'')
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji_okm] ADD  CONSTRAINT [DF__koulutuslaji_okm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji2] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji3] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__tietolahde]  DEFAULT ('OKM') FOR [tietolahde]
GO
USE [ANTERO]