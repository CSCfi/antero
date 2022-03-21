USE [ANTERO]
GO

IF (OBJECT_ID(N'dw.d_vuosiluokka_tai_koulutus', N'U') IS NOT NULL)
BEGIN
ALTER TABLE [dw].[d_vuosiluokka_tai_koulutus] DROP CONSTRAINT [DF_d_vuosiluokka_username]
ALTER TABLE [dw].[d_vuosiluokka_tai_koulutus] DROP CONSTRAINT [DF_d_vuosiluokka_loadtime]
DROP TABLE [dw].[d_vuosiluokka_tai_koulutus]
END
;

/****** Object:  Table [dw].[d_vuosiluokka_tai_koulutus]    Script Date: 31.8.2021 21:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_vuosiluokka_tai_koulutus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[vuosiluokka_fi] [varchar](255) NULL,
	[vuosiluokka_sv] [varchar](255) NULL,
	[vuosiluokka_en] [varchar](255) NULL,
	[vuosiluokkaryhma_fi] [varchar](255) NULL,
	[vuosiluokkaryhma_sv] [varchar](255) NULL,
	[vuosiluokkaryhma_en] [varchar](255) NULL,
	[koulutus_fi] [varchar](255) NULL,
	[koulutus_sv] [varchar](255) NULL,
	[koulutus_en] [varchar](255) NULL,
	[jarjestys_vuosiluokka] [int] NULL,
	[jarjestys_vuosiluokkaryhma] [int] NULL,
	[jarjestys_koulutus] [int] NULL,
	[kommentti] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_vuosiluokka] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_vuosiluokka_tai_koulutus] ON 

GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', N'Tieto puuttuu', N'Information saknas', N'Missing data', N'Tieto puuttuu', N'Information saknas', N'Missing data', 99, 99, 99, N'', CAST(N'2021-03-16T20:03:00.060' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (26, N'001102', N'Varhaiskasvatuksen yhteydessä annettava esiopetus', N'Förskoleundervisning som ges i anknytning till småbarnspedagogiken', N'Pre-primary education in ECEC centres', N'Varhaiskasvatuksen yhteydessä annettava esiopetus', N'Förskoleundervisning som ges i anknytning till småbarnspedagogiken', N'Pre-primary education in ECEC centres', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', 11, 11, 10, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (27, N'001101', N'Opetustoimen yhteydessä annettava esiopetus', N'Förskoleundervisning som ges i anknytning till undervisningsväsendet', N'Pre-primary education in schools', N'Opetustoimen yhteydessä annettava esiopetus', N'Förskoleundervisning som ges i anknytning till undervisningsväsendet', N'Pre-primary education in schools', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', 12, 12, 10, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (28, N'201101', N'Perusopetuksen oppimäärä', N'Grundläggande utbildningens lärokurs', N'Basic education syllabus', N'Perusopetuksen oppimäärä', N'Grundläggande utbildningens lärokurs', N'Basic education syllabus', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 30, 30, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (29, N'1', N'1. vuosiluokka', N'Årskurs 1', N'Grade 1', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 21, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (30, N'2', N'2. vuosiluokka', N'Årskurs 2', N'Grade 2', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 22, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (31, N'3', N'3. vuosiluokka', N'Årskurs 3', N'Grade 3', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 23, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (32, N'4', N'4. vuosiluokka', N'Årskurs 4', N'Grade 4', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 24, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (33, N'5', N'5. vuosiluokka', N'Årskurs 5', N'Grade 5', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 25, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (34, N'6', N'6. vuosiluokka', N'Årskurs 6', N'Grade 6', N'Vuosiluokat 1–6', N'Årskurserna 1–6', N'Grades 1–6', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 26, 21, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (35, N'7', N'7. vuosiluokka', N'Årskurs 7', N'Grade 7', N'Vuosiluokat 7–9', N'Årskurserna 7–9', N'Grades 7–9', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 27, 27, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (36, N'8', N'8. vuosiluokka', N'Årskurs 8', N'Grade 8', N'Vuosiluokat 7–9', N'Årskurserna 7–9', N'Grades 7–9', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 28, 27, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (37, N'9', N'9. vuosiluokka', N'Årskurs 9', N'Grade 9', N'Vuosiluokat 7–9', N'Årskurserna 7–9', N'Grades 7–9', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', 29, 27, 30, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (38, N'20', N'Aikuisten perusopetuksen oppimäärän alkuvaihe', N'Inledningsskedet i den grundläggande utbildningens lärokurs för vuxna', N'Introductory phase to basic education for adults syllabus', N'Aikuisten perusopetuksen oppimäärän alkuvaihe', N'Inledningsskedet i den grundläggande utbildningens lärokurs för vuxna', N'Introductory phase to basic education for adults syllabus', N'Aikuisten perusopetus', N'Grundläggande utbildning för vuxna', N'Basic education for adults', 41, 41, 41, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (39, N'21', N'Aikuisten perusopetuksen oppimäärä', N'Lärökurs i den grundläggande utbildningen för vuxna', N'Basic education for adults syllabus', N'Aikuisten perusopetuksen oppimäärä', N'Lärökurs i den grundläggande utbildningen för vuxna', N'Basic education for adults syllabus', N'Aikuisten perusopetus', N'Grundläggande utbildning för vuxna', N'Basic education for adults', 42, 42, 42, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (40, N'020075', N'Perusopetuksen lisäopetus', N'Påbyggnadsundervisning efter den grundläggande utbildningen', N'Voluntary additional basic education', N'Perusopetuksen lisäopetus', N'Påbyggnadsundervisning efter den grundläggande utbildningen', N'Voluntary additional basic education', N'Perusopetuksen lisäopetus', N'Påbyggnadsundervisning efter den grundläggande utbildningen', N'Voluntary additional basic education', 50, 50, 50, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
INSERT [dw].[d_vuosiluokka_tai_koulutus] ([id], [koodi], [vuosiluokka_fi], [vuosiluokka_sv], [vuosiluokka_en], [vuosiluokkaryhma_fi], [vuosiluokkaryhma_sv], [vuosiluokkaryhma_en], [koulutus_fi], [koulutus_sv], [koulutus_en], [jarjestys_vuosiluokka], [jarjestys_vuosiluokkaryhma], [jarjestys_koulutus], [kommentti], [loadtime], [username]) VALUES (41, N'999905', N'Perusopetukseen valmistava opetus', N'Undervisning som förebereder för den grundläggande utbildning', N'Instruction preparing for basic education', N'Perusopetukseen valmistava opetus', N'Undervisning som förebereder för den grundläggande utbildning', N'Instruction preparing for basic education', N'Perusopetukseen valmistava opetus', N'Undervisning som förebereder för den grundläggande utbildning', N'Instruction preparing for basic education', 60, 60, 60, N'', CAST(N'2021-03-16T20:09:20.390' AS DateTime), N'DWI\jsyrjala2')
GO
SET IDENTITY_INSERT [dw].[d_vuosiluokka_tai_koulutus] OFF
GO
ALTER TABLE [dw].[d_vuosiluokka_tai_koulutus] ADD  CONSTRAINT [DF_d_vuosiluokka_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_vuosiluokka_tai_koulutus] ADD  CONSTRAINT [DF_d_vuosiluokka_username]  DEFAULT (suser_sname()) FOR [username]
GO
