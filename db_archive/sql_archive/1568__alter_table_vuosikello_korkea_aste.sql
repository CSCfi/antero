USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 24.4.2018 17:02:35 ******/
DROP TABLE IF EXISTS [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 24.4.2018 17:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]') AND type in (N'U'))
BEGIN
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
END
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
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Korkeakoulujen syksyn 2018 yhteishaun lisähaku', NULL, NULL, CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Erillishaku', NULL, N'20182', CAST(N'2018-09-25' AS Date), CAST(N'2018-09-25' AS Date), CAST(N'2018-09-25' AS Date), CAST(N'2018-09-25' AS Date), CAST(N'2018-09-25' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20181', CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date), CAST(N'2018-08-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (N'Jatkotutkintohaku', NULL, N'20182', CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-01-05' AS Date))
GO
