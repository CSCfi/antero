USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[tutkintoryhma] DROP CONSTRAINT [DF__tutkintoryhma__tietolahde]
GO
ALTER TABLE [dbo].[tutkintoryhma] DROP CONSTRAINT [DF__tutkintoryhma__paattyy]
GO
ALTER TABLE [dbo].[tutkintoryhma] DROP CONSTRAINT [DF__tutkintoryhma__alkaa]
GO
/****** Object:  Table [dbo].[tutkintoryhma]    Script Date: 26.7.2019 9:03:33 ******/
DROP TABLE [dbo].[tutkintoryhma]
GO
/****** Object:  Table [dbo].[tutkintoryhma]    Script Date: 26.7.2019 9:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkintoryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoryhma_koodi] [nvarchar](10) NULL,
	[tutkintoryhma] [nvarchar](100) NULL,
	[tutkintoryhma_SV] [nvarchar](100) NULL,
	[tutkintoryhma_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Peruskoulun 9.luokan päättäneet', N'Personer som gått ut klass 9 i grundskolan', N'Completed grade 9 of comprehensive school', N'01', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Ylioppilaat', N'Studenter', N'General upper secondary school graduate', N'02', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Toisen asteen ammatillisen koulutuksen suorittaneet', N'Personer som genomgått yrkesutbildning på andra stadiet', N'Upper secondary vocational education and training graduate', N'03', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2018-04-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'31', N'Ammatillisen perustutkinnon suorittaneet', N'Avlagt yrkesinriktade grundexamen', N'Vocational upper secondary qualification', N'04', N'E', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2018-04-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'32', N'Ammattitutkinnon suorittaneet', N'Avlagt yrkesexamen', N'Further vocational qualification', N'05', N'E', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[tutkintoryhma] ([id], [luotu], [alkaa], [paattyy], [tutkintoryhma_koodi], [tutkintoryhma], [tutkintoryhma_SV], [tutkintoryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2018-04-09' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'33', N'Erikoisammattitutkinnon suorittaneet', N'Avlagt specialyrkesexamen', N'Specialist vocational qualification', N'06', N'E', N'0', N'Manuaalinen', N'CSC Anssi')
GO
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkintoryhma] ADD  CONSTRAINT [DF__tutkintoryhma__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO

USE [ANTERO]
