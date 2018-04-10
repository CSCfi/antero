USE [VipunenTK_lisatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarkastelujakso]') AND type in (N'U'))
ALTER TABLE [dbo].[tarkastelujakso] DROP CONSTRAINT IF EXISTS [DF__tarkastel__tieto__12748D24]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarkastelujakso]') AND type in (N'U'))
ALTER TABLE [dbo].[tarkastelujakso] DROP CONSTRAINT IF EXISTS [DF__tarkastel__paatt__118068EB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarkastelujakso]') AND type in (N'U'))
ALTER TABLE [dbo].[tarkastelujakso] DROP CONSTRAINT IF EXISTS [DF__tarkastel__alkaa__108C44B2]
GO
/****** Object:  Table [dbo].[tarkastelujakso]    Script Date: 10.4.2018 14:33:20 ******/
DROP TABLE IF EXISTS [dbo].[tarkastelujakso]
GO
/****** Object:  Table [dbo].[tarkastelujakso]    Script Date: 10.4.2018 14:33:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tarkastelujakso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tarkastelujakso](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso] [nvarchar](100) NULL,
	[tarkastelujakso_SV] [nvarchar](100) NULL,
	[tarkastelujakso_EN] [nvarchar](100) NULL,
	[tarkastelujakso2] [nvarchar](100) NULL,
	[tarkastelujakso2_SV] [nvarchar](100) NULL,
	[tarkastelujakso2_EN] [nvarchar](100) NULL,
	[jaksovuosi] [int] NULL,
	[jaksokausi] [int] NULL,
	[jarjestys] [nvarchar](100) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[sijoittuminen 0_5 - 5_0 vuotta] [nvarchar](100) NULL,
	[sijoittuminen 1_0 - 5_5 vuotta] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (-1, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'Tuntematon', N'Okänd', N'Unknown', 99, 1, N'98', N'K', N'0', N'Manuaalinen', NULL, N'Tuntematon', N'Tuntematon')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (-2, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', 99, 1, N'99', N'K', N'0', N'Manuaalinen', NULL, N'Virhetilanne', N'Virhetilanne')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (1, CAST(N'2015-08-24' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'0', N'0 vuotta (välittömästi)', N'0 år', N'0 years', N'0 vuotta (välittömästi)', N'0 år', N'0 years', 0, 1, N'10', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (2, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'0,5', N'0,5 vuotta', N'0,5 år', N'0,5 years', N'0 vuotta (välittömästi)', N'0 år', N'0 years', 0, 2, N'11', N'E', N'0', N'Manuaalinen', NULL, N'0,5 - 1 vuotta', NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (3, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'1 vuosi', N'1 år', N'1 year', N'1 vuosi', N'1 år', N'1 year', 1, 1, N'12', N'E', N'0', N'Manuaalinen', NULL, N'0,5 - 1 vuotta', N'1 - 1,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (4, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1,5', N'1,5 vuotta', N'1,5 år', N'1,5 years', N'1 vuosi', N'1 år', N'1 year', 1, 2, N'14', N'E', N'0', N'Manuaalinen', NULL, N'1,5 - 2 vuotta', N'1 - 1,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (5, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'2 vuotta', N'2 år', N'2 years', N'2 vuotta', N'2 år', N'2 years', 2, 1, N'16', N'E', N'0', N'Manuaalinen', NULL, N'1,5 - 2 vuotta', N'2 - 2,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (6, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2,5', N'2,5 vuotta', N'2,5 år', N'2,5 years', N'2 vuotta', N'2 år', N'2 years', 2, 2, N'18', N'E', N'0', N'Manuaalinen', NULL, N'2,5 - 3 vuotta', N'2 - 2,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (7, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'3 vuotta', N'3 år', N'3 years', N'3 vuotta', N'3 år', N'3 years', 3, 1, N'20', N'E', N'0', N'Manuaalinen', NULL, N'2,5 - 3 vuotta', N'3 - 3,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (8, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3,5', N'3,5 vuotta', N'3,5 år', N'3,5 years', N'3 vuotta', N'3 år', N'3 years', 3, 2, N'22', N'E', N'0', N'Manuaalinen', NULL, N'3,5 - 4 vuotta', N'3 - 3,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (9, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4', N'4 vuotta', N'4 år', N'4 years', N'4 vuotta', N'4 år', N'4 years', 4, 1, N'24', N'E', N'0', N'Manuaalinen', NULL, N'3,5 - 4 vuotta', N'4 - 4,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (10, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4,5', N'4,5 vuotta', N'4,5 år', N'4,5 years', N'4 vuotta', N'4 år', N'4 years', 4, 2, N'26', N'E', N'0', N'Manuaalinen', NULL, N'4,5 - 5 vuotta', N'4 - 4,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (11, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5', N'5 vuotta', N'5 år', N'5 years', N'5 vuotta', N'5 år', N'5 years', 5, 1, N'28', N'E', N'0', N'Manuaalinen', NULL, N'4,5 - 5 vuotta', N'5 - 5,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (12, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5,5', N'5,5 vuotta', N'5,5 år', N'5,5 years', N'5 vuotta', N'5 år', N'5 years', 5, 2, N'30', N'E', N'0', N'Manuaalinen', NULL, NULL, N'5 - 5,5 vuotta')
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (13, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6', N'6 vuotta', N'6 år', N'6 years', N'6 vuotta', N'6 år', N'6 years', 6, 1, N'32', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (14, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6,5', N'6,5 vuotta', N'6,5 år', N'6,5 years', N'6 vuotta', N'6 år', N'6 years', 6, 2, N'34', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (15, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7', N'7 vuotta', N'7 år', N'7 years', N'7 vuotta', N'7 år', N'7 years', 7, 1, N'36', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (16, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7,5', N'7,5 vuotta', N'7,5 år', N'7,5 years', N'7 vuotta', N'7 år', N'7 years', 7, 2, N'38', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (17, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8', N'8 vuotta', N'8 år', N'8 years', N'8 vuotta', N'8 år', N'8 years', 8, 1, N'40', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (18, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8,5', N'8,5 vuotta', N'8,5 år', N'8,5 years', N'8 vuotta', N'8 år', N'8 years', 8, 2, N'42', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (19, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9', N'9 vuotta', N'9 år', N'9 years', N'9 vuotta', N'9 år', N'9 years', 9, 1, N'44', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (20, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9,5', N'9,5 vuotta', N'9,5 år', N'9,5 years', N'9 vuotta', N'9 år', N'9 years', 9, 2, N'46', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (21, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10', N'10 vuotta', N'10 år', N'10 years', N'10 vuotta', N'10 år', N'10 years', 10, 1, N'48', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (22, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10,5', N'10,5 vuotta', N'10,5 år', N'10,5 years', N'10 vuotta', N'10 år', N'10 years', 10, 2, N'50', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (23, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11', N'11 vuotta', N'11 år', N'11 years', N'11 vuotta', N'11 år', N'11 years', 11, 1, N'52', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (24, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11,5', N'11,5 vuotta', N'11,5 år', N'11,5 years', N'11 vuotta', N'11 år', N'11 years', 11, 2, N'54', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (25, CAST(N'2013-09-18' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12', N'12 vuotta', N'12 år', N'12 years', N'12 vuotta', N'12 år', N'12 years', 12, 1, N'56', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (26, CAST(N'2014-10-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'12,5', N'12,5 vuotta', N'12,5 år', N'12,5 years', N'12 vuotta', N'12 år', N'12 years', 12, 2, N'58', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (27, CAST(N'2014-10-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13', N'13 vuotta', N'13 år', N'13 years', N'13 vuotta', N'13 år', N'13 years', 13, 1, N'60', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (28, CAST(N'2015-10-22' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'13,5', N'13,5 vuotta', N'13,5 år', N'13,5 years', N'13 vuotta', N'13 år', N'13 years', 13, 2, N'62', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (29, CAST(N'2014-10-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14', N'14 vuotta', N'14 år', N'14 years', N'14 vuotta', N'14 år', N'14 years', 14, 1, N'64', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (30, CAST(N'2015-10-22' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'14,5', N'14,5 vuotta', N'14,5 år', N'14,5 years', N'14 vuotta', N'14 år', N'14 years', 14, 2, N'66', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (31, CAST(N'2014-10-12' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'15', N'15 vuotta', N'15 år', N'15 years', N'15 vuotta', N'15 år', N'15 years', 15, 1, N'68', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (32, CAST(N'2015-10-22' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'15,5', N'15,5 vuotta', N'15,5 år', N'15,5 years', N'15 vuotta', N'15 år', N'15 years', 15, 2, N'70', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (33, CAST(N'2015-10-22' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'16', N'16 vuotta', N'16 år', N'16 years', N'16 vuotta', N'16 år', N'16 years', 16, 1, N'72', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
INSERT [dbo].[tarkastelujakso] ([id], [luotu], [alkaa], [paattyy], [tarkastelujakso_koodi], [tarkastelujakso], [tarkastelujakso_SV], [tarkastelujakso_EN], [tarkastelujakso2], [tarkastelujakso2_SV], [tarkastelujakso2_EN], [jaksovuosi], [jaksokausi], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti], [sijoittuminen 0_5 - 5_0 vuotta], [sijoittuminen 1_0 - 5_5 vuotta]) VALUES (34, CAST(N'2015-10-01' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'99', N'Rajaton', N'Obegränsad', N'Unlimited', N'Rajaton', N'Obegränsad', N'Unlimited', 99, 1, N'90', N'E', N'0', N'Manuaalinen', NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__alkaa__108C44B2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('1900-01-01') FOR [alkaa]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__paatt__118068EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('9999-01-01') FOR [paattyy]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__tarkastel__tieto__12748D24]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tarkastelujakso] ADD  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
USE [ANTERO]