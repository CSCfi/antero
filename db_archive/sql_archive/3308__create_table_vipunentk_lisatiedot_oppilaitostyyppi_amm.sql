USE [VipunenTK_lisatiedot]
GO

DROP TABLE IF EXISTS [dbo].[oppilaitostyyppi_amm]
GO

/****** Object:  Table [dbo].[oppilaitostyyppi_amm]    Script Date: 31.3.2020 10:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oppilaitostyyppi_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[oppilaitostyyppi_koodi] [nchar](2) NULL,
	[oppilaitostyyppi] [nvarchar](150) NULL,
	[oppilaitostyyppi_SV] [nvarchar](150) NULL,
	[oppilaitostyyppi_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (-1, CAST(N'2020-03-31' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (-2, CAST(N'2020-03-31' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (1, CAST(N'2020-03-31' AS Date)
, N'21 '
, N'Ammatilliset oppilaitokset'
, N'Yrkesläroanstalter'
, N'Vocational institutions'
, N'1010', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (2, CAST(N'2020-03-31' AS Date)
, N'22 '
, N'Ammatilliset erityisoppilaitokset'
, N'Specialyrkesläroanstalter'
, N'Vocational special education institutions'
, N'1020', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (3, CAST(N'2020-03-31' AS Date)
, N'23 '
, N'Ammatilliset erikoisoppilaitokset'
, N'Yrkesinriktade särskilda läroanstalter'
, N'Specialised vocational institutions'
, N'1030', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (4, CAST(N'2020-03-31' AS Date)
, N'24 '
, N'Ammatilliset aikuiskoulutuskeskukset'
, N'Yrkesinriktade vuxenutbildningscentrer'
, N'Vocational adult education centres'
, N'1040', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[oppilaitostyyppi_amm] ([id], [luotu], [oppilaitostyyppi_koodi], [oppilaitostyyppi], [oppilaitostyyppi_SV], [oppilaitostyyppi_EN], [jarjestys]
, [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (5, CAST(N'2020-03-31' AS Date)
, N'25 '
, N'Palo-, poliisi- ja vartiointialojen oppilaitokset'
, N'Läroanstalter inom brand-, polis- och bevakningsväsendet'
, N'Fire, police and security service institutes'
, N'1050', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO

USE [ANTERO]