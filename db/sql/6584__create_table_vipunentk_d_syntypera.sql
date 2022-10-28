USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_syntypera]    Script Date: 28.10.2022 23:52:35 ******/
DROP TABLE IF EXISTS [dbo].[d_syntypera]
GO

/****** Object:  Table [dbo].[d_syntypera]    Script Date: 28.10.2022 23:52:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_syntypera](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[syntypera_koodi] [nvarchar](2) NULL,
	[syntypera] [nvarchar](50) NULL,
	[syntypera_SV] [nvarchar](50) NULL,
	[syntypera_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_syntypera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Felsituation', N'Error', N'99', N'K', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänt', N'Unknown', N'98', N'K', N'0', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'Suomalaistaustainen, syntynyt Suomessa', N'Finska bakgrund, född i Finland', N'Finnish background, born in Finland', N'11', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'Suomalaistaustainen, syntynyt ulkomailla', N'Finska bakgrund, född utomlands', N'Finnish background, born abroad', N'12', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Ulkomaalaistaustainen, syntynyt Suomessa', N'Utländsk bakgrund, född i Finland', N'Foreign background, born in Finland', N'21', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2022-05-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Ulkomaalaistaustainen, syntynyt ulkomailla', N'Utländsk bakgrund, född utomlands', N'Foreign background, born abroad', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_syntypera] ([id], [luotu], [alkaa], [paattyy], [syntypera_koodi], [syntypera], [syntypera_SV], [syntypera_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2022-10-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'99', N'Tuntematon', N'Okänt', N'Unknown', N'98', N'K', N'0', N'Tilastokeskus', N'CSC Juha')
GO

ALTER TABLE [dbo].[d_syntypera] ADD  CONSTRAINT [DF__d_syntypera__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_syntypera] ADD  CONSTRAINT [DF__d_syntypera__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_syntypera] ADD  CONSTRAINT [DF__d_syntypera__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
