USE [ANTERO]
GO
/****** Object:  Table [dw].[d_perusopetus_oppiaine_ja_oppimaara]    Script Date: 20.12.2021 9:27:46 ******/
DROP TABLE IF EXISTS [dw].[d_perusopetus_oppiaine_ja_oppimaara]
GO
/****** Object:  Table [dw].[d_perusopetus_oppiaine_ja_oppimaara]    Script Date: 20.12.2021 9:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_perusopetus_oppiaine_ja_oppimaara](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodisto] [nvarchar](100) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[ryhma_koodi] [nvarchar](10) NOT NULL,
	[ryhma_nimi] [nvarchar](50) NULL,
	[ryhma_nimi_sv] [nvarchar](50) NULL,
	[ryhma_nimi_en] [nvarchar](50) NULL,
	[jarjestys_ryhma] [int] NULL,
	[ryhma2_koodi] [nvarchar](10) NOT NULL,
	[ryhma2_nimi] [nvarchar](50) NULL,
	[ryhma2_nimi_sv] [nvarchar](50) NULL,
	[ryhma2_nimi_en] [nvarchar](50) NULL,
	[jarjestys_ryhma2] [int] NULL,
 CONSTRAINT [PK__d_perusopetus_oppiaine_ja_oppimaara] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ON 

GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (1, N'koskioppiaineetyleissivistava', N'AI', N'Äidinkieli ja kirjallisuus', N'Modersmålet och litteratur', NULL, N'0000', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (2, N'koskioppiaineetyleissivistava', N'AOM', N'Äidinkielenomainen kieli', N'Äidinkielenomainen kieli', NULL, N'0100', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (3, N'oppiaineaidinkielijakirjallisuus', N'AI1', N'Suomen kieli ja kirjallisuus', N'Finska och litteratur', NULL, N'0801', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (4, N'oppiaineaidinkielijakirjallisuus', N'AI2', N'Ruotsin kieli ja kirjallisuus', N'Svenska och litteratur', NULL, N'0802', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (5, N'oppiaineaidinkielijakirjallisuus', N'AI3', N'Saamen kieli ja kirjallisuus', N'Samiska och litteratur', NULL, N'0803', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (6, N'oppiaineaidinkielijakirjallisuus', N'AI4', N'Romanikieli ja kirjallisuus', N'Romani och litteratur', NULL, N'0804', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (7, N'oppiaineaidinkielijakirjallisuus', N'AI5', N'Viittomakieli ja kirjallisuus', N'Teckenspråk och litteratur', NULL, N'0805', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (8, N'oppiaineaidinkielijakirjallisuus', N'AI6', N'Muu oppilaan äidinkieli', N'Annat modersmål', NULL, N'0806', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (9, N'oppiaineaidinkielijakirjallisuus', N'AI7', N'Suomi toisena kielenä ja kirjallisuus', N'Finska som andraspråk och litteratur', NULL, N'0807', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (10, N'oppiaineaidinkielijakirjallisuus', N'AI8', N'Ruotsi toisena kielenä ja kirjallisuus', N'Svenska som andraspråk och litteratur', NULL, N'0808', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (11, N'oppiaineaidinkielijakirjallisuus', N'AI9', N'Suomi saamenkielisille', N'Finska för samisktalande', NULL, N'0809', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (12, N'oppiaineaidinkielijakirjallisuus', N'AI10', N'Ruotsi saamenkielisille', N'Svenska för samisktalande', NULL, N'0810', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (13, N'oppiaineaidinkielijakirjallisuus', N'AI11', N'Suomi viittomakielisille', N'Finska för teckenspråkiga', NULL, N'0811', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (14, N'oppiaineaidinkielijakirjallisuus', N'AI12', N'Ruotsi viittomakielisille', N'Svenska för teckenspråkiga', NULL, N'0812', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (15, N'oppiaineaidinkielijakirjallisuus', N'AIAI', N'Suomen kieli, äidinkielenomainen suomi', N'Finska, modersmålsinriktad finska', NULL, N'0815', N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0, N'aid', N'Äidinkieli ja kirjallisuus', NULL, NULL, 0)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (16, N'koskioppiaineetyleissivistava', N'HI', N'Historia', N'Historia', NULL, N'5300', N'his', N'Historia, Yhteiskuntaoppi', NULL, NULL, 5, N'his', N'Historia, Yhteiskuntaoppi', NULL, NULL, 5)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (17, N'koskioppiaineetyleissivistava', N'YH', N'Yhteiskuntaoppi', N'Samhällslära', NULL, N'5400', N'his', N'Historia, Yhteiskuntaoppi', NULL, NULL, 5, N'his', N'Historia, Yhteiskuntaoppi', NULL, NULL, 5)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (18, N'koskioppiaineetyleissivistava', N'A', N'A-kieli', N'A-språk', NULL, N'1000', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (19, N'koskioppiaineetyleissivistava', N'A1', N'A1-kieli', N'A1-språk', NULL, N'1010', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (20, N'koskioppiaineetyleissivistava', N'A2', N'A2-kieli', N'A2-språk', NULL, N'1020', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (21, N'koskioppiaineetyleissivistava', N'B1', N'B1-kieli', N'B1-språk', NULL, N'1100', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (22, N'koskioppiaineetyleissivistava', N'B2', N'B2-kieli', N'B2-språk', NULL, N'1110', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (23, N'koskioppiaineetyleissivistava', N'B3', N'B3-kieli', N'B3-språk', NULL, N'1120', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (24, N'kielivalikoima', N'AR', N'arabia', N'arabiska', N'Arabic', N'2701', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (25, N'kielivalikoima', N'EN', N'englanti', N'engelska', N'English', N'2702', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (26, N'kielivalikoima', N'ES', N'espanja', N'spanska', N'Spanish', N'2703', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (27, N'kielivalikoima', N'HE', N'heprea', N'hebreiska', N'Hebrew', N'2704', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (28, N'kielivalikoima', N'IT', N'italia', N'italienska', N'Italian', N'2705', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (29, N'kielivalikoima', N'JA', N'japani', N'japanska', N'Japanese', N'2706', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (30, N'kielivalikoima', N'ZH', N'kiina', N'kinesiska', N'Chinese', N'2707', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (31, N'kielivalikoima', N'KO', N'korea', N'koreanska', N'Korean', N'2708', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (32, N'kielivalikoima', N'EL', N'kreikka', N'grekiska', N'Greek', N'2709', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (33, N'kielivalikoima', N'KU', N'kurdi', N'kurdiska', N'Kurdish', N'2710', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (34, N'kielivalikoima', N'LA', N'latina', N'latin', N'Latin', N'2711', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (35, N'kielivalikoima', N'LV', N'latvia', N'lettiska', N'Latvian', N'2712', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (36, N'kielivalikoima', N'LT', N'liettua', N'litauiska', N'Lithuanian', N'2713', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (37, N'kielivalikoima', N'NE', N'nepali', N'nepali', N'Nepali', N'2714', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (38, N'kielivalikoima', N'PT', N'portugali', N'portugisiska', N'Portuguese', N'2715', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (39, N'kielivalikoima', N'PL', N'puola', N'polska', N'Polish', N'2716', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (40, N'kielivalikoima', N'FR', N'ranska', N'franska', N'French', N'2717', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (41, N'kielivalikoima', N'SE', N'saame', N'samiska', N'Sami', N'2719', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (42, N'kielivalikoima', N'DE', N'saksa', N'tyska', N'German', N'2720', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (43, N'kielivalikoima', N'TH', N'thai', N'thai', N'Thai', N'2722', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (44, N'kielivalikoima', N'TR', N'turkki', N'turkiska', N'Turkish', N'2723', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (45, N'kielivalikoima', N'UK', N'ukraina', N'ukrainska', N'Ukrainian', N'2724', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (46, N'kielivalikoima', N'HU', N'unkari', N'ungerska', N'Hungarian', N'2725', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (47, N'kielivalikoima', N'RU', N'venäjä', N'ryska', N'Russian', N'2726', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (48, N'kielivalikoima', N'VI', N'vietnam', N'vietnamesiska', N'Vietnamese', N'2727', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (49, N'kielivalikoima', N'VK', N'viittomakieli', N'teckenspråk', N'Sign language', N'2728', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (50, N'kielivalikoima', N'ET', N'viro', N'estniska', N'Estonian', N'2729', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (51, N'kielivalikoima', N'XX', N'muu kieli', N'övrigt språk', N'Other languages', N'2800', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (52, N'kielivalikoima', N'97', N'Ei suoritusta', N'Ej avlagd', NULL, N'2900', N'kie', N'Kielet', NULL, NULL, 2, N'kie', N'Vieraat kielet', NULL, NULL, 2)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (53, N'koskioppiaineetyleissivistava', N'MA', N'Matematiikka', N'Matematik', NULL, N'3000', N'mat', N'Matematiikka', NULL, NULL, 3, N'mat', N'Matematiikka', NULL, NULL, 3)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (54, N'koskioppiaineetyleissivistava', N'XX', N'Ei tiedossa', N'Okänd', N'Unknown', N'9900', N'muu', N'Ei tiedossa', NULL, NULL, 9, N'muu', N'Ei tiedossa', NULL, NULL, 9)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (55, N'koskioppiaineetyleissivistava', N'OP', N'Oppilaanohjaus', N'Elevhandledning', NULL, N'9711', N'opo', N'Oppilaanohjaus', NULL, NULL, 8, N'opo', N'Oppilaanohjaus', NULL, NULL, 8)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (56, N'koskioppiaineetyleissivistava', N'OPA', N'Oppilaanohjaus', N'Studiehandledning och handledning i arbetslivsfärdigheter', NULL, N'9712', N'opo', N'Oppilaanohjaus', NULL, NULL, 8, N'opo', N'Oppilaanohjaus', NULL, NULL, 8)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (57, N'koskioppiaineetyleissivistava', N'MU', N'Musiikki', N'Musik', NULL, N'6400', N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7, N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (58, N'koskioppiaineetyleissivistava', N'KU', N'Kuvataide', N'Bildkonst', NULL, N'6500', N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7, N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (59, N'koskioppiaineetyleissivistava', N'LI', N'Liikunta', N'Gymnastik', NULL, N'6600', N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7, N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (60, N'koskioppiaineetyleissivistava', N'KO', N'Kotitalous', N'Huslig ekonomi', NULL, N'6700', N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7, N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (61, N'koskioppiaineetyleissivistava', N'KS', N'Käsityö', N'Slöjd', NULL, N'6800', N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7, N'tai', N'Taide- ja taitoaineet', NULL, NULL, 7)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (62, N'kielivalikoima', N'SV', N'ruotsi', N'svenska', N'Swedish', N'2718', N'kie', N'Kielet', NULL, NULL, 2, N'toi', N'Toinen kotimainen kieli', NULL, NULL, 1)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (63, N'kielivalikoima', N'FI', N'suomi', N'finska', N'Finnish', N'2721', N'kie', N'Kielet', NULL, NULL, 2, N'toi', N'Toinen kotimainen kieli', NULL, NULL, 1)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (64, N'koskioppiaineetyleissivistava', N'KT', N'Uskonto', N'Religion', NULL, N'5500', N'usk', N'Uskonto, Elämänkatsomustieto', NULL, NULL, 6, N'usk', N'Uskonto, Elämänkatsomustieto', NULL, NULL, 6)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (65, N'koskioppiaineetyleissivistava', N'ET', N'Elämänkatsomustieto', N'Livsåskådningskunskap', NULL, N'5600', N'usk', N'Uskonto, Elämänkatsomustieto', NULL, NULL, 6, N'usk', N'Uskonto, Elämänkatsomustieto', NULL, NULL, 6)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (66, N'koskioppiaineetyleissivistava', N'FY', N'Fysiikka', N'Fysik', NULL, N'3400', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (67, N'koskioppiaineetyleissivistava', N'KE', N'Kemia', N'Kemi', NULL, N'3500', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (68, N'koskioppiaineetyleissivistava', N'BI', N'Biologia', N'Biologi', NULL, N'3600', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (69, N'koskioppiaineetyleissivistava', N'GE', N'Maantieto', N'Geografi', NULL, N'3700', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (70, N'koskioppiaineetyleissivistava', N'YL', N'Ympäristöoppi', N'Omgivningslära', NULL, N'3800', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] ([id], [koodisto], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [ryhma_koodi], [ryhma_nimi], [ryhma_nimi_sv], [ryhma_nimi_en], [jarjestys_ryhma], [ryhma2_koodi], [ryhma2_nimi], [ryhma2_nimi_sv], [ryhma2_nimi_en], [jarjestys_ryhma2]) VALUES (71, N'koskioppiaineetyleissivistava', N'TE', N'Terveystieto', N'Hälsokunskap', NULL, N'3900', N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4, N'ymp', N'Ympäristö- ja luonnontietoaineet', NULL, NULL, 4)
GO
SET IDENTITY_INSERT [dw].[d_perusopetus_oppiaine_ja_oppimaara] OFF
GO
