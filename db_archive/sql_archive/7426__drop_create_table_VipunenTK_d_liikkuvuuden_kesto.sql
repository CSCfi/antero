USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_liikkuvuuden_kesto]    Script Date: 26.2.2023 9:52:43 ******/
DROP TABLE [dbo].[d_liikkuvuuden_kesto]
GO

/****** Object:  Table [dbo].[d_liikkuvuuden_kesto]    Script Date: 26.2.2023 9:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_liikkuvuuden_kesto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[liikkuvuuden_kesto_koodi] [nvarchar](2) NULL,
	[liikkuvuuden_kesto] [nvarchar](50) NULL,
	[liikkuvuuden_kesto_SV] [nvarchar](50) NULL,
	[liikkuvuuden_kesto_EN] [nvarchar](50) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_liikkuvuuden_kesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[d_liikkuvuuden_kesto] ([id], [luotu], [liikkuvuuden_kesto_koodi], [liikkuvuuden_kesto], [liikkuvuuden_kesto_SV], [liikkuvuuden_kesto_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2022-11-25' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'9', N'K', N'Manuaalinen', NULL)
GO
INSERT [dbo].[d_liikkuvuuden_kesto] ([id], [luotu], [liikkuvuuden_kesto_koodi], [liikkuvuuden_kesto], [liikkuvuuden_kesto_SV], [liikkuvuuden_kesto_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2022-11-25' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'8', N'K', N'Manuaalinen', NULL)
GO
INSERT [dbo].[d_liikkuvuuden_kesto] ([id], [luotu], [liikkuvuuden_kesto_koodi], [liikkuvuuden_kesto], [liikkuvuuden_kesto_SV], [liikkuvuuden_kesto_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (1, CAST(N'2022-11-25' AS Date), N'1', N'Alle 87 päivää', N'Mindre än 87 dagar', N'Less than 87 days', N'1', N'E', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[d_liikkuvuuden_kesto] ([id], [luotu], [liikkuvuuden_kesto_koodi], [liikkuvuuden_kesto], [liikkuvuuden_kesto_SV], [liikkuvuuden_kesto_EN], [jarjestys], [virhetilanne], [tietolahde], [kommentti]) VALUES (2, CAST(N'2022-11-25' AS Date), N'2', N'87 päivää tai enemmän', N'87 dagar eller mer', N'87 days or more', N'2', N'E', N'Tilastokeskus', N'CSC Juha')
GO
