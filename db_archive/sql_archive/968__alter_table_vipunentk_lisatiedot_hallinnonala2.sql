USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[hallinnonala2] DROP CONSTRAINT [DF__hallinnon2__paatt__0371755F]
GO
ALTER TABLE [dbo].[hallinnonala2] DROP CONSTRAINT [DF__hallinnon2__alkaa__027D5126]
GO
ALTER TABLE [dbo].[hallinnonala2] DROP CONSTRAINT [DF__hallinnon2__luotu__01892CED]
GO
/****** Object:  Table [dbo].[hallinnonala2]    Script Date: 26.10.2017 13:51:07 ******/
DROP TABLE [dbo].[hallinnonala2]
GO
/****** Object:  Table [dbo].[hallinnonala2]    Script Date: 26.10.2017 13:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hallinnonala2](
	[id] [int] NOT NULL,
	[luotu] [date] NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[hallinnonala_koodi] [nvarchar](2) NOT NULL,
	[hallinnonala] [nvarchar](200) NULL,
	[hallinnonala_SV] [nvarchar](200) NULL,
	[hallinnonala_EN] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[hallinnonala2] ([id], [luotu], [alkaa], [paattyy], [hallinnonala_koodi], [hallinnonala], [hallinnonala_SV], [hallinnonala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2017-05-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2', N'Opetushallinto, työvoimakoulutus', N'Utbildningsförvaltningen, arbetskraftsutbildning', N'Education administration, labour policy education and training', N'02', N'E', N'0', N'OKM', N'CSC Anssi')
GO
INSERT [dbo].[hallinnonala2] ([id], [luotu], [alkaa], [paattyy], [hallinnonala_koodi], [hallinnonala], [hallinnonala_SV], [hallinnonala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2017-05-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1', N'Opetushallinto, pl. työvoimakoulutus', N'Utbildningsförvaltningen, exkl. arbetskraftsutbildning', N'Education administration, excl. labour policy education and training', N'01', N'E', N'0', N'OKM', N'CSC Anssi')
GO
INSERT [dbo].[hallinnonala2] ([id], [luotu], [alkaa], [paattyy], [hallinnonala_koodi], [hallinnonala], [hallinnonala_SV], [hallinnonala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2017-05-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3', N'Muut hallinnonalat', N'Andra förvaltningsområden', N'Other administrative sectors', N'03', N'E', N'0', N'OKM', N'CSC Anssi')
GO
INSERT [dbo].[hallinnonala2] ([id], [luotu], [alkaa], [paattyy], [hallinnonala_koodi], [hallinnonala], [hallinnonala_SV], [hallinnonala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2017-05-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'98', N'K', N'0', N'CSC', NULL)
GO
INSERT [dbo].[hallinnonala2] ([id], [luotu], [alkaa], [paattyy], [hallinnonala_koodi], [hallinnonala], [hallinnonala_SV], [hallinnonala_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2017-05-05' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N'0', N'CSC', NULL)
GO
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__luotu__01892CED]  DEFAULT (getdate()) FOR [luotu]
GO
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__alkaa__027D5126]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[hallinnonala2] ADD  CONSTRAINT [DF__hallinnon2__paatt__0371755F]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
USE [ANTERO]