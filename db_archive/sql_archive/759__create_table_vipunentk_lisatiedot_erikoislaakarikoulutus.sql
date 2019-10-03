USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[erikoislaakarikoulutus]    Script Date: 14.9.2017 13:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[erikoislaakarikoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[erikoislaakarikoulutus](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[erikoislaakarikoulutus_koodi] [nvarchar](2) NOT NULL,
	[erikoislaakarikoulutus] [nvarchar](200) NULL,
	[erikoislaakarikoulutus_SV] [nvarchar](200) NULL,
	[erikoislaakarikoulutus_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[erikoislaakarikoulutus] ([id], [luotu], [alkaa], [paattyy], [erikoislaakarikoulutus_koodi], [erikoislaakarikoulutus], [erikoislaakarikoulutus_SV], [erikoislaakarikoulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[erikoislaakarikoulutus] ([id], [luotu], [alkaa], [paattyy], [erikoislaakarikoulutus_koodi], [erikoislaakarikoulutus], [erikoislaakarikoulutus_SV], [erikoislaakarikoulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[erikoislaakarikoulutus] ([id], [luotu], [alkaa], [paattyy], [erikoislaakarikoulutus_koodi], [erikoislaakarikoulutus], [erikoislaakarikoulutus_SV], [erikoislaakarikoulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Erikoislääkärit', N'*SV*Erikoislääkärit', N'*EN*Erikoislääkärit', N'1', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[erikoislaakarikoulutus] ([id], [luotu], [alkaa], [paattyy], [erikoislaakarikoulutus_koodi], [erikoislaakarikoulutus], [erikoislaakarikoulutus_SV], [erikoislaakarikoulutus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Erikoishammaslääkärit', N'*SV*Erikoishammaslääkärit', N'*EN*Erikoishammaslääkärit', N'2', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO

USE [ANTERO]