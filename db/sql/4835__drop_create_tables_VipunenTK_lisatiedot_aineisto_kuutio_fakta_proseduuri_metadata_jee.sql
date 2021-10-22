USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_kuutio]    Script Date: 3.9.2021 16:22:09 ******/
DROP TABLE [dbo].[Vipunen_aineisto_kuutio]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_fakta_proseduuri]    Script Date: 3.9.2021 16:22:09 ******/
DROP TABLE [dbo].[Vipunen_aineisto_fakta_proseduuri]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto]    Script Date: 3.9.2021 16:22:09 ******/
DROP TABLE [dbo].[Vipunen_aineisto]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto]    Script Date: 3.9.2021 16:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vipunen_aineisto](
	[aineisto_nimi] [nvarchar](250) NULL,
	[aineisto_avain] [nvarchar](20) NULL,
	[aineistoryhma] [nvarchar](50) NULL,
	[aineisto_julkaisukuukausi] [nvarchar](50) NULL,
	[aineisto_tilastovuosi] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vipunen_aineisto_fakta_proseduuri]    Script Date: 3.9.2021 16:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vipunen_aineisto_fakta_proseduuri](
	[aineisto_avain] [varchar](255) NULL,
	[fakta] [varchar](255) NULL,
	[proseduuri] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vipunen_aineisto_kuutio]    Script Date: 3.9.2021 16:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vipunen_aineisto_kuutio](
	[aineisto_avain] [nvarchar](10) NULL,
	[kuutio_avain] [nvarchar](20) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.1 Peruskoulutiedosto', N'TK_K2_1', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.2 Peruskoulun erityisopetus', N'TK_K2_2', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3a Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3a', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3b Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3b', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3c Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3c', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3d Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_2_3d', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3e Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3e', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3f Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3f', N'Opiskelija- opinto- ja tutkintoaineistot', N'10', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3g Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3g', N'Opiskelija- opinto- ja tutkintoaineistot', N'10', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.3h Lukiokoulutuksen ja ammatillisen koulutuksen opiskelijat', N'TK_K2_3h', N'Opiskelija- opinto- ja tutkintoaineistot', N'10', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4a Ammatillisen koulutuksen tutkinnot', N'TK_K2_4a', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4b Ammatillisen koulutuksen tutkinnot', N'TK_K2_4b', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4c Ammatillisen koulutuksen tutkinnot', N'TK_K2_4c', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4d Ammatillisen koulutuksen tutkinnot', N'TK_2_4d', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4e Ammatillisen koulutuksen tutkinnot', N'TK_K2_4e', N'Opiskelija- opinto- ja tutkintoaineistot', N'10', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4f Ammatillisen koulutuksen tutkinnot', N'TK_K2_4f', N'Opiskelija- opinto- ja tutkintoaineistot', N'10', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.4g Ammatillisen koulutuksen tutkinnot', N'TK_K2_4g', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.5 Lukiokoulutuksen ainevalinnat', N'TK_2_5', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.6 Ammatillisen koulutuksen eritysopetuksen opiskelijat ja tutkinnon suorittaneet', N'TK_K2_6', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.7 Ammatillisen koulutuksen erityisopetuksen opiskelijat ja tutkinnon suorittaneet järjestäjittäin', N'TK_K2_7', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.8a Korkeakouluopiskelijat', N'TK_2_8a', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.8b Korkeakouluopiskelijat', N'TK_K2_8b', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.8c Korkeakouluopiskelijat', N'TK_2_8c', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.8d Korkeakouluopiskelijat', N'TK_2_8d', N'Opiskelija- opinto- ja tutkintoaineistot', N'3', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.9a Korkeakoulututkinnot', N'TK_2_9a', N'Opiskelija- opinto- ja tutkintoaineistot', N'', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.9b Korkeakoulututkinnot', N'TK_2_9b', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.9c Korkeakoulututkinnot', N'TK_K2_9c', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.10 Korkeakouluopiskelijoiden aikaisempi koulutus', N'TK_K2_10', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.11 Oppilaitosten tutkintoon johtamaton koulutus', N'TK_2_11', N'Opiskelija- opinto- ja tutkintoaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.12 Yliopistoissa erilliset opettajan pedagogiset opinnot suorittaneet', N'TK_2_12', N'Opiskelija- opinto- ja tutkintoaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.13 Tutkintoon johtavan koulutuksen opiskelijat kansalaisuuden mukaan', N'TK_K2_13', N'Opiskelija- opinto- ja tutkintoaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.14 Tutkintoon johtavan koulutuksen opiskelijat syntymämaan mukaan', N'TK_K2_14', N'Opiskelija- opinto- ja tutkintoaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.15 Tutkintoon johtavan koulutuksen opiskelijat äidinkielen mukaan', N'TK_K2_15', N'Opiskelija- opinto- ja tutkintoaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.16 Oppilaitokset ja opiskelijat syksyllä', N'TK_2_16', N'Opiskelija- opinto- ja tutkintoaineistot', N'5', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.17a Ulkomaalaiset, ulkomaalaistaustaiset ja vieraskieliset opiskelijat ja tutkinnon suorittaneet', N'TK_K2_17a', N'Opiskelija- opinto- ja tutkintoaineistot', N'4', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.17b Ulkomaalaiset, ulkomaalaistaustaiset ja vieraskieliset opiskelijat ja tutkinnon suorittaneet', N'TK_K2_17b', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.18 Koulutuksen ja opetuksen järjestäjätason tiedot', N'TK_K2_18', N'Opiskelija- opinto- ja tutkintoaineistot', N'11', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.20 Lukiokoulutuksen ammatillisen koulutuksen ja oppisopimuskoulutuksen opiskelijat iän ja aikaisemman koulutuksen mukaan', N'TK_K2_20', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.21 Lukiokoulutuksessa sekä toisen asteen ammatillisessa peruskoulutuksessa opiskelevat ja tutkinnon suorittaneet', N'TK_2_21', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R2.22 Oppilaitostason oppilaat ja opiskelijat', N'TK_K2_22', N'Opiskelija- opinto- ja tutkintoaineistot', N'7', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'2.23 Opiskelijat ja tutkinnon suorittaneet vanhempien koulutustason sekä taloudellisen ja sosioekonomisen aseman mukaan', N'TK_K2_23', N'Opiskelija- opinto- ja tutkintoaineistot', N'2', -3)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.1a Oppisopimuskoulutukseen osallistuneiden koulutuksen aloittaneiden, suorittaneiden ja keskeyttäneiden pääasiallinen toiminta ja työllistyminen', N'TK_3_1a', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'6', -3)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.1b Oppisopimuskoulutuksen tutkinnon suorittaneet koulutuksen keston mukaan', N'TK_3_1b', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'6', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.2 Oppisopimuskoulutuksen suorittaneiden ja keskeyttäneiden jatko-opinnot', N'TK_3_2', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'6', -3)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.3 Ammattikorkeakouluopiskelijoiden ja tutkinnon lukuvuonna suorittaneiden opintopisteseuranta', N'TK_3_3', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'5', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.4 Korkeakoulututkinnon suorittaneiden mediaani-iät ja tutkinnon suorittamiseen kuluneet mediaaniajat', N'TK_K3_4', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.5 Yliopistojen lukuvuoden uusien opiskelijoiden (10-v.) läpäisy', N'TK_3_5', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.6 Koulutukseen hakeneet ja opiskelupaikan vastaanottaneet ', N'TK_3_6', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'6', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.7 Tutkinnon suorittaneiden osuus poistumasta, erityisopiskelijat', N'TK_K3_7', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'10', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.8 utkinnon suorittaneiden osuus 2004-2012 aloittaneista, ammatillisen peruskoulutuksen, erityisopiskelijat', N'TK_K3_8', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'10', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.9 Tutkinnon suorittaneiden osuus aloittaneista, toinen aste', N'TK_K3_9', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.10 Tutkinnon suorittaneiden osuus aloittaneista, korkeakoulut', N'TK_K3_10', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.11a Tutkinnon suorittaneiden osuus poistumasta (lopullinen) ja (amk- ja yliopistoennakko)', N'TK_K3_11a', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'5', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.11b Tutkinnon suorittaneiden osuus poistumasta (lopullinen) ja (amk- ja yliopistoennakko)', N'TK_K3_11b', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.12 Peruskoulun 9.luokan päättäneiden, ylioppilaiden ja toisen asteen ammatillisentutkinnon suorittaneiden sijoittuminen jatko-opintoihin ja työhön tutkinnon suorittamisesta kuluneen ajan mukaan', N'TK_K3_12', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.13 Peruskoulun 9.luokan päättäneiden, ylioppilaiden ja toisen asteen ammatillisen tutkinnon suorittaneiden sijoittuminen jatko-opintoihin ja työhön tutkinnon suorittamisesta kuluneen ajan mukaan', N'TK_K3_13', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'9', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.14  Ammatillisen koulutuksen ja lukiokoulutuksen opiskelijoiden mediaani-iät', N'TK_K3_14', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'3.15 Ammatillisen koulutuksen ja lukiokoulutuksen tutkinnon suorittaneiden mediaani-iät ', N'TK_K3_15', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K3.16 Moninkertainen haku ', N'TK_K3_16', N'Tehokkuus- tuloksellisuus- ja laatuaineistot', N'5', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.1 Perusopetuksen lisäopetuksen päättäneiden sijoittuminen', N'TK_K4_1', N'Väestö- ja työmarkkina- aineistot', N'6', -3)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.2a Väestön koulutusrakenne ja pääasiallinen toiminta', N'TK_K4_2a', N'Väestö- ja työmarkkina- aineistot', N'12', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.2b Väestön koulutusrakenne ja pääasiallinen toiminta', N'TK_K4_2b', N'Väestö- ja työmarkkina- aineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.2c Väestön koulutusrakenne ja pääasiallinen toiminta', N'TK_K4_2c', N'Väestö- ja työmarkkina- aineistot', N'4', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K4.3 Vuosina tutkinnon suorittaneiden pääasiallinen toiminta 2012, lopullinen', N'TK_K4_3', N'Väestö- ja työmarkkina- aineistot', N'4', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.4 Ulkomaalaisten vuonna tutkinnon suorittaneiden pääasiallinen toiminta kansalaisuuden mukaan (lopullinen)', N'TK_4_4', N'Väestö- ja työmarkkina- aineistot', N'4', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.5 Työvoimatutkimus: työlliset ammatin, toimialan ja sukupuolen mukaan ', N'TK_R4_5', N'Väestö- ja työmarkkina- aineistot', N'4', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.6a Työvoimatutkimus: Työlliset ja työttömät iän, ammatin, koulutusasteen ja opintoalan mukaan', N'TK_R4_6a', N'Väestö- ja työmarkkina- aineistot', N'4', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.6b Työvoimatutkimus: Työlliset ja työttömät iän, ammatin, koulutusasteen ja opintoalan mukaan', N'TK_R4_6b', N'Väestö- ja työmarkkina- aineistot', N'4', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.7 Tutkinnon suorittaneet aikaisemman koulutuksen mukaan', N'TK_K4_7', N'Väestö- ja työmarkkina- aineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.8 Tutkinnon suorittaneet myöhemmän koulutuksen mukaan', N'TK_K4_8', N'Väestö- ja työmarkkina- aineistot', N'5', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.9 Väestörakenne kunnittain', N'TK_K4_9', N'Väestö- ja työmarkkina- aineistot', N'5', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.10 Väestörakenne äidinkielen mukaan maakunnittain', N'TK_K4_10', N'Väestö- ja työmarkkina- aineistot', N'4', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.11 Väestön maassamuutto asuinmaakunnan ja koulutuksen mukaan ', N'TK_4_11', N'Väestö- ja työmarkkina- aineistot', N'3', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.12a Työttömät työnhakijat joulukuussa', N'TK_K4_12a', N'Väestö- ja työmarkkina- aineistot', N'3', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.12b Työttömät työnhakijat kesäkuussa', N'TK_K4_12b', N'Väestö- ja työmarkkina- aineistot', N'8', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.14a Alueella työssäkäyvät toimialan, ammattiryhmän ja koulutuksen mukaan', N'TK_K4_14a', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.14b Alueella työssäkäyvät toimialan, ammattiryhmän ja koulutuksen mukaan', N'TK_K4_14b', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.15 Alueella työssäkäyvät toimialan, ammattiryhmän ja asuinalueen mukaan 1-vuotisikäryhmittäin', N'TK_K4_15', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.16 Alueella työssäkäyvät ammateittain', N'TK_K4_16', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.17a Eläkkeelle siirtyneet ja kuolleet ja heidän ammattinsa vuotta aiemmin', N'TK_K4_17a', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.17b Eläkkeelle siirtyneet ja kuolleet ja heidän ammattinsa vuotta aiemmin', N'TK_K4_17b', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.18a Eläkkeelle siirtyneet ja kuolleet ja heidän ammattinsa kahta vuotta aiemmin', N'TK_K4_18a', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.18b Eläkkeelle siirtyneet ja kuolleet ja heidän ammattinsa kahta vuotta aiemmin', N'TK_K4_18b', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.19 Työllisten ammattisiirtymät', N'TK_R4_19', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.20 Työllisten ammattit', N'TK_R4_20', N'Väestö- ja työmarkkina- aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'4.21 Väestöennuste', N'TK_4_21', N'Väestö- ja työmarkkina- aineistot', N'11', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K4.22 Yli 15-vuotiaat, koulutuksen, kielen ja asuinkunnan mukaan', N'TK_K4_22', N'Väestö- ja työmarkkina- aineistot', N'2', -2)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'5.1 Yliopistojen tutkimushenkilökunta yliopistoittain ja tieteenaloittain', N'TK_K5_1', N'Tiede ja teknologia', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'5.2 Yliopistojen tutkimustyövuodet yliopistoittain ja tieteenaloittain', N'TK_K5_2', N'Tiede ja teknologia', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'5.3 Yliopistojen tutkimustyövuodet ja tutkimusmenot (1000 eur) rahoituslähteittäin menolajeittain yliopistoittain', N'TK_5_3', N'Tiede ja teknologia', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'5.4 Ammattikorkeakoulujen ja sektoritutkimuslaitosten (summatieto) aineisto', N'TK_K5_4', N'Tiede ja teknologia', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K5.5 Ammatillisen koulutuksen tutkinnot', N'TK_K5_5', N'Tiede ja teknologia', N'3', -3)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.1 Oppilaitosrekisteri', N'TK_R6_1', N'Luokitukset ja muut aineistot', N'2', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.2 Koulutuksen järjestäjärekisteri', N'TK_6_2', N'Luokitukset ja muut aineistot', N'2', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.3 Koulutuksen järjestäjät, luokitteluaineisto', N'TK_6_3', N'Luokitukset ja muut aineistot', N'12', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.4 Näyttötutkintoja järjestävät koulutusalan yritykset', N'TK_6_4', N'Luokitukset ja muut aineistot', N'11', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.5 Koulutusluokitus', N'TK_6_5', N'Luokitukset ja muut aineistot', N'2', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.6 Koulutusluokitus historiatiedosto', N'TK_6_6', N'Luokitukset ja muut aineistot', N'3', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.7 Alueluokitus', N'TK_6_7', N'Luokitukset ja muut aineistot', N'2', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.8 Alueluokituksen historiatiedosto', N'TK_6_8', N'Luokitukset ja muut aineistot', N'3', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.9 Valtiot', N'TK_6_9', N'Luokitukset ja muut aineistot', N'2', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.10 Kielet', N'TK_6_10', N'Luokitukset ja muut aineistot', N'3', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.11 Toimialaluokitus 2002', N'TK_6_11', N'Luokitukset ja muut aineistot', N'1', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.12 Toimialaluokitus 2008', N'TK_6_12', N'Luokitukset ja muut aineistot', N'1', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.13 Ammattiluokitus 2001', N'TK_6_13', N'Luokitukset ja muut aineistot', N'1', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.14 Ammattiluokitus 2010', N'TK_6_14', N'Luokitukset ja muut aineistot', N'1', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'6.15 Väliaikaiset ammattikorkeakoulut', N'TK_6_15', N'Luokitukset ja muut aineistot', N'5', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.1 Perusopetuksen opettajat, kelpoisuus ja opetusryhmäkoot', N'TK_7_1', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.2 Perusopetuksen opettajat, koulutuksen järjestäjätason tietoja ja opetusryhmäkoot', N'TK_7_2', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.3 Perusopetuksen opettajat, osallistuminen täydennyskoulutukseen', N'TK_7_3', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.4 Lukiokoulutuksen opettajat, kelpoisuus ja eniten opetettava aine', N'TK_7_4', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.5 Lukiokoulutuksen opettajat, koulutuksen ja järjestäjätason tietoja', N'TK_7_5', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.6 Lukiokoulutuksen opettajat osallistuminen täydennyskoulutukseen', N'TK_7_6', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.7 Toisen asteen ammatillisen koulutuksen opettajat, kelpoisuus ja koulutus', N'TK_7_7', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.8 Toisen asteen ammatillisen koulutuksen opettajat, osallistuminen täydennyskoulutukseen', N'TK_7_8', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.9 Vapaan sivistystyön opettajat, osallistuminen täydennyskoulutukseen', N'TK_7_9', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.10  Toisen asteen ammatillisen koulutuksen opettajat, eniten opetettavat aineet', N'TK_K7_10', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.11 Toisen asteen ammatillisen koulutuksen opettajat, kelpoisuus koulutuksen järjestäjittäin', N'TK_K7_11', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.12 Vapaan sivistystyön opettajat, eniten opetettavat aineet', N'TK_K7_12', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.13 Vapaan sivistystyön päätoimiset opettajat, kelpoisuus ja koulutuksen järjestäjätason tietoja', N'TK_K7_13', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.15 Taiteen perusopetuksen opettajat, eniten opetettavat aineet', N'TK_K7_15', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K7.16 Taiteen perusopetuksen opettajat, kelpoisuus ja koulutuksen järjestäjätason tietoja', N'TK_K7_16', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.17 Taiteen perusopetuksen opettajat, osallistuminen täydennyskoulutukseen', N'TK_7_17', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.18 Perus- ja lukioasteen opettajat, kelpoisuus (kokonaisaineisto)', N'TK_7_18', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'7.19 Toisen asteen ammatillisen koulutuksen opettajat, kelpoisuus (kokonaisaineisto)', N'TK_7_19', N'Opettajatiedonkeruuaineistot', N'12', 0)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.8e Korkeakouluopiskelijat', N'TK_K2_8e', N'Opiskelija- opinto- ja tutkintoaineistot', N'6', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'R4.23 Väestön toimiala- ja ammattisiirtymät', N'TK_K4_23', N'Väestö- ja työmarkkina- aineistot', N'11', NULL)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.22c Peruskoulujen erityisopetus', N'TK_K2_22c', N'Opiskelija- opinto- ja tutkintoaineistot', N'7', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.4h Lukiokoulutuksen opiskelijat ja ammatillisen koulutuksen opiskelijat ja tutkinnon suorittaneet', N'TK_K2_4h', N'Opiskelija- opinto- ja tutkintoaineistot', N'7', -1)
GO
INSERT [dbo].[Vipunen_aineisto] ([aineisto_nimi], [aineisto_avain], [aineistoryhma], [aineisto_julkaisukuukausi], [aineisto_tilastovuosi]) VALUES (N'K2.22b Esi- ja perusopetuksen oppilaat ja päättäneet', N'TK_K2_22b', N'Opiskelija- opinto- ja tutkintoaineistot', N'7', -1)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_1', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_10', N'f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus', N'p_lataa_KAK_f_2_10')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_11', N'f_TJK_2_11_tutkintoon_johtamaton_koulutus', N'p_lataa_f_tutkintoon_johtamaton_koulutus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_13', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_14', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_15', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_16', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_18', N'f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto', N'p_lataa_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_2', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_20', N'f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan', N'p_lataa_TOAK_f_2_20')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_21', N'f_Lukion_ja_ammatillisen_peruskoulutuksen_opiskelijat_tutkinnot', N'p_lataa_f_Lukion_ja_ammatillisen_kaksoistutkinto')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_23', N'f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk', N'p_lataa_SA_f_2_23')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3a', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3b', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3c', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3d', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3e', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3f', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3g', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_3h', N'f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3h')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4a', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4b', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4c', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4d', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4e', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4f', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4g', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_ainevalinnat_lukiossa', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_AVL_ainevalinnat', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_AVL_kieltenmaarat', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_6', N'f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet', N'p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_7', N'f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain', N'p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8a', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_8b', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8c', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8d', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_9a', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_9b', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_9c', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_14', N'f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat', N'p_lataa_OTV_f_3_14')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_15', N'f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat', N'p_lataa_OTV_f_3_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_1a', N'f_3_1a_Oppisopimus_paaasiallinen_toiminta', N'p_lataa_f_3_1a')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_1b', N'f_3_1b_Oppisopimus_koulutuksen_kesto', N'p_lataa_f_3_1b')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_2', N'f_3_2_Oppisopimus_jatko_opinnot', N'p_lataa_f_3_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_3', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_4', N'f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat', N'p_lataa_OTV_f_3_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_5', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_6', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_7', N'f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat', N'p_lataa_f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_8', N'f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat', N'p_lataa_f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_1', N'f_4_1_Perusopetuksen_lisaopetuksen_paattaneiden_sijoittuminen', N'p_lataa_f_4_1_Perusopetuksen_lisaopetuksen_paattaneiden_sijoittuminen')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_10', N'f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain', N'p_lataa_f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_11', N'f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan', N'p_lataa_f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_12a', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_12b', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_21', N'f_Vaestoennuste', N'p_lataa_f_vaestoennuste')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_2a', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_2b', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_2c', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_3', N'f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta', N'p_lataa_TJ_f_4_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_4', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_7', N'f_tab_tutkinnon_suorittaneiden_aiempi_koulutus_4_7_yhteiset', N'p_lataa_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_7', N'f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7', N'p_lataa_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_8', N'f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset', N'p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_8', N'f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8', N'p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_9', N'f_4_9_Vaestorakenne_kunnittain', N'p_lataa_f_4_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_9', N'f_OTV_4_9_Vaestorakenne_kunnittain', N'p_lataa_OTV_f_4_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_3', N'f_korkeakoulujen_tutkimus_kehitys_5_3_menot', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_3', N'f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R6_1', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_10', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_11', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_14', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_15', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_2', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_3', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_4', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_5', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_6', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_7', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_8', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_9', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_1', N'f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_2', N'f_Opettajat_perusopetus_koulutuksen_jarjestaja_opetusryhmakoot', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_3', N'f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_4', N'f_Opettajat_lukiokoulutus_kelpoisuus_aine', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_5', N'f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_6', N'f_Opettajat_lukiokoulutus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_7', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_8', N'f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_9', N'f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_10', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_11', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_12', N'f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_15', N'f_Opettajat_taiteen_perusopetus_kelpoisuus_aine', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_16', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_17', N'f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_18', N'f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_19', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_1', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_1', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_2', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_2', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_3', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_17a', N'f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk', N'p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_17b', N'f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk', N'p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_10', N'f_aloittaneiden_lapaisy', N'p_lataa_f_aloittaneiden_lapaisy')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_11a', N'f_keskeyttaneet', N'p_lataa_K_f_3_11')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_11b', N'f_keskeyttaneet', N'p_lataa_K_f_3_11')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_12', N'f_koulutukseen_sijoittuneet_2v', N'p_lataa_f_koulutukseen_sijoittuneet_2v')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_13', N'f_koulutukseen_sijoittuneet_6v', N'p_lataa_f_koulutukseen_sijoittuneet_6v')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_aiemmat_tutkinnot', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_edellisen_vuoden_opiskelut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_edelliset_haut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_hakijat', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_uudet_haut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_9', N'f_aloittaneiden_lapaisy', N'p_lataa_f_aloittaneiden_lapaisy')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_22', N'f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan', N'p_lataa_f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_1', N'f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_2', N'f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_5', N'f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat', N'p_lataa_f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R1_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K1_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_ainevalinnat_perusopetuksessa', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_oppimaara', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_jopo_oppilaat', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_kuljetusetuutta_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_majoitusetuutta_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_peruskoulun_aloittaneiden_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_peruskoulun_ilman_todistusta_paattaneiden_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_Perusasteen_erityisopetus_vieraskielisten_tehostetun_tuen_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_perusopetuksen_kieltenmaara', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22', N'f_perusopetuksen_oppilasmaarat', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_14', N'f_alueella_tyossakayvat', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_14a', N'f_alueella_tyossakayvat', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_14b', N'f_alueella_tyossakayvat_toimialoittain', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_15', N'f_alueella_tyossakayvat_1v', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_16', N'f_tyossakayvat_ammateittain', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_17a', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_17b', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_18a', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_18b', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_19', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_20', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_23', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_5', N'f_4_5_Tyovoimatutkimus_tyolliset', N'p_lataa_f_4_5')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_6a', N'f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat', N'p_lataa_f_4_6ab')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_6b', N'f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat', N'p_lataa_f_4_6ab')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_8e', N'f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat', N'p_lataa_f_2_8e')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_11b', N'f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili', N'p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22c', N'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22c', N'f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22c', N'f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4h', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4h', N'f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3h')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4h', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4h', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_4h', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22b', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_22b', N'f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto', N'p_lataa_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_1', N'AV_PER_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_1', N'OTV_EP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_10', N'PK_KK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_10', N'PK_KK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_10', N'PK_KK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_11', N'I_VSTV_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_11', N'TJK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_13', N'ULK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_13', N'ULK_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_13', N'ULK_LU_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_13', N'ULK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_13', N'ULK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_14', N'ULK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_14', N'ULK_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_14', N'ULK_LU_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_14', N'ULK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_14', N'ULK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_15', N'ULK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_15', N'ULK_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_15', N'ULK_LU_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_15', N'ULK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_15', N'ULK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_18', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_20', N'PK_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_20', N'PK_TA_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_20', N'PK_TA_LU_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_21', N'LAKT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_23', N'SEA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_3d', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_3d', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_3d', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_3d', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_3d', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3e', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3f', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3g', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3h', N'I_KL_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3h', N'LAKKK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4a', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4a', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4a', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4a', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4b', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4b', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4b', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4b', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4c', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4c', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4c', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4c', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_4d', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_4d', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_4d', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_4d', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4e', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4f', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4g', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_5', N'AV_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_6', N'AKEO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_7', N'AKEO_JARJ_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'I_KL_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'OTV_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'OTV_YLIOP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_8c', N'OTV_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_8c', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_8d', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_8d', N'OTV_YLIOP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_9a', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_9a', N'OTV_YLIOP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_9b', N'OTV_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_9b', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'OTV_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'OTV_KK_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'OTV_YLIOP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_14', NULL)
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_15', N'I_SA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_3_1a', N'OPPIS_PA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_3_1b', N'OPPIS_KK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_3_2', N'OPPIS_JO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_4', N'I_SA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_7', N'TSOPE_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_8', N'TSOAE_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_1', N'PO_LPS_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_10', N'VR_AI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_10', N'VR_AI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_4_11', N'VMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_4_11', N'VMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_4_21', N'VAESE_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2a', N'VKR_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2a', N'VKR_PAT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2b', N'VKR_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2b', N'VKR_PAT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2c', N'VKR_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2c', N'VKR_PAT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_7', N'TSAIK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_8', N'TSMYOH_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_9', N'I_VSTV_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_9', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_1', N'KKTK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_2', N'KKTK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_5_3', N'KKTK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_4', N'AMKTK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_4', N'STLTK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_4', N'YO_SAIR_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_1', N'OPE_71_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_1', N'OPE_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_2', N'OPE_72_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_3', N'OPE_73_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_4', N'OPE_74_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_4', N'OPE_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_5', N'OPE_75_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_6', N'OPE_76_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_7', N'OPE_77_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_8', N'OPE_78_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_9', N'OPE_79_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_10', N'OPE_710_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_10', N'OPE_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_12', N'OPE_712_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_12', N'OPE_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K7_15', N'OPE_715_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_17', N'OPE_717_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_18', N'OPE_718_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_7_19', N'OPE_719_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_17a', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_17a', N'ULK_T_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_17b', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_17b', N'ULK_T_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_10', N'AL_K310_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_10', N'AL_K310_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_10', N'AL_K310_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_10', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11a', N'KESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11a', N'KESK_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11a', N'KESK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11a', N'KESK_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11a', N'KESK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11b', N'KESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11b', N'KESK_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11b', N'KESK_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_12', N'KS2_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_12', N'KS2_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_12', N'KS2_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_12', N'KS2_PER_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_13', N'KS6_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_13', N'KS6_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_13', N'KS6_PER_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_13', N'KS6_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_16', N'MKH_KK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_16', N'MKH_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_9', N'AL_K39_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_9', N'AL_K39_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_9', N'AL_K39_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_9', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_22', N'Y15KKA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_AMK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_YO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_EXTRA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TY_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_5', N'TTHV_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'AV_PER_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'AV_PERK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'I_OV_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'OTV_EP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'PAEO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_14a', N'ATK_414_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_14b', N'ATK_414b_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_15', N'ATK_415_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_16', N'ATK_416_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_17a', N'ESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_17b', N'ESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_18a', N'ESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_18b', N'ESK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_19', N'TASAA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_20', N'TASAA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8e', N'I_AKK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_23', N'TASAA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11b', N'KESK_AMM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_11b', N'KESK_LUK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_18', N'PHYAEO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_9', N'VAES_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3b', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3c', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4a', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4b', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4c', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_8b', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_9c', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_11', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K3_12', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_3', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2a', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2b', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_2c', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K4_9', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_3a', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K5_5', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_2_11b', N'TJK_PROF_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_5', N'TVT_T_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_6a', N'TVT_TT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_R4_6b', N'TVT_TT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22c', N'PAEO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'AMMSC_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'I_KL_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'LAKKK_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'OTV_TA_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'OTVY_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'TAOT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'TIM_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_4h', N'UUV_YHT_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22b', N'I_OV_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22b', N'I_UOSI_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22b', N'OTV_EP_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22b', N'PHYAEO_TAB')
GO
INSERT [dbo].[Vipunen_aineisto_kuutio] ([aineisto_avain], [kuutio_avain]) VALUES (N'TK_K2_22b', N'TIM_TAB')
GO
