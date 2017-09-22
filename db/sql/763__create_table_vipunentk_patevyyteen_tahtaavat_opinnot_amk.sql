USE [VipunenTK]
GO
/****** Object:  Table [dbo].[d_patevyyteen_tahtaavat_opinnot_amk]    Script Date: 14.9.2017 13:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_patevyyteen_tahtaavat_opinnot_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_patevyyteen_tahtaavat_opinnot_amk](
	[id] [int] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[patevyyteen_tahtaavat_opinnot_koodi] [nvarchar](2) NOT NULL,
	[patevyyteen_tahtaavat_opinnot] [nvarchar](200) NULL,
	[patevyyteen_tahtaavat_opinnot_SV] [nvarchar](200) NULL,
	[patevyyteen_tahtaavat_opinnot_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (-2, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'Manuaalinen')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (-1, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'Manuaalinen')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (1, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät lastentarhanopettajan pätevyyteen', N'*SV*Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät lastentarhanopettajan pätevyyteen', N'*EN*Sosionomi (amk) tutkintoon kuuluu opintoja, jotka tähtäävät lastentarhanopettajan pätevyyteen', N'1', N'Tilastokeskus')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (2, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Sairaanhoitajan pätevyys (tutkintokeruu)', N'*SV*Sairaanhoitajan pätevyys (tutkintokeruu)', N'*EN*Sairaanhoitajan pätevyys (tutkintokeruu)', N'2', N'Tilastokeskus')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (3, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Ammatillinen opettajankoulutus, pedagogiset opinnot', N'*SV*Ammatillinen opettajankoulutus, pedagogiset opinnot', N'*EN*Ammatillinen opettajankoulutus, pedagogiset opinnot', N'3', N'Tilastokeskus')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (4, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'Ammatillinen opettajankoulutus, opinto-ohjaaja', N'*SV*Ammatillinen opettajankoulutus, opinto-ohjaaja', N'*EN*Ammatillinen opettajankoulutus, opinto-ohjaaja', N'4', N'Tilastokeskus')
GO
INSERT [dbo].[d_patevyyteen_tahtaavat_opinnot_amk] ([id], [alkaa], [paattyy], [patevyyteen_tahtaavat_opinnot_koodi], [patevyyteen_tahtaavat_opinnot], [patevyyteen_tahtaavat_opinnot_SV], [patevyyteen_tahtaavat_opinnot_EN], [jarjestys], [tietolahde]) VALUES (5, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Ammatillinen opettajankoulutus, erityisopettaja', N'*SV*Ammatillinen opettajankoulutus, erityisopettaja', N'*EN*Ammatillinen opettajankoulutus, erityisopettaja', N'5', N'Tilastokeskus')
GO

USE [ANTERO]