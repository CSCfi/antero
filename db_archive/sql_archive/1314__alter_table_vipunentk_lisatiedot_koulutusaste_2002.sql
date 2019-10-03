USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[koulutusaste_2002]    Script Date: 9.3.2018 8:48:45 ******/
DROP TABLE [dbo].[koulutusaste_2002]
GO
/****** Object:  Table [dbo].[koulutusaste_2002]    Script Date: 9.3.2018 8:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (1, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'00', N'Esiaste', N'Förskolenivå', N'Pre-primary education', N'1000', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (2, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'20', N'Perusaste', N'Grundnivå', N'Basic education', N'1020', N'E', N'Manuaalinen', N'Palautettu 18.4.2016 / CSC Anssi')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (3, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', N'1021', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (4, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Lisäopetus', N'Tilläggsundervisning', N'Voluntary additional basic education', N'1022', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (6, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'31', N'Lukiokoulutus', N'Gymnasieutbildning', N'General upper secondary education', N'1031', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (7, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'32', N'Ammatillinen koulutus', N'Yrkesutbildning', N'Vocational education and training', N'1032', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (8, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'50', N'Opistoaste', N'Institutnivå', N'Post-secondary level education', N'1050', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (10, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'61', N'Ammatillinen korkea-aste', N'Yrkesinriktad lägsta högre nivå', N'Higher vocational education', N'1061', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (11, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'62', N'Ammattikorkeakoulututkinto', N'Yrkeshögskoleexamen', N'UAS degree', N'1062', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (12, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'63', N'Alempi korkeakoulutututkinto', N'Lägre högskoleexamen', N'Bachelor''s degree', N'1063', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (14, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'71', N'Ylempi ammattikorkeakoulututkinto', N'Högre yrkeshögskoleexamen', N'UAS Master''s degree', N'1071', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (15, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'72', N'Ylempi korkeakoulututkinto', N'Högre högskoleexamen', N'Master''s degree', N'1072', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (16, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'73', N'Lääkärien erikoistumiskoulutus', N'Specialiseringsutbildning för läkare', N'Specialist degree in medicine', N'1073', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (18, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'81', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'1081', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (19, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'82', N'Tohtorintutkinto', N'Doktorsexamen', N'Doctoral degree', N'1082', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (20, CAST(N'2013-11-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'90', N'Koulutusaste tuntematon', N'Utbildningsnivå okänd', N'Level of education unknown', N'1090', N'E', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (17, CAST(N'2018-03-07' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'78', N'Ylempi korkeakoulututkinto ja tutkijakoulutus', N'Högre yrkeshögskoleexamen och forskarutbildning', N'Master''s degree and doctoral education', N'1078', N'E', N'Manuaalinen', N'CSC Anssi / R4.23')
GO
INSERT [dbo].[koulutusaste_2002] ([id], [luotu], [alkaa], [paattyy], [koulutusaste_2002koodi], [koulutusaste_2002], [koulutusaste_2002_SV], [koulutusaste_2002_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (9, CAST(N'2018-03-07' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'60', N'Alempi korkeakouluaste ja ammatillinen korkea-aste', N'Lägre högskolenivå och yrkesinriktad lägsta högre nivå', N'Bachelor''s degree and higher vocational education', N'1060', N'E', N'Manuaalinen', N'CSC Anssi / R4.23')
GO
USE [ANTERO]