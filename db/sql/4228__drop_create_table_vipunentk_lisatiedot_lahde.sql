USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[lahde]    Script Date: 7.1.2021 19:53:35 ******/
DROP TABLE [dbo].[lahde]
GO
/****** Object:  Table [dbo].[lahde]    Script Date: 7.1.2021 19:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Lukiokoulutuksen uudet opiskelijat ja opiskelijat', N'Nya studerande och studerande inom gymnasieutbildningen', N'Applicants admitted and students in general upper secondary education', N'1021', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Ylioppilastutkinnot', N'Studentexamina', N'Matriculation examinations', N'1022', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'23', N'Kansainväliset ylioppilastutkinnot ja gymnasieexamen', N'Internationella universitetsexamina och gymnasieexamen', N'International baccalaureates and gymnasieexamen', N'1023', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'31', N'Opetussuunnitelmaperusteisen ammatillisen koulutuksen uudet opiskelijat ja opiskelijat', N'Nya studerande och studerande inom läroplansbaserad yrkesutbildning', N'Applicants admitted and students in curriculum-based vocational education and training', N'1031', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'32', N'Opetussuunnitelmaperusteisen ammatillisen tutkinnon suorittaneet', N'Personer som avlagt en läroplansbaserad yrkesexamen', N'Completers of curriculum-based vocational qualifications', N'1032', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'33', N'Näyttötutkintoon valmistavan koulutuksen uudet opiskelijat, opiskelijat ja/tai näyttötutkinnon suorittaneet', N'Nya studerande, studerande och/eller personer som avlagt fristående examen inom förberedande utbildning för fristående examen', N'Applicants admitted and students in preparatory training for competence-based qualification and/or completers of competence-based qualifications', N'1034', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'34', N'Oppisopimuskoulutukseen osallistuneet ja/tai tutkinnon suorittaneet', N'Personer som deltagit och/eller avlagt examen inom läroavtalsutbildning', N'Students in apprenticeship training and/or completers of qualifications', N'1035', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-01-22' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'35', N'Oppilaitosmuotoisen ammatillisen koulutuksen opiskelijat ja tutkinnon suorittaneet (ent. 32 ja 33)', N'Personer som deltagit och/eller avlagt examen inom läroavtalsutbildning', N'Students in apprenticeship training and/or completers of qualifications', N'1033', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'41', N'Ammattikorkeakouluopiskelijat', N'Yrkeshögskolestuderande', N'Students in UASes', N'1041', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'42', N'Ammattikorkeakoulututkinnot', N'Yrkeshögskoleexamina', N'UAS degrees', N'1042', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'51', N'Yliopisto-opiskelijat', N'Universitetsstuderande', N'Students in universities', N'1051', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2013-11-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'52', N'Yliopistotutkinnot', N'Studentexamina', N'Matriculation Examinations', N'1052', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2020-11-02' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'61', N'Ammatilliset perustutkinnot, ei oppisopimuskoulutus', N'Yrkesinriktade grundexamina, ej läroavtalsutbildning', N'Vocational qualifications, not apprenticeship training', N'1030', N'E', N' ', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2021-01-07' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'36', N'Ammatillisen koulutuksen opiskelijat ja tutkinnot', N'Studerande och examina i yrkesutbildning', N'Students and qualifications in vocational education', N'1036', N'E', N' ', N'Tilastokeskus', N'CSC Juha')
GO

use antero