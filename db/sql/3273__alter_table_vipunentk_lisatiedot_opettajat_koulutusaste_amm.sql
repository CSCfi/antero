USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:13:45 ******/
DROP TABLE [dbo].[opettajat_koulutusaste_amm]
GO
/****** Object:  Table [dbo].[opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	[kommentti] [nvarchar](250) NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (-1, CAST(N'2015-06-08' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (-2, CAST(N'2015-06-08' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (1, CAST(N'2015-06-08' AS Date), N'01', N'Ammatillinen perustutkintokoulutus', N'Yrkesinriktad grundutbildning', N'Vocational upper secondary education and training', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (2, CAST(N'2015-06-08' AS Date), N'02', N'Ammatillinen perustutkintokoulutus', N'Yrkesinriktad grundutbildning', N'Vocational upper secondary education and training', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (3, CAST(N'2015-06-08' AS Date), N'03', N'Ammatillinen perustutkintokoulutus', N'Yrkesinriktad grundutbildning', N'Vocational upper secondary education and training', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (4, CAST(N'2015-06-08' AS Date), N'04', N'Ammatillinen perustutkintokoulutus', N'Yrkesinriktad grundutbildning', N'Vocational upper secondary education and training', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (5, CAST(N'2015-06-08' AS Date), N'05', N'Ammattitutkintokoulutus', N'Yrkesexamensutbildning', N'Preparatory training for further vocational qualification', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (6, CAST(N'2015-06-08' AS Date), N'06', N'Erikoisammattitutkintokoulutus', N'Specialyrkesexamensutbildning', N'Preparatory training for specialist vocational qualification', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (7, CAST(N'2015-06-08' AS Date), N'07', N'Ammattitutkintokoulutus', N'Yrkesexamensutbildning', N'Preparatory training for further vocational qualification', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (8, CAST(N'2015-06-08' AS Date), N'08', N'Erikoisammattitutkintokoulutus', N'Specialyrkesexamensutbildning', N'Preparatory training for specialist vocational qualification', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (9, CAST(N'2015-06-08' AS Date), N'09', N'Työvoimakoulutus', N'Arbetskraftsutbildning', N'Vocational labour market training', N'1080', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (10, CAST(N'2015-06-08' AS Date), N'10', N'Lukiokoulutus', N'Gymnasieutbildning', N'General upper secondary education', N'1090', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (11, CAST(N'2015-06-08' AS Date), N'11', N'Ammattikorkeakoulussa annettava koulutus', N'Yrkeshögskoleutbildning', N'Polytechnic education', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (12, CAST(N'2015-06-08' AS Date), N'12', N'Yliopistokoulutus', N'Universitetsutbildning', N'University education', N'1110', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (13, CAST(N'2015-06-08' AS Date), N'13', N'Muu', N'Övrig', N'Other', N'1130', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (14, CAST(N'2017-02-10' AS Date), N'14', N'Vapaan sivistystyön koulutus', N'Fritt bildningsarbete', N'Liberal (non-formal) adult education', N'1120', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi', CAST(N'2010-01-01' AS Date), CAST(N'2018-12-31' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (25, CAST(N'2020-02-11' AS Date), N'11', N'Vapaan sivistystyön koulutus', N'Fritt bildningsarbete', N'Liberal (non-formal) adult education', N'1120', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (26, CAST(N'2020-02-11' AS Date), N'12', N'Maahanmuuttajien koulutus (kotoutumiskoulutus tai luku- ja kirjoitustaidottomien)', N'Utbildning för invandrare (integrationsutbildning eller utbildning för icke läs- och skrivkunniga)', N'Education for immigrants (integration training or instruction for the illiterate)', N'1125', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (15, CAST(N'2020-02-11' AS Date), N'01', N'Ammatillinen perustutkintokoulutus', N'Yrkesinriktad grundutbildning', N'Vocational upper secondary education and training', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (16, CAST(N'2020-02-11' AS Date), N'02', N'Ammattitutkintokoulutus', N'Yrkesexamensutbildning', N'Preparatory training for further vocational qualification', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (17, CAST(N'2020-02-11' AS Date), N'03', N'Erikoisammattitutkintokoulutus', N'Specialyrkesexamensutbildning', N'Preparatory training for specialist vocational qualification', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (18, CAST(N'2020-02-11' AS Date), N'04', N'Valmentava koulutus', N'Förberedande utbildning', N'Prepatory training', N'1060', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (19, CAST(N'2020-02-11' AS Date), N'05', N'Muu ammatillinen koulutus (osaamista syventävä, täydentävä tai tehtävään valmistava)', N'Annan yrkesutbildning (kompetensfördjupande, -kompletterande eller förberedande för yrkesuppgifter )', N'Other vocational education (competence deepening, broadening or prepatory for occupation)', N'1070', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (20, CAST(N'2020-02-11' AS Date), N'06', N'Opiskeluvalmiuksia tukevat opinnot', N'Studier som stöder studiefärdigheterna', N'Studies supporting learning skills', N'1075', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (21, CAST(N'2020-02-11' AS Date), N'07', N'Työvoimakoulutus', N'Arbetskraftsutbildning', N'Vocational labour market training', N'1080', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (22, CAST(N'2020-02-11' AS Date), N'08', N'Lukiokoulutus', N'Gymnasieutbildning', N'General upper secondary education', N'1090', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (23, CAST(N'2020-02-11' AS Date), N'09', N'Ammattikorkeakoulussa annettava koulutus', N'Yrkeshögskoleutbildning', N'Polytechnic education', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO
INSERT [dbo].[opettajat_koulutusaste_amm] ([id], [luotu], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [alkaa], [paattyy]) VALUES (24, CAST(N'2020-02-11' AS Date), N'10', N'Yliopistokoulutus', N'Universitetsutbildning', N'University education', N'1110', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha', CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date))
GO

USE [ANTERO]