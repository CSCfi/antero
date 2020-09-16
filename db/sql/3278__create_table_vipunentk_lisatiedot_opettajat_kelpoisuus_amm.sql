USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajat_kelpoisuus_amm]    Script Date: 11.2.2020 21:43:43 ******/
DROP TABLE IF EXISTS [dbo].[opettajat_kelpoisuus_amm]
GO
/****** Object:  Table [dbo].[opettajat_kelpoisuus_amm]    Script Date: 11.2.2020 21:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajat_kelpoisuus_amm](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kelpoisuus_koodi] [nvarchar](3) NULL,
	[kelpoisuus] [nvarchar](255) NULL,
	[kelpoisuus_SV] [nvarchar](255) NULL,
	[kelpoisuus_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-1, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (-2, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (1, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Ammatillisten tutkinnon osien opettajan kelpoisuus', N'Ammatillisten tutkinnon osien opettajan kelpoisuus_SV', N'Ammatillisten tutkinnon osien opettajan kelpoisuus_EN', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (2, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Yhteisten tutkinnon osien opettajan kelpoisuus', N'Yhteisten tutkinnon osien opettajan kelpoisuus_SV', N'Yhteisten tutkinnon osien opettajan kelpoisuus_EN', N'1010', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (3, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Opinto-ohjaajan kelpoisuus', N'Opinto-ohjaajan kelpoisuus_SV', N'Opinto-ohjaajan kelpoisuus_EN', N'1020', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (4, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Erityisopettajan kelpoisuus', N'Erityisopettajan kelpoisuus_SV', N'Erityisopettajan kelpoisuus_EN', N'1030', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (5, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Valmentavaa koulutusta antavan opettajan kelpoisuus', N'Valmentavaa koulutusta antavan opettajan kelpoisuus_SV', N'Valmentavaa koulutusta antavan opettajan kelpoisuus_EN', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO
INSERT [dbo].[opettajat_kelpoisuus_amm] ([id], [alkaa], [paattyy], [kelpoisuus_koodi], [kelpoisuus], [kelpoisuus_SV], [kelpoisuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [luotu], [kommentti]) VALUES (6, CAST(N'2016-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Muu opettajan kelpoisuus (esim. vapaan sivistystyön opettajan kelpoisuus)', N'Muu opettajan kelpoisuus (esim. vapaan sivistystyön opettajan kelpoisuus)_SV', N'Muu opettajan kelpoisuus (esim. vapaan sivistystyön opettajan kelpoisuus)_EN', N'1050', N'E         ', N' ', N'Tilastokeskus 7-aineistot', CAST(N'2020-02-11' AS Date), N'CSC Juha')
GO

USE [ANTERO]