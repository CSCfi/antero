USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[kvopiskelija]    Script Date: 17.10.2025 16.30.08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kvopiskelija]') AND type in (N'U'))
  DROP TABLE [dbo].[kvopiskelija]
GO

CREATE TABLE [dbo].[kvopiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kvopiskelija_koodi] [nvarchar](10) NULL,
	[kvopiskelija] [nvarchar](250) NULL,
	[kvopiskelija_SV] [nvarchar](250) NULL,
	[kvopiskelija_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[kvopiskelija] ([id], [luotu], [alkaa], [paattyy], [kvopiskelija_koodi], [kvopiskelija], [kvopiskelija_SV], [kvopiskelija_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2025-10-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Mika')
INSERT [dbo].[kvopiskelija] ([id], [luotu], [alkaa], [paattyy], [kvopiskelija_koodi], [kvopiskelija], [kvopiskelija_SV], [kvopiskelija_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2025-10-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Mika')
INSERT [dbo].[kvopiskelija] ([id], [luotu], [alkaa], [paattyy], [kvopiskelija_koodi], [kvopiskelija], [kvopiskelija_SV], [kvopiskelija_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (0, CAST(N'2025-10-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'0', N'Ei kansainvälinen opiskelija', N'Icke-internationell studerande', N'Non-international student', N'1010', N'E', N' ', N'Manuaalinen', N'CSC Mika')
INSERT [dbo].[kvopiskelija] ([id], [luotu], [alkaa], [paattyy], [kvopiskelija_koodi], [kvopiskelija], [kvopiskelija_SV], [kvopiskelija_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2025-10-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Kansainvälinen opiskelija', N'Internationell studerande', N'International student', N'1020', N'E', N' ', N'Manuaalinen', N'CSC Mika')
INSERT [dbo].[kvopiskelija] ([id], [luotu], [alkaa], [paattyy], [kvopiskelija_koodi], [kvopiskelija], [kvopiskelija_SV], [kvopiskelija_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2025-10-17' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Kansalaisuus-tieto muu kuin suomi', N'Annan nationalitet än finsk', N'Nationality other than Finnish', N'1030', N'E', N' ', N'Manuaalinen', N'CSC Mika')
GO
