USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT [DF__tutkintolaji_tyollistymiseen__tietolahde]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT [DF__tutkintolaji_tyollistymiseen__paattyy]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] DROP CONSTRAINT [DF__tutkintolaji_tyollistymiseen__alkaa]
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 21.7.2020 20:13:46 ******/
DROP TABLE [dbo].[tutkintolaji_tyollistymiseen]
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 21.7.2020 20:13:46 ******/
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
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Perusopetuksen päättäneet', N'Avslutad grundläggande utbildning', N'Completed basic education', N'01', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Ylioppilastutkinto, nuorten opetussuunnitelma', N'Studentexamen, läroplan för unga', N'Matriculation examination, curriculum for young people', N'02', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Ylioppilastutkinto, aikuisten opetussuunnitelma', N'Studentexamen, läroplan för vuxna', N'Matriculation examination, curriculum for adults', N'03', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Ammatillinen perustutkinto', N'Grundläggande yrkesexamen', N'Vocational upper secondary qualification', N'04', N'E', N' ', N'OKM', N'')
GO
INSERT [dbo].[tutkintolaji_tyollistymiseen] ([id], [luotu], [alkaa], [paattyy], [tutkintolaji_tyollistymiseen_koodi], [tutkintolaji_tyollistymiseen], [tutkintolaji_tyollistymiseen_SV], [tutkintolaji_tyollistymiseen_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-05-08' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Ammatillinen perustutkinto', N'Grundläggande yrkesexamen', N'Vocational upper secondary qualification', N'04', N'E', N' ', N'OKM', N'')
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
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkintolaji_tyollistymiseen] ADD  CONSTRAINT [DF__tutkintolaji_tyollistymiseen__tietolahde]  DEFAULT ('OKM') FOR [tietolahde]
GO
USE [ANTERO]