USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[hyvinvointialue]    Script Date: 10.5.2023 21:24:28 ******/
DROP TABLE IF EXISTS [dbo].[hyvinvointialue]
GO

/****** Object:  Table [dbo].[hyvinvointialue]    Script Date: 10.5.2023 21:24:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hyvinvointialue](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[hyvinvointialue_koodi] [nvarchar](10) NULL,
	[hyvinvointialue] [nvarchar](250) NULL,
	[hyvinvointialue_SV] [nvarchar](250) NULL,
	[hyvinvointialue_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'98', N'K', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'99', N'K', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Itä-Uudenmaan hyvinvointialue', N'Östra Nylands välfärdsområde', N'East Uusimaa wellbeing services county', N'01', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Keski-Uudenmaan hyvinvointialue', N'Mellersta Nylands välfärdsområde', N'Central Uusimaa wellbeing services county', N'02', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Länsi-Uudenmaan hyvinvointialue', N'Västra Nylands välfärdsområde', N'West Uusimaa wellbeing services county', N'03', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Vantaan ja Keravan hyvinvointialue', N'Vanda och Kervo välfärdsområde', N'Vantaa and Kerava wellbeing services county', N'04', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Varsinais-Suomen hyvinvointialue', N'Egentliga Finlands välfärdsområde', N'Southwest Finland wellbeing services county', N'05', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'06', N'Satakunnan hyvinvointialue', N'Satakunta välfärdsområde', N'Satakunta wellbeing services county', N'06', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'07', N'Kanta-Hämeen hyvinvointialue', N'Egentliga Tavastlands välfärdsområde', N'Kanta-Häme wellbeing services county', N'07', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Pirkanmaan hyvinvointialue', N'Birkalands välfärdsområde', N'Pirkanmaa wellbeing services county', N'08', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Päijät-Hämeen hyvinvointialue', N'Päijänne-Tavastlands välfärdsområde', N'Päijät-Häme wellbeing services county', N'09', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Kymenlaakson hyvinvointialue', N'Kymmenedalens välfärdsområde', N'Kymenlaakso wellbeing services county', N'10', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'Etelä-Karjalan hyvinvointialue', N'Södra Karelens välfärdsområde', N'South Karelia wellbeing services county', N'11', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'Etelä-Savon hyvinvointialue', N'Södra Savolax välfärdsområde', N'South Savo wellbeing services county', N'12', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13', N'Pohjois-Savon hyvinvointialue', N'Norra Savolax välfärdsområde', N'North Savo wellbeing services county', N'13', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14', N'Pohjois-Karjalan hyvinvointialue', N'Norra Karelens välfärdsområde', N'North Karelia wellbeing services county', N'14', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'15', N'Keski-Suomen hyvinvointialue', N'Mellersta Finlands välfärdsområde', N'Central Finland wellbeing services county', N'15', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'16', N'Etelä-Pohjanmaan hyvinvointialue', N'Södra Österbottens välfärdsområde', N'South Ostrobothnia wellbeing services county', N'16', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'17', N'Pohjanmaan hyvinvointialue', N'Österbottens välfärdsområde', N'Ostrobothnia wellbeing services county', N'17', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'18', N'Keski-Pohjanmaan hyvinvointialue', N'Mellersta Österbottens välfärdsområde', N'Central Ostrobothnia wellbeing services county', N'18', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'19', N'Pohjois-Pohjanmaan hyvinvointialue', N'Norra Österbottens välfärdsområde', N'North Ostrobothnia wellbeing services county', N'19', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'20', N'Kainuun hyvinvointialue', N'Kajanalands välfärdsområde', N'Kainuu wellbeing services county', N'20', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (21, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Lapin hyvinvointialue', N'Lapplands välfärdsområde', N'Lapland wellbeing services county', N'21', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (22, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'90', N'Helsingin kaupunki', N'Helsingfors stad', N'City of Helsinki', N'90', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[hyvinvointialue] ([id], [luotu], [alkaa], [paattyy], [hyvinvointialue_koodi], [hyvinvointialue], [hyvinvointialue_SV], [hyvinvointialue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (23, CAST(N'2023-05-10' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'91', N'Ahvenanmaa', N'Åland', N'Åland', N'91', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO

ALTER TABLE [dbo].[hyvinvointialue] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[hyvinvointialue] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[hyvinvointialue] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
