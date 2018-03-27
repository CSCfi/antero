USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[aidinkieli_versio5]    Script Date: 9.3.2018 8:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aidinkieli_versio5]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aidinkieli_versio5](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aidinkieli_versio5_koodi] [nvarchar](2) NULL,
	[aidinkieli_versio5] [nvarchar](50) NULL,
	[aidinkieli_versio5_SV] [nvarchar](50) NULL,
	[aidinkieli_versio5_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[aidinkieli_versio5] ([id], [luotu], [aidinkieli_versio5_koodi], [aidinkieli_versio5], [aidinkieli_versio5_SV], [aidinkieli_versio5_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2018-03-06' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[aidinkieli_versio5] ([id], [luotu], [aidinkieli_versio5_koodi], [aidinkieli_versio5], [aidinkieli_versio5_SV], [aidinkieli_versio5_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2018-03-06' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[aidinkieli_versio5] ([id], [luotu], [aidinkieli_versio5_koodi], [aidinkieli_versio5], [aidinkieli_versio5_SV], [aidinkieli_versio5_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2018-03-06' AS Date), N'1', N'suomi, ruotsi, saame', N'finska, svenska, samiska', N'finnish, swedish, sámi', N'1', N'E', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[aidinkieli_versio5] ([id], [luotu], [aidinkieli_versio5_koodi], [aidinkieli_versio5], [aidinkieli_versio5_SV], [aidinkieli_versio5_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2018-03-06' AS Date), N'2', N'muut kielet ja tuntematon', N'övriga språk och okänd', N'other languages and unknown', N'2', N'E', N'0', N'Manuaalinen', N'CSC Anssi')
GO
USE [ANTERO]