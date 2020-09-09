USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:35:28 ******/
DROP TABLE [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa]
GO
/****** Object:  Table [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa]    Script Date: 25.2.2020 20:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tehtavatyyppi_koodi] [nvarchar](2) NULL,
	[tehtavatyyppi] [nvarchar](255) NULL,
	[tehtavatyyppi_SV] [nvarchar](255) NULL,
	[tehtavatyyppi_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K         ', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K         ', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Rehtori', N'Rektor', N'Rector', N'1000', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Apulaisrehtori, aluerehtori, vararehtori', N'Biträdande rektor, områdesrektor, prorektor', N'Vice-principal, Regional principal, Deputy principal', N'1040', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Opettaja, lehtori, suunnittelijaopettaja', N'Lärare, lektor, planerarlärare', N'Teacher, Full-time teacher, Designer teacher', N'1100', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Päätoiminen tuntiopettaja', N'Timlärare på heltid', N'Full-time teacher', N'1600', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Sivutoiminen tuntiopettaja', N'Timlärare på deltid', N'Part-time teacher', N'1700', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Kurssiopettaja
', N'Kurslärare', N'Course teacher', N'1810', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7', N'Kerho-opettaja
', N'Klubblärare', N'Club teacher', N'1820', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO
INSERT [dbo].[opettajan_tehtavatyyppi_taiteen_perusopetuksessa] ([id], [luotu], [alkaa], [paattyy], [tehtavatyyppi_koodi], [tehtavatyyppi], [tehtavatyyppi_SV], [tehtavatyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2020-02-25' AS Date), CAST(N'2019-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8', N'Muu tai tuntematon', N'Övrig eller okänd', N'Other or unknown', N'1900', N'E         ', N' ', N'Tilastokeskus 7-aineistot', N'CSC Juha')
GO

USE [ANTERO]