USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[amm_sopimusjaksot]    Script Date: 6.8.2021 11:16:41 ******/
DROP TABLE IF EXISTS [dbo].[amm_sopimusjaksot]
GO
/****** Object:  Table [dbo].[amm_sopimusjaksot]    Script Date: 6.8.2021 11:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amm_sopimusjaksot](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koodi] [int] NULL,
	[selite_fi] [nvarchar](250) NULL,
	[selite_sv] [nvarchar](250) NULL,
	[selite_en] [nvarchar](250) NULL,
	[jarjestys_koodi] [int] NULL,
	[virhetilanne] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-08-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-12-31' AS Date), -2, N'Virhetilanne', N'Feltillstånd', N'Error occured', 9999, N'K', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-08-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-12-31' AS Date), -1, N'Tuntematon', N'Information saknas', N'Missing data', 9998, N'K', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-08-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'2018-12-31' AS Date), 1, N'Oppilaitosmuotoinen koulutus', N'Institututbildning', N'Institute-based education', 1, N'E', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-08-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'2018-12-31' AS Date), 2, N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', 2, N'E', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-08-05' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-12-31' AS Date), 3, N'Ei sis. koulutus- eikä oppisopimusjaksoja', N'Omfattar inte utbildningsavtals- eller läroavtalsperioder', N'No training agreement or apprenticeship training periods included', 3, N'E', N'OKM/OPH', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-08-05' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-12-31' AS Date), 4, N'Sis. koulutussopimusjaksoja', N'Omfattar utbildningsavtalsperioder', N'Training agreement periods included', 4, N'E', N'OKM/OPH', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-08-05' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-12-31' AS Date), 5, N'Sis. oppisopimusjaksoja', N'Omfattar läroavtalsperioder', N'Apprenticeship training periods included', 5, N'E', N'OKM/OPH', N'CSC Juha')
GO
INSERT [dbo].[amm_sopimusjaksot] ([id], [luotu], [alkaa], [paattyy], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [virhetilanne], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-08-05' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-12-31' AS Date), 6, N'Sis. koulutus- sekä oppisopimusjaksoja', N'Omfattar utbildningsavtals- samt läroavtalsperioder', N'Training agreement and apprenticeship training periods included', 6, N'E', N'OKM/OPH', N'CSC Juha')
GO
