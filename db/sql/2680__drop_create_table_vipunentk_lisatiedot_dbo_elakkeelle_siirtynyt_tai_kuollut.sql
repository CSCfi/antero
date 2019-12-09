USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[elakkeelle_siirtynyt_tai_kuollut]    Script Date: 6.12.2019 18:02:54 ******/
DROP TABLE [dbo].[elakkeelle_siirtynyt_tai_kuollut]
GO
/****** Object:  Table [dbo].[elakkeelle_siirtynyt_tai_kuollut]    Script Date: 6.12.2019 18:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elakkeelle_siirtynyt_tai_kuollut](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[elakkeelle_siirtynyt_tai_kuollut_koodi] [nvarchar](10) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_ryhma_EN] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_SV] [nvarchar](250) NULL,
	[elakkeelle_siirtynyt_tai_kuollut_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (-1, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (-2, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (1, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Eläkkeelle siirtynyt ', N'Pensionerad ', N'Retired '
, N'Vanhuuseläke', N'Ålderspension', N'Old-age pension', N'1000', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (2, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Eläkkeelle siirtynyt ', N'Pensionerad ', N'Retired '
, N'Työkyvyttömyyseläke (sis. työuraeläkkeen)', N'Invalidpension (inkl. arbetslivspension)', N'Disability pension (incl. years-of-service pension)', N'1010', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (3, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Eläkkeelle siirtynyt ', N'Pensionerad ', N'Retired '
, N'Työttömyyseläke ', N'Arbetslöshetspension ', N'Unemployment pension ', N'1020', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (4, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Eläkkeelle siirtynyt ', N'Pensionerad ', N'Retired '
, N'Maatalouden erityiseläke', N'Specialpension inom lantbruket', N'Farmers’ special pension', N'1030', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (5, CAST(N'2019-12-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Eläkkeelle siirtynyt ', N'Pensionerad ', N'Retired '
, N'Osa-aikaeläke (sis. osittain varhennettu vanhuuseläke)', N'Deltidspension (inkl. partiell förtida ålderspension)', N'Part-time pension (incl. partial early old-age pension)', N'1035', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[elakkeelle_siirtynyt_tai_kuollut] ([id], [luotu], [alkaa], [paattyy], [elakkeelle_siirtynyt_tai_kuollut_koodi], [elakkeelle_siirtynyt_tai_kuollut_ryhma], [elakkeelle_siirtynyt_tai_kuollut_ryhma_SV], [elakkeelle_siirtynyt_tai_kuollut_ryhma_EN], [elakkeelle_siirtynyt_tai_kuollut], [elakkeelle_siirtynyt_tai_kuollut_SV], [elakkeelle_siirtynyt_tai_kuollut_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (6, CAST(N'2013-11-28' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'100', N'Kuollut', N'Avliden', N'Deceased', N'Kuollut', N'Avliden', N'Deceased', N'1040', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
USE [ANTERO]