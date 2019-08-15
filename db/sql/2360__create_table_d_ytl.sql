USE [ANTERO]
GO
/****** Object:  Table [dw].[d_ytl_aine]    Script Date: 15.8.2019 20:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ytl_aine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_ytl_aine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](500) NULL,
	[aine_selite_fi] [nvarchar](500) NULL,
	[aine_selite_sv] [nvarchar](500) NULL,
	[aine_selite_en] [nvarchar](500) NULL,
	[aineryhma_selite_fi] [nvarchar](500) NULL,
	[aineryhma_selite_sv] [nvarchar](500) NULL,
	[aineryhma_selite_en] [nvarchar](500) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
 CONSTRAINT [PK__d_ytl_aine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_ytl_aine_laajuus]    Script Date: 15.8.2019 20:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ytl_aine_laajuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_ytl_aine_laajuus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](500) NULL,
	[selite_fi] [nvarchar](500) NULL,
	[selite_sv] [nvarchar](500) NULL,
	[selite_en] [nvarchar](500) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
 CONSTRAINT [PK__d_ytl_aine_laajuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dw].[d_ytl_aine] ON 

GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'BI', N'Biologia', NULL, NULL, N'Reaali', NULL, NULL, 4, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (2, N'ET', N'Elämänkatsomustieto', NULL, NULL, N'Reaali', NULL, NULL, 5, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (3, N'FF', N'Filosofia', NULL, NULL, N'Reaali', NULL, NULL, 6, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (4, N'FY', N'Fysiikka', NULL, NULL, N'Reaali', NULL, NULL, 7, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (5, N'GE', N'Maantiede', NULL, NULL, N'Reaali', NULL, NULL, 8, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (6, N'HI', N'Historia', NULL, NULL, N'Reaali', NULL, NULL, 9, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (7, N'KE', N'Kemia', NULL, NULL, N'Reaali', NULL, NULL, 10, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (8, N'PS', N'Psykologia', NULL, NULL, N'Reaali', NULL, NULL, 11, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (9, N'TE', N'Terveystieto', NULL, NULL, N'Reaali', NULL, NULL, 12, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (10, N'UE', N'Uskonto, ev.lut', NULL, NULL, N'Reaali', NULL, NULL, 13, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (11, N'UO', N'Uskonto, ort.', NULL, NULL, N'Reaali', NULL, NULL, 14, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (12, N'YH', N'Yhteiskuntaoppi', NULL, NULL, N'Reaali', NULL, NULL, 15, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (13, N'PITKA', N'Matematiikka, pitkä', NULL, NULL, N'Matematiikka', NULL, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (16, N'LYHYT', N'Matematiikka, lyhyt', NULL, NULL, N'Matematiikka', NULL, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (17, N'EI_MATIKKA', N'Ei matematiikkaa', NULL, NULL, N'Matematiikka', NULL, NULL, 3, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (18, N'EN', N'Englanti', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (19, N'ES', N'Espanja', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (20, N'FI', N'Suomi', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (21, N'IS', N'Inarinsaame', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (22, N'IT', N'Italia', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (23, N'LA', N'Latina', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (24, N'PG', N'Portugali', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (25, N'QC', N'Koltansaame', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (26, N'QS', N'Koltansaame', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (27, N'RA', N'Ranska', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (28, N'RU', N'Ruotsi', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (29, N'SA', N'Saksa', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (30, N'VE', N'Venäjä', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (31, N'ZA', N'Pohjoissaame', NULL, NULL, N'Kieli', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine] ([id], [koodi], [aine_selite_fi], [aine_selite_sv], [aine_selite_en], [aineryhma_selite_fi], [aineryhma_selite_sv], [aineryhma_selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (32, N'MA', N'Matematiikka', NULL, NULL, N'Matematiikka', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dw].[d_ytl_aine] OFF
GO
SET IDENTITY_INSERT [dw].[d_ytl_aine_laajuus] ON 

GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'A', N'pitkä', NULL, NULL, 3, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (2, N'B', N'keskipitkä', NULL, NULL, 4, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (3, N'C', N'lyhyt', NULL, NULL, 5, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (4, N'AI', N'äidinkieli', NULL, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (5, N'TOINENKIELI', N'toisena kielenä', NULL, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (6, N'PITKA', N'pitkä', NULL, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (7, N'LYHYT', N'lyhyt', NULL, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (8, N'D', N'lyhyt', NULL, NULL, 6, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (9, N'VI2', N'toisena kielenä', NULL, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (10, N'KYPSYYS', N'kypsyyskoe', NULL, NULL, 7, NULL, NULL, NULL)
GO
INSERT [dw].[d_ytl_aine_laajuus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (11, N'SAKSALKOUL', N'Saksalaisen koulun saksan kielen koe', NULL, NULL, 8, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dw].[d_ytl_aine_laajuus] OFF
