USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_koodisto_pohjakoulutus_kk_odw]    Script Date: 7.12.2017 17:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koodisto_pohjakoulutus_kk_odw]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_koodisto_pohjakoulutus_kk_odw](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodisto] [nvarchar](100) NULL,
	[koodi] [nvarchar](100) NULL,
	[nimi_fi] [nvarchar](255) NULL,
	[nimi_sv] [nvarchar](255) NULL,
	[nimi_en] [nvarchar](255) NULL,
	[tila] [nvarchar](255) NULL,
	[alkupvm] [nvarchar](100) NULL,
	[loppupvm] [nvarchar](100) NULL,
	[lataaja] [nvarchar](100) NULL,
	[source] [nvarchar](100) NULL,
	[latausaika] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ON 

GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (0, N'pohjakoulutusKKodw', N'pohjakoulutus_am', N'Suomessa suoritettu ammatillinen perustutkinto, kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto', N'Yrkesinriktad grundexamen, examen på skolnivå, examen på institutsnivå eller yrkesinriktad examen på högre nivå som avlagts i Finland', N'Vocational upper secondary qualification, school-level qualification, post-secondary level qualification or higher vocational level qualification completed in Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (1, N'pohjakoulutusKKodw', N'pohjakoulutus_amt', N'Suomessa suoritettu ammatti- tai erikoisammattitutkinto', N'Yrkesexamen eller specialyrkesexamen som avlagts i Finland', N'Further vocational qualification or specialist vocational qualification completed in Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (2, N'pohjakoulutusKKodw', N'pohjakoulutus_avoin', N'Korkeakoulun edellyttämät avoimen korkeakoulun opinnot', N'Studier som högskolan kräver vid en öppen högskola', N'Studies required by the higher education institution completed at open university or open polytechnic/UAS', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (3, N'pohjakoulutusKKodw', N'pohjakoulutus_kk', N'Suomessa suoritettu korkeakoulututkinto', N'Högskoleexamen som avlagts i Finland', N'Higher education qualification completed in Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (4, N'pohjakoulutusKKodw', N'pohjakoulutus_kk_ulk', N'Muualla kuin Suomessa suoritettu korkeakoulututkinto', N'Högskoleexamen som avlagts annanstans än i Finland', N'Higher education qualification completed outside Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (5, N'pohjakoulutusKKodw', N'pohjakoulutus_muu', N'Muu korkeakoulukelpoisuus', N'Övrig högskolebehörighet', N'Other eligibility for higher education', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (6, N'pohjakoulutusKKodw', N'pohjakoulutus_ulk', N'Muualla kuin Suomessa suoritettu muu tutkinto, joka asianomaisessa maassa antaa hakukelpoisuuden korkeakouluun', N'Övrig examen som avlagts annanstans än i Finland, och ger behörighet för högskolestudier i ifrågavarande land', N'Other qualification completed outside Finland that provides eligibility to apply for higher education in the country in question', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (7, N'pohjakoulutusKKodw', N'pohjakoulutus_yo', N'Suomessa suoritettu ylioppilastutkinto ja/tai lukion oppimäärä', N'Studentexamen och/eller gymnasiets lärokurs som avlagts i Finland', N'Matriculation examination and/or general upper secondary school syllabus completed in Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (8, N'pohjakoulutusKKodw', N'pohjakoulutus_yo_ammatillinen', N'Ammatillinen perustutkinto ja ylioppilastutkinto (kaksoistutkinto)', N'Dubbelexamen', N'Double degree (secondary level)', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (9, N'pohjakoulutusKKodw', N'pohjakoulutus_yo_kansainvalinen_suomessa', N'Suomessa suoritettu kansainvälinen ylioppilastutkinto', N'Internationell studentexamen som avlagts i Finland', N'International matriculation examination completed in Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] ([id], [koodisto], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [tila], [alkupvm], [loppupvm], [lataaja], [source], [latausaika]) VALUES (10, N'pohjakoulutusKKodw', N'pohjakoulutus_yo_ulkomainen', N'Muualla kuin Suomessa suoritettu kansainvälinen ylioppilastutkinto', N'Internationell studentexamen som avlagts annanstans än i Finland', N'International matriculation examination completed outside Finland', N'LUONNOS', N'2015-11-05', NULL, N'dwi\vhamalai', N'https://virkailija.opintopolku.fi/koodisto-service/rest/codes/hakutapa', CAST(N'2017-11-17T13:58:16.420' AS DateTime))
GO
SET IDENTITY_INSERT [sa].[sa_koodisto_pohjakoulutus_kk_odw] OFF

