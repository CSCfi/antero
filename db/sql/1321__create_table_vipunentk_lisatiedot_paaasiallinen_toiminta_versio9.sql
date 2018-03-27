USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_versio9]    Script Date: 9.3.2018 8:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_versio9]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_versio9](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_versio9_koodi] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio9] [nvarchar](150) NULL,
	[paaasiallinen_toiminta_versio9_SV] [nvarchar](150) NULL,
	[paaasiallinen_toiminta_versio9_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'98', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'999', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'Työllinen', N'Sysselsatt', N'Employed', N'01', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'Työtön', N'Arbetslös', N'Unemployed', N'02', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Opiskelija, koululainen', N'Studerande, skolelev', N'Student, schoolchild', N'03', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'30', N'Muut
(sisältää
eläkeläiset,
varusmiehet/siviilipalvelusmiehet
ja
muut 
työvoiman
ulkopuoliset)', N'Övriga (inkl. pensionärer, beväringar/civiltjänstgörande och andra utanför arbertskraften)', N'Others (incl. pensioners, conscripts/conscientious objectors and others outside the labour force)', N'04', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio9] ([id], [luotu], [alkaa], [paattyy], [paaasiallinen_toiminta_versio9_koodi], [paaasiallinen_toiminta_versio9], [paaasiallinen_toiminta_versio9_SV], [paaasiallinen_toiminta_versio9_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2018-03-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'99', N'Tuntematon', N'Okänd', N'Unknown', N'99', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
USE [ANTERO]