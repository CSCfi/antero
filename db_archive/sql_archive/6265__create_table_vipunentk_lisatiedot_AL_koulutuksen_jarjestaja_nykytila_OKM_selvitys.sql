USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys]    Script Date: 24.6.2022 12:28:32 ******/
DROP TABLE IF EXISTS [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys]
GO
/****** Object:  Table [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys]    Script Date: 24.6.2022 12:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys](
	[luotu] [date] NULL,
	[koulutuksen_jarjestajakoodi] [varchar](10) NULL,
	[tiedoksi_koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[koulutuksen_jarjestajakoodi_nykytila] [varchar](10) NULL,
	[tiedoksi_koulutuksen_jarjestaja_nykytila] [nvarchar](255) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[kommentti2] [varchar](55) NOT NULL
) ON [PRIMARY]

GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0135770-6', N'Noormarkun kunta', N'2388924-4', N'Satakunnan Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-02' AS Date), N'0167492-0', N'Enon kunta', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-02' AS Date), N'0168780-1', N'Kiihtelysvaaran kunta', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-02' AS Date), N'0169896-5', N'Pyhäselän kunta', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-02' AS Date), N'0170073-8', N'Tuupovaaran kunta', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-02' AS Date), N'0190345-5', N'Vuolijoen kunta', N'2553600-4', N'Kajaanin Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-04' AS Date), N'1027740-9', N'ETELÄ-KARJALAN KOULUTUSKUNTAYHTYMÄ', N'2177546-2', N'Saimaan Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Jukka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-04' AS Date), N'0209602-6', N'VAASAN KAUPUNKI', N'2267669-3', N'Oy Vaasan Ammattikorkeakoulu - Vasa Yrkeshögskola Ab', N'OKM selvitys', N'OKM Jukka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2014-05-26' AS Date), N'0137323-9', N'Porin Kaupunki', N'2388924-4', N'Satakunnan Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'1092784-6', N'Helsingin Liiketalouden Ammattikorkeakoulun Säätiö', N'2029188-8', N'Haaga-Helia Oy Ab', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'1013321-0', N'Mikkelin Ammattikorkeakouluyhtymä', N'2189312-7', N'Mikkelin Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0242746-2', N'Joensuun kaupunki', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'1023897-9', N'Pohjois-Karjalan Ammattikorkeakouluosakeyhtiö', N'2454377-1', N'Karelia Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0992445-3', N'Oulun seudun koulutuskuntayhtymä', N'2509747-8', N'Oulun Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0204819-8', N'Turun kaupunki', N'2528160-3', N'Turun Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'1003210-2', N'Kemi-tornion ammattikorkeakoulun kuntayhtymä', N'2528792-5', N'Lapin Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'1007629-5', N'Seinäjoen koulutuskuntayhtymä', N'2539767-3', N'Seinäjoen Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0214958-9', N'Kajaanin Kaupunki', N'2553600-4', N'Kajaanin Ammattikorkeakoulu Oy', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2015-04-09' AS Date), N'0200099-5', N'Stiftelsen arcada', N'2553871-2', N'Högskolan Arcada Ab', N'OKM selvitys', N'OKM Pekka', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2016-03-11' AS Date), N'0996167-6', N'Hämeen Ammatillisen Korkeakoulutuksen Kuntayhtymä', N'2617489-3', N'Hämeen Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2016-03-11' AS Date), N'0993644-6', N'Päijät-Hämeen Koulutuskonserni -Kuntayhtymä', N'2630644-6', N'Lahden Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
INSERT [dbo].[AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys] ([luotu], [koulutuksen_jarjestajakoodi], [tiedoksi_koulutuksen_jarjestaja], [koulutuksen_jarjestajakoodi_nykytila], [tiedoksi_koulutuksen_jarjestaja_nykytila], [tietolahde], [kommentti], [kommentti2]) VALUES (CAST(N'2016-03-11' AS Date), N'1007067-8', N'Savonia-Ammattikorkeakoulun Kuntayhtymä', N'2629463-3', N'Savonia-Ammattikorkeakoulu Oy', N'OKM selvitys', N'CSC Jarmo', N'CSC Juha 22.6.2022. AMK-poikkeukset automaation tueksi.')
GO
