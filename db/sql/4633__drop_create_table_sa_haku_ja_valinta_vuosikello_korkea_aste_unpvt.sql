USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt]    Script Date: 8.6.2021 22:16:50 ******/
DROP TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt]    Script Date: 8.6.2021 22:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ON 

GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (1, N'Korkeakoulujen yhteishaku kevät 2015', N'1.2.246.562.29.95390561488', NULL, NULL, CAST(N'2015-05-04' AS Date), CAST(N'2015-08-31' AS Date), CAST(N'2015-08-31' AS Date), CAST(N'2015-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (2, N'Korkeakoulujen kevään 2015 yhteishaun lisähaku', N'1.2.246.562.29.68266931788', NULL, NULL, CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date), CAST(N'2015-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (3, N'Erillishaku', NULL, N'20152', NULL, CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date), CAST(N'2015-11-26' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (4, N'Korkeakoulujen yhteishaku syksy 2015', N'1.2.246.562.29.10714450698', NULL, NULL, CAST(N'2015-11-26' AS Date), CAST(N'2015-12-19' AS Date), CAST(N'2016-01-02' AS Date), CAST(N'2016-02-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (5, N'Korkeakoulujen syksyn 2015 yhteishaun lisähaku', N'1.2.246.562.29.74004630419', NULL, NULL, CAST(N'2016-01-23' AS Date), CAST(N'2016-01-23' AS Date), CAST(N'2016-01-23' AS Date), CAST(N'2016-02-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (6, N'Erillishaku', NULL, N'20161', NULL, CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (7, N'Korkeakoulujen yhteishaku kevät 2016', N'1.2.246.562.29.75203638285', NULL, CAST(N'2016-04-09' AS Date), CAST(N'2016-07-02' AS Date), CAST(N'2016-08-15' AS Date), CAST(N'2016-08-29' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (8, N'Erillishaku', NULL, N'20162', CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (9, N'Korkeakoulujen kevään 2016 yhteishaun lisähaku', N'1.2.246.562.29.58015176033', NULL, CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (10, N'Korkeakoulujen yhteishaku syksy 2016', N'1.2.246.562.29.87593180141', NULL, CAST(N'2016-11-26' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-12-21' AS Date), CAST(N'2017-01-03' AS Date), CAST(N'2017-01-18' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (12, N'Korkeakoulujen syksyn 2016 yhteishaun lisähaku', N'1.2.246.562.29.28768955933', NULL, CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (13, N'Erillishaku', NULL, N'20171', CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (14, N'Korkeakoulujen yhteishaku kevät 2017', N'1.2.246.562.29.59856749474', NULL, CAST(N'2017-05-09' AS Date), CAST(N'2017-05-09' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (16, N'Korkeakoulujen kevään 2017 yhteishaun lisähaku', N'1.2.246.562.29.64700343086', NULL, CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (17, N'Erillishaku', NULL, N'20172', CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (18, N'Korkeakoulujen yhteishaku syksy 2017', N'1.2.246.562.29.25191045126', NULL, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-01' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2018-01-08' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (20, N'Erillishaku', NULL, N'20181', CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (21, N'Korkeakoulujen syksyn 2017 yhteishaun lisähaku', N'1.2.246.562.29.18780377844', NULL, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (22, N'Korkeakoulujen yhteishaku kevät 2018', N'1.2.246.562.29.26435854158', NULL, CAST(N'2018-05-08' AS Date), CAST(N'2018-05-08' AS Date), CAST(N'2018-08-01' AS Date), CAST(N'2018-08-14' AS Date), CAST(N'2018-09-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (24, N'Korkeakoulujen kevään 2018 yhteishaun lisähaku', N'1.2.246.562.29.70576649506', NULL, CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (25, N'Erillishaku', NULL, N'20182', CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date), CAST(N'2018-09-28' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (26, N'Korkeakoulujen yhteishaku syksy 2018', N'1.2.246.562.29.92384231418', NULL, CAST(N'2018-10-18' AS Date), CAST(N'2018-10-18' AS Date), CAST(N'2018-12-19' AS Date), CAST(N'2019-01-02' AS Date), CAST(N'2019-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (28, N'Korkeakoulujen syksyn 2018 yhteishaun lisähaku', N'1.2.246.562.29.26958286416', NULL, CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (29, N'Erillishaku', NULL, N'20191', CAST(N'2019-01-22' AS Date), CAST(N'2019-01-22' AS Date), CAST(N'2019-01-22' AS Date), CAST(N'2019-01-22' AS Date), CAST(N'2019-01-22' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (30, N'Korkeakoulujen yhteishaku kevät 2019', N'1.2.246.562.29.70000333388', NULL, CAST(N'2019-05-07' AS Date), CAST(N'2019-05-07' AS Date), CAST(N'2019-08-01' AS Date), CAST(N'2019-08-13' AS Date), CAST(N'2019-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (32, N'Korkeakoulujen kevään 2019 yhteishaun lisähaku', N'1.2.246.562.29.80539926735', NULL, CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date), CAST(N'2019-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (33, N'Erillishaku', NULL, N'20192', CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date), CAST(N'2019-09-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (34, N'Korkeakoulujen yhteishaku syksy 2019', N'1.2.246.562.29.66593343719', NULL, CAST(N'2019-10-17' AS Date), CAST(N'2019-10-17' AS Date), CAST(N'2019-12-18' AS Date), CAST(N'2020-01-02' AS Date), CAST(N'2020-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (36, N'Korkeakoulujen syksyn 2019 yhteishaun lisähaku', N'1.2.246.562.29.941949110810', NULL, CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date), CAST(N'2020-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (37, N'Erillishaku', NULL, N'20201', CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (38, N'Korkeakoulujen kevään 2020 ensimmäinen yhteishaku', N'1.2.246.562.29.93102260101', NULL, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-08-03' AS Date), CAST(N'2020-08-11' AS Date), CAST(N'2020-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (39, N'Korkeakoulujen kevään 2020 toinen yhteishaku', N'1.2.246.562.29.36339915997', NULL, CAST(N'2020-05-11' AS Date), CAST(N'2020-05-11' AS Date), CAST(N'2020-08-03' AS Date), CAST(N'2020-08-11' AS Date), CAST(N'2020-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (40, N'Korkeakoulujen kevään 2020 toisen yhteishaun lisähaku', NULL, NULL, CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (41, N'Korkeakoulujen kevään 2020 ensimmäisen yhteishaun lisähaku', NULL, NULL, CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (42, N'Erillishaku', NULL, N'20202', CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date), CAST(N'2020-09-23' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (43, N'Korkeakoulujen yhteishaku syksy 2020', N'1.2.246.562.29.98666182252', NULL, CAST(N'2020-10-16' AS Date), CAST(N'2020-10-16' AS Date), CAST(N'2020-12-17' AS Date), CAST(N'2021-01-04' AS Date), CAST(N'2021-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (44, N'Korkeakoulujen syksyn 2020 yhteishaun lisähaku', NULL, NULL, CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (45, N'Erillishaku', NULL, N'20211', CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (46, N'Korkeakoulujen kevään 2021 ensimmäinen yhteishaku', N'1.2.246.562.29.72389663526', NULL, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18' AS Date), CAST(N'2021-08-03' AS Date), CAST(N'2021-08-10' AS Date), CAST(N'2021-09-27' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (47, N'Korkeakoulujen kevään 2021 toinen yhteishaku', N'1.2.246.562.29.98117005904', NULL, CAST(N'2021-04-12' AS Date), CAST(N'2021-04-12' AS Date), CAST(N'2021-08-03' AS Date), CAST(N'2021-08-10' AS Date), CAST(N'2021-09-27' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (48, N'Korkeakoulujen yhteishaku syksy 2021', NULL, NULL, CAST(N'2021-09-27' AS Date), CAST(N'2021-09-27' AS Date), CAST(N'2021-11-29' AS Date), CAST(N'2021-12-22' AS Date), CAST(N'2022-01-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (49, N'Erillishaku', NULL, N'20212', CAST(N'2021-09-27' AS Date), CAST(N'2021-09-27' AS Date), CAST(N'2021-09-27' AS Date), CAST(N'2021-09-27' AS Date), CAST(N'2021-09-27' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (50, N'Erillishaku', NULL, N'20221', CAST(N'2022-01-24' AS Date), CAST(N'2022-01-24' AS Date), CAST(N'2022-01-24' AS Date), CAST(N'2022-01-24' AS Date), CAST(N'2022-01-24' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (51, N'Korkeakoulujen kevään 2021 toinen yhteishaku', N'1.2.246.562.29.98117005904', NULL, NULL, NULL, CAST(N'2021-07-12' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (52, N'Korkeakoulujen kevään 2021 toinen yhteishaku', N'1.2.246.562.29.98117005904', NULL, NULL, NULL, CAST(N'2021-06-01' AS Date), NULL, NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] ([id], [haku], [haku_oid], [koulutuksen_alkamiskausi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet]) VALUES (53, N'Korkeakoulujen kevään 2021 ensimmäinen yhteishaku', N'1.2.246.562.29.72389663526', NULL, NULL, NULL, CAST(N'2021-06-07' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] OFF
GO
