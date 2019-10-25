USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[rahoituslahde_amm] DROP CONSTRAINT [DF__rahoituslahde_amm__tietolahde]
GO
ALTER TABLE [dbo].[rahoituslahde_amm] DROP CONSTRAINT [DF__rahoituslahde_amm__paattyy]
GO
ALTER TABLE [dbo].[rahoituslahde_amm] DROP CONSTRAINT [DF__rahoituslahde_amm__alkaa]
GO
/****** Object:  Table [dbo].[rahoituslahde_amm]    Script Date: 25.10.2019 17:28:16 ******/
DROP TABLE [dbo].[rahoituslahde_amm]
GO
/****** Object:  Table [dbo].[rahoituslahde_amm]    Script Date: 25.10.2019 17:28:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Valtionosuusrahoitteinen koulutus', N'Statsandelsfinansierad utbildning', N'Education funded by central government transfers', N'1010', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Työvoimakoulutus, ELY-keskukset ja työ- ja elinkeinotoimistot (kansallinen rahoitus)', N'Arbetskraftsutbildning, NTM-centraler och TE-byråer (nationell finansiering)', N'Labour market training, ELY Centres and TE Offices (national funding)', N'1020', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Työvoimakoulutus (ESR-rahoitteinen)', N'Arbetskraftspolitisk vuxenutbildning (ESF-finansiering)', N'Labour policy adult education and training (ESF funding)', N'1030', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Työnantajan kokonaan rahoittama', N'I sin helhet finansierad av arbetsgivaren', N'Fully financed by the employer', N'1040', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Noste -ohjelmakoulutus', N'Noste -programutbildning', N'Noste programme training', N'1050', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Muuta kautta rahoitettu (opiskelijan kokonaan itse maksama)', N'Annan finansiering (betalas i sin helhet av eleven)', N'Financed through other channels (fully paid by the student)', N'1070', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-02-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7', N'Nuorten aikuisten osaamisohjelma', N'Kompetensprogram för unga vuxna', N'Skills programme for young adults', N'1060', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2019-10-25' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8', N'Aikuisten osaamisperustan vahvistaminen', N'Stärkande av den vuxna befolkningens kompetensbas', N'Strengthening the skills base of adults', N'1080', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2019-10-25' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9', N'Maahanmuuttajien ammatillinen koulutus (valtionavustus)', N'Yrkesutbildning för invandrare (statsunderstöd)', N'Vocational education for immigrants (state aid)', N'1090', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[rahoituslahde_amm] ([id], [luotu], [alkaa], [paattyy], [rahoituslahde_amm_koodi], [rahoituslahde_amm], [rahoituslahde_amm_SV], [rahoituslahde_amm_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2019-10-25' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Työvoimakoulutus (OKM-rahoitus)', N'Arbetskraftsutbildning (UKM-finansiering)', N'Labour market training (OKM funding)', N'1100', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[rahoituslahde_amm] ADD  CONSTRAINT [DF__rahoituslahde_amm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
USE [ANTERO]
