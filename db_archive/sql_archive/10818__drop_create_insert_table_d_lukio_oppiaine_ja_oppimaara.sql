USE [ANTERO]
GO
/****** Object:  Table [dw].[d_lukio_oppiaine_ja_oppimaara]    Script Date: 16.6.2025 10.55.37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_lukio_oppiaine_ja_oppimaara]') AND type in (N'U'))
DROP TABLE [dw].[d_lukio_oppiaine_ja_oppimaara]
GO
/****** Object:  Table [dw].[d_lukio_oppiaine_ja_oppimaara]    Script Date: 16.6.2025 10.55.37 ******/
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
	[kommentti] [varchar](50) NULL,
 CONSTRAINT [PK__d_lukio_oppiaine_ja_oppimaara] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ON 
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (1, N'koskioppiaineetyleissivistava', N'A', N'A-kieli, väh. 12 op / 6 kurssia', N'A-språk, minst 12 sp / 6 kurser', NULL, 2000, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (2, N'koskioppiaineetyleissivistava', N'A1', N'A-kieli, väh. 12 op / 6 kurssia', N'A-språk, minst 12 sp / 6 kurser', NULL, 2000, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (3, N'koskioppiaineetyleissivistava', N'A2', N'A-kieli, väh. 12 op / 6 kurssia', N'A-språk, minst 12 sp / 6 kurser', NULL, 2000, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (4, N'koskioppiaineetyleissivistava', N'B1', N'B1-kieli, väh. 10 op / 5 kurssia', N'B1-språk, minst 10 sp / 5 kurser', NULL, 2200, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (5, N'koskioppiaineetyleissivistava', N'B2', N'B2-kieli, väh. 6 op / 3 kurssia', N'B2-språk, minst 6 sp / 3 kurser', NULL, 2201, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (6, N'koskioppiaineetyleissivistava', N'B3', N'B3-kieli, väh. 6 op / 3 kurssia', N'B3-språk, minst 6 sp / 3 kurser', NULL, 2202, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (7, N'koskioppiaineetyleissivistava', N'A1X', N'A-kieli, alle 12 op / 6 kurssia', N'A-språk, under 12 sp / 6 kurser', NULL, 2100, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (8, N'koskioppiaineetyleissivistava', N'A2X', N'A-kieli, alle 12 op / 6 kurssia', N'A-språk, under 12 sp / 6 kurser', NULL, 2100, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (9, N'koskioppiaineetyleissivistava', N'AX', N'A-kieli, alle 12 op / 6 kurssia', N'A-språk, under 12 sp / 6 kurser', NULL, 2100, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (10, N'koskioppiaineetyleissivistava', N'B1X', N'B1-kieli, alle 10 op / 5 kurssia', N'B1-språk, under 10 sp / 5 kurser', NULL, 2300, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (11, N'koskioppiaineetyleissivistava', N'B2X', N'B2-kieli, alle 6 op / 3 kurssia', N'B2-språk, under 6 sp / 3 kurser', NULL, 2301, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (12, N'koskioppiaineetyleissivistava', N'B3X', N'B3-kieli, alle 6 op / 3 kurssia', N'B3-språk, under 6 sp / 3 kurser', NULL, 2302, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (13, N'kielivalikoima', N'AF', N'afrikaans', N'afrikaans', N'afrikaans', 2601, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (14, N'kielivalikoima', N'SQ', N'albania', N'albanska', N'Albanian', 2602, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (15, N'kielivalikoima', N'AM', N'amhara', N'amhariska', N'Amharic', 2603, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (16, N'kielivalikoima', N'AR', N'arabia', N'arabiska', N'Arabic', 2604, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (17, N'kielivalikoima', N'HY', N'armenia', N'armeniska', N'Armenian', 2605, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (18, N'kielivalikoima', N'AZ', N'azeri', N'azerbajdzjanska', N'Azerbaijani', 2606, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (19, N'kielivalikoima', N'BN', N'bengali', N'bengali', N'Bengali, Bangla', 2607, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (20, N'kielivalikoima', N'BS', N'bosnia', N'bosniska', N'Bosnian', 2608, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (21, N'kielivalikoima', N'BG', N'bulgaria', N'bulgariska', N'Bulgarian', 2609, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (22, N'kielivalikoima', N'PRS', N'Dari', N'Dari', N'Dari', 2610, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (23, N'kielivalikoima', N'EN', N'englanti', N'engelska', N'English', 2611, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (24, N'kielivalikoima', N'ES', N'espanja', N'spanska', N'Spanish', 2612, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (25, N'kielivalikoima', N'ST', N'eteläsotho', N'sotho', N'Sesotho, Southern Sotho', 2613, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (26, N'kielivalikoima', N'fil', N'filipino', N'filipino', NULL, 2614, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (27, N'kielivalikoima', N'KA', N'georgia', N'georgiska', N'Georgian', 2615, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (28, N'kielivalikoima', N'HE', N'heprea', N'hebreiska', N'Hebrew', 2616, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (29, N'kielivalikoima', N'HI', N'hindi', N'hindi', N'Hindi', 2617, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (30, N'kielivalikoima', N'NL', N'hollanti', N'holländska', N'Dutch', 2618, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (31, N'kielivalikoima', N'IG', N'igbo', N'ibo', N'Igbo', 2619, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (32, N'kielivalikoima', N'ID', N'indonesia', N'indonesiska', N'Indonesian', 2620, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (33, N'kielivalikoima', N'IS', N'islanti', N'isländska', N'Icelandic', 2621, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (34, N'kielivalikoima', N'IT', N'italia', N'italienska', N'Italian', 2622, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (35, N'kielivalikoima', N'JA', N'japani', N'japanska', N'Japanese', 2623, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (36, N'kielivalikoima', N'YO', N'joruba', N'joruba', N'Yoruba', 2624, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (37, N'kielivalikoima', N'YUE', N'kantoninkiina', N'kantonesiska', N'Yue Chinese', 2625, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (38, N'kielivalikoima', N'CA', N'katalaani', N'katalanska', N'Catalan', 2626, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (39, N'kielivalikoima', N'KM', N'keskikhmer', N'khmeriska, kambodjanska', N'Cambodian, Khmer', 2627, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (40, N'koskioppiaineetyleissivistava', N'MA', N'Matematiikka', N'Matematik', NULL, 3000, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (41, N'oppiainematematiikka', N'MAA', N'Matematiikka, pitkä oppimäärä', N'Matematik, lång lärokurs', NULL, 3100, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (42, N'oppiainematematiikka', N'MAB', N'Matematiikka, lyhyt oppimäärä', N'Matematik, kort lärokurs', NULL, 3200, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (43, N'oppiainematematiikka', N'MAY', N'Matematiikka, yhteinen opintokokonaisuus', N'Matematik, gemensam studiehelhet', NULL, 3300, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (44, N'koskioppiaineetyleissivistava', N'FY', N'Fysiikka', N'Fysik', NULL, 3400, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (45, N'koskioppiaineetyleissivistava', N'KE', N'Kemia', N'Kemi', NULL, 3500, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (46, N'koskioppiaineetyleissivistava', N'BI', N'Biologia', N'Biologi', NULL, 3600, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (47, N'koskioppiaineetyleissivistava', N'GE', N'Maantiede', N'Geografi', NULL, 3700, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (48, N'koskioppiaineetyleissivistava', N'YL', N'Ympäristöoppi', N'Omgivningslära', NULL, 3800, N'luo', N'Matematiikka ja luonnontieteet', N'Matematik och naturvetenskaper', NULL, 3, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (49, N'koskioppiaineetyleissivistava', N'FI', N'Filosofia', N'Filosofi', NULL, 5100, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (50, N'koskioppiaineetyleissivistava', N'PS', N'Psykologia', N'Psykologi', NULL, 5150, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (51, N'koskioppiaineetyleissivistava', N'TE', N'Terveystieto', N'Hälsokunskap', NULL, 5200, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (52, N'koskioppiaineetyleissivistava', N'HI', N'Historia', N'Historia', NULL, 5300, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (53, N'koskioppiaineetyleissivistava', N'YH', N'Yhteiskuntaoppi', N'Samhällslära', NULL, 5400, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (54, N'koskioppiaineetyleissivistava', N'KT', N'Uskonto', N'Religion', NULL, 5510, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (55, N'koskioppiaineetyleissivistava', N'ET', N'Elämänkatsomustieto', N'Livsåskådningskunskap', NULL, 5520, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (56, N'uskonnonoppimaara', N'EV', N'Evankelisluterilainen uskonto', N'Evangelisk-luthersk religion', NULL, 5803, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (57, N'uskonnonoppimaara', N'IS', N'Islamin uskonto', N'Islamisk religion', NULL, 5806, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (58, N'uskonnonoppimaara', N'JU', N'Juutalainen uskonto', N'Judisk religion', NULL, 5807, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (59, N'uskonnonoppimaara', N'KA', N'Katolinen uskonto', N'Katolsk religion', NULL, 5805, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (60, N'uskonnonoppimaara', N'OR', N'Ortodoksinen uskonto', N'Ortodox religion', NULL, 5804, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (61, N'uskonnonoppimaara', N'MU', N'Muut uskonnot', N'Övriga religioner', NULL, 5900, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (62, N'koskioppiaineetyleissivistava', N'MU', N'Musiikki', N'Musik', NULL, 6400, N'tai', N'Taito- ja taideaineet', N'Konst- och färdighetsämnen', NULL, 6, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (63, N'koskioppiaineetyleissivistava', N'KU', N'Kuvataide', N'Bildkonst', NULL, 6500, N'tai', N'Taito- ja taideaineet', N'Konst- och färdighetsämnen', NULL, 6, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (64, N'koskioppiaineetyleissivistava', N'LI', N'Liikunta', N'Gymnastik', NULL, 6600, N'tai', N'Taito- ja taideaineet', N'Konst- och färdighetsämnen', NULL, 6, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (65, N'koskioppiaineetyleissivistava', N'AI', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 1000, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (66, N'koskioppiaineetyleissivistava', N'AOM', N'Äidinkielenomainen oppimäärä, väh. 12 op / 6 kurssia', N'Modersmålsinriktad lärokurs, minst 12 sp / 6 kurser', NULL, 2150, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, N'selite laajuuden osalta manuaalisesti lisätty')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (67, N'lukionmuutopinnot', N'OA', N'Oman äidinkielen opinnot', N'Studier i det egna modersmålet', NULL, 9050, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (68, N'oppiaineaidinkielijakirjallisuus', N'AI1', N'Suomen kieli ja kirjallisuus', N'Finska och litteratur', NULL, 1801, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (69, N'oppiaineaidinkielijakirjallisuus', N'AI2', N'Ruotsin kieli ja kirjallisuus', N'Svenska och litteratur', NULL, 1802, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (70, N'oppiaineaidinkielijakirjallisuus', N'AI3', N'Saamen kieli ja kirjallisuus', N'Samiska och litteratur', NULL, 1803, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (71, N'oppiaineaidinkielijakirjallisuus', N'AI4', N'Romanikieli ja kirjallisuus', N'Romani och litteratur', NULL, 1804, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (72, N'oppiaineaidinkielijakirjallisuus', N'AI5', N'Viittomakieli ja kirjallisuus', N'Teckenspråk och litteratur', NULL, 1805, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (73, N'oppiaineaidinkielijakirjallisuus', N'AI6', N'Muu opiskelijan äidinkieli ja kirjallisuus', N'Annat modersmål', NULL, 1813, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, N'selite manuaalisesti muutettu')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (74, N'oppiaineaidinkielijakirjallisuus', N'AI7', N'Suomi toisena kielenä ja kirjallisuus', N'Finska som andraspråk och litteratur', NULL, 1807, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (75, N'oppiaineaidinkielijakirjallisuus', N'AI8', N'Ruotsi toisena kielenä ja kirjallisuus', N'Svenska som andraspråk och litteratur', NULL, 1808, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (76, N'oppiaineaidinkielijakirjallisuus', N'AI9', N'Suomi saamenkielisille', N'Finska för samisktalande', NULL, 1809, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (77, N'oppiaineaidinkielijakirjallisuus', N'AI10', N'Ruotsi saamenkielisille', N'Svenska för samisktalande', NULL, 1810, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (78, N'oppiaineaidinkielijakirjallisuus', N'AI11', N'Suomi viittomakielisille', N'Finska för teckenspråkiga', NULL, 1811, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (79, N'oppiaineaidinkielijakirjallisuus', N'AI12', N'Ruotsi viittomakielisille', N'Svenska för teckenspråkiga', NULL, 1812, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (80, N'oppiaineaidinkielijakirjallisuus', N'AIAI', N'Suomen kieli, äidinkielenomainen suomi', N'Finska, modersmålsinriktad finska', NULL, 1815, N'aid', N'Äidinkieli ja kirjallisuus', N'Modersmål och litteratur', NULL, 0, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (81, N'lukionmuutopinnot', N'TO', N'Teemaopinnot', N'Temastudier', NULL, 9100, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (82, N'lukionmuutopinnot', N'LD', N'Lukiodiplomit', N'Gymnasiediplom', NULL, 9200, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (83, N'lukionmuutopinnot', N'TVK', N'Taiteiden väliset kurssit', N'Ämnesövergripande kurser i konststudier', NULL, 9300, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (84, N'lukionmuutopinnot', N'TVO', N'Taiteiden väliset kurssit', N'Ämnesövergripande kurser i konststudier', NULL, 9300, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (85, N'koskioppiaineetyleissivistava', N'KO', N'Kotitalous', N'Huslig ekonomi', NULL, 9701, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (86, N'koskioppiaineetyleissivistava', N'KS', N'Käsityö', N'Slöjd', NULL, 9702, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (87, N'koskioppiaineetyleissivistava', N'OP', N'Opinto-ohjaus', N'Elevhandledning', NULL, 8000, N'opo', N'Opinto-ohjaus', N'Elevhandledning', NULL, 8, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (88, N'koskioppiaineetyleissivistava', N'OPA', N'Opinto-ohjaus ja työelämätaidot', N'Studiehandledning och handledning i arbetslivsfärdigheter', NULL, 8100, N'opo', N'Opinto-ohjaus', N'Elevhandledning', NULL, 8, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (89, N'lukionmuutopinnot', N'MS', N'Muut suoritukset', N'Övriga prestationer', NULL, 9800, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (90, N'koskioppiaineetyleissivistava', N'XX', N'Ei tiedossa', N'Okänd', N'Unknown', 9900, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (91, N'koskioppiaineetyleissivistava', N'KT/ET', N'Uskonto, Elämänkatsomustieto', N'Uskonto, Elämänkatsomustieto', NULL, 5500, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (92, N'manuaalinen', N'OA', N'Oman äidinkielen opinnot', N'Oman äidinkielen opinnot', NULL, 9050, N'muu', N'Muut opinnot', N'Övriga studier', NULL, 9, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (93, N'kielivalikoima', N'ZH', N'kiina', N'kinesiska', N'Chinese', 2628, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (94, N'kielivalikoima', N'KO', N'korea', N'koreanska', N'Korean', 2629, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (95, N'kielivalikoima', N'EL', N'kreikka', N'grekiska', N'Greek', 2630, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (96, N'kielivalikoima', N'HR', N'kroatia', N'kroatiska', N'Croatian', 2631, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (97, N'kielivalikoima', N'KU', N'kurdi', N'kurdiska', N'Kurdish', 2632, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (98, N'kielivalikoima', N'LA', N'latina', N'latin', N'Latin', 2633, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (99, N'kielivalikoima', N'LV', N'latvia', N'lettiska', N'Latvian', 2634, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (100, N'kielivalikoima', N'LT', N'liettua', N'litauiska', N'Lithuanian', 2635, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (101, N'kielivalikoima', N'MK', N'makedonia', N'makedonska', N'Macedonian', 2636, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (102, N'kielivalikoima', N'MS', N'malaiji', N'malajiska', N'Malay', 2637, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (103, N'kielivalikoima', N'CMN', N'mandariinikiina', N'mandarin', N'Mandarin Chinese', 2638, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (104, N'kielivalikoima', N'MN', N'mongoli', N'mongoliska', N'Mongolian', 2639, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (105, N'kielivalikoima', N'NE', N'nepali', N'nepali', N'Nepali', 2640, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (106, N'kielivalikoima', N'NO', N'norja', N'norska', N'Norwegian', 2641, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (107, N'kielivalikoima', N'PS', N'paštu, myös: afgaani', N'pashto', N'Pashto, Pushto', 2642, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (108, N'kielivalikoima', N'FA', N'persia, farsi', N'persiska', N'Persian, Farsi', 2643, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (109, N'kielivalikoima', N'PT', N'portugali', N'portugisiska', N'Portuguese', 2644, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (110, N'kielivalikoima', N'PL', N'puola', N'polska', N'Polish', 2645, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (111, N'kielivalikoima', N'FR', N'ranska', N'franska', N'French', 2646, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (112, N'kielivalikoima', N'RI', N'romani', N'romani', N'Romani', 2647, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (113, N'kielivalikoima', N'RO', N'romania', N'rumänska', N'Romanian', 2648, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (114, N'kielivalikoima', N'RW', N'ruanda', N'kinyarwanda', N'Kinyarwanda, Rwanda', 2649, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (115, N'kielivalikoima', N'SV', N'ruotsi', N'svenska', N'Swedish', 2510, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (116, N'kielivalikoima', N'XAI8', N'ruotsi toisena kielenä', N'svenska som andraspråk', N'Swedish as a second language', 2511, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (117, N'kielivalikoima', N'XAI12', N'ruotsi viittomakielisille', N'svenska för teckenspråkiga', N'Swedish for sign language users', 2512, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (118, N'kielivalikoima', N'SE', N'saame', N'samiska', N'Northern Sami', 2653, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (119, N'kielivalikoima', N'DE', N'saksa', N'tyska', N'German', 2654, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (120, N'kielivalikoima', N'SR', N'serbia', N'serbiska', N'Serbian', 2655, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (121, N'kielivalikoima', N'SH', N'serbokroatia', N'serbokroatiska', N'Serbo-Croatian', 2656, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (122, N'kielivalikoima', N'SI', N'sinhala', N'singalesiska', N'Sinhala; Sinhalese; Singhalese', 2657, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (123, N'kielivalikoima', N'SK', N'slovakki', N'slovakiska', N'Slovak', 2658, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (124, N'kielivalikoima', N'SL', N'sloveeni', N'slovenska', N'Slovenian', 2659, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (125, N'kielivalikoima', N'SO', N'somali', N'somaliska', N'Somali', 2660, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (126, N'koskioppiaineetyleissivistava', N'AOMX', N'Äidinkielenomainen oppimäärä, alle 12 op / 6 kurssia', N'Modersmålsinriktad lärokurs, under 12 sp / 6 kurser', NULL, 2160, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, N'koodi ja selite keksitty laajuuden erottelemiseksi')
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (127, N'kielivalikoima', N'SW', N'suahili', N'swahili', N'Swahili, Kiswahili', 2661, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (128, N'kielivalikoima', N'FI', N'suomi', N'finska', N'Finnish', 2502, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (129, N'kielivalikoima', N'XAI7', N'suomi toisena kielenä', N'finska som andraspråk', N'Finnish as a second language', 2503, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (130, N'kielivalikoima', N'XAI11', N'suomi viittomakielisille', N'finska för teckenspråkiga', N'Finnish for sign language users', 2504, N'toi', N'Toinen kotimainen kieli', N'Det andra inhemska språket', NULL, 1, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (131, N'kielivalikoima', N'SS', N'swazi', N'swazi', N'Siswati, Swazi, Swati', 2665, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (132, N'kielivalikoima', N'TL', N'tagalog', N'tagalog', N'Tagalog', 2666, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (133, N'kielivalikoima', N'TA', N'tamili', N'tamili', N'Tamil', 2667, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (134, N'kielivalikoima', N'DA', N'tanska', N'danska', N'Danish', 2668, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (135, N'kielivalikoima', N'TT', N'tataari', N'tatariska', N'Tatar', 2669, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (136, N'kielivalikoima', N'TH', N'thai', N'thai', NULL, 2670, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (137, N'kielivalikoima', N'TI', N'tigrinja', N'tigrinja', N'Tigrinya', 2671, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (138, N'kielivalikoima', N'CS', N'tšekki', N'tjeckiska', N'Czech', 2672, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (139, N'kielivalikoima', N'TR', N'turkki', N'turkiska', N'Turkish', 2673, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (140, N'kielivalikoima', N'UG', N'uiguuri', N'uiguriska', N'Uighur', 2674, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (141, N'kielivalikoima', N'UK', N'ukraina', N'ukrainska', N'Ukrainian', 2675, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (142, N'kielivalikoima', N'HU', N'unkari', N'ungerska', N'Hungarian', 2676, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (143, N'kielivalikoima', N'UR', N'urdu', N'urdu', N'Urdu', 2677, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (144, N'kielivalikoima', N'RU', N'venäjä', N'ryska', N'Russian', 2678, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (145, N'kielivalikoima', N'VI', N'vietnam', N'vietnamesiska', N'Vietnamese', 2679, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (146, N'kielivalikoima', N'VK', N'viittomakieli', N'teckenspråk', N'Sign language', 2680, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (147, N'kielivalikoima', N'ET', N'viro', N'estniska', N'Estonian', 2681, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (148, N'kielivalikoima', N'XX', N'muu kieli', N'övrigt språk', N'Other languages', 2700, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (149, N'kielivalikoima', N'KX', N'muu kieli', N'övrigt språk', N'Other languages', 2700, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (150, N'kielivalikoima', N'97', N'Ei suoritusta', N'Ej avlagd', NULL, 2800, N'kie', N'Vieraat kielet', N'Främmande språk', NULL, 2, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (151, N'uskonnonoppimaara', N'BU', N'Buddhalainen uskonto', N'Buddhistisk religion', NULL, 5809, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (152, N'uskonnonoppimaara', N'BA', N'Bahá’í-uskonto', N'Bahá’í-religion', NULL, 5808, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [kommentti]) VALUES (153, N'uskonnonoppimaara', N'KR', N'Krishna-uskonto', N'Krishna-religion', NULL, 5810, N'hum', N'Humanistis-yhteiskunnalliset aineet', N'Humanistiska och samhällsvetenskapliga ämnen', NULL, 5, NULL)
GO
SET IDENTITY_INSERT [dw].[d_lukio_oppiaine_ja_oppimaara] OFF
GO
