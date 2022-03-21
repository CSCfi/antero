USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__tietolahde]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__paattyy]
GO
ALTER TABLE [dbo].[koulutustyyppi] DROP CONSTRAINT [DF__koulutustyyppi__alkaa]
GO
/****** Object:  Table [dbo].[koulutustyyppi]    Script Date: 30.1.2019 10:40:12 ******/
DROP TABLE [dbo].[koulutustyyppi]
GO
/****** Object:  Table [dbo].[koulutustyyppi]    Script Date: 30.1.2019 10:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[koulutustyyppi](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutustyyppi_koodi] [nvarchar](2) NULL,
	[koulutustyyppi] [nvarchar](50) NULL,
	[koulutustyyppi_SV] [nvarchar](50) NULL,
	[koulutustyyppi_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (78, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Ammattikorkeakoulututkinto, päivätoteutus', N'Yrkeshögskoleexamen, dagstudier', N'UAS Bachelor''s degree, full-time studies', N'1', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (80, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Ammattikorkeakoulututkinto, monimuotototeutus', N'Yrkeshögskoleexamen, flerformsstudier', N'UAS Bachelor''s degree, part-time studies', N'2', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (82, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Erikoistumisopinnot', N'Specialiseringsstudier', N'Specialisation studies', N'3', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (83, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'Ammatillinen opettajankoulutus', N'Yrkesinriktad lärarutbildning', N'Vocational teacher education', N'4', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (84, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'Ylempi ammattikorkeakoulututkinto', N'Högre yrkeshögskoleexamen', N'UAS Master''s degree', N'5', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (85, CAST(N'2017-03-27' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7', N'Erikoistumiskoulutus', N'Specialiseringsutbildning', N'Specialisation studies', N'6', N'E', N'0', N'Tilastokeskus', N'CSC Anssi')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutustyyppi] ([id], [luotu], [alkaa], [paattyy], [koulutustyyppi_koodi], [koulutustyyppi], [koulutustyyppi_SV], [koulutustyyppi_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[koulutustyyppi] ADD  CONSTRAINT [DF__koulutustyyppi__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
USE [ANTERO]