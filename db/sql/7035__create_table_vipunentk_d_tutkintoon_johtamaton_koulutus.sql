USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_tutkintoon_johtamaton_koulutus]    Script Date: 5.10.2022 22:10:29 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintoon_johtamaton_koulutus]
GO

/****** Object:  Table [dbo].[d_tutkintoon_johtamaton_koulutus]    Script Date: 5.10.2022 22:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_tutkintoon_johtamaton_koulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintoon_johtamaton_koulutus_koodi] [nvarchar](2) NULL,
	[tutkintoon_johtamaton_koulutus] [nvarchar](50) NULL,
	[tutkintoon_johtamaton_koulutus_SV] [nvarchar](50) NULL,
	[tutkintoon_johtamaton_koulutus_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_tutkintoon_johtamaton_koulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Muu ammatillinen koulutus', N'Övrig yrkesinriktad utbildning', N'Other vocational education', N'08', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Tutkinnon osaa pienempi kokonaisuus', N'En mindre helhet som än en del av examen', N'A module smaller than qualification unit', N'09', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Täydennyskoulutus', N'Fortbildning', N'Continuing education', N'10', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13', N'Avoimen opinnot', N'Öppna studier', N'Open studies', N'13', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14', N'Opettajan pedagogiset opinnot', N'Pedagogiska studier för lärare', N'Teacher''s pedagogical studies', N'14', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'15', N'Ammatillinen opettajakoulutus', N'Yrkesinriktad lärarutbildning', N'Vocational teacher education', N'15', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'17', N'Valmentava koulutus', N'Handledande utbildning', N'Preparatory education', N'17', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'18', N'Erillisoikeus', N'Särskild studierätt', N'Separate study right', N'18', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_tutkintoon_johtamaton_koulutus] ([id], [luotu], [alkaa], [paattyy], [tutkintoon_johtamaton_koulutus_koodi], [tutkintoon_johtamaton_koulutus], [tutkintoon_johtamaton_koulutus_SV], [tutkintoon_johtamaton_koulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2022-10-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'19', N'Erikoistumiskoulutus', N'Specialiseringsutbildning', N'Specialisation studies', N'19', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
ALTER TABLE [dbo].[d_tutkintoon_johtamaton_koulutus] ADD  CONSTRAINT [DF__d_tutkintoon_johtamaton_koulutus__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkintoon_johtamaton_koulutus] ADD  CONSTRAINT [DF__d_tutkintoon_johtamaton_koulutus__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkintoon_johtamaton_koulutus] ADD  CONSTRAINT [DF__d_tutkintoon_johtamaton_koulutus__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
