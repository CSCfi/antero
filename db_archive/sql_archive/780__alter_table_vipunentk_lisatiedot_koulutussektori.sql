USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[koulutussektori]    Script Date: 19.9.2017 17:14:46 ******/
DROP TABLE IF EXISTS [dbo].[koulutussektori]
GO
/****** Object:  Table [dbo].[koulutussektori]    Script Date: 19.9.2017 17:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutussektori]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutussektori](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koulutussektori_koodi] [nvarchar](2) NOT NULL,
	[koulutussektori] [nvarchar](50) NULL,
	[koulutussektori_SV] [nvarchar](50) NULL,
	[koulutussektori_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Ammattikorkeakoulukoulutus', N'Yrkeshögskoleutbildning', N'UAS education', N'04', N'E', N'0', N'OKM', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Esi- ja perusopetus', N'Förskoleundervisning och grundläggande utbildning', N'Pre-primary and basic education', N'01', N'E', N'0', N'OKM', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Lukiokoulutus', N'Gymnasieutbildning', N'General upper secondary education', N'02', N'E', N'0', N'OKM', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Ammatillinen koulutus', N'Yrkesutbildning', N'Vocational education and training', N'03', N'E', N'0', N'OKM', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Yliopistokoulutus', N'Universitetsutbildning', N'University education', N'05', N'E', N'0', N'OKM', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'K', N'0', N'CSC', NULL)
GO
INSERT [dbo].[koulutussektori] ([id], [luotu], [alkaa], [paattyy], [koulutussektori_koodi], [koulutussektori], [koulutussektori_SV], [koulutussektori_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-19' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N'0', N'CSC', NULL)
GO
USE [ANTERO]