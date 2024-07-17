USE [VipunenTK_lisatiedot]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__tietolahde]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__paattyy]
GO
ALTER TABLE [dbo].[koulutuslaji] DROP CONSTRAINT [DF__koulutuslaji__alkaa]
GO
/****** Object:  Table [dbo].[koulutuslaji]    Script Date: 17.7.2024 14:37:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuslaji]') AND type in (N'U'))
DROP TABLE [dbo].[koulutuslaji]
GO
/****** Object:  Table [dbo].[koulutuslaji]    Script Date: 17.7.2024 14:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuslaji_koodi] [nvarchar](10) NULL,
	[koulutuslaji] [nvarchar](250) NULL,
	[koulutuslaji_SV] [nvarchar](250) NULL,
	[koulutuslaji_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99999', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'99998', N'K', N'0', N'Manuaalinen', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'21', N'Lukiokoulutus, nuorten OPS (oppilaitoksen määrittelemä tieto)', N'Gymnasieutbildning, LP för unga (uppgift som läroanstalten fastställt)', N'Upper secondary general education, curriculum for young people (data provided by the educational institution)', N'21', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'22', N'Lukiokoulutus, aikuisten OPS (oppilaitoksen määrittelemä tieto)', N'Gymnasieutbildning, LP för vuxna (uppgift som läroanstalten fastställt)', N'Upper secondary general education, curriculum for adults (data provided by the educational institution)', N'22', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'31', N'Ammatilliset perustutkinnot (ei oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (ej läroavtalsutbildning)', N'Vocational qualifications (not apprenticeship training)', N'310', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'32', N'Ammatilliset perustutkinnot (ei oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (ej läroavtalsutbildning)', N'Vocational qualifications (not apprenticeship training)', N'310', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'33', N'Ammattitutkinnot (ei oppisopimuskoulutus)', N'Yrkesexamina (ej läroavtalsutbildning)', N'Further vocational qualifications (not apprenticeship training)', N'330', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'34', N'Erikoisammattitutkinnot (ei oppisopimuskoulutus)', N'Specialyrkesexamina (ej läroavtalsutbildning)', N'Specialist vocational qualifications (not apprenticeship training)', N'340', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'35', N'Ammatilliset perustutkinnot (oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (läroavtalsutbildning)', N'Vocational qualifications (apprenticeship training)', N'350', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'36', N'Ammatilliset perustutkinnot (oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (läroavtalsutbildning)', N'Vocational qualifications (apprenticeship training)', N'350', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'37', N'Ammattitutkinnot (oppisopimuskoulutus)', N'Yrkesexamina (läroavtalsutbildning)', N'Further vocational qualifications (apprenticeship training)', N'370', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'38', N'Erikoisammattitutkinnot (oppisopimuskoulutus)', N'Specialyrkesexamina (läroavtalsutbildning)', N'Specialist vocational qualifications (apprenticeship training)', N'380', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'41', N'Ammattikorkeakoulututkinto, päivätoteutus', N'Yrkeshögskoleexamen, dagstudier', N'UAS degree, daytime studies', N'410', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'42', N'Ammattikorkeakoulututkinto, monimuotototeutus', N'Yrkeshögskoleexamen, flerformsstudier', N'UAS degree, multiform studies', N'420', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'46', N'Ylempään AMK-tutkintoon tähtäävä koulutus', N'Utbildning för högre YH-examen', N'Education leading to a UAS Master''s degree', N'460', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'51', N'Alempaan ja ylempään korkeakoulututkintoon tähtäävä koulutus', N'Utbildning för lägre och högre högskoleexamen', N'Education leading to a Bachelor''s and Master’s degree', N'510', N'E', N'0', N'Tilastokeskus', N'CSC Lauri')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2014-02-03' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'2014-12-31' AS Date), N'52', N'Lisensiaatinkoulutus, tohtorinkoulutus ja lääkärien erikoistumiskoulutus', N'Licentiatutbildning, doktorsutbildning och specialiseringsutbildning för läkare', N'Licentiate education, postgraduate education and specialist degrees in medicine', N'520', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'62', N'Ammattitutkinnot (ei oppisopimuskoulutus)', N'Yrkesexamina (ej läroavtalsutbildning)', N'Further vocational qualifications (not apprenticeship training)', N'330', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'64', N'Ammatilliset perustutkinnot (oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (läroavtalsutbildning)', N'Vocational qualifications (apprenticeship training)', N'350', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'65', N'Ammattitutkinnot (oppisopimuskoulutus)', N'Yrkesexamina (läroavtalsutbildning)', N'Further vocational qualifications (apprenticeship training)', N'370', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'66', N'Erikoisammattitutkinnot (oppisopimuskoulutus)', N'Specialyrkesexamina (läroavtalsutbildning)', N'Specialist vocational qualifications (apprenticeship training)', N'380', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'61', N'Ammatilliset perustutkinnot (ei oppisopimuskoulutus)', N'Yrkesinriktade grundexamina (ej läroavtalsutbildning)', N'Vocational qualifications (not apprenticeship training)', N'310', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (21, CAST(N'2020-01-16' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'63', N'Erikoisammattitutkinnot (ei oppisopimuskoulutus)', N'Specialyrkesexamina (ej läroavtalsutbildning)', N'Specialist vocational qualifications (not apprenticeship training)', N'340', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (22, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'71', N'Ammatilliset perustutkinnot (ei sisällä koulutussopimus- eikä oppisopimusjaksoja)', N'Grundläggande yrkesutbildning (omfattar inte utbildningsavtals- eller läroavtalsperioder)', N'Initial vocational qualifications (training agreement or apprenticeship training periods not included)', N'250', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (23, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'72', N'Ammattitutkinnot (ei sisällä koulutussopimus- eikä oppisopimusjaksoja)', N'Yrkesexamina (omfattar inte utbildningsavtals- eller läroavtalsperioder)', N'Further vocational qualifications (training agreement or apprenticeship training periods not included)', N'251', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (24, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'73', N'Erikoisammattitutkinnot (ei sisällä koulutussopimus- eikä oppisopimusjaksoja)', N'Specialyrkesexamina (omfattar inte utbildningsavtals- eller läroavtalsperioder)', N'Specialist vocational qualifications (training agreement or apprenticeship training periods not included)', N'252', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (25, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'74', N'Ammatilliset perustutkinnot (sisältää sekä koulutus- että oppisopimusjaksoja)', N'Grundläggande yrkesutbildning (omfattar både utbildningsavtals- och läroavtalsperioder)', N'Initial vocational qualifications (training agreement and apprenticeship training periods included)', N'259', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (26, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'75', N'Ammattitutkinnot (sisältää sekä koulutus- että oppisopimusjaksoja)', N'Yrkesexamina (omfattar både utbildningsavtals- och läroavtalsperioder)', N'Further vocational qualifications (training agreement and apprenticeship training periods included)', N'260', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (27, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'76', N'Erikoisammattitutkinnot (sisältää sekä koulutus- että oppisopimusjaksoja)', N'Specialyrkesexamina (omfattar både utbildningsavtals- och läroavtalsperioder)', N'Specialist vocational qualifications (training agreement and apprenticeship training periods included)', N'261', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (28, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'77', N'Ammatilliset perustutkinnot (sisältää koulutussopimusjaksoja)', N'Grundläggande yrkesutbildning (omfattar utbildningsavtalsperioder)', N'Initial vocational qualifications (training agreement periods included)', N'253', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (29, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'78', N'Ammattitutkinnot (sisältää koulutussopimusjaksoja)', N'Yrkesexamina (omfattar utbildningsavtalsperioder)', N'Further vocational qualifications (training agreement periods included)', N'254', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (30, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'79', N'Erikoisammattitutkinnot (sisältää koulutussopimusjaksoja)', N'Specialyrkesexamina (omfattar utbildningsavtalsperioder)', N'Specialist vocational qualifications (training agreement periods included)', N'255', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (31, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'80', N'Ammatilliset perustutkinnot (sisältää oppisopimusjaksoja)', N'Grundläggande yrkesutbildning (omfattar läroavtalsperioder)', N'Initial vocational qualifications (apprenticeship training periods included)', N'256', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (32, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'81', N'Ammattitutkinnot (sisältää oppisopimusjaksoja)', N'Yrkesexamina (omfattar läroavtalsperioder)', N'Further vocational qualifications (apprenticeship training periods included)', N'257', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (35, CAST(N'2023-04-05' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2016-12-31' AS Date), N'53', N'Lääkärien ja hammaslääkärien erikoistumiskoulutus (tutkintoon johtamaton koulutus)', N'Specialiseringsutbildning för läkare och tandläkare (utbildning som inte leder till examen)', N'Specialist training in medicine and dentistry (education not leading to a degree)', N'512', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (33, CAST(N'2021-08-06' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'82', N'Erikoisammattitutkinnot (sisältää oppisopimusjaksoja)', N'Specialyrkesexamina (omfattar läroavtalsperioder)', N'Specialist vocational qualifications (apprenticeship training periods included)', N'258', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (34, CAST(N'2023-04-05' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'52', N'Lisensiaatinkoulutus, tohtorinkoulutus ja eläinlääkärien erikoistumiskoulutus', N'Licentiatutbildning, doktorsutbildning och specialiseringsutbildning för veterinärer', N'Licentiate education, postgraduate education and specialist degrees in veterinary medicine', N'511', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
INSERT [dbo].[koulutuslaji] ([id], [luotu], [alkaa], [paattyy], [koulutuslaji_koodi], [koulutuslaji], [koulutuslaji_SV], [koulutuslaji_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (36, CAST(N'2024-07-17' AS Date), CAST(N'2017-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'53', N'Yliopistojen erikoistumiskoulutus (tutkintoon johtamaton koulutus)', N'Specialiseringsutbildning vid universitet (utbildning som inte leder till examen)', N'Specialisation studies in university (education not leading to a degree)', N'512', N'E', N'0', N'Tilastokeskus', N'CSC Juha')
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[koulutuslaji] ADD  CONSTRAINT [DF__koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO
