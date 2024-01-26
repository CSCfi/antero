USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_tutkijanuraporras]    Script Date: 12.1.2023 23:01:54 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkijanuraporras]
GO

/****** Object:  Table [dbo].[d_tutkijanuraporras]    Script Date: 12.1.2023 23:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_tutkijanuraporras](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[tutkijanuraporras_koodi] [nvarchar](10) NULL,
	[tutkijanuraporras] [nvarchar](100) NULL,
	[tutkijanuraporras_SV] [nvarchar](100) NULL,
	[tutkijanuraporras_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_tutkijanuraporras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2023-01-12' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2023-01-12' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'manuaalinen', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2023-01-12' AS Date), N'1', N'Tutkijakoulutettava/Nuorempi tutkija, jne.', N'T.ex. Doktorand', N'E.g. Doctoral student', N'1', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2023-01-12' AS Date), N'2', N'Tutkijatohtori, jne.', N'T.ex. Forskardoktor', N'E.g. Postdoctoral researcher', N'2', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2023-01-12' AS Date), N'3', N'Yliopistonlehtori, jne.', N'T.ex. Universitetslektor', N'E.g. University lecturer', N'3', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2023-01-12' AS Date), N'4', N'Professori/Akatemiaprofessori/Tutkimusprofessori/Tutkimusjohtaja, jne.', N'T.ex. Professor, Forskningsledare, Akademiprofessor', N'E.g. Professor, Research director, Academy Research Fellow', N'4', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2023-01-12' AS Date), N'5', N'Tuntiopettaja', N'Timlärare', N'Part-time lecturer', N'5', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
INSERT [dbo].[d_tutkijanuraporras] ([id], [luotu], [tutkijanuraporras_koodi], [tutkijanuraporras], [tutkijanuraporras_SV], [tutkijanuraporras_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2023-01-12' AS Date), N'0', N'Muu t&k-henkilöstö', N'Annan f&u-personal', N'Other R&D personnel', N'6', N'E', N' ', N'TK 5.1 ja 5.2', N'CSC Juha')
GO
