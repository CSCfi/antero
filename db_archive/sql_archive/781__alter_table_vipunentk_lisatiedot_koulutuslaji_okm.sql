USE [VipunenTK_lisatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji_okm]') AND type in (N'U'))
ALTER TABLE [dbo].[koulutuslaji_okm] DROP CONSTRAINT IF EXISTS [DF__koulutuslaji_okm__tietolahde]
GO
/****** Object:  Table [dbo].[koulutuslaji_okm]    Script Date: 19.9.2017 17:25:27 ******/
DROP TABLE IF EXISTS [dbo].[koulutuslaji_okm]
GO
/****** Object:  Table [dbo].[koulutuslaji_okm]    Script Date: 19.9.2017 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji_okm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuslaji_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji_okm_avain] [nvarchar](10) NULL,
	[koulutuslaji_okm] [nvarchar](100) NULL,
	[koulutuslaji_okm_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm_EN] [nvarchar](100) NULL,
	[koulutuslaji_okm2] [nvarchar](100) NULL,
	[koulutuslaji_okm2_SV] [nvarchar](100) NULL,
	[koulutuslaji_okm2_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[jarjestys2] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2015-05-13' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2015-05-13' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2015-05-13' AS Date), N'1', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', N'Esiopetus', N'Förskoleundervisning', N'Pre-primary education', N'10', N'10', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2015-05-13' AS Date), N'2', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', N'Perusopetus', N'Grundläggande utbildning', N'Basic education', N'11', N'11', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2015-05-13' AS Date), N'3', N'Lukiokoulutus (nuorten koulutus)', N'Gymnasieutbildning (utbildning för unga)', N'General upper secondary education (youth education)', N'Lukiokoulutus (nuorten koulutus)', N'Gymnasieutbildning (utbildning för unga)', N'General upper secondary education (youth education)', N'12', N'12', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2015-05-13' AS Date), N'4', N'Lukiokoulutus (aikuiskoulutus)', N'Gymnasieutbildning (vuxenutbildning)', N'General upper secondary general education (adult education)', N'Lukiokoulutus (aikuiskoulutus)', N'Gymnasieutbildning (vuxenutbildning)', N'General upper secondary general education (adult education)', N'13', N'13', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2015-05-13' AS Date), N'5', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (i läroanstaltsform, läroplansbaserad)', N'Vocational upper secondary qualification (institution-based, curriculum-based)', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (i läroanstaltsform, läroplansbaserad)', N'Vocational upper secondary qualification (institution-based, curriculum-based)', N'14', N'14', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2015-05-13' AS Date), N'6', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)', N'Grundläggande yrkesexamen (i läroanstaltsform, fristående examen)', N'Vocational upper secondary qualification (institution-based, competence-based)', N'Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)', N'Grundläggande yrkesexamen (i läroanstaltsform, fristående examen)', N'Vocational upper secondary qualification (institution-based, competence-based)', N'15', N'15', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2015-05-13' AS Date), N'7', N'Ammattitutkinto (oppilaitosmuotoinen)', N'Yrkesexamen (i läroanstaltsform)', N'Further vocational qualification (institution-based)', N'Ammattitutkinto (oppilaitosmuotoinen)', N'Yrkesexamen (i läroanstaltsform)', N'Further vocational qualification (institution-based)', N'16', N'16', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2015-05-13' AS Date), N'8', N'Erikoisammattitutkinto  (oppilaitosmuotoinen)', N'Specialyrkesexamen (i läroanstaltsform)', N'Specialist vocational qualification (institution-based)', N'Erikoisammattitutkinto  (oppilaitosmuotoinen)', N'Specialyrkesexamen (i läroanstaltsform)', N'Specialist vocational qualification (institution-based)', N'17', N'17', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2015-05-13' AS Date), N'9', N'Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (läroavtalsutbildning, läroplansbaserad)', N'Vocational upper secondary qualification (apprenticeship training, curriculum-based)', N'Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)', N'Grundläggande yrkesexamen (läroavtalsutbildning, läroplansbaserad)', N'Vocational upper secondary qualification (apprenticeship training, curriculum-based)', N'18', N'18', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2015-05-13' AS Date), N'10', N'Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)', N'Grundläggande yrkesexamen (läroavtalsutbildning, fristående examen)', N'Vocational upper secondary qualification (apprenticeship training, competence-based)', N'Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)', N'Grundläggande yrkesexamen (läroavtalsutbildning, fristående examen)', N'Vocational upper secondary qualification (apprenticeship training, competence-based)', N'19', N'19', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2015-05-13' AS Date), N'19', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'Lisensiaatintutkinto', N'Licentiatexamen', N'Licentiate degree', N'28', N'28', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2015-05-13' AS Date), N'20', N'Tohtorintutkinto', N'Doktorsexamen', N'Doctoral degree', N'Tohtorintutkinto', N'Doktorsexamen', N'Doctoral degree', N'29', N'29', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2015-05-13' AS Date), N'11', N'Ammattitutkinto (oppisopimuskoulutus)', N'Yrkesexamen (läroavtalsutbildning)', N'Further vocational qualification (apprenticeship training)', N'Ammattitutkinto (oppisopimuskoulutus)', N'Yrkesexamen (läroavtalsutbildning)', N'Further vocational qualification (apprenticeship training)', N'20', N'20', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2015-05-13' AS Date), N'12', N'Erikoisammattitutkinto (oppisopimuskoulutus)', N'Specialyrkesexamen (läroavtalsutbildning)', N'Specialist vocational qualification (apprenticeship training)', N'Erikoisammattitutkinto (oppisopimuskoulutus)', N'Specialyrkesexamen (läroavtalsutbildning)', N'Specialist vocational qualification (apprenticeship training)', N'21', N'21', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2015-05-13' AS Date), N'13', N'Ammattikorkeakoulututkinto (nuorten koulutus)  ', N'Yrkeshögskoleexamen (utbildning för unga)  ', N'UAS degree (youth education)  ', N'Ammattikorkeakoulututkinto', N'Yrkeshögskoleexamen', N'UAS degree', N'22', N'22', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2015-05-13' AS Date), N'14', N'Ammattikorkeakoulututkinto (aikuiskoulutus)  ', N'Yrkeshögskoleexamen (vuxenutbildning)  ', N'UAS degree (adult education)  ', N'Ammattikorkeakoulututkinto', N'Yrkeshögskoleexamen', N'UAS degree', N'23', N'22', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2015-05-13' AS Date), N'15', N'Ylempi ammattikorkeakoulututkinto  ', N'Högre yrkeshögskoleexamen  ', N'UAS Master''s degree  ', N'Ylempi ammattikorkeakoulututkinto  ', N'Högre yrkeshögskoleexamen  ', N'UAS Master''s degree  ', N'24', N'24', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2015-05-13' AS Date), N'16', N'Alempi korkeakoulututkinto  ', N'Lägre högskoleexamen  ', N'Bachelor''s degree  ', N'Alempi korkeakoulututkinto  ', N'Lägre högskoleexamen  ', N'Bachelor''s degree  ', N'25', N'25', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2015-05-13' AS Date), N'17', N'Ylempi korkeakoulututkinto  ', N'Högre högskoleexamen  ', N'Master''s degree  ', N'Ylempi korkeakoulututkinto  ', N'Högre högskoleexamen  ', N'Master''s degree  ', N'26', N'26', N'K', N'0', N'CSC', N'CSC Lasse')
GO
INSERT [dbo].[koulutuslaji_okm] ([id], [luotu], [koulutuslaji_okm_avain], [koulutuslaji_okm], [koulutuslaji_okm_SV], [koulutuslaji_okm_EN], [koulutuslaji_okm2], [koulutuslaji_okm2_SV], [koulutuslaji_okm2_EN], [jarjestys], [jarjestys2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2015-05-13' AS Date), N'18', N'Lääkärien erikoistumiskoulutus', N'Läkarnas specialiseringsutbildning', N'Specialist degree in medicine', N'Lääkärien erikoistumiskoulutus', N'Läkarnas specialiseringsutbildning', N'Specialist degree in medicine', N'27', N'27', N'K', N'0', N'CSC', N'CSC Lasse')
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__koulutuslaji_okm__tietolahde]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[koulutuslaji_okm] ADD  CONSTRAINT [DF__koulutuslaji_okm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
END

GO
USE [ANTERO]
