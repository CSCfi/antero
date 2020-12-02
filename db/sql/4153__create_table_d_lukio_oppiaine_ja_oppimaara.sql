USE [ANTERO]
GO

/****** Object:  Table [dw].[d_lukio_oppiaine_ja_oppimaara]    Script Date: 1.12.2020 20:17:32 ******/
DROP TABLE IF EXISTS [dw].[d_lukio_oppiaine_ja_oppimaara]
GO

/****** Object:  Table [dw].[d_lukio_oppiaine_ja_oppimaara]    Script Date: 1.12.2020 20:17:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_lukio_oppiaine_ja_oppimaara](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodisto] [nvarchar](100) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[jarjestys] [int] NULL,
	[ryhma_koodi] [nvarchar](10) NOT NULL,
	[ryhma_nimi] [nvarchar](50) NULL,
	[ryhma_nimi_sv] [nvarchar](50) NULL,
	[ryhma_nimi_en] [nvarchar](50) NULL,
	[jarjestys_ryhma] [int] NULL,
 CONSTRAINT [PK__d_lukio_oppiaine_ja_oppimaara] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ON 

GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (1, N'koskioppiaineetyleissivistava', N'A', N'A-kieli, väh. 6 kurssia', N'A-språk, minst 6 kurser', NULL, 1000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (2, N'koskioppiaineetyleissivistava', N'A1', N'A-kieli, väh. 6 kurssia', N'A-språk, minst 6 kurser', NULL, 1000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (3, N'koskioppiaineetyleissivistava', N'A2', N'A-kieli, väh. 6 kurssia', N'A-språk, minst 6 kurser', NULL, 1000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (4, N'koskioppiaineetyleissivistava', N'B1', N'B1-kieli, väh. 5 kurssia', N'B1-språk, minst 5 kurser', NULL, 1100, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (5, N'koskioppiaineetyleissivistava', N'B2', N'B2-kieli, väh. 6 kurssia', N'B2-språk, minst 6 kurser', NULL, 1200, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (6, N'koskioppiaineetyleissivistava', N'B3', N'B3-kieli, väh. 6 kurssia', N'B3-språk, minst 6 kurser', NULL, 1300, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (7, N'koskioppiaineetyleissivistava', N'A1X', N'A-kieli, alle 6 kurssia', N'A-språk, under 6 kurser', NULL, 2000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (8, N'koskioppiaineetyleissivistava', N'A2X', N'A-kieli, alle 6 kurssia', N'A-språk, under 6 kurser', NULL, 2000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (9, N'koskioppiaineetyleissivistava', N'AX', N'A-kieli, alle 6 kurssia', N'A-språk, under 6 kurser', NULL, 2000, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (10, N'koskioppiaineetyleissivistava', N'B1X', N'B1-kieli, alle 5 kurssia', N'B1-språk, under 5 kurser', NULL, 2100, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (11, N'koskioppiaineetyleissivistava', N'B2X', N'B2-kieli, alle 6 kurssia', N'B2-språk, under 6 kurser', NULL, 2200, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (12, N'koskioppiaineetyleissivistava', N'B3X', N'B3-kieli, alle 6 kurssia', N'B3-språk, under 6 kurser', NULL, 2300, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (13, N'kielivalikoima', N'AR', N'arabia', N'arabiska', N'Arabic', 2701, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (14, N'kielivalikoima', N'EN', N'englanti', N'engelska', N'English', 2702, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (15, N'kielivalikoima', N'ES', N'espanja', N'spanska', N'Spanish', 2703, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (16, N'kielivalikoima', N'HE', N'heprea', N'hebreiska', N'Hebrew', 2704, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (17, N'kielivalikoima', N'IT', N'italia', N'italienska', N'Italian', 2705, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (18, N'kielivalikoima', N'JA', N'japani', N'japanska', N'Japanese', 2706, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (19, N'kielivalikoima', N'ZH', N'kiina', N'kinesiska', N'Chinese', 2707, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (20, N'kielivalikoima', N'KO', N'korea', N'koreanska', N'Korean', 2708, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (21, N'kielivalikoima', N'EL', N'kreikka', N'grekiska', N'Greek', 2709, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (22, N'kielivalikoima', N'KU', N'kurdi', N'kurdiska', N'Kurdish', 2710, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (23, N'kielivalikoima', N'LA', N'latina', N'latin', N'Latin', 2711, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (24, N'kielivalikoima', N'LV', N'latvia', N'lettiska', N'Latvian', 2712, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (25, N'kielivalikoima', N'LT', N'liettua', N'litauiska', N'Lithuanian', 2713, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (26, N'kielivalikoima', N'NE', N'nepali', N'nepali', N'Nepali', 2714, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (27, N'kielivalikoima', N'PT', N'portugali', N'portugisiska', N'Portuguese', 2715, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (28, N'kielivalikoima', N'PL', N'puola', N'polska', N'Polish', 2716, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (29, N'kielivalikoima', N'FR', N'ranska', N'franska', N'French', 2717, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (30, N'kielivalikoima', N'SV', N'ruotsi', N'svenska', N'Swedish', 2718, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (31, N'kielivalikoima', N'SE', N'saame', N'samiska', N'Sami', 2719, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (32, N'kielivalikoima', N'DE', N'saksa', N'tyska', N'German', 2720, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (33, N'kielivalikoima', N'FI', N'suomi', N'finska', N'Finnish', 2721, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (34, N'kielivalikoima', N'TH', N'thai', N'thai', N'Thai', 2722, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (35, N'kielivalikoima', N'TR', N'turkki', N'turkiska', N'Turkish', 2723, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (36, N'kielivalikoima', N'UK', N'ukraina', N'ukrainska', N'Ukrainian', 2724, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (37, N'kielivalikoima', N'HU', N'unkari', N'ungerska', N'Hungarian', 2725, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (38, N'kielivalikoima', N'RU', N'venäjä', N'ryska', N'Russian', 2726, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (39, N'kielivalikoima', N'VI', N'vietnam', N'vietnamesiska', N'Vietnamese', 2727, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (40, N'kielivalikoima', N'VK', N'viittomakieli', N'teckenspråk', N'Sign language', 2728, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (41, N'kielivalikoima', N'ET', N'viro', N'estniska', N'Estonian', 2729, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (42, N'kielivalikoima', N'XX', N'muu kieli', N'övrigt språk', N'Other languages', 2800, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (43, N'kielivalikoima', N'97', N'Ei suoritusta', N'Ej avlagd', NULL, 2900, N'kie', N'Kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (44, N'koskioppiaineetyleissivistava', N'MA', N'Matematiikka', N'Matematik', NULL, 3000, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (45, N'oppiainematematiikka', N'MAA', N'Matematiikka, pitkä oppimäärä', N'Matematik, lång lärokurs', NULL, 3100, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (46, N'oppiainematematiikka', N'MAB', N'Matematiikka, lyhyt oppimäärä', N'Matematik, kort lärokurs', NULL, 3200, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (47, N'oppiainematematiikka', N'MAY', N'Matematiikka, yhteinen opintokokonaisuus', N'Matematik, gemensam studiehelhet', NULL, 3300, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (48, N'koskioppiaineetyleissivistava', N'FY', N'Fysiikka', N'Fysik', NULL, 3400, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (49, N'koskioppiaineetyleissivistava', N'KE', N'Kemia', N'Kemi', NULL, 3500, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (50, N'koskioppiaineetyleissivistava', N'BI', N'Biologia', N'Biologi', NULL, 3600, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (51, N'koskioppiaineetyleissivistava', N'GE', N'Maantiede', N'Geografi', NULL, 3700, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (52, N'koskioppiaineetyleissivistava', N'YL', N'Ympäristöoppi', N'Omgivningslära', NULL, 3800, N'luo', N'Matematiikka ja luonnontieteet', NULL, NULL, 3)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (53, N'koskioppiaineetyleissivistava', N'FI', N'Filosofia', N'Filosofi', NULL, 5100, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (54, N'koskioppiaineetyleissivistava', N'PS', N'Psykologia', N'Psykologi', NULL, 5150, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (55, N'koskioppiaineetyleissivistava', N'TE', N'Terveystieto', N'Hälsokunskap', NULL, 5200, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (56, N'koskioppiaineetyleissivistava', N'HI', N'Historia', N'Historia', NULL, 5300, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (57, N'koskioppiaineetyleissivistava', N'YH', N'Yhteiskuntaoppi', N'Samhällslära', NULL, 5400, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (58, N'koskioppiaineetyleissivistava', N'KT', N'Uskonto', N'Religion', NULL, 5500, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (59, N'koskioppiaineetyleissivistava', N'ET', N'Elämänkatsomustieto', N'Livsåskådningskunskap', NULL, 5600, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (60, N'uskonnonoppimaara', N'EV', N'Evankelis-luterilainen uskonto', N'Evangelisk-luthersk tro', NULL, 5801, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (61, N'uskonnonoppimaara', N'IS', N'Islam', N'Islam', NULL, 5802, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (62, N'uskonnonoppimaara', N'JU', N'Juutalainen uskonto', N'Juutalainen uskonto', NULL, 5803, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (63, N'uskonnonoppimaara', N'KA', N'Katolinen uskonto', N'Katolinen uskonto', NULL, 5804, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (64, N'uskonnonoppimaara', N'OR', N'Ortodoksinen uskonto', N'Ortodox tro', NULL, 5805, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (65, N'uskonnonoppimaara', N'MU', N'Muut uskonnot', N'Andra religioner', NULL, 5900, N'hum', N'Humanistis-yhteiskunnalliset aineet', NULL, NULL, 5)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (66, N'koskioppiaineetyleissivistava', N'MU', N'Musiikki', N'Musik', NULL, 6400, N'tai', N'Taito- ja taideaineet', NULL, NULL, 6)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (67, N'koskioppiaineetyleissivistava', N'KU', N'Kuvataide', N'Bildkonst', NULL, 6500, N'tai', N'Taito- ja taideaineet', NULL, NULL, 6)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (68, N'koskioppiaineetyleissivistava', N'LI', N'Liikunta', N'Gymnastik', NULL, 6600, N'tai', N'Taito- ja taideaineet', NULL, NULL, 6)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (69, N'koskioppiaineetyleissivistava', N'AI', N'Äidinkieli ja kirjallisuus', N'Modersmålet och litteratur', NULL, 7000, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (70, N'koskioppiaineetyleissivistava', N'AOM', N'Äidinkielenomainen kieli', N'Äidinkielenomainen kieli', NULL, 7100, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (71, N'lukionmuutopinnot', N'OA', N'Oman äidinkielen opinnot', N'Studier i det egna modersmålet', NULL, 7200, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (72, N'oppiaineaidinkielijakirjallisuus', N'AI1', N'Suomen kieli ja kirjallisuus', N'Finska och litteratur', NULL, 7801, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (73, N'oppiaineaidinkielijakirjallisuus', N'AI2', N'Ruotsin kieli ja kirjallisuus', N'Svenska och litteratur', NULL, 7802, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (74, N'oppiaineaidinkielijakirjallisuus', N'AI3', N'Saamen kieli ja kirjallisuus', N'Samiska och litteratur', NULL, 7803, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (75, N'oppiaineaidinkielijakirjallisuus', N'AI4', N'Romanikieli ja kirjallisuus', N'Romani och litteratur', NULL, 7804, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (76, N'oppiaineaidinkielijakirjallisuus', N'AI5', N'Viittomakieli ja kirjallisuus', N'Teckenspråk och litteratur', NULL, 7805, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (77, N'oppiaineaidinkielijakirjallisuus', N'AI6', N'Muu oppilaan äidinkieli', N'Annat modersmål', NULL, 7806, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (78, N'oppiaineaidinkielijakirjallisuus', N'AI7', N'Suomi toisena kielenä ja kirjallisuus', N'Finska som andraspråk och litteratur', NULL, 7807, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (79, N'oppiaineaidinkielijakirjallisuus', N'AI8', N'Ruotsi toisena kielenä ja kirjallisuus', N'Svenska som andraspråk och litteratur', NULL, 7808, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (80, N'oppiaineaidinkielijakirjallisuus', N'AI9', N'Suomi saamenkielisille', N'Finska för samisktalande', NULL, 7809, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (81, N'oppiaineaidinkielijakirjallisuus', N'AI10', N'Ruotsi saamenkielisille', N'Svenska för samisktalande', NULL, 7810, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (82, N'oppiaineaidinkielijakirjallisuus', N'AI11', N'Suomi viittomakielisille', N'Finska för teckenspråkiga', NULL, 7811, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (83, N'oppiaineaidinkielijakirjallisuus', N'AI12', N'Ruotsi viittomakielisille', N'Svenska för teckenspråkiga', NULL, 7812, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (84, N'oppiaineaidinkielijakirjallisuus', N'AIAI', N'Suomen kieli, äidinkielenomainen suomi', N'Finska, modersmålsinriktad finska', NULL, 7815, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 7)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (85, N'lukionmuutopinnot', N'TO', N'Teemaopinnot', N'Temastudier', NULL, 9100, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (86, N'lukionmuutopinnot', N'LD', N'Lukiodiplomit', N'Gymnasiediplom', NULL, 9200, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (87, N'lukionmuutopinnot', N'TVK', N'Taiteiden väliset kurssit', N'Ämnesövergripande kurser i konststudier', NULL, 9300, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (88, N'lukionmuutopinnot', N'TVO', N'Taiteiden väliset kurssit', N'Ämnesövergripande kurser i konststudier', NULL, 9300, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (89, N'koskioppiaineetyleissivistava', N'KO', N'Kotitalous', N'Huslig ekonomi', NULL, 9701, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (90, N'koskioppiaineetyleissivistava', N'KS', N'Käsityö', N'Slöjd', NULL, 9702, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (91, N'koskioppiaineetyleissivistava', N'OP', N'Opinto-ohjaus', N'Elevhandledning', NULL, 9711, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (92, N'koskioppiaineetyleissivistava', N'OPA', N'Opinto-ohjaus ja työelämätaidot', N'Studiehandledning och handledning i arbetslivsfärdigheter', NULL, 9712, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (93, N'lukionmuutopinnot', N'MS', N'Muut suoritukset', N'Övriga prestationer', NULL, 9800, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma]) VALUES (94, N'koskioppiaineetyleissivistava', N'XX', N'Ei tiedossa', N'Okänd', N'Unknown', 9900, N'muu', N'Muut opinnot', NULL, NULL, 9)
GO
SET IDENTITY_INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] OFF
GO
