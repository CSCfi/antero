USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[patevyyteen_tahtaavat_opinnot_amk]    Script Date: 23.9.2021 13:34:34 ******/
DROP TABLE [dbo].[patevyyteen_tahtaavat_opinnot_amk]
GO
/****** Object:  Table [dbo].[patevyyteen_tahtaavat_opinnot_amk]    Script Date: 23.9.2021 13:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patevyyteen_tahtaavat_opinnot_amk](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[patevyyteen_tahtaavat_opinnot_koodi] [nvarchar](2) NOT NULL,
	[patevyyteen_tahtaavat_opinnot] [nvarchar](200) NULL,
	[patevyyteen_tahtaavat_opinnot_SV] [nvarchar](200) NULL,
	[patevyyteen_tahtaavat_opinnot_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät varhaiskasvatuksen opettajan pätevyyteen', N'*SV*Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät varhaiskasvatuksen opettajan pätevyyteen', N'*EN*Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät varhaiskasvatuksen opettajan pätevyyteen', N'1', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Sairaanhoitajan pätevyys (tutkintokeruu)', N'*SV*Sairaanhoitajan pätevyys (tutkintokeruu)', N'*EN*Sairaanhoitajan pätevyys (tutkintokeruu)', N'2', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Ammatillinen opettajankoulutus, pedagogiset opinnot', N'*SV*Ammatillinen opettajankoulutus, pedagogiset opinnot', N'*EN*Ammatillinen opettajankoulutus, pedagogiset opinnot', N'3', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Ammatillinen opettajankoulutus, opinto-ohjaaja', N'*SV*Ammatillinen opettajankoulutus, opinto-ohjaaja', N'*EN*Ammatillinen opettajankoulutus, opinto-ohjaaja', N'4', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2017-09-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Ammatillinen opettajankoulutus, erityisopettaja', N'*SV*Ammatillinen opettajankoulutus, erityisopettaja', N'*EN*Ammatillinen opettajankoulutus, erityisopettaja', N'5', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[patevyyteen_tahtaavat_opinnot_amk] ([id], [luotu], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-09-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Tutkintoon sisältyy varhaiskasvatukseen ja sosiaalipedagogiikkaan suuntautuneet vähintään 60 opintopisteen laajuiset opinnot (amk)', N'*SV*Tutkintoon sisältyy varhaiskasvatukseen ja sosiaalipedagogiikkaan suuntautuneet vähintään 60 opintopisteen laajuiset opinnot (amk)', N'*EN*Tutkintoon sisältyy varhaiskasvatukseen ja sosiaalipedagogiikkaan suuntautuneet vähintään 60 opintopisteen laajuiset opinnot (amk)', N'6', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
