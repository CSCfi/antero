USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]    Script Date: 12.2.2019 18:53:58 ******/
DROP TABLE [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 12.2.2019 18:53:58 ******/
DROP TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 12.2.2019 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste](
	[haku] [varchar](255) NOT NULL,
	[haku_oid] [varchar](255) NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[aloituspaikat] [date] NULL,
	[hakijat] [date] NULL,
	[valitut] [date] NULL,
	[vastaanottaneet] [date] NULL,
	[aloittaneet] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]    Script Date: 12.2.2019 18:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste](
	[haku] [varchar](255) NOT NULL,
	[haku_oid] [varchar](255) NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[hakuvuosi] [nchar](10) NULL,
	[aloituspaikat] [date] NULL,
	[hakijat] [date] NULL,
	[valitut] [date] NULL,
	[vastaanottaneet] [date] NULL,
	[aloittaneet] [date] NULL,
	[pisterajat] [date] NULL,
	[extra] [date] NULL
) ON [PRIMARY]

GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku syksy 2017', N'1.2.246.562.29.25191045126', NULL, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-01' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2018-01-08' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku kevät 2015', N'1.2.246.562.29.95390561488', NULL, NULL, CAST(N'2015-05-04' AS Date), CAST(N'2015-08-31' AS Date), CAST(N'2015-08-31' AS Date), CAST(N'2015-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen kevään 2015 yhteishaun lisähaku', N'1.2.246.562.29.68266931788', NULL, NULL, CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku syksy 2015', N'1.2.246.562.29.10714450698', NULL, NULL, CAST(N'2015-11-26' AS Date), CAST(N'2015-12-19' AS Date), CAST(N'2016-01-02' AS Date), CAST(N'2016-02-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2015 yhteishaun lisähaku', N'1.2.246.562.29.74004630419', NULL, NULL, CAST(N'2016-01-23' AS Date), CAST(N'2016-01-23' AS Date), CAST(N'2016-01-23' AS Date), CAST(N'2016-02-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20152', NULL, CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20161', NULL, CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku kevät 2016', N'1.2.246.562.29.75203638285', NULL, CAST(N'2016-04-09' AS Date), CAST(N'2016-07-02' AS Date), CAST(N'2016-08-15' AS Date), CAST(N'2016-08-29' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen kevään 2016 yhteishaun lisähaku', N'1.2.246.562.29.58015176033', NULL, CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20162', CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku syksy 2016', N'1.2.246.562.29.87593180141', NULL, CAST(N'2016-11-26' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-12-21' AS Date), CAST(N'2017-01-03' AS Date), CAST(N'2017-01-18' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20162', CAST(N'2017-01-03' AS Date), CAST(N'2017-01-03' AS Date), CAST(N'2017-01-03' AS Date), CAST(N'2017-01-03' AS Date), CAST(N'2017-01-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2016 yhteishaun lisähaku', N'1.2.246.562.29.28768955933', NULL, CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20171', CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku kevät 2017', N'1.2.246.562.29.59856749474', NULL, CAST(N'2017-05-09' AS Date), CAST(N'2017-05-09' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20171', CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20172', CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen kevään 2017 yhteishaun lisähaku', N'1.2.246.562.29.64700343086', NULL, CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2017 yhteishaun lisähaku', N'1.2.246.562.29.18780377844', NULL, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20181', CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20172', CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku kevät 2018', N'1.2.246.562.29.26435854158', NULL, CAST(N'2018-05-08' AS Date), CAST(N'2018-05-08' AS Date), CAST(N'2018-08-01' AS Date), CAST(N'2018-08-14' AS Date), CAST(N'2018-09-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen kevään 2018 yhteishaun lisähaku', N'1.2.246.562.29.70576649506', NULL, CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku syksy 2018', N'1.2.246.562.29.92384231418', NULL, CAST(N'2018-10-18' AS Date), CAST(N'2018-10-18' AS Date), CAST(N'2018-12-19' AS Date), CAST(N'2019-01-02' AS Date), CAST(N'2019-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2018 yhteishaun lisähaku', N'1.2.246.562.29.26958286416', NULL, CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20182', CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20181', CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20182', CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku kevät 2019', N'1.2.246.562.29.70000333388', NULL, CAST(N'2019-05-07' AS Date), CAST(N'2019-05-07' AS Date), CAST(N'2019-08-01' AS Date), CAST(N'2019-08-13' AS Date), CAST(N'2019-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen kevään 2019 yhteishaun lisähaku', NULL, NULL, CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen yhteishaku syksy 2019', NULL, NULL, CAST(N'2019-10-17' AS Date), CAST(N'2019-10-17' AS Date), CAST(N'2019-12-18' AS Date), CAST(N'2020-01-02' AS Date), CAST(N'2020-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2019 yhteishaun lisähaku', NULL, NULL, CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20192', CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20191', CAST(N'2019-08-02' AS Date), CAST(N'2019-08-02' AS Date), CAST(N'2019-08-02' AS Date), CAST(N'2019-08-02' AS Date), CAST(N'2019-08-02' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20192', CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen kevään 2014 yhteishaku', N'1.2.246.562.5.2013080813081926341927', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2014-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2015', N'1.2.246.562.29.90697286251', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kevään 2015 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.13657766393', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2015 yhteishaku', N'1.2.246.562.29.80306203979', NULL, N'2015      ', CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku syksyn 2015 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.94278815611', NULL, N'2015      ', CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2016', N'1.2.246.562.29.14662042044', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kevään 2016 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.98929669087', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2017', N'1.2.246.562.29.10108985853', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2015', N'1.2.246.562.29.61316288341', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2015', N'1.2.246.562.29.14262905905', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2016', N'1.2.246.562.29.669559278110', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2016', N'1.2.246.562.29.67051356953', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2017', N'1.2.246.562.29.57263577488', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2015 haku', N'1.2.246.562.29.14865319314', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2015 lisähaku', N'1.2.246.562.29.67129953195', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2016 haku', N'1.2.246.562.29.94318919571', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2016 lisähaku', N'1.2.246.562.29.41716846138', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2017 haku', N'1.2.246.562.29.57768753733', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Ammatillisen koulutuksen syksyn 2016 haku keväällä alkavaan koulutukseen', N'1.2.246.562.29.74414985379', NULL, N'2016      ', CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kevään 2017 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.62377116603', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2017 lisähaku', N'1.2.246.562.29.48353453128', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2017', N'1.2.246.562.29.59213949841', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku keväällä 2018 alkavaan koulutukseen', N'1.2.246.562.29.83917330132', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen haku keväällä 2018 alkavaan koulutukseen', N'1.2.246.562.29.82633706526', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Ammatillisen koulutuksen syksyn 2017 haku keväällä alkavaan koulutukseen', N'1.2.246.562.29.69946045619', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kevään yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.32820950486', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2014 yhteishaku', N'1.2.246.562.29.92175749016', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku syksyn 2014 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.35400243156', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2018', N'1.2.246.562.29.55739081531', NULL, N'2018      ', CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-06-15' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-06-15' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku lukiokoulutukseen kevään 2018 yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.21494502285', NULL, N'2018      ', CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2019', N'1.2.246.562.29.676633696010', NULL, N'2019      ', CAST(N'2019-03-18' AS Date), CAST(N'2019-03-18' AS Date), CAST(N'2019-06-14' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-06-14' AS Date), CAST(N'2019-10-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku lukiokoulutukseen kevään 2019 yhteishaussa vapaaksi jääneille opiskelupaikoille', NULL, NULL, N'2019      ', CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), NULL, CAST(N'2019-10-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2018 haku', N'1.2.246.562.29.50212298785', NULL, N'2018      ', CAST(N'2018-07-27' AS Date), CAST(N'2018-07-27' AS Date), CAST(N'2018-08-04' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kymppiluokalle ja lukioon valmistavaan koulutukseen 2018', N'1.2.246.562.29.86099733445', NULL, N'2018      ', CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Haku vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen, kevät 2018', N'1.2.246.562.29.98788866931', NULL, N'2018      ', CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-06-15' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2019 haku', N'1.2.246.562.29.99771464296', NULL, N'2019      ', CAST(N'2019-07-25' AS Date), CAST(N'2019-07-25' AS Date), CAST(N'2019-08-03' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), NULL, CAST(N'2019-10-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Lisähaku kymppiluokalle ja lukioon valmistavaan koulutukseen 2019', NULL, NULL, N'2019      ', CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), NULL, CAST(N'2019-10-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat], [extra]) VALUES (N'Haku vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen, kevät 2019', N'1.2.246.562.29.69908067932', NULL, N'2019      ', CAST(N'2019-04-05' AS Date), CAST(N'2019-04-05' AS Date), CAST(N'2019-06-14' AS Date), CAST(N'2019-08-19' AS Date), CAST(N'2019-08-19' AS Date), NULL, CAST(N'2019-10-04' AS Date))
GO
USE [ANTERO]