USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_amos_tavoitteelliset_opiskelijavuodet]    Script Date: 29.10.2020 16:34:49 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_tavoitteelliset_opiskelijavuodet]
GO
/****** Object:  Table [sa].[sa_amos_tavoitteelliset_opiskelijavuodet]    Script Date: 29.10.2020 16:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tavoitteelliset_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_tavoitteelliset_opiskelijavuodet](
	[vuosi] [int] NULL,
	[ytunnus] [varchar](10) NOT NULL,
	[koulutuksen_jarjestaja] [varchar](200) NOT NULL,
	[tavoitteelliset_opiskelijavuodet] [int] NOT NULL,
	[source] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0763403-0', N'ABB Oy', 50, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0155402-1', N'Ahlmanin koulun Säätiö sr', 329, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2767840-1', N'Air Navigation Services Finland Oy', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0150951-1', N'Aitoon Emäntäkoulu Oy', 89, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0213612-0', N'Ami-säätiö sr', 2754, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0116354-9', N'Ammattienedistämislaitossäätiö AEL sr', 1133, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2811092-2', N'Ammattiopisto Spesia Oy', 1106, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0211060-9', N'Ava-instituutin kannatusyhdistys ry', 87, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2064886-7', N'Axxell Utbildning Ab', 1741, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0986820-1', N'Cargotec Finland Oy ', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2189108-4', N'Cimson Koulutuspalvelut Oy', 12, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0502454-6', N'Espoon seudun koulutuskuntayhtymä Omnia', 6488, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1027740-9', N'Etelä-Karjalan Koulutuskuntayhtymä', 3214, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2249317-6', N'Etelä-Savon Koulutus Oy', 2724, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0203717-3', N'Eurajoen kristillisen opiston kannatusyhdistys r.y.', 37, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0108023-3', N'Finnair Oyj', 73, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2334857-9', N'Folkhälsan Utbildning Ab', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0209492-8', N'Fria kristliga Folkhögskolan i Vasa', 26, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0734567-7', N'Fysikaalinen hoitolaitos Arcus Lumio & Pirttimaa', 36, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0209770-7', N'Haapaveden Opiston kannatustyhdistys ry', 125, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1055483-2', N'Harjun Oppimiskeskus Oy', 198, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1778388-1', N'HAUS Kehittämiskeskus Oy', 25, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201256-6', N'Helsingin kaupunki', 9947, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201252-3', N'Helsingin Konservatorion Säätiö sr', 64, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0200004-7', N'Helsingin kristillisen opiston säätiö sr', 40, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2162576-3', N'Helsinki Business College Oy', 2065, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201472-1', N'Hengitysliitto ry', 1534, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0934732-6', N'Hevosopisto Oy', 326, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2250205-2', N'Hyria koulutus Oy ', 3686, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2627679-3', N'Hämeen ammatti-instituutti Oy', 476, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201375-3', N'Invalidisäätiö sr', 1078, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207329-7', N'Itä-Karjalan Kansanopistoseura ry', 43, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207390-8', N'Itä-Savon koulutuskuntayhtymä', 1460, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0167924-6', N'Itä-Suomen Liikuntaopisto Oy', 75, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0210838-1', N'Itä-Uudenmaan Koulutuskuntayhtymä', 2406, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0242746-2', N'Joensuun kaupunki', 68, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0210010-1', N'Jokilaaksojen koulutuskuntyhtymä', 3178, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1637771-8', N'Jollas-Opisto Oy', 153, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0208201-1', N'Jyväskylän Koulutuskuntayhtymä', 7385, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1605076-6', N'Jyväskylän kristillisen opiston säätiö sr', 190, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0942165-3', N'Jyväskylän Talouskouluyhdistys r.y.', 123, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1807931-9', N'Järviseudun Koulutuskuntayhtymä', 570, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0188756-3', N'Kainuun Opisto Oy', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0214958-9', N'Kajaanin kaupunki', 2666, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0209892-9', N'Kalajoen Kristillisen Opiston Kannatusyhdistys ry', 98, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0213977-8', N'Kanneljärven Kansanopiston kannatusyhdistys r.y.', 90, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0213502-1', N'Kansan Sivistystyön Liitto KSL ry', 63, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0208362-0', N'Karstulan Evankelisen Kansanopiston kannatusyhdistys ry', 26, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0503417-0', N'Kauppiaitten Kauppaoppilaitos Oy', 724, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0178980-8', N'Kaustisen Evankelisen Opiston Kannatusyhdistys ry', 74, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0101304-9', N'Kelloseppätaidon Edistämissäätiö sr', 87, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2109309-0', N'Kemi-Tornionlaakson koulutuskuntayhtymä, Lappia', 2603, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1943518-6', N'Keski-Pohjanmaan Konservatorion Kannatusyhdistys Ry', 48, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0208916-8', N'Keski-Pohjanmaan Koulutusyhtymä', 2800, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0213834-5', N'Keski-Uudenmaan koulutuskuntayhtymä', 5705, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0774302-6', N'Kiinteistöalan Koulutussäätiö sr', 360, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0147520-0', N'Kiipulasäätiö sr', 659, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0215281-7', N'Kirkkopalvelut ry ', 1461, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0128756-8', N'Kisakalliosäätiö sr', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207572-7', N'Kiteen Evankelisen Kansanopiston kannatusyhdistys ry', 23, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1904292-1', N'KONE Hissit Oy', 41, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0950895-1', N'Konecranes Finland Oy', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0536496-2', N'Korpisaaren Säätiö sr', 100, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1958694-5', N'Kotkan-Haminan seudun koulutuskuntayhtymä', 2583, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0993644-6', N'Koulutuskeskus Salpaus -kuntayhtymä', 6127, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0205303-4', N'Koulutuskuntayhtymä Tavastia', 2338, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0161067-9', N'Kouvolan Ammatillinen Aikuiskoulutussäätiö sr', 195, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0161075-9', N'Kouvolan kaupunki', 2424, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0832600-5', N'KSAK Oy', 117, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207862-9', N'Kuopion Konservatorion kannatusyhdistys r.y.', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207872-5', N'Kuopion Talouskoulun Kannatusyhdistys ry', 94, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0180124-8', N'Kuortaneen Urheiluopistosäätiö sr', 149, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0209021-4', N'Kvarnen samkommun', 34, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0206976-5', N'Kymenlaakson Opiston Kannatusyhdistys ry', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0149666-9', N'Lahden kansanopiston säätiö sr', 28, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0149057-4', N'Lahden Konservatorio Oy', 43, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0169327-5', N'Lieksan Kristillisen Opiston kannatusyhdistys ry', 7, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0626288-8', N'Lounais-Hämeen ammatillisen koulutuksen ky', 1228, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0204023-3', N'Lounais-Suomen koulutuskuntayhtymä', 1694, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0203167-9', N'Luksia, Länsi-Uudenmaan koulutuskuntayhtymä ', 2670, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2245018-4', N'Länsirannikon Koulutus Oy', 4816, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0871305-6', N'M.S.F-oppilaitos Oy', 28, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0222804-1', N'Maalariammattikoulun kannatusyhdistys r.y.', 219, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2460281-5', N'Management Institute Finland MIF Oy', 78, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201689-0', N'Markkinointi-instituutin Kannatusyhdistys ry', 1023, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0187711-1', N'Marttayhdistysten liitto ry', 193, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0772017-4', N'Meyer Turku Oy', 25, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0151534-8', N'Nanso Group Oy', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0112038-9', N'Nokia Oyj', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0201789-3', N'Opintotoiminnan keskusliitto ry', 30, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0796234-1', N'Optima samkommun', 1286, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0187690-1', N'Oulun kaupunki', 47, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0992445-3', N'Oulun seudun koulutuskuntayhtymä (OSEKK)', 7562, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0130270-5', N'Oy Porvoo International College Ab', 627, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0365121-2', N'Paasikiviopistoyhdistys r.y.', 45, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0882817-9', N'Palkansaajien koulutussäätiö  sr ', 86, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0153158-3', N'Palloilu Säätiö sr', 62, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0823246-3', N'Peimarin koulutuskuntayhtymä', 992, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2734201-9', N'Perho Liiketalousopisto Oy', 1442, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0193507-8', N'Peräpohjolan Kansanopiston kannatusyhdistys ry', 67, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0212371-7', N'Pohjois-Karjalan Koulutuskuntayhtymä', 5324, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0280690-5', N'Pohjois-Satakunnan Kansanopiston kannatusyhdistys r.y.', 117, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0214822-8', N'Pohjois-Savon Kansanopistoseura r.y.', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0828475-7', N'Pohjois-Suomen Koulutuskeskussäätiö sr', 239, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0908429-8', N'Pop & Jazz Konservatorion Säätiö sr', 113, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207972-8', N'Portaanpää ry', 82, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0210287-9', N'Raahen Koulutuskuntayhtymä', 1042, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0189373-6', N'Raahen Porvari- ja Kauppakoulurahasto sr', 184, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0204427-7', N'Raision Seudun Koulutuskuntayhtymä ', 1755, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0215303-5', N'Rakennusteollisuus RT ry', 123, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0114371-6', N'Rastor Oy', 507, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0195258-0', N'Raudaskylän Kristillinen Opisto r.y.', 33, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0113276-9', N'Rautaruukki Oyj', 49, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0210311-8', N'Reisjärven Kristillinen Kansanopistoyhdistys ry', 10, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0210668-5', N'Rovalan Setlementti ry', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0973110-9', N'Rovaniemen Koulutuskuntayhtymä', 3463, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0139545-4', N'Salon Seudun Koulutuskuntayhtymä', 2028, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0214081-6', N'Samkommunen för Yrkesutbildning i Östra Nyland', 224, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1524361-1', N'Sanoma Oyj ', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0204964-1', N'SASKY koulutuskuntayhtymä', 3719, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0203929-1', N'Satakunnan koulutuskuntayhtymä', 2018, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1852679-9', N'Savon Koulutuskuntayhtymä', 6371, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1007629-5', N'Seinäjoen koulutuskuntayhtymä', 4631, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2756786-7', N'Suomen Diakoniaopisto - SDO Oy', 1804, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1728925-0', N'Suomen Ilmailuopisto Oy', 73, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0116936-9', N'Suomen kansallisooppera ja -baletti sr', 29, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0242525-6', N'Suomen Luterilainen Evankeliumiyhdistys ry', 21, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'2390097-6', N'Suomen Nosturikoulutus Oy', 19, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0207230-7', N'Suomen Nuoriso-Opiston kannatusyhdistys ry', 102, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0202512-1', N'Suomen Urheiluopiston Kannatusosakeyhtiö', 238, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0681365-1', N'Suomen ympäristöopisto SYKLI Oy', 226, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0208850-1', N'Suomen yrittäjäopiston kannatus Oy', 498, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0973712-1', N'Suupohjan Koulutuskuntayhtymä', 563, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1648362-5', N'Svenska Framtidsskolan i Helsingforsregionen Ab', 883, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0988182-8', N'Svenska Österbottens förbund för Utbildning och Kultur', 1520, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0155651-0', N'Tampereen Aikuiskoulutussäätiö sr', 2000, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0211675-2', N'Tampereen kaupunki', 8694, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0206148-0', N'Tampereen Musiikkiopiston Säätiö sr', 66, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1099221-8', N'Tampereen Urheiluhierojakoulu Oy', 5, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0166930-4', N'Tanhuvaaran Säätiö sr', 70, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0872020-5', N'Teak Oy', 165, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0172730-8', N'Tohtori Matthias Ingmanin säätiö sr', 192, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1019670-5', N'Toyota Auto Finland Oy', 35, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1577184-4', N'Traffica Oy', 38, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0858476-8', N'TUL:n Kisakeskussäätiö sr', 5, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0142247-5', N'Turun Aikuiskoulutussäätiö sr', 983, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0276652-8', N'Turun Ammattiopistosäätiö sr', 327, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0204819-8', N'Turun kaupunki', 5003, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0915313-4', N'Turun kristillisen opiston säätiö sr', 229, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0202496-2', N'Työtehoseura ry', 1354, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0215382-8', N'Työväen Sivistysliitto TSL ry', 56, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1041090-0', N'UPM-Kymmene Oyj', 45, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0209602-6', N'Vaasan kaupunki', 2604, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0206289-7', N'Valkeakosken seudun koulutuskuntayhtymä', 1076, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0163408-0', N'Valkealan Kristillisen Kansanopiston kannatusyhdistys r.y.', 19, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0143991-2', N'Valmet Automotive Oy', 15, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'1053500-9', N'Valtakunnallinen valmennus- ja liikuntakeskus Oy', 173, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0124610-9', N'Vantaan kaupunki', 3383, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0155689-5', N'Varalan Säätiö sr', 133, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0195200-3', N'Vuokatin säätiö sr', 111, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0195032-3', N'Vuolle Setlementti ry', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0773744-3', N'Wärtsilä Finland Oy', 35, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0214765-5', N'Ylä-Savon koulutuskuntayhtymä', 1541, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0208589-6', N'Äänekosken Ammatillisen Koulutuksen kuntayhtymä', 1592, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2018, N'0204843-8', N'Turun Konservatorion kannatusyhdistys r.y. - Garantiföreningen för Åbo Konservatorium r.y. ', 84, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0763403-0', N'ABB Oy', 50, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0155402-1', N'Ahlmanin koulun Säätiö', 334, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2767840-1', N'Air Navigation Services', 20, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0150951-1', N'Aitoon Emäntäkoulu Oy', 93, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0213612-0', N'Ami-säätiö', 2756, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0116354-9', N'Ammattienedistämislaitos-', 1085, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2811092-2', N'Ammattiopisto Spesia Oy', 1106, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0211060-9', N'AVA-instituutin Kannatus-', 77, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2064886-7', N'Axxell Utbildning Ab', 1731, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0986820-1', N'Cargotec Finland Oy', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2189108-4', N'Cimson Koulutuspalvelut Oy', 10, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2918298-7', N'EdupoliPointCollege Oy', 2949, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0502454-6', N'Espoon seudun koulutuskunta-', 6553, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1027740-9', N'Etelä-Karjalan koulutus-', 3365, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2249317-6', N'Etelä-Savon Koulutus Oy', 2696, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0203717-3', N'Eurajoen kristillisen opiston', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0108023-3', N'Finnair Oyj', 73, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2334857-9', N'Folkhälsan Utbildning Ab', 114, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0209492-8', N'Fria kristliga folkhögskolan', 26, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0734567-7', N'Fysikaalinen hoitolaitos', 36, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0209770-7', N'Haapaveden Opiston kannatus-', 125, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1055483-2', N'Harjun oppimiskeskus oy', 203, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1778388-1', N'Haus Kehittämiskeskus Oy', 25, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201256-6', N'Helsingin kaupunki', 9976, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201252-3', N'Helsingin konservatorion', 64, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2162576-3', N'Helsinki Business College Oy', 2020, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201472-1', N'Hengitysliitto ry', 1534, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0934732-6', N'Hevosopisto Oy', 320, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2250205-2', N'Hyria koulutus Oy', 3461, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2627679-3', N'Hämeen ammatti-instituutti Oy', 506, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201375-3', N'Invalidisäätiö', 909, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207329-7', N'Itä-Karjalan kansanopistoseura', 43, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207390-8', N'Itä-Savon koulutuskuntayhtymä', 1475, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0167924-6', N'Itä-Suomen liikuntaopisto Oy', 80, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0242746-2', N'Joensuun kaupunki', 68, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0210010-1', N'Jokilaaksojen koulutus-', 3038, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1637771-8', N'Jollas-Opisto Oy', 143, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0208201-1', N'Jyväskylän koulutuskuntayhtymä', 7048, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1605076-6', N'Jyväskylän kristillisen', 180, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0942165-3', N'Jyväskylän talouskoulu-', 123, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1807931-9', N'Järviseudun koulutus-', 570, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0214958-9', N'Kajaanin kaupunki', 2734, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0209892-9', N'Kalajoen kristillisen', 98, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0213977-8', N'Kanneljärven kansanopiston', 90, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0213502-1', N'Kansan sivistystyön liiton', 63, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0208362-0', N'Karstulan evankelisen kansan-', 23, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0503417-0', N'Kauppiaitten Kauppa-', 759, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0178980-8', N'Kaustisen Evankelisen Opiston', 69, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0101304-9', N'Kellosepäntaidon edistämis-', 88, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2109309-0', N'Kemi-Tornionlaakson koulutus-', 2694, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1943518-6', N'Keski-Pohjanmaan konservato-', 48, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0208916-8', N'Keski-Pohjanmaan koulutus-', 2733, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0213834-5', N'Keski-Uudenmaan koulutuskunta-', 5900, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0774302-6', N'Kiinteistöalan koulutussäätiön', 345, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0147520-0', N'Kiipulasäätiö', 647, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0215281-7', N'Kirkkopalvelut ry', 1535, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0128756-8', N'Kisakalliosäätiö', 115, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207572-7', N'Kiteen evankelisen kansan-', 20, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1904292-1', N'KONE Hissit Oy', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0950895-1', N'Konecranes Finland Oy', 20, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0536496-2', N'Korpisaaren säätiö', 100, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1958694-5', N'Kotkan-Haminan seudun', 2599, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0993644-6', N'Koulutuskeskus Salpaus-kunta-', 6166, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0205303-4', N'Koulutuskuntayhtymä Tavastia', 2254, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0161067-9', N'Kouvolan Ammatillinen', 260, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0161075-9', N'Kouvolan kaupunki', 2441, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0832600-5', N'KSAK Oy', 117, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207862-9', N'Kuopion konservatorion', 52, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207872-5', N'Kuopion Talouskoulun kannatus-', 94, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0180124-8', N'Kuortaneen urheiluopistosäätiö', 149, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0209021-4', N'Kvarnen samkommun', 33, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0200004-7', N'Laajasalon opiston säätiö sr', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0149666-9', N'Lahden kansanopiston säätiö', 28, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0149057-4', N'Lahden Konservatorio Oy', 43, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0169327-5', N'Lieksan kristillisen opiston', 7, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0626288-8', N'Lounais-Hämeen koulutuskunta', 1228, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0204023-3', N'Lounais-Suomen koulutuskunta-', 1714, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0203167-9', N'Luksia, Länsi-Uudenmaan', 2810, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2245018-4', N'Länsirannikon Koulutus Oy', 5028, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0871305-6', N'M.S.F-oppilaitos Oy', 28, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0222804-1', N'Maalariammattikoulun', 214, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2460281-5', N'Management Institute of Fin.', 73, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201689-0', N'Markkinointi-Instituutin', 1023, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0187711-1', N'Marttayhdistysten liitto ry', 210, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0772017-4', N'Meyer Turku Oy', 8, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0112038-9', N'Nokia-yhtymä', 114, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0201789-3', N'Opintotoiminnan keskusliitto', 30, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0796234-1', N'Optima samkommun', 1286, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0187690-1', N'Oulun kaupunki', 45, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0992445-3', N'Oulun seudun koulutuskunta-', 7672, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0365121-2', N'Paasikiviopistoyhdistys ry', 45, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0882817-9', N'Palkansaajien koulutussäätiö', 86, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0153158-3', N'Palloilu Säätiö', 62, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0823246-3', N'Peimarin koulutuskuntayhtymä', 984, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2734201-9', N'Perho Liiketalousopisto Oy', 1427, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0193507-8', N'Peräpohjolan kansanopiston', 67, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0212371-7', N'Pohjois-Karjalan koulutus-', 5214, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0280690-5', N'Pohjois-Satakunnan kansanopis-', 117, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0214822-8', N'Pohjois-Savon kansanopisto-', 52, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0828475-7', N'Pohjois-Suomen koulutus-', 304, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0908429-8', N'Pop & Jazz Konservatorion', 113, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207972-8', N'Portaanpää ry.', 77, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0210287-9', N'Raahen koulutuskuntayhtymä', 1027, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0189373-6', N'Raahen Porvari- ja Kauppakou-', 179, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0204427-7', N'Raision seudun koulutuskunta-', 1870, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0215303-5', N'Rakennusteollisuus RT ry', 88, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0114371-6', N'Rastor Oy', 517, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0195258-0', N'Raudaskylän Kristillinen', 38, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0113276-9', N'Rautaruukki Oyj', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0210311-8', N'Reisjärven kristillinen', 10, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0210668-5', N'Rovalan Setlementti ry', 50, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0973110-9', N'Rovaniemen koulutuskuntayhtymä', 3467, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0139545-4', N'Salon seudun koulutuskunta-', 2088, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0214081-6', N'Samkommunen för yrkesutbild-', 221, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1524361-1', N'SanomaWSOY Oyj', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0204964-1', N'SASKY koulutuskuntayhtymä', 3680, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0203929-1', N'Satakunnan koulutuskuntayhtymä', 2106, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1852679-9', N'Savon koulutuskuntayhtymä', 6171, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1007629-5', N'Seinäjoen koulutuskuntayhtymä', 4767, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'2756786-7', N'Suomen Diakoniaopisto-SDO Oy', 1919, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1728925-0', N'Suomen Ilmailuopisto Oy', 83, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0116936-9', N'Suomen Kansallisooppera ja', 27, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0242525-6', N'Suomen Luterilainen Evankeliu-', 21, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0207230-7', N'Suomen Nuoriso-opiston', 102, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0202512-1', N'Suomen Urheiluopiston kannatus', 248, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0681365-1', N'Suomen Ympäristöopisto', 216, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0208850-1', N'Suomen yrittäjäopiston', 648, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0973712-1', N'Suupohjan koulutuskuntayhtymä', 563, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1648362-5', N'Svenska framtidsskolan i', 883, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0988182-8', N'Svenska Österbottens förbund', 1519, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0155651-0', N'Tampereen Aikuiskoulutussäätiö', 1853, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0211675-2', N'Tampereen kaupunki', 8614, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0206148-0', N'Tampereen musiikkiopiston', 66, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1099221-8', N'Tampereen Urheiluhieroja-', 5, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0166930-4', N'Tanhuvaaran säätiö', 73, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1019670-5', N'Toyota Auto Finland Oy', 35, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1577184-4', N'Traffica Oy', 35, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0172730-8', N'Tri Matthias Ingmanin säätiö', 197, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0858476-8', N'TUL:n Kisakeskussäätiö', 5, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0142247-5', N'Turun aikuiskoulutussäätiö', 1171, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0276652-8', N'Turun ammattiopistosäätiö', 338, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0204819-8', N'Turun kaupunki', 5089, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0204843-8', N'Turun konservatorion', 84, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0915313-4', N'Turun kristillisen opiston', 229, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0202496-2', N'Työtehoseura ry', 1262, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0215382-8', N'Työväen Sivistysliitto TSL', 45, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1041090-0', N'UPM-Kymmene Oyj', 44, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0209602-6', N'Vaasan kaupunki', 2609, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0206289-7', N'Valkeakosken seudun', 1055, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0163408-0', N'Valkealan kristillisen kansan-', 19, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0143991-2', N'Valmet Automotive Oy', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'1053500-9', N'Valtakunnallinen valmennus- ja', 178, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0124610-9', N'Vantaan kaupunki', 3480, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0155689-5', N'Varalan Säätiö', 138, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0195032-3', N'Vuolle Setlementti ry', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0773744-3', N'Wärtsilä Finland Oy', 35, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0214765-5', N'Ylä-Savon koulutuskuntayhtymä', 1550, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2019, N'0208589-6', N'Äänekosken ammatillisen koulu-', 1642, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0763403-0', N'ABB Oy', 50, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'3008326-5', N'AEL-Amiedu Oy', 4244, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0155402-1', N'Ahlmanin koulun Säätiö sr', 349, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2767840-1', N'Air Navigation Services Finland Oy', 20, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0150951-1', N'Aitoon Emäntäkoulu Oy', 104, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2811092-2', N'Ammattiopisto Spesia Oy', 1126, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0211060-9', N'Ava-instituutin kannatusyhdistys ry', 77, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2064886-7', N'Axxell Utbildning Ab', 1731, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2918298-7', N'Careeria Oy', 3154, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2189108-4', N'Cimson Koulutuspalvelut Oy', 10, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0502454-6', N'Espoon seudun koulutuskuntayhtymä Omnia', 6715, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1027740-9', N'Etelä-Karjalan Koulutuskuntayhtymä', 3139, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2249317-6', N'Etelä-Savon Koulutus Oy', 2620, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0203717-3', N'Eurajoen kristillisen opiston kannatusyhdistys r.y.', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0108023-3', N'Finnair Oyj', 73, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2334857-9', N'Folkhälsan Utbildning Ab', 112, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0209492-8', N'Fria Kristliga Folkhögskolföreningen FKF rf', 26, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0734567-7', N'Fysikaalinen hoitolaitos Arcus Lumio & Pirttimaa', 29, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0209770-7', N'Haapaveden Opiston kannatusyhdistys ry', 125, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1055483-2', N'Harjun Oppimiskeskus Oy', 203, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1778388-1', N'HAUS Kehittämiskeskus Oy', 25, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201256-6', N'Helsingin kaupunki', 10021, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201252-3', N'Helsingin Konservatorion Säätiö sr', 64, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2162576-3', N'Helsinki Business College Oy', 2090, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201472-1', N'Hengitysliitto ry', 1601, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0934732-6', N'Hevosopisto Oy', 324, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2250205-2', N'Hyria koulutus Oy', 3683, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2627679-3', N'Hämeen ammatti-instituutti Oy', 501, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201375-3', N'Invalidisäätiö sr', 935, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207329-7', N'Itä-Karjalan Kansanopistoseura ry', 45, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207390-8', N'Itä-Savon koulutuskuntayhtymä', 1475, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0167924-6', N'Itä-Suomen Liikuntaopisto Oy', 80, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0242746-2', N'Joensuun kaupunki', 68, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0210010-1', N'Jokilaaksojen koulutuskuntayhtymä', 3008, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1637771-8', N'Jollas-Opisto Oy', 143, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0208201-1', N'Jyväskylän Koulutuskuntayhtymä', 6791, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1605076-6', N'Jyväskylän kristillisen opiston säätiö sr', 182, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0942165-3', N'Jyväskylän Talouskouluyhdistys r.y.', 125, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1807931-9', N'Järviseudun Koulutuskuntayhtymä', 555, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0214958-9', N'Kajaanin kaupunki', 2824, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0209892-9', N'Kalajoen Kristillisen Opiston Kannatusyhdistys ry', 98, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0213977-8', N'Kanneljärven Kansanopiston kannatusyhdistys r.y.', 90, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0213502-1', N'Kansan Sivistystyön Liitto KSL ry', 63, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0208362-0', N'Karstulan Evankelisen Kansanopiston kannatusyhdistys ry', 23, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0503417-0', N'Kauppiaitten Kauppaoppilaitos Oy', 789, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0178980-8', N'Kaustisen Evankelisen Opiston Kannatusyhdistys ry', 69, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0101304-9', N'Kellosepäntaidon Edistämissäätiö sr', 83, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2109309-0', N'Kemi-Tornionlaakson koulutuskuntayhtymä Lappia', 2640, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1943518-6', N'Keski-Pohjanmaan Konservatorion Kannatusyhdistys ry', 49, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0208916-8', N'Keski-Pohjanmaan Koulutusyhtymä', 2758, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0213834-5', N'Keski-Uudenmaan koulutuskuntayhtymä', 6096, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0774302-6', N'Kiinteistöalan Koulutussäätiö sr', 345, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0147520-0', N'Kiipulasäätiö sr', 663, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0215281-7', N'Kirkkopalvelut ry', 1644, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0128756-8', N'Kisakalliosäätiö sr', 120, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207572-7', N'Kiteen Evankelisen Kansanopiston kannatusyhdistys ry', 20, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1904292-1', N'KONE Hissit Oy', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0950895-1', N'Konecranes Finland Oy', 12, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0536496-2', N'Korpisaaren Säätiö sr', 105, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1958694-5', N'Kotkan-Haminan seudun koulutuskuntayhtymä', 2510, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0993644-6', N'Koulutuskeskus Salpaus -kuntayhtymä', 6159, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0205303-4', N'Koulutuskuntayhtymä Tavastia', 2254, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0161067-9', N'Kouvolan Aikuiskoulutussäätiö sr', 385, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0161075-9', N'Kouvolan kaupunki', 2557, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0832600-5', N'KSAK Oy', 100, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207862-9', N'Kuopion Konservatorion kannatusyhdistys r.y.', 52, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207872-5', N'Kuopion Talouskoulun kannatusyhdistys r.y.', 90, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0180124-8', N'Kuortaneen Urheiluopistosäätiö sr', 151, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0209021-4', N'Kvarnen samkommun', 32, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0200004-7', N'Laajasalon opiston säätiö sr', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0149666-9', N'Lahden kansanopiston säätiö sr', 27, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0149057-4', N'Lahden Konservatorio Oy', 43, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0626288-8', N'Lounais-Hämeen koulutuskuntayhtymä', 1205, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0204023-3', N'Lounais-Suomen koulutuskuntayhtymä', 1784, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0203167-9', N'Luksia, Länsi-Uudenmaan koulutuskuntayhtymä', 2972, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2245018-4', N'Länsirannikon Koulutus Oy', 4764, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0222804-1', N'Maalariammattikoulun kannatusyhdistys r.y.', 216, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2460281-5', N'Management Institute of Finland MIF Oy', 73, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201689-0', N'Markkinointi-instituutin Kannatusyhdistys ry', 1430, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0187711-1', N'Marttayhdistysten liitto ry', 210, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0772017-4', N'Meyer Turku Oy', 13, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0151534-8', N'Nanso Group Oy', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0112038-9', N'Nokia Oyj', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0201789-3', N'Opintotoiminnan Keskusliitto ry, Centralförbundet för Studieverksamhet rf', 8, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0796234-1', N'Optima samkommun', 1202, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0187690-1', N'Oulun kaupunki', 43, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0992445-3', N'Oulun seudun koulutuskuntayhtymä (OSEKK)', 6937, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0365121-2', N'Paasikiviopistoyhdistys r.y.', 45, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0882817-9', N'Palkansaajien koulutussäätiö sr', 81, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0153158-3', N'Palloilu Säätiö sr', 67, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0823246-3', N'Peimarin koulutuskuntayhtymä', 1002, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2734201-9', N'Perho Liiketalousopisto Oy', 1427, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0193507-8', N'Peräpohjolan Kansanopiston kannatusyhdistys ry', 72, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0212371-7', N'Pohjois-Karjalan Koulutuskuntayhtymä', 5317, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0280690-5', N'Pohjois-Satakunnan Kansanopiston kannatusyhdistys r.y.', 122, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0214822-8', N'Pohjois-Savon Kansanopistoseura r.y.', 56, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0828475-7', N'Pohjois-Suomen Koulutuskeskussäätiö sr', 319, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0908429-8', N'Pop & Jazz Konservatorion Säätiö sr', 118, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207972-8', N'Portaanpää ry', 77, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0210287-9', N'Raahen Koulutuskuntayhtymä', 1072, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0189373-6', N'Raahen Porvari- ja Kauppakoulurahasto sr', 199, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0204427-7', N'Raision Seudun Koulutuskuntayhtymä', 1872, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0215303-5', N'Rakennusteollisuus RT ry', 118, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0195258-0', N'Raudaskylän Kristillinen Opisto r.y.', 39, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0210668-5', N'Rovalan Setlementti ry', 60, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0973110-9', N'Rovaniemen Koulutuskuntayhtymä', 3450, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0139545-4', N'Salon Seudun Koulutuskuntayhtymä', 2088, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1524361-1', N'Sanoma Oyj ', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0204964-1', N'SASKY koulutuskuntayhtymä', 3815, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0203929-1', N'Satakunnan koulutuskuntayhtymä', 2300, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1852679-9', N'Savon Koulutuskuntayhtymä', 5887, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1007629-5', N'Seinäjoen koulutuskuntayhtymä', 4600, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2756786-7', N'Suomen Diakoniaopisto - SDO Oy', 1934, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1728925-0', N'Suomen Ilmailuopisto Oy', 88, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0116936-9', N'Suomen kansallisooppera ja -baletti sr', 27, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0242525-6', N'Suomen Luterilainen Evankeliumiyhdistys ry', 21, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0207230-7', N'Suomen Nuoriso-Opiston kannatusyhdistys ry', 102, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0202512-1', N'Suomen Urheiluopiston Kannatusosakeyhtiö', 287, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0681365-1', N'Suomen ympäristöopisto SYKLI Oy', 235, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0208850-1', N'Suomen Yrittäjäopisto Oy', 731, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0973712-1', N'Suupohjan Koulutuskuntayhtymä', 563, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1648362-5', N'Svenska Framtidsskolan i Helsingforsregionen Ab', 1087, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0988182-8', N'Svenska Österbottens förbund för Utbildning och Kultur', 1519, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0155651-0', N'Tampereen Aikuiskoulutussäätiö sr', 2151, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0211675-2', N'Tampereen kaupunki', 8614, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0206148-0', N'Tampereen Musiikkiopiston Säätiö sr', 66, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0166930-4', N'Tanhuvaaran Säätiö sr', 66, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0172730-8', N'Tohtori Matthias Ingmanin säätiö sr', 199, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1019670-5', N'Toyota Auto Finland Oy', 35, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1577184-4', N'Traffica Oy', 37, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0858476-8', N'TUL:n Kisakeskussäätiö sr', 5, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0142247-5', N'Turun Aikuiskoulutussäätiö sr', 1379, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0276652-8', N'Turun Ammattiopistosäätiö sr', 320, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0204819-8', N'Turun kaupunki', 5246, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0915313-4', N'Turun kristillisen opiston säätiö sr', 242, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'2962876-6', N'Turun musiikinopetus Oy', 84, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0871305-6', N'TYA-oppilaitos Oy', 28, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0202496-2', N'Työtehoseura ry', 1384, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0215382-8', N'Työväen Sivistysliitto TSL ry', 5, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1041090-0', N'UPM-Kymmene Oyj', 40, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0209602-6', N'Vaasan kaupunki', 2610, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0206289-7', N'Valkeakosken seudun koulutuskuntayhtymä', 1055, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0163408-0', N'Valkealan Kristillisen Kansanopiston kannatusyhdistys r.y.', 17, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0143991-2', N'Valmet Automotive Oy', 0, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'1053500-9', N'Valtakunnallinen valmennus- ja liikuntakeskus Oy', 175, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0124610-9', N'Vantaan kaupunki', 3665, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0155689-5', N'Varalan Säätiö sr', 163, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0773744-3', N'Wärtsilä Finland Oy', 35, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0214765-5', N'Ylä-Savon koulutuskuntayhtymä', 1550, N'Johannes Peltola 26.10.2020')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([vuosi], [ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet], [source]) VALUES (2020, N'0208589-6', N'Äänekosken Ammatillisen Koulutuksen kuntayhtymä', 1707, N'Johannes Peltola 26.10.2020')
