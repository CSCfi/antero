USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 18.2.2020 20:55:05 ******/
DROP TABLE [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 18.2.2020 20:55:05 ******/
DROP TABLE [dbo].[opettajan_tehtavatyyppi_perusopetuksessa]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 18.2.2020 20:55:05 ******/
DROP TABLE [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 18.2.2020 20:55:05 ******/
DROP TABLE [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 18.2.2020 20:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 18.2.2020 20:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 18.2.2020 20:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 18.2.2020 20:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-06-08' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-06-08' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-06-08' AS Date), N'1', N'Rehtori, johtaja', N'Rektor, direktör', N'Principal, school head', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-06-08' AS Date), N'2', N'Apulaisrehtori', N'Biträdande rektor', N'Vice-principal', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-06-08' AS Date), N'3', N'Muu johtotehtävä, esim. toimialajohtaja', N'Annan direktör, t.ex. branschdirektor', N'Other managerial position, e.g. Head of sector', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-06-08' AS Date), N'4', N'Lehtori', N'Lektor', N'Full-time teacher', N'1110', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-06-08' AS Date), N'5', N'Päätoiminen tuntiopettaja', N'Timlärare på heltid', N'Full-time teacher', N'1600', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-06-08' AS Date), N'6', N'Sivutoiminen tuntiopettaja', N'Timlärare på deltid', N'Part-time teacher', N'1700', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-06-08' AS Date), N'8', N'Erityisopettaja', N'Speciallärare', N'Special needs teachers', N'1400', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-06-08' AS Date), N'9', N'Opinto-ohjaaja', N'Studiehandledare', N'Careers adviser', N'1200', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2015-06-08' AS Date), N'0', N'Muu tai tuntematon', N'Övrig eller okänd', N'Other or unknown', N'1900', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2020-02-14' AS Date), N'7', N'Opettaja/Kouluttaja', N'Lärare/Instruktör', N'Teacher/Instructor', N'1800', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-20' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-20' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-20' AS Date), N'1', N'Rehtorit', N'Rektorer', N'Principals', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-20' AS Date), N'2', N'Lehtorit ja opinto-ohjaajat', N'Lektorer och studiehandledare', N'Full-time teachers and career counsellors', N'1130', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-20' AS Date), N'3', N'Maahanmuuttajien opettajat', N'Invandrarlärare', N'Migrant education teachers', N'1500', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-20' AS Date), N'4', N'Päätoimiset tuntiopettajat', N'Heltidsanställda timlärare', N'Full-time teachers', N'1610', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-20' AS Date), N'5', N'Sivutoimiset tuntiopettajat', N'Deltidsanställda timlärare', N'Part-time hourly teachers', N'1710', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_lukiokoulutuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-20' AS Date), N'9', N'Muu tai tuntematon', N'Övrig eller okänd', N'Other or unknown', N'1900', N'E         ', NULL, N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-11' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-11' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-11' AS Date), N'1', N'Rehtorit', N'Rektorer', N'Principals', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-11' AS Date), N'2', N'Lehtorit', N'Lektorer', N'Full-time teachers', N'1120', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-11' AS Date), N'3', N'Luokanopettajat ja esiopetuksen opettajat', N'Klasslärare och lärare i förskoleundervisningen', N'Primary and pre-primary education teaching professionals', N'1300', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-11' AS Date), N'4', N'Erityisluokanopettajat ja erityisopettajat', N'Specialklasslärare och speciallärare', N'Special class teachers and Special needs teachers', N'1410', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-11' AS Date), N'5', N'Maahanmuuttajien opettajat', N'Invandrarlärare', N'Migrant education teachers', N'1500', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-11' AS Date), N'6', N'Päätoimiset tuntiopettajat, perusopetus', N'Heltidsanställda timlärare, grundläggande utbildning', N'Full-time teachers, basic education', N'1620', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-11' AS Date), N'7', N'Sivutoimiset tuntiopettajat', N'Deltidsanställda timlärare', N'Part-time hourly teachers', N'1710', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-05-11' AS Date), N'8', N'Päätoimiset tuntiopettajat, perusopetuksen ja lukion yhteinen', N'Heltidsanställda timlärare, gemensam för den grundläggande utbildningen och gymnasiet', N'Full-time teachers, shared by basic education and general upper secondary education', N'1630', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_perusopetuksessa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2016-12-07' AS Date), N'9', N'Muu tai tuntematon', N'Övrig eller okänd', N'Other or unknown', N'1900', N'E         ', NULL, N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-07-13' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-07-13' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-07-13' AS Date), N'1', N'Rehtori', N'Rektor', N'Rector', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-07-13' AS Date), N'2', N'Apulaisrehtori, aluerehtori, vararehtori', N'Biträdande rektor, områdesrektor, prorektor', N'Vice-principal, Regional principal, Deputy principal', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-07-13' AS Date), N'3', N'Opettaja, linjajohtaja, lehtori', N'Lärare, linjedirektör, lektor', N'Teacher, Line manager, Full-time teacher', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-07-13' AS Date), N'4', N'Päätoiminen tuntiopettaja', N'Timlärare på heltid', N'Full-time teacher', N'1600', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_vapaassa_sivistystyossa] ([id], [luotu], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-07-13' AS Date), N'5', N'Muu tai tuntematon', N'Övrig eller okänd', N'Other or unknown', N'1900', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO

USE [ANTERO]