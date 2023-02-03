USE [VipunenTK_lisatiedot]
GO


/****** Object:  Table [dbo].[tutkinto]    Script Date: 29.9.2022 23:36:44 ******/
DROP TABLE [dbo].[tutkinto]
GO
/****** Object:  Table [dbo].[tutkinnon_tavoite]    Script Date: 29.9.2022 23:36:44 ******/
DROP TABLE [dbo].[tutkinnon_tavoite]
GO

/****** Object:  Table [dbo].[tutkinnon_tavoite]    Script Date: 29.9.2022 23:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tutkinnon_tavoite](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinnon_tavoite_koodi] [nvarchar](2) NULL,
	[tutkinnon_tavoite] [nvarchar](50) NULL,
	[tutkinnon_tavoite_SV] [nvarchar](50) NULL,
	[tutkinnon_tavoite_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tutkinto]    Script Date: 29.9.2022 23:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tutkinto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_avain] [nvarchar](10) NULL,
	[tutkinto] [nvarchar](250) NULL,
	[tutkinto_SV] [nvarchar](250) NULL,
	[tutkinto_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

INSERT [dbo].[tutkinnon_tavoite] ([id], [luotu], [alkaa], [paattyy], [tutkinnon_tavoite_koodi], [tutkinnon_tavoite], [tutkinnon_tavoite_SV], [tutkinnon_tavoite_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (56, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Koko tutkinnon suorittaminen', N'Avläggande av hela examen', N'Completing the qualification in full', N'01', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkinnon_tavoite] ([id], [luotu], [alkaa], [paattyy], [tutkinnon_tavoite_koodi], [tutkinnon_tavoite], [tutkinnon_tavoite_SV], [tutkinnon_tavoite_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (58, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Tutkinnon osan tai osien suorittaminen', N'Avläggande av en del eller delar av examen', N'Completing module(s) of the qualification', N'02', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkinnon_tavoite] ([id], [luotu], [alkaa], [paattyy], [tutkinnon_tavoite_koodi], [tutkinnon_tavoite], [tutkinnon_tavoite_SV], [tutkinnon_tavoite_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (60, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9', N'Ei tietoa', N'Information saknas', N'Missing data', N'03', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[tutkinnon_tavoite] ([id], [luotu], [alkaa], [paattyy], [tutkinnon_tavoite_koodi], [tutkinnon_tavoite], [tutkinnon_tavoite_SV], [tutkinnon_tavoite_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[tutkinnon_tavoite] ([id], [luotu], [alkaa], [paattyy], [tutkinnon_tavoite_koodi], [tutkinnon_tavoite], [tutkinnon_tavoite_SV], [tutkinnon_tavoite_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO

INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'K', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'yo', N'Ylioppilastutkinto', N'Studentexamen', N'Matriculation examination', N'11', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'amm', N'Ammatillinen tutkinto', N'Yrkesexamen', N'Vocational qualification', N'12', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2022-11-07' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'pt', N'Ammatillinen perustutkinto', N'Yrkesinriktad grundexamen', N'Vocational upper secondary qualification', N'12b', N'E', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2022-11-07' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'ateat', N'Ammatti- tai erikoisammattitutkinto', N'Yrkes- eller specialyrkesexamen', N'Further or specialist vocational qualification', N'12c', N'E', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'amk', N'Amk-tutkinto', N'Yh-examen', N'UAS degree', N'13', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'ylamk', N'Ylempi amk-tutkinto', N'Högre yh-examen', N'UAS master''s degree', N'15', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'alkk', N'Alempi kk-tutkinto', N'Lägre högskoleexamen', N'Bachelor''s degree', N'14', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'ylkk', N'Ylempi kk-tutkinto', N'Högre högskoleexamen', N'Master''s degree', N'16', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2014-09-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'listri', N'Tutkijakoulutus', N'Forskarutbildning', N'Postgraduate education', N'17', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2014-10-02' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'ei', N'Ei tutkintoa', N'Ingen examen', N'No qualification', N'30', N'E', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[tutkinto] ([id], [luotu], [alkaa], [paattyy], [tutkinto_avain], [tutkinto], [tutkinto_SV], [tutkinto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (90, CAST(N'2022-09-29' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'eiper', N'Ei perusasteen jälkeistä tutkintoa tai tuntematon', N'Ingen examen efter den grundläggande utbildningen eller okänd', N'No degree after elementary education or unknown', N'40', N'E', N'0', N'Manuaalinen', N'CSC Juha')
GO

ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinnon_tavoite] ADD  CONSTRAINT [DF__tutkinnon_tavoite__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
