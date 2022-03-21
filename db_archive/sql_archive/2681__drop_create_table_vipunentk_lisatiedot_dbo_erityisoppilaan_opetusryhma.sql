USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[erityisoppilaan_opetusryhma]    Script Date: 6.12.2019 19:02:45 ******/
DROP TABLE [dbo].[erityisoppilaan_opetusryhma]
GO
/****** Object:  Table [dbo].[erityisoppilaan_opetusryhma]    Script Date: 6.12.2019 19:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[erityisoppilaan_opetusryhma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[erityisoppilaan_opetusryhma_avain] [nvarchar](10) NULL,
	[erityisoppilaan_opetusryhma] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_SV] [nvarchar](250) NULL,
	[erityisoppilaan_opetusryhma_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[erityisoppilaan_opetusryhma] ([id], [luotu], [erityisoppilaan_opetusryhma_avain], [erityisoppilaan_opetusryhma], [erityisoppilaan_opetusryhma_SV], [erityisoppilaan_opetusryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-04-21' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'1980
', N'K', NULL, N'Manuaalinen', N'CSC Jouko')
GO
INSERT [dbo].[erityisoppilaan_opetusryhma] ([id], [luotu], [erityisoppilaan_opetusryhma_avain], [erityisoppilaan_opetusryhma], [erityisoppilaan_opetusryhma_SV], [erityisoppilaan_opetusryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-04-21' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990
', N'K', NULL, N'Manuaalinen', N'CSC Jouko')
GO
INSERT [dbo].[erityisoppilaan_opetusryhma] ([id], [luotu], [erityisoppilaan_opetusryhma_avain], [erityisoppilaan_opetusryhma], [erityisoppilaan_opetusryhma_SV], [erityisoppilaan_opetusryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-04-21' AS Date), N'1', N'Erityisopetusryhmä', N'Specialundervisningsgrupp', N'Special needs education group', N'1000', N'E', NULL, N'Manuaalinen', N'CSC Jouko')
GO
INSERT [dbo].[erityisoppilaan_opetusryhma] ([id], [luotu], [erityisoppilaan_opetusryhma_avain], [erityisoppilaan_opetusryhma], [erityisoppilaan_opetusryhma_SV], [erityisoppilaan_opetusryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-04-21' AS Date), N'2', N'Muiden oppilaiden kanssa samassa ryhmässä (integroitu)', N'Tillsammans med andra elever i samma grupp (integrerad)', N'In the same group with other pupils (integrated)', N'1010', N'E', NULL, N'Manuaalinen', N'CSC Jouko')
GO
INSERT [dbo].[erityisoppilaan_opetusryhma] ([id], [luotu], [erityisoppilaan_opetusryhma_avain], [erityisoppilaan_opetusryhma], [erityisoppilaan_opetusryhma_SV], [erityisoppilaan_opetusryhma_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
VALUES (3, CAST(N'2015-04-21' AS Date), N'9', N'Ei tietoa, näyttötutkintoon valmistava koulutus (-2017), oppisopimuskoulutus', N'Inga uppgifter, förberedande utbildning för fristående examen (-2017), läroavtalsutbildning', N'Unknown, preparatory training for competence-based qualification (-2017), apprenticeship training', N'1020', N'E', NULL, N'Manuaalinen', N'CSC Jouko')
GO
USE [ANTERO]