USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[koulutusmuoto]    Script Date: 5.4.2023 14:51:57 ******/
DROP TABLE [dbo].[koulutusmuoto]
GO
/****** Object:  Table [dbo].[koulutusmuoto]    Script Date: 5.4.2023 14:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (78, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'nuorten koulutus, koulujärjestelmäkoulutus (perusopetus, nuorten opetussuunnitelman mukainen lukiokoulutus, ammatillinen muu kuin näyttötutkinto, nuorten ammattikorkeakoulukoulutus, yliopistokoulutus), sisältää myös sotilasalan tutkinnot ja ulkomailla suoritetut tutkinnot.', N'utbildning för unga, utbildning inom skolsystemet (grundläggande utbildning, gymnasieutbildning för unga enligt läroplanen, annan yrkesexamen än fristående examen, yrkeshögskoleutbildning för unga, universitetsutbildning), omfattar även examina inom det militära området och examina avlagda utomlands.', N'youth education, education under the education system (basic education, general upper secondary education following the curriculum for young people, vocational other than competence-based qualification, polytechnic education for young people, university education), includes armed forces qualifications and qualifications attained abroad.', N'01', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (80, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'työllisyyskurssikoulutus v. 1990 asti', N'utbildning i form av sysselsättningskurs fram till 1990', N'education and training promoting employment until 1990', N'02', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (82, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'muut kuin näyttötutkinnot; lukiokoulutuksen aikuiskoulutukset v. 1985 alkaen YTL-aineiston pohjalta vuoteen 2005 saakka. Senjälkeen tieto on poimittu opiskelija-aineiston aikuisten opetussuunnitelma tiedosta. Ammattikorkeakoulun aikuiskoulutukset v.1994 alkaen, ylemmät ammattikorkeakoulututkinnot v. 2003 alkaen', N'andra än fristående examina; gymnasieutbildningens vuxenutbildningar utifrån SEN-materialet från 1985 fram till 2005. Därefter har uppgifterna hämtats från uppgifterna i studerandematerialet i läroplanen för vuxna. Yrkeshögskolans vuxenutbildningar från och med 1994, högre yrkeshögskoleexamina från och med 2003', N'other than competence-based qualifications; adult general upper secondary education from 1985 based on the Matriculation Examination Board data until 2005. Subsequent data has been collected from the student data for the curriculum for adults. Polytechnic adult education from 1994, polytechnic Master’s degrees from 2003', N'03', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (83, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8', N'kaikki näyttötutkintona suoritetut tutkinnot (ammatilliset perustutkinnot, ammatti- ja erikoisammattitutkinnot)', N'samtliga examina avlagda som fristående examina (grundläggande yrkesexamina, yrkes- och specialyrkesexamina)', N'all competence-based qualifications (vocational upper secondary qualifications, further and specialist vocational qualifications)', N'08', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (84, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9', N'aikuiskoulutuksen jatkolinja v. 1990 asti', N'påbyggnadslinje inom vuxenutbildningen fram till 1990', N'further adult education until 1990', N'09', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutusmuoto] ([id], [luotu], [alkaa], [paattyy], [koulutusmuoto_koodi], [koulutusmuoto], [koulutusmuoto_SV], [koulutusmuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[koulutusmuoto] ADD  CONSTRAINT [DF__koulutusmuoto__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
