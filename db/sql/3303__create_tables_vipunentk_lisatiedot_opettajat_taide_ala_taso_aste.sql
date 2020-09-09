USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajat_opintotaso_tpo]    Script Date: 26.2.2020 17:05:40 ******/
DROP TABLE IF EXISTS [dbo].[opettajat_opintotaso_tpo]
GO
/****** Object:  Table [dbo].[opettajat_koulutusaste_tpo]    Script Date: 26.2.2020 17:05:40 ******/
DROP TABLE IF EXISTS [dbo].[opettajat_koulutusaste_tpo]
GO
/****** Object:  Table [dbo].[opettajat_ala_tpo]    Script Date: 26.2.2020 17:05:40 ******/
DROP TABLE IF EXISTS [dbo].[opettajat_ala_tpo]
GO
/****** Object:  Table [dbo].[opettajat_ala_tpo]    Script Date: 26.2.2020 17:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajat_ala_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ala_koodi] [nvarchar](3) NULL,
	[ala] [nvarchar](255) NULL,
	[ala_SV] [nvarchar](255) NULL,
	[ala_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[opettajat_koulutusaste_tpo]    Script Date: 26.2.2020 17:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajat_koulutusaste_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusaste_koodi] [nvarchar](3) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[opettajat_opintotaso_tpo]    Script Date: 26.2.2020 17:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajat_opintotaso_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintotaso_koodi] [nvarchar](3) NULL,
	[opintotaso] [nvarchar](255) NULL,
	[opintotaso_SV] [nvarchar](255) NULL,
	[opintotaso_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Kuvataide
', N'Bildkonst', N'Visual arts', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Arkkitehtuuri
', N'Arkitektur', N'Architecture', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (3, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Käsityö
', N'Slöjd', N'Crafts', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (4, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Sanataide
', N'Ordkonst', N'Literary art', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (5, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Sirkus
', N'Cirkuskonst', N'Circus art', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (6, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'06', N'Tanssi
', N'Dans', N'Dance', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (7, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'07', N'Teatteri
', N'Teaterkonst', N'Theatre', N'1070', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (8, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Musiikki
', N'Musik', N'Music', N'1080', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (9, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Mediataiteet
', N'Mediekonst', N'Media arts', N'1090', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_ala_tpo] ([id], [alkaa], [paattyy], [ala_koodi], [ala], [ala_SV], [ala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (10, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Muu
', N'Övrig', N'Other', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Varhaiskasvatus
', N'Småbarnsfostran', N'Early childhood education and care', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Perusopetus
', N'Grundläggande utbildning', N'Basic education', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (3, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Taiteen perusopetus, oppilaitoksessa
', N'Grundläggande konstundervisning, vid läroanstalt', N'Basic education in the arts, at educational institution', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (4, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Taiteen perusopetus, kansalaisopistossa
', N'Grundläggande konstundervisning, vid medborgarinstitut', N'Basic education in the arts, at adult education centre', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (5, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Lukiokoulutus
', N'Gymnasieutbildning', N'General upper secondary education', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (6, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'06', N'Ammatillinen koulutus
', N'Yrkesutbildning', N'Vocational education and training', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (7, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'07', N'Ammattikorkeakoulutus
', N'Yrkeshögskoleutbildning', N'Polytechnic education', N'1070', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (8, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Yliopistokoulutus
', N'Universitetsutbildning', N'University education', N'1080', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (9, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Vapaa sivistystyö, kansalaisopistossa
', N'Fritt bildningsarbete, vid medborgarinstitut', N'Liberal adult education, at adult education centre', N'1090', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (10, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Vapaa sivistystyö, kansanopistossa
', N'Fritt bildningsarbete, vid folkhögskola', N'Liberal adult education, at folk high school', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (11, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'Vapaa sivistystyö, opintokeskuksessa
', N'Fritt bildningsarbete, vid studiecentral', N'Liberal adult education, at study centre', N'1110', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (12, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'Kesäyliopisto
', N'Sommaruniversitet', N'Summer university', N'1120', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (13, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13', N'Yksityinen elinkeinonharjoittaja (opetus)
', N'Enskild näringsverksamhet (undervisning)', N'Sole proprietorship (teaching)', N'1130', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_koulutusaste_tpo] ([id], [alkaa], [paattyy], [koulutusaste_koodi], [koulutusaste], [koulutusaste_SV], [koulutusaste_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (14, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14', N'Muu', N'Övrig', N'Other', N'1140', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Taiteen perusopetuksen varhaisiän opinnot
', N'Grundläggande konstundervisning, småbarnspedagogik', N'Basic education in the arts, early childhood education', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Taiteen perusopetuksen perusopinnot (laaja oppimäärä)
', N'Grundläggande konstundervisning, grundstudier (fördjupad lärokurs)', N'Basic education in the arts, basic studies (extended syllabus)', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (3, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Taiteen perusopetuksen syventävät opinnot (laaja oppimäärä)
', N'Grundläggande konstundervisning, fördjupade (fördjupad lärokurs)', N'Basic education in the arts, advanced studies (extended syllabus)', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (4, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Taiteen perusopetuksen yhteiset opinnot (yleinen oppimäärä)
', N'Grundläggande konstundervisning, gemensamma studier (allmän lärokurs)', N'Basic education in the arts, core studies (general syllabus)', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (5, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Taiteen perusopetuksen teemaopinnot (yleinen oppimäärä)
', N'Grundläggande konstundervisning, temastudier (allmän lärokurs)', N'Basic education in the arts, theme studies (general syllabus)', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (6, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Aikuisten taiteen perusopetus', N'Grundläggande konstundervisning för vuxna', N'Basic education in the arts for adults', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_opintotaso_tpo] ([id], [alkaa], [paattyy], [opintotaso_koodi], [opintotaso], [opintotaso_SV], [opintotaso_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (7, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7', N'Muu kuin taiteen perusopetus, esim. lyhytkurssit ja kerhot
', N'Icke grundläggande konstundervisning, t.ex. kortkurser och klubbar', N'Not basic education in the arts, e.g. short courses and clubs', N'1070', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO

USE [ANTERO]