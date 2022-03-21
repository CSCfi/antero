USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_amos_tavoitteelliset_opiskelijavuodet]    Script Date: 17.9.2019 16:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tavoitteelliset_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_tavoitteelliset_opiskelijavuodet](
	[ytunnus] [varchar](10) NOT NULL,
	[koulutuksen_jarjestaja] [varchar](200) NOT NULL,
	[tavoitteelliset_opiskelijavuodet_2018] [int] NOT NULL,
	[source] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0763403-0', N'ABB Oy', 50, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0155402-1', N'Ahlmanin koulun Säätiö sr', 329, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2767840-1', N'Air Navigation Services Finland Oy', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0150951-1', N'Aitoon Emäntäkoulu Oy', 89, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0213612-0', N'Ami-säätiö sr', 2754, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0116354-9', N'Ammattienedistämislaitossäätiö AEL sr', 1133, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2811092-2', N'Ammattiopisto Spesia Oy', 1106, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0211060-9', N'Ava-instituutin kannatusyhdistys ry', 87, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2064886-7', N'Axxell Utbildning Ab', 1741, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0986820-1', N'Cargotec Finland Oy ', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2189108-4', N'Cimson Koulutuspalvelut Oy', 12, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0502454-6', N'Espoon seudun koulutuskuntayhtymä Omnia', 6488, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1027740-9', N'Etelä-Karjalan Koulutuskuntayhtymä', 3214, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2249317-6', N'Etelä-Savon Koulutus Oy', 2724, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0203717-3', N'Eurajoen kristillisen opiston kannatusyhdistys r.y.', 37, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0108023-3', N'Finnair Oyj', 73, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2334857-9', N'Folkhälsan Utbildning Ab', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0209492-8', N'Fria kristliga Folkhögskolan i Vasa', 26, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0734567-7', N'Fysikaalinen hoitolaitos Arcus Lumio & Pirttimaa', 36, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0209770-7', N'Haapaveden Opiston kannatustyhdistys ry', 125, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1055483-2', N'Harjun Oppimiskeskus Oy', 198, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1778388-1', N'HAUS Kehittämiskeskus Oy', 25, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201256-6', N'Helsingin kaupunki', 9947, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201252-3', N'Helsingin Konservatorion Säätiö sr', 64, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0200004-7', N'Helsingin kristillisen opiston säätiö sr', 40, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2162576-3', N'Helsinki Business College Oy', 2065, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201472-1', N'Hengitysliitto ry', 1534, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0934732-6', N'Hevosopisto Oy', 326, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2250205-2', N'Hyria koulutus Oy ', 3686, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2627679-3', N'Hämeen ammatti-instituutti Oy', 476, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201375-3', N'Invalidisäätiö sr', 1078, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207329-7', N'Itä-Karjalan Kansanopistoseura ry', 43, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207390-8', N'Itä-Savon koulutuskuntayhtymä', 1460, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0167924-6', N'Itä-Suomen Liikuntaopisto Oy', 75, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0210838-1', N'Itä-Uudenmaan Koulutuskuntayhtymä', 2406, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0242746-2', N'Joensuun kaupunki', 68, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0210010-1', N'Jokilaaksojen koulutuskuntyhtymä', 3178, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1637771-8', N'Jollas-Opisto Oy', 153, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0208201-1', N'Jyväskylän Koulutuskuntayhtymä', 7385, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1605076-6', N'Jyväskylän kristillisen opiston säätiö sr', 190, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0942165-3', N'Jyväskylän Talouskouluyhdistys r.y.', 123, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1807931-9', N'Järviseudun Koulutuskuntayhtymä', 570, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0188756-3', N'Kainuun Opisto Oy', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0214958-9', N'Kajaanin kaupunki', 2666, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0209892-9', N'Kalajoen Kristillisen Opiston Kannatusyhdistys ry', 98, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0213977-8', N'Kanneljärven Kansanopiston kannatusyhdistys r.y.', 90, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0213502-1', N'Kansan Sivistystyön Liitto KSL ry', 63, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0208362-0', N'Karstulan Evankelisen Kansanopiston kannatusyhdistys ry', 26, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0503417-0', N'Kauppiaitten Kauppaoppilaitos Oy', 724, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0178980-8', N'Kaustisen Evankelisen Opiston Kannatusyhdistys ry', 74, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0101304-9', N'Kelloseppätaidon Edistämissäätiö sr', 87, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2109309-0', N'Kemi-Tornionlaakson koulutuskuntayhtymä, Lappia', 2603, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1943518-6', N'Keski-Pohjanmaan Konservatorion Kannatusyhdistys Ry', 48, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0208916-8', N'Keski-Pohjanmaan Koulutusyhtymä', 2800, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0213834-5', N'Keski-Uudenmaan koulutuskuntayhtymä', 5705, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0774302-6', N'Kiinteistöalan Koulutussäätiö sr', 360, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0147520-0', N'Kiipulasäätiö sr', 659, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0215281-7', N'Kirkkopalvelut ry ', 1461, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0128756-8', N'Kisakalliosäätiö sr', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207572-7', N'Kiteen Evankelisen Kansanopiston kannatusyhdistys ry', 23, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1904292-1', N'KONE Hissit Oy', 41, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0950895-1', N'Konecranes Finland Oy', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0536496-2', N'Korpisaaren Säätiö sr', 100, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1958694-5', N'Kotkan-Haminan seudun koulutuskuntayhtymä', 2583, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0993644-6', N'Koulutuskeskus Salpaus -kuntayhtymä', 6127, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0205303-4', N'Koulutuskuntayhtymä Tavastia', 2338, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0161067-9', N'Kouvolan Ammatillinen Aikuiskoulutussäätiö sr', 195, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0161075-9', N'Kouvolan kaupunki', 2424, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0832600-5', N'KSAK Oy', 117, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207862-9', N'Kuopion Konservatorion kannatusyhdistys r.y.', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207872-5', N'Kuopion Talouskoulun Kannatusyhdistys ry', 94, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0180124-8', N'Kuortaneen Urheiluopistosäätiö sr', 149, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0209021-4', N'Kvarnen samkommun', 34, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0206976-5', N'Kymenlaakson Opiston Kannatusyhdistys ry', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0149666-9', N'Lahden kansanopiston säätiö sr', 28, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0149057-4', N'Lahden Konservatorio Oy', 43, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0169327-5', N'Lieksan Kristillisen Opiston kannatusyhdistys ry', 7, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0626288-8', N'Lounais-Hämeen ammatillisen koulutuksen ky', 1228, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0204023-3', N'Lounais-Suomen koulutuskuntayhtymä', 1694, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0203167-9', N'Luksia, Länsi-Uudenmaan koulutuskuntayhtymä ', 2670, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2245018-4', N'Länsirannikon Koulutus Oy', 4816, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0871305-6', N'M.S.F-oppilaitos Oy', 28, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0222804-1', N'Maalariammattikoulun kannatusyhdistys r.y.', 219, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2460281-5', N'Management Institute Finland MIF Oy', 78, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201689-0', N'Markkinointi-instituutin Kannatusyhdistys ry', 1023, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0187711-1', N'Marttayhdistysten liitto ry', 193, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0772017-4', N'Meyer Turku Oy', 25, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0151534-8', N'Nanso Group Oy', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0112038-9', N'Nokia Oyj', 115, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0201789-3', N'Opintotoiminnan keskusliitto ry', 30, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0796234-1', N'Optima samkommun', 1286, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0187690-1', N'Oulun kaupunki', 47, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0992445-3', N'Oulun seudun koulutuskuntayhtymä (OSEKK)', 7562, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0130270-5', N'Oy Porvoo International College Ab', 627, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0365121-2', N'Paasikiviopistoyhdistys r.y.', 45, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0882817-9', N'Palkansaajien koulutussäätiö  sr ', 86, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0153158-3', N'Palloilu Säätiö sr', 62, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0823246-3', N'Peimarin koulutuskuntayhtymä', 992, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2734201-9', N'Perho Liiketalousopisto Oy', 1442, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0193507-8', N'Peräpohjolan Kansanopiston kannatusyhdistys ry', 67, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0212371-7', N'Pohjois-Karjalan Koulutuskuntayhtymä', 5324, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0280690-5', N'Pohjois-Satakunnan Kansanopiston kannatusyhdistys r.y.', 117, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0214822-8', N'Pohjois-Savon Kansanopistoseura r.y.', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0828475-7', N'Pohjois-Suomen Koulutuskeskussäätiö sr', 239, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0908429-8', N'Pop & Jazz Konservatorion Säätiö sr', 113, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207972-8', N'Portaanpää ry', 82, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0210287-9', N'Raahen Koulutuskuntayhtymä', 1042, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0189373-6', N'Raahen Porvari- ja Kauppakoulurahasto sr', 184, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0204427-7', N'Raision Seudun Koulutuskuntayhtymä ', 1755, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0215303-5', N'Rakennusteollisuus RT ry', 123, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0114371-6', N'Rastor Oy', 507, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0195258-0', N'Raudaskylän Kristillinen Opisto r.y.', 33, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0113276-9', N'Rautaruukki Oyj', 49, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0210311-8', N'Reisjärven Kristillinen Kansanopistoyhdistys ry', 10, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0210668-5', N'Rovalan Setlementti ry', 52, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0973110-9', N'Rovaniemen Koulutuskuntayhtymä', 3463, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0139545-4', N'Salon Seudun Koulutuskuntayhtymä', 2028, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0214081-6', N'Samkommunen för Yrkesutbildning i Östra Nyland', 224, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1524361-1', N'Sanoma Oyj ', 0, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0204964-1', N'SASKY koulutuskuntayhtymä', 3719, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0203929-1', N'Satakunnan koulutuskuntayhtymä', 2018, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1852679-9', N'Savon Koulutuskuntayhtymä', 6371, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1007629-5', N'Seinäjoen koulutuskuntayhtymä', 4631, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2756786-7', N'Suomen Diakoniaopisto - SDO Oy', 1804, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1728925-0', N'Suomen Ilmailuopisto Oy', 73, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0116936-9', N'Suomen kansallisooppera ja -baletti sr', 29, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0242525-6', N'Suomen Luterilainen Evankeliumiyhdistys ry', 21, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'2390097-6', N'Suomen Nosturikoulutus Oy', 19, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0207230-7', N'Suomen Nuoriso-Opiston kannatusyhdistys ry', 102, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0202512-1', N'Suomen Urheiluopiston Kannatusosakeyhtiö', 238, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0681365-1', N'Suomen ympäristöopisto SYKLI Oy', 226, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0208850-1', N'Suomen yrittäjäopiston kannatus Oy', 498, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0973712-1', N'Suupohjan Koulutuskuntayhtymä', 563, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1648362-5', N'Svenska Framtidsskolan i Helsingforsregionen Ab', 883, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0988182-8', N'Svenska Österbottens förbund för Utbildning och Kultur', 1520, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0155651-0', N'Tampereen Aikuiskoulutussäätiö sr', 2000, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0211675-2', N'Tampereen kaupunki', 8694, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0206148-0', N'Tampereen Musiikkiopiston Säätiö sr', 66, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1099221-8', N'Tampereen Urheiluhierojakoulu Oy', 5, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0166930-4', N'Tanhuvaaran Säätiö sr', 70, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0872020-5', N'Teak Oy', 165, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0172730-8', N'Tohtori Matthias Ingmanin säätiö sr', 192, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1019670-5', N'Toyota Auto Finland Oy', 35, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1577184-4', N'Traffica Oy', 38, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0858476-8', N'TUL:n Kisakeskussäätiö sr', 5, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0142247-5', N'Turun Aikuiskoulutussäätiö sr', 983, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0276652-8', N'Turun Ammattiopistosäätiö sr', 327, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0204819-8', N'Turun kaupunki', 5003, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0915313-4', N'Turun kristillisen opiston säätiö sr', 229, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0202496-2', N'Työtehoseura ry', 1354, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0215382-8', N'Työväen Sivistysliitto TSL ry', 56, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1041090-0', N'UPM-Kymmene Oyj', 45, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0209602-6', N'Vaasan kaupunki', 2604, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0206289-7', N'Valkeakosken seudun koulutuskuntayhtymä', 1076, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0163408-0', N'Valkealan Kristillisen Kansanopiston kannatusyhdistys r.y.', 19, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0143991-2', N'Valmet Automotive Oy', 15, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'1053500-9', N'Valtakunnallinen valmennus- ja liikuntakeskus Oy', 173, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0124610-9', N'Vantaan kaupunki', 3383, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0155689-5', N'Varalan Säätiö sr', 133, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0195200-3', N'Vuokatin säätiö sr', 111, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0195032-3', N'Vuolle Setlementti ry', 20, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0773744-3', N'Wärtsilä Finland Oy', 35, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0214765-5', N'Ylä-Savon koulutuskuntayhtymä', 1541, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0208589-6', N'Äänekosken Ammatillisen Koulutuksen kuntayhtymä', 1592, N'Saara Ikkelä 10.9.2019')
GO
INSERT [sa].[sa_amos_tavoitteelliset_opiskelijavuodet] ([ytunnus], [koulutuksen_jarjestaja], [tavoitteelliset_opiskelijavuodet_2018], [source]) VALUES (N'0204843-8', N'Turun Konservatorion kannatusyhdistys r.y. - Garantiföreningen för Åbo Konservatorium r.y. ', 84, N'Saara Ikkelä 10.9.2019')
