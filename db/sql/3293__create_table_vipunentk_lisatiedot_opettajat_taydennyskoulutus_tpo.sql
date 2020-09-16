USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:28:15 ******/
DROP TABLE IF EXISTS [dbo].[opettajat_taydennyskoulutus_tpo]
GO
/****** Object:  Table [dbo].[opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajat_taydennyskoulutus_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[osaalue_koodi] [nvarchar](3) NULL,
	[osaalue] [nvarchar](255) NULL,
	[osaalue_SV] [nvarchar](255) NULL,
	[osaalue_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Tuntematon_SV', N'Tuntematon_EN', N'1980', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Virhetilanne_SV', N'Virhetilanne_EN', N'1990', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'01', N'Erityisen tuen tarpeiset oppilaat', N'Erityisen tuen tarpeiset oppilaat_SV', N'Erityisen tuen tarpeiset oppilaat_EN', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (2, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'02', N'Ryhmänhallinta ja ryhmäpedagogiikka', N'Ryhmänhallinta ja ryhmäpedagogiikka_SV', N'Ryhmänhallinta ja ryhmäpedagogiikka_EN', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (3, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'03', N'Pedagogiset taidot', N'Pedagogiset taidot_SV', N'Pedagogiset taidot_EN', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (4, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'04', N'Tietotekniikan ja digitaalisuuden hyödyntäminen', N'Tietotekniikan ja digitaalisuuden hyödyntäminen_SV', N'Tietotekniikan ja digitaalisuuden hyödyntäminen_EN', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (5, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'05', N'Arviointi', N'Arviointi_SV', N'Arviointi_EN', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (6, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'06', N'Aineenhallinta opetusaineessa', N'Aineenhallinta opetusaineessa_SV', N'Aineenhallinta opetusaineessa_EN', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (7, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'07', N'Vuorovaikutustaidot', N'Vuorovaikutustaidot_SV', N'Vuorovaikutustaidot_EN', N'1070', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (8, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'08', N'Oman työn organisointi', N'Oman työn organisointi_SV', N'Oman työn organisointi_EN', N'1080', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (9, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'09', N'Muu', N'Muu_SV', N'Muu_EN', N'1090', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_taydennyskoulutus_tpo] ([id], [alkaa], [paattyy], [osaalue_koodi], [osaalue], [osaalue_SV], [osaalue_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (10, CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'Ei koe tarvitsevansa täydennyskoulutusta', N'Ei koe tarvitsevansa täydennyskoulutusta_SV', N'Ei koe tarvitsevansa täydennyskoulutusta_EN', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-25' AS Date), N'CSC Juha')
GO

USE [ANTERO]