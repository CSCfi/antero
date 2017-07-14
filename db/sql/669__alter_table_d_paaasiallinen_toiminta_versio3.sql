USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_versio3]    Script Date: 14.7.2017 14:58:09 ******/
DROP TABLE IF EXISTS [dbo].[paaasiallinen_toiminta_versio3]
GO
/****** Object:  Table [dbo].[paaasiallinen_toiminta_versio3]    Script Date: 14.7.2017 14:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paaasiallinen_toiminta_versio3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paaasiallinen_toiminta_versio3](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[paaasiallinen_toiminta_versio3_avain] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_SV] [nvarchar](50) NULL,
	[paaasiallinen_toiminta_versio3_TTHV_EN] [nvarchar](50) NULL,
	[jarjestys_paaasiallinen_toiminta_versio3_TTHV] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2011-10-04' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'98', N'K', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2011-10-04' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'Tuntematon', N'Okänd', N'Unknown', N'99', N'K', N'0', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2011-09-30' AS Date), N'11', N'Työllinen', N'Sysselsatt', N'Employed', N'11', N'Työllinen', N'Sysselsatt', N'Employed', N'11', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2011-09-30' AS Date), N'12', N'Työtön', N'Arbetslös', N'Unemployed', N'12', N'Työtön', N'Arbetslös', N'Unemployed', N'12', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2011-09-30' AS Date), N'22', N'Päätoiminen opiskelija, koululainen', N'Studerande, skolelev huvudsakligen', N'Full-time student, schoolchild', N'22', N'Työvoiman ulkopuolella', N'Utanför arbetskraften', N'Outside the labour force', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2011-09-30' AS Date), N'24', N'Eläkeläinen, pl. työttömyyseläkeläinen', N'Pensionär, exkl. arbetslöshetspensionerade', N'Pensioner, excl. unemployment pension claimants', N'24', N'Työvoiman ulkopuolella', N'Utanför arbetskraften', N'Outside the labour force', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2011-09-30' AS Date), N'25', N'Varusmies, siiviipalvelusmies', N'Beväring, civiltjänstgörande', N'Conscript, conscientious objector', N'25', N'Työvoiman ulkopuolella', N'Utanför arbetskraften', N'Outside the labour force', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2011-09-30' AS Date), N'29', N'Työttömyyseläkeläinen', N'Arbetslöshetspensionerade', N'Unemployment pension claimants', N'29', N'Työvoiman ulkopuolella', N'Utanför arbetskraften', N'Outside the labour force', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
INSERT [dbo].[paaasiallinen_toiminta_versio3] ([id], [luotu], [paaasiallinen_toiminta_versio3_avain], [paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_SV], [paaasiallinen_toiminta_versio3_EN], [jarjestys_paaasiallinen_toiminta_versio3], [paaasiallinen_toiminta_versio3_TTHV], [paaasiallinen_toiminta_versio3_TTHV_SV], [paaasiallinen_toiminta_versio3_TTHV_EN], [jarjestys_paaasiallinen_toiminta_versio3_TTHV], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2014-02-26' AS Date), N'99', N'Muu tai tuntematon', N'Annan eller okänd', N'Other or unknown', N'97', N'Työvoiman ulkopuolella', N'Utanför arbetskraften', N'Outside the labour force', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Jarmo')
GO
USE [ANTERO]