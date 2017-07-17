USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajat_aine_2016_lukio]    Script Date: 17.7.2017 9:55:20 ******/
DROP TABLE [dbo].[opettajat_aine_2016_lukio]
GO
/****** Object:  Table [dbo].[opettajat_aine_2016]    Script Date: 17.7.2017 9:55:20 ******/
DROP TABLE [dbo].[opettajat_aine_2016]
GO
/****** Object:  Table [dbo].[opettajat_aine_2016]    Script Date: 17.7.2017 9:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[opettajat_aine_2016_lukio]    Script Date: 17.7.2017 9:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-12' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-12' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-12' AS Date), N'01', N'*Ei opetusta*', N'ingen undervisning', N'no teaching', N'1000', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-12' AS Date), N'02', N'Esiopetus', N'förskoleundervisning', N'pre-primary education', N'1010', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-12' AS Date), N'03', N'Luokanopetus', N'klassundervisning', N'class teaching', N'1011', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-12' AS Date), N'04', N'Luokkamuotoinen erityisopetus', N'specialundervisning i klass', N'special needs class education', N'1012', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-12' AS Date), N'05', N'Maahanmuuttajien perusopetukseen valmistava opetus', N'förberedenade undervisning för invandrarnas grundläggande utbildning', N'preparatory teaching for basic education for migrants', N'1013', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-12' AS Date), N'06', N'Äidinkieli ja kirjallisuus, suomi äidinkielenä', N'modersmål och litteratur, finska som modersmål', N'mother tongue and literature, Finnish as mother tongue', N'1014', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-12' AS Date), N'07', N'Äidinkieli ja kirjallisuus, ruotsi äidinkielenä', N'modersmål och litteratur, svenska som modersmål', N'mother tongue and literature, Swedish as mother tongue', N'1015', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-05-12' AS Date), N'08', N'Äidinkieli ja kirjallisuus, saame äidinkielenä', N'modersmål och litteratur, samiska som modersmål', N'mother tongue and literature, Sámi as mother tongue', N'1016', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2015-05-12' AS Date), N'09', N'Äidinkieli ja kirjallisuus, romani äidinkielenä', N'modersmål och litteratur, romerska som modersmål', N'mother tongue and literature, Roma as mother tongue', N'1017', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2015-05-12' AS Date), N'10', N'Äidinkieli ja kirjallisuus, viittomakieli äidinkielenä', N'modersmål och litteratur, teckenspråk som modersmål', N'mother tongue and literature, sign language as mother tongue', N'1018', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2015-05-12' AS Date), N'11', N'Äidinkieli ja kirjallisuus, muu oppilaan äidinkieli', N'modersmål och litteratur, eleven har annat modersmål ', N'mother tongue and literature, other mother tongue ', N'1019', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2015-05-12' AS Date), N'12', N'Maahanmuuttajien oma äidinkieli', N'invandrarnas eget modersmål', N'migrant mother tongue', N'1020', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2015-05-12' AS Date), N'13', N'Äidinkieli ja kirjallisuus, suomi toisena kielenä', N'modersmål och litteratur, finska som andra språk', N'mother tongue and literature, Finnish as a second language', N'1021', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2015-05-12' AS Date), N'14', N'Äidinkieli ja kirjallisuus, ruotsi toisena kielenä', N'modersmål och litteratur, svenska som andra språk', N'mother tongue and literature, Swedish as a second language', N'1022', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2015-05-12' AS Date), N'15', N'Äidinkieli ja kirjallisuus, suomi saamenkielisille', N'modersmål och litteratur, finska för dem som talar samiska', N'mother tongue and literature, Finnish for speakers of Sámi', N'1023', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2015-05-12' AS Date), N'16', N'Äidinkieli ja kirjallisuus, suomi viittomakielisille', N'modersmål och litteratur, finska för dem som talar teckenspråk', N'mother tongue and literature, Finnish for speakers of sign language', N'1024', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2015-05-12' AS Date), N'17', N'Äidinkieli ja kirjallisuus, ruotsi viittomakielisille', N'modersmål och litteratur, svenska för dem som talar teckenspråk', N'mother tongue and literature, Swedish for speakers of sign language', N'1025', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2015-05-12' AS Date), N'20', N'Saame vieraana kielenä', N'samiska som främmande språk', N'Sámi as a foreign language', N'1028', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (21, CAST(N'2015-05-12' AS Date), N'21', N'Englanti', N'engelska', N'english', N'1029', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (22, CAST(N'2015-05-12' AS Date), N'22', N'Saksa', N'tyska', N'german', N'1030', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (23, CAST(N'2015-05-12' AS Date), N'23', N'Ranska', N'franska', N'french', N'1031', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (24, CAST(N'2015-05-12' AS Date), N'24', N'Venäjä', N'ryska', N'russian', N'1032', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (25, CAST(N'2015-05-12' AS Date), N'25', N'Espanja', N'spanska', N'spanish', N'1033', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2015-05-12' AS Date), N'18', N'Toinen kotimainen kieli ruotsi (suomenkielinen opetus)', N'andra inhemska språket svenska (undervisning på finska)', N'second national language Swedish (teaching in Finnish)', N'1026', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2015-05-12' AS Date), N'19', N'Toinen kotimainen kieli suomi (ruotsinkielinen opetus)', N'andra inhemska språket finska (undervisning på svenska)', N'second national language Finnish (teaching in Swedish)', N'1027', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (26, CAST(N'2015-05-12' AS Date), N'26', N'Italia', N'italienska', N'italian', N'1034', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (27, CAST(N'2015-05-12' AS Date), N'27', N'Latina', N'latin', N'latin', N'1035', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (28, CAST(N'2015-05-12' AS Date), N'28', N'Muu kieli', N'annat språk', N'other language', N'1036', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (29, CAST(N'2015-05-12' AS Date), N'29', N'Matematiikka', N'matematik', N'mathematics', N'1037', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (30, CAST(N'2015-05-12' AS Date), N'30', N'Fysiikka', N'fysik', N'physics', N'1038', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (31, CAST(N'2015-05-12' AS Date), N'31', N'Kemia', N'kemi', N'chemistry', N'1039', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (32, CAST(N'2015-05-12' AS Date), N'32', N'Maantieto tai maantiede', N'geografi ', N'geography ', N'1040', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (33, CAST(N'2015-05-12' AS Date), N'33', N'Biologia', N'biologi', N'biology', N'1041', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (34, CAST(N'2015-05-12' AS Date), N'34', N'Ympäristö- ja luonnontieteet', N'miljö- och naturvetenskaper', N'environment and nature studies', N'1042', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (35, CAST(N'2015-05-12' AS Date), N'35', N'Uskonto, evankelis-luterilainen', N'religion, evangelisk-luthersk', N'religion, Evangelical-Lutheran', N'1043', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (36, CAST(N'2015-05-12' AS Date), N'36', N'Uskonto, ortodoksinen', N'religion, ortodox', N'religion, Orthodox', N'1044', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (37, CAST(N'2015-05-12' AS Date), N'37', N'Muut uskonnot', N'övriga religioner', N'other religions', N'1045', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (38, CAST(N'2015-05-12' AS Date), N'38', N'Pienryhmäinen muun kuin ev.-lut. tai ortodoksisen uskonnon opettaja', N'religion, annan än evangelisk-luthersk eller ortodox (undervisning i smågrupp)
', N'religion, other than Evangelical-Lutheran or Orthodox (small-group teaching)
', N'1046', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (39, CAST(N'2015-05-12' AS Date), N'39', N'Elämänkatsomustieto', N'livsåskådningskunskap', N'ethics', N'1047', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (40, CAST(N'2015-05-12' AS Date), N'40', N'Historia', N'historia', N'history', N'1048', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (41, CAST(N'2015-05-12' AS Date), N'41', N'Yhteiskuntaoppi', N'samhällskunskap', N'social studies', N'1049', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (42, CAST(N'2015-05-12' AS Date), N'42', N'Oppilaanohjaus', N'elevhandledning', N'guidance counselling', N'1050', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (43, CAST(N'2015-05-12' AS Date), N'43', N'Opinto-ohjaus', N'studiehandledning', N'careers advise', N'1051', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (44, CAST(N'2015-05-12' AS Date), N'44', N'Osa-aikainen erityisopetus', N'specialundervisning på deltid', N'part-time special needs education', N'1052', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (45, CAST(N'2015-05-12' AS Date), N'45', N'Musiikki', N'musik', N'music', N'1053', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (46, CAST(N'2015-05-12' AS Date), N'46', N'Kuvataide', N'bildkonst', N'visual arts', N'1054', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (47, CAST(N'2015-05-12' AS Date), N'47', N'Liikunta', N'gymnastik och idrott', N'physical education', N'1055', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (48, CAST(N'2015-05-12' AS Date), N'48', N'Terveystieto', N'hälsokunskap', N'health education', N'1056', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (49, CAST(N'2015-05-12' AS Date), N'49', N'Käsityö (tekstiilityö)', N'handarbete (textilarbete)', N'crafts (textiles)', N'1057', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (50, CAST(N'2015-05-12' AS Date), N'50', N'Käsityö (tekninen työ)', N'handarbete (tekniskt arbete)', N'crafts (technical)', N'1058', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (51, CAST(N'2015-05-12' AS Date), N'51', N'Käsityö', N'handarbete', N'crafts', N'1059', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (52, CAST(N'2015-05-12' AS Date), N'52', N'Kotitalous', N'hushållslära', N'home economics', N'1060', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (53, CAST(N'2015-05-12' AS Date), N'53', N'Filosofia', N'filosofi', N'philosophy', N'1061', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (54, CAST(N'2015-05-12' AS Date), N'54', N'Psykologia', N'psykologi', N'psychology', N'1062', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (55, CAST(N'2015-05-12' AS Date), N'55', N'Tietotekniikka', N'IT', N'information technology', N'1063', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (56, CAST(N'2015-05-12' AS Date), N'56', N'Maa- ja metsätalous, puutarhanhoito', N'jord- och skogsbruk, trädgårdsskötsel', N'agriculture and forestry, horticulture', N'1064', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (57, CAST(N'2015-05-12' AS Date), N'57', N'Kaupalliset aineet ja konekirjoitus', N'kommersiella ämnen och maskinskrivning', N'business subjects and typing', N'1065', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (58, CAST(N'2015-05-12' AS Date), N'58', N'Muut', N'annan', N'other', N'1066', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (59, CAST(N'2015-05-12' AS Date), N'99', N'Tuntematon', N'okänd', N'unknown', N'1067', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-12' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-12' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-12' AS Date), N'01', N'*Ei opetusta*', N'ingen undervisning', N'no teaching', N'1000', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-12' AS Date), N'02', N'Esiopetus', N'förskoleundervisning', N'pre-primary education', N'1010', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-12' AS Date), N'03', N'Luokanopetus', N'klassundervisning', N'class teaching', N'1011', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-12' AS Date), N'04', N'Luokkamuotoinen erityisopetus', N'specialundervisning i klass', N'special needs class education', N'1012', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-12' AS Date), N'05', N'Maahanmuuttajien perusopetukseen valmistava opetus', N'förberedenade undervisning för invandrarnas grundläggande utbildning', N'preparatory teaching for basic education for migrants', N'1013', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-12' AS Date), N'06', N'Äidinkieli ja kirjallisuus, suomi äidinkielenä', N'modersmål och litteratur, finska som modersmål', N'mother tongue and literature, Finnish as mother tongue', N'1014', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-12' AS Date), N'07', N'Äidinkieli ja kirjallisuus, ruotsi äidinkielenä', N'modersmål och litteratur, svenska som modersmål', N'mother tongue and literature, Swedish as mother tongue', N'1015', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-05-12' AS Date), N'08', N'Äidinkieli ja kirjallisuus, saame äidinkielenä', N'modersmål och litteratur, samiska som modersmål', N'mother tongue and literature, Sámi as mother tongue', N'1016', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2015-05-12' AS Date), N'09', N'Äidinkieli ja kirjallisuus, romani äidinkielenä', N'modersmål och litteratur, romerska som modersmål', N'mother tongue and literature, Roma as mother tongue', N'1017', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2015-05-12' AS Date), N'10', N'Äidinkieli ja kirjallisuus, viittomakieli äidinkielenä', N'modersmål och litteratur, teckenspråk som modersmål', N'mother tongue and literature, sign language as mother tongue', N'1018', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2015-05-12' AS Date), N'11', N'Äidinkieli ja kirjallisuus, muu oppilaan äidinkieli', N'modersmål och litteratur, eleven har annat modersmål ', N'mother tongue and literature, other mother tongue ', N'1019', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2015-05-12' AS Date), N'12', N'Maahanmuuttajien oma äidinkieli', N'invandrarnas eget modersmål', N'migrant mother tongue', N'1020', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2015-05-12' AS Date), N'13', N'Äidinkieli ja kirjallisuus, suomi toisena kielenä', N'modersmål och litteratur, finska som andra språk', N'mother tongue and literature, Finnish as a second language', N'1021', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2015-05-12' AS Date), N'14', N'Äidinkieli ja kirjallisuus, ruotsi toisena kielenä', N'modersmål och litteratur, svenska som andra språk', N'mother tongue and literature, Swedish as a second language', N'1022', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2015-05-12' AS Date), N'15', N'Äidinkieli ja kirjallisuus, suomi saamenkielisille', N'modersmål och litteratur, finska för dem som talar samiska', N'mother tongue and literature, Finnish for speakers of Sámi', N'1023', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2015-05-12' AS Date), N'16', N'Äidinkieli ja kirjallisuus, suomi viittomakielisille', N'modersmål och litteratur, finska för dem som talar teckenspråk', N'mother tongue and literature, Finnish for speakers of sign language', N'1024', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2015-05-12' AS Date), N'17', N'Äidinkieli ja kirjallisuus, ruotsi viittomakielisille', N'modersmål och litteratur, svenska för dem som talar teckenspråk', N'mother tongue and literature, Swedish for speakers of sign language', N'1025', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2015-05-12' AS Date), N'20', N'Saame vieraana kielenä', N'samiska som främmande språk', N'Sámi as a foreign language', N'1028', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (21, CAST(N'2015-05-12' AS Date), N'21', N'Englanti', N'engelska', N'english', N'1029', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (22, CAST(N'2015-05-12' AS Date), N'22', N'Saksa', N'tyska', N'german', N'1030', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (23, CAST(N'2015-05-12' AS Date), N'23', N'Ranska', N'franska', N'french', N'1031', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (24, CAST(N'2015-05-12' AS Date), N'24', N'Venäjä', N'ryska', N'russian', N'1032', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (25, CAST(N'2015-05-12' AS Date), N'25', N'Espanja', N'spanska', N'spanish', N'1033', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2015-05-12' AS Date), N'18', N'Toinen kotimainen kieli ruotsi (suomenkielinen opetus)', N'andra inhemska språket svenska (undervisning på finska)', N'second national language Swedish (teaching in Finnish)', N'1026', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2015-05-12' AS Date), N'19', N'Toinen kotimainen kieli suomi (ruotsinkielinen opetus)', N'andra inhemska språket finska (undervisning på svenska)', N'second national language Finnish (teaching in Swedish)', N'1027', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (26, CAST(N'2015-05-12' AS Date), N'26', N'Italia', N'italienska', N'italian', N'1034', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (27, CAST(N'2015-05-12' AS Date), N'27', N'Latina', N'latin', N'latin', N'1035', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (28, CAST(N'2015-05-12' AS Date), N'28', N'Muu kieli', N'annat språk', N'other language', N'1036', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (29, CAST(N'2015-05-12' AS Date), N'29', N'Matematiikka', N'matematik', N'mathematics', N'1037', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (30, CAST(N'2015-05-12' AS Date), N'30', N'Fysiikka', N'fysik', N'physics', N'1038', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (31, CAST(N'2015-05-12' AS Date), N'31', N'Kemia', N'kemi', N'chemistry', N'1039', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (32, CAST(N'2015-05-12' AS Date), N'32', N'Maantieto tai maantiede', N'geografi ', N'geography ', N'1040', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (33, CAST(N'2015-05-12' AS Date), N'33', N'Biologia', N'biologi', N'biology', N'1041', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (34, CAST(N'2015-05-12' AS Date), N'34', N'Ympäristö- ja luonnontieteet', N'miljö- och naturvetenskaper', N'environment and nature studies', N'1042', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (35, CAST(N'2015-05-12' AS Date), N'35', N'Uskonto, evankelis-luterilainen', N'religion, evangelisk-luthersk', N'religion, Evangelical-Lutheran', N'1043', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (36, CAST(N'2015-05-12' AS Date), N'36', N'Uskonto, ortodoksinen', N'religion, ortodox', N'religion, Orthodox', N'1044', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (37, CAST(N'2015-05-12' AS Date), N'37', N'Muut uskonnot', N'övriga religioner', N'other religions', N'1045', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (38, CAST(N'2015-05-12' AS Date), N'38', N'Pienryhmäinen muun kuin ev.-lut. tai ortodoksisen uskonnon opettaja', N'religion, annan än evangelisk-luthersk eller ortodox (undervisning i smågrupp)
', N'religion, other than Evangelical-Lutheran or Orthodox (small-group teaching)
', N'1046', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (39, CAST(N'2015-05-12' AS Date), N'39', N'Elämänkatsomustieto', N'livsåskådningskunskap', N'ethics', N'1047', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (40, CAST(N'2015-05-12' AS Date), N'40', N'Historia', N'historia', N'history', N'1048', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (41, CAST(N'2015-05-12' AS Date), N'41', N'Yhteiskuntaoppi', N'samhällskunskap', N'social studies', N'1049', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (42, CAST(N'2015-05-12' AS Date), N'42', N'Oppilaanohjaus', N'elevhandledning', N'guidance counselling', N'1050', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (43, CAST(N'2015-05-12' AS Date), N'43', N'Opinto-ohjaus', N'studiehandledning', N'careers advise', N'1051', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (44, CAST(N'2015-05-12' AS Date), N'44', N'Osa-aikainen erityisopetus', N'specialundervisning på deltid', N'part-time special needs education', N'1052', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (45, CAST(N'2015-05-12' AS Date), N'45', N'Musiikki', N'musik', N'music', N'1053', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (46, CAST(N'2015-05-12' AS Date), N'46', N'Kuvataide', N'bildkonst', N'visual arts', N'1054', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (47, CAST(N'2015-05-12' AS Date), N'47', N'Liikunta', N'gymnastik och idrott', N'physical education', N'1055', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (48, CAST(N'2015-05-12' AS Date), N'48', N'Terveystieto', N'hälsokunskap', N'health education', N'1056', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (49, CAST(N'2015-05-12' AS Date), N'49', N'Käsityö (tekstiilityö)', N'handarbete (textilarbete)', N'crafts (textiles)', N'1057', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (50, CAST(N'2015-05-12' AS Date), N'50', N'Käsityö (tekninen työ)', N'handarbete (tekniskt arbete)', N'crafts (technical)', N'1058', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (51, CAST(N'2015-05-12' AS Date), N'51', N'Käsityö', N'handarbete', N'crafts', N'1059', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (52, CAST(N'2015-05-12' AS Date), N'52', N'Kotitalous', N'hushållslära', N'home economics', N'1060', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (53, CAST(N'2015-05-12' AS Date), N'53', N'Filosofia', N'filosofi', N'philosophy', N'1061', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (54, CAST(N'2015-05-12' AS Date), N'56', N'Psykologia', N'psykologi', N'psychology', N'1062', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (55, CAST(N'2015-05-12' AS Date), N'57', N'Tietotekniikka', N'IT', N'information technology', N'1063', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (56, CAST(N'2015-05-12' AS Date), N'58', N'Maa- ja metsätalous, puutarhanhoito', N'jord- och skogsbruk, trädgårdsskötsel', N'agriculture and forestry, horticulture', N'1064', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (57, CAST(N'2015-05-12' AS Date), N'54', N'Kaupalliset aineet ja konekirjoitus', N'kommersiella ämnen och maskinskrivning', N'business subjects and typing', N'1065', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (58, CAST(N'2015-05-12' AS Date), N'55', N'Muut', N'annan', N'other', N'1066', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[opettajat_aine_2016_lukio] ([id], [luotu], [aine_koodi], [aine], [aine_SV], [aine_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (59, CAST(N'2015-05-12' AS Date), N'99', N'Tuntematon', N'okänd', N'unknown', N'1067', N'E         ', N' ', N'Tilastokeskus', N'CSC Anssi')
GO

USE [ANTERO]