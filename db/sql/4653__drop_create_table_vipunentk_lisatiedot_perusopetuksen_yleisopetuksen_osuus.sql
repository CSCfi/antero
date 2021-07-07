USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[perusopetuksen_yleisopetuksen_osuus]    Script Date: 6.7.2021 19:48:35 ******/
DROP TABLE [dbo].[perusopetuksen_yleisopetuksen_osuus]
GO
/****** Object:  Table [dbo].[perusopetuksen_yleisopetuksen_osuus]    Script Date: 6.7.2021 19:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perusopetuksen_yleisopetuksen_osuus](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[perusopetuksen_yleisopetuksen_osuus_koodi] [nchar](10) NULL,
	[perusopetuksen_yleisopetuksen_osuus] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_SV] [nvarchar](100) NULL,
	[perusopetuksen_yleisopetuksen_osuus_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-12-01' AS Date), N'-1        ', N'Tuntematon', N'Information saknas', N'Missing data', N'1980', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-12-01' AS Date), N'-2        ', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'1990', N'K', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-12-01' AS Date), N'int4      ', N'Opetus on kokonaan yleisopetuksen ryhmässä', N'Undervisningen i sin helhet i gruppen allmän undervisning', N'All teaching takes place in a mainstream group', N'1000', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-12-01' AS Date), N'int3      ', N'Opetuksesta 51-99 % on yleisopetuksen ryhmässä', N'Av undervisningen 51–99 % i gruppen för allmän undervisning', N'51-99% of teaching takes place in a mainstream group', N'1010', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-12-01' AS Date), N'int2      ', N'Opetuksesta 21-50 % on yleisopetuksen ryhmässä', N'Av undervisningen 21–50 % i gruppen för allmän undervisning', N'21-50% of teaching takes place in a mainstream group', N'1020', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-12-01' AS Date), N'int1      ', N'Opetuksesta 1-20 % on yleisopetuksen ryhmässä', N'Av undervisningen 1–20 % i gruppen för allmän undervisning', N'1-20% of teaching takes place in a mainstream group', N'1030', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-12-01' AS Date), N'int0      ', N'Opetus on kokonaan erityisryhmässä tai -luokassa', N'Undervisningen i sin helhet i specialgrupp eller -klass', N'All teaching takes place in a special group or class', N'1040', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2014-12-01' AS Date), N'int_ei    ', N'Muut kuin erityisen tuen oppilaat', N'Andra elever än de som omfattas av specialstöd', N'Other than pupils receiving special support', N'1050', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-07-06' AS Date), N'int4_uusi ', N'Opetuksesta 80-100 % on yleisopetuksen ryhmässä', N'Av undervisningen 80–100 % i gruppen för allmän undervisning', N'80-100% of teaching takes place in a mainstream group', N'1005', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-07-06' AS Date), N'int3_uusi ', N'Opetuksesta 50-79 % on yleisopetuksen ryhmässä', N'Av undervisningen 50–79 % i gruppen för allmän undervisning', N'50-79% of teaching takes place in a mainstream group', N'1015', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2021-07-06' AS Date), N'int2_uusi ', N'Opetuksesta 20-49 % on yleisopetuksen ryhmässä', N'Av undervisningen 20–49 % i gruppen för allmän undervisning', N'20-49% of teaching takes place in a mainstream group', N'1025', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] ([id], [luotu], [perusopetuksen_yleisopetuksen_osuus_koodi], [perusopetuksen_yleisopetuksen_osuus], [perusopetuksen_yleisopetuksen_osuus_SV], [perusopetuksen_yleisopetuksen_osuus_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2021-07-06' AS Date), N'int1_uusi ', N'Opetuksesta 1-19 % on yleisopetuksen ryhmässä', N'Av undervisningen 1–19 % i gruppen för allmän undervisning', N'1-19% of teaching takes place in a mainstream group', N'1035', N'E', N' ', N'Manuaalinen', N'CSC Juha')
GO
