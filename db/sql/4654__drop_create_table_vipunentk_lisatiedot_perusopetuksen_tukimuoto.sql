USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[perusopetuksen_tukimuoto]    Script Date: 6.7.2021 20:42:12 ******/
DROP TABLE [dbo].[perusopetuksen_tukimuoto]
GO
/****** Object:  Table [dbo].[perusopetuksen_tukimuoto]    Script Date: 6.7.2021 20:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perusopetuksen_tukimuoto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_tukimuoto_koodi] [nchar](10) NULL,
	[perusopetuksen_tukimuoto] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_SV] [nvarchar](50) NULL,
	[perusopetuksen_tukimuoto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-12-01' AS Date), N'-1        ', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-12-01' AS Date), N'-2        ', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-12-01' AS Date), N'tuki_tuki ', N'Tukiopetus', N'Stödundervisning', N'Remedial teaching', N'1000', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-12-01' AS Date), N'tuki_osa  ', N'Osa-aikainen erityisopetus', N'Specialundervisning på deltid', N'Part-time special needs education', N'1010', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-12-01' AS Date), N'tuki_avu  ', N'Avustaja- ja/tai tulkitsemispalvelut', N'Biträdes- och/eller tolkningstjänster', N'Assistant or interpreting services', N'1020', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-12-01' AS Date), N'tuki_muu  ', N'Muut tukimuodot', N'Övriga stödformer', N'Other support forms', N'1030', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-12-01' AS Date), N'tuki_ei   ', N'Ei tukea', N'Inget stöd', N'No support', N'1040', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-07-06' AS Date), N'tuki_avus ', N'Avustajapalvelut', N'Biträdestjänster', N'Assistant services', N'1021', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-07-06' AS Date), N'tuki_tulk ', N'Tulkitsemispalvelut', N'Tolkningstjänster', N'Interpreting services', N'1022', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[perusopetuksen_tukimuoto] ([id], [luotu], [perusopetuksen_tukimuoto_koodi], [perusopetuksen_tukimuoto], [perusopetuksen_tukimuoto_SV], [perusopetuksen_tukimuoto_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-07-06' AS Date), N'tuki_apuv ', N'Erityiset apuvälineet', N'Särskilda hjälpmedel', N'Special aids', N'1025', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
