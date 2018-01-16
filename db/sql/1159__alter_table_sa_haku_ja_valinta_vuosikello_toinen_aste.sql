USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]    Script Date: 16.1.2018 11:18:03 ******/
DROP TABLE IF EXISTS [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]    Script Date: 16.1.2018 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]') AND type in (N'U'))
BEGIN
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
	[pisterajat] [date] NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen kevään 2014 yhteishaku', N'1.2.246.562.5.2013080813081926341927', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2014-10-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2015', N'1.2.246.562.29.90697286251', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku kevään 2015 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.13657766393', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2015 yhteishaku', N'1.2.246.562.29.80306203979', NULL, N'2015      ', CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku syksyn 2015 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.94278815611', NULL, N'2015      ', CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2016', N'1.2.246.562.29.14662042044', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku kevään 2016 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.98929669087', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2017', N'1.2.246.562.29.10108985853', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2015', N'1.2.246.562.29.61316288341', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2015', N'1.2.246.562.29.14262905905', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2016', N'1.2.246.562.29.669559278110', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2016', N'1.2.246.562.29.67051356953', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2017', N'1.2.246.562.29.57263577488', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2015 haku', N'1.2.246.562.29.14865319314', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2015 lisähaku', N'1.2.246.562.29.67129953195', NULL, N'2015      ', CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), CAST(N'2015-11-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2016 haku', N'1.2.246.562.29.94318919571', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2016 lisähaku', N'1.2.246.562.29.41716846138', NULL, N'2016      ', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2017 haku', N'1.2.246.562.29.57768753733', NULL, N'2017      ', CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2016-10-03' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Ammatillisen koulutuksen syksyn 2016 haku keväällä alkavaan koulutukseen', N'1.2.246.562.29.74414985379', NULL, N'2016      ', CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-04' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku kevään 2017 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.62377116603', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2017 lisähaku', N'1.2.246.562.29.48353453128', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2017', N'1.2.246.562.29.59213949841', NULL, N'2017      ', CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku keväällä 2018 alkavaan koulutukseen', N'1.2.246.562.29.83917330132', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen haku keväällä 2018 alkavaan koulutukseen', N'1.2.246.562.29.82633706526', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Ammatillisen koulutuksen syksyn 2017 haku keväällä alkavaan koulutukseen', N'1.2.246.562.29.69946045619', NULL, N'2017      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku kevään yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.32820950486', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2014 yhteishaku', N'1.2.246.562.29.92175749016', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku syksyn 2014 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', N'1.2.246.562.29.35400243156', NULL, N'2014      ', CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Yhteishaku ammatilliseen ja lukioon, kevät 2018', N'1.2.246.562.29.55739081531', NULL, N'2018      ', CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-06-15' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-06-15' AS Date))
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku kevään 2018 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille', NULL, NULL, N'2018      ', CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Haku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2018', NULL, NULL, N'2018      ', CAST(N'2018-04-07' AS Date), CAST(N'2018-04-07' AS Date), CAST(N'2018-06-15' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Lisähaku erityisopetuksena järjestettävään ammatilliseen koulutukseen, kevät 2018', NULL, NULL, N'2018      ', CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2018 haku', N'1.2.246.562.29.50212298785', NULL, N'2018      ', CAST(N'2018-07-27' AS Date), CAST(N'2018-07-27' AS Date), CAST(N'2018-08-04' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-08-18' AS Date), NULL)
GO
INSERT [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] ([haku], [haku_oid], [koulutuksen_alkamiskausi], [hakuvuosi], [aloituspaikat], [hakijat], [valitut], [vastaanottaneet], [aloittaneet], [pisterajat]) VALUES (N'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2018 lisähaku', NULL, NULL, N'2018      ', CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-09-21' AS Date), NULL)
