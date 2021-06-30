USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_amos_tutkinto_kustannusryhma_uusi]    Script Date: 30.6.2021 9:22:06 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_tutkinto_kustannusryhma_uusi]
GO
/****** Object:  Table [sa].[sa_amos_siirtotiedosto_okm7_uusi]    Script Date: 30.6.2021 9:22:06 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_siirtotiedosto_okm7_uusi]
GO
/****** Object:  Table [sa].[sa_amos_siirtotiedosto_okm7_uusi]    Script Date: 30.6.2021 9:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_siirtotiedosto_okm7_uusi]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm7_uusi](
	[kerroin_id] [int] NULL,
	[kerroin_luokka] [varchar](50) NULL,
	[kerroin_koodi] [varchar](10) NULL,
	[kerroin_nimi] [varchar](255) NULL,
	[vuosi] [int] NULL,
	[varainhoitovuosi] [int] NULL,
	[kokorahoitus] [decimal](4, 2) NULL,
	[perusrahoitus] [decimal](4, 2) NULL,
	[suoritusrahoitus] [decimal](4, 2) NULL,
	[vaikuttavuusrahoitus] [decimal](4, 2) NULL,
	[simulaatio_perusrahoitus] [decimal](4, 2) NULL,
	[simulaatio_suoritusrahoitus] [decimal](4, 2) NULL,
	[simulaatio_vaikuttavuusrahoitus] [decimal](4, 2) NULL,
	[simulaatio_1] [decimal](4, 2) NULL,
	[simulaatio_2] [decimal](4, 2) NULL,
	[simulaatio_3] [decimal](4, 2) NULL,
	[alkaa_pvm] [varchar](10) NULL,
	[paattyy_pvm] [varchar](10) NULL,
	[tekija] [varchar](50) NULL,
	[kommentti] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_amos_tutkinto_kustannusryhma_uusi]    Script Date: 30.6.2021 9:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinto_kustannusryhma_uusi]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_tutkinto_kustannusryhma_uusi](
	[tutkinto_koodi] [varchar](6) NOT NULL,
	[kustannusryhma_koodi] [varchar](10) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (1, N'kustannusryhma', N'kr_1', N'Ryhmä1', 2019, 2019, NULL, CAST(0.70 AS Decimal(4, 2)), CAST(0.70 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1.1.2019', N'31.1.2019', N'karik', N'no comments')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (2, N'kustannusryhma', N'kr_2', N'Ryhmä2', 2019, 2019, NULL, CAST(0.99 AS Decimal(4, 2)), CAST(0.99 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (3, N'kustannusryhma', N'kr_3', N'Ryhmä3', 2019, 2019, NULL, CAST(1.23 AS Decimal(4, 2)), CAST(1.23 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (4, N'kustannusryhma', N'kr_4', N'Ryhmä4  ', 2019, 2019, NULL, CAST(1.59 AS Decimal(4, 2)), CAST(1.59 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (5, N'kustannusryhma', N'kr_5', N'Ryhmä5', 2019, 2019, NULL, CAST(2.33 AS Decimal(4, 2)), CAST(2.33 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (6, N'kustannusryhma', N'kr_6', N'VALMA, TELMA', 2019, 2019, NULL, CAST(1.04 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (7, N'kustannusryhma', N'kr_7', N'Opiskelijavalmiuksia tukeva koulutus', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (8, N'kustannusryhma', N'kr_8', N'Muu ammatillinen koulutus (pl. VALMA, TELMA)', 2019, 2019, NULL, CAST(0.63 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (9, N'tutkintotyyppi', N'tt_9', N'Perustutkinnot (pl. oppisopimuskoulutus)', 2019, 2019, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (10, N'tutkintotyyppi', N'tt_10', N'Ammatti- ja erikisammattitukinnot (pl. oppisopimuskoulutus)', 2019, 2019, NULL, CAST(0.85 AS Decimal(4, 2)), CAST(0.60 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (11, N'tutkintotyyppi', N'tt_11', N'Perustutkinnot (oppisopimuskoulutus)', 2019, 2019, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (12, N'tutkintotyyppi', N'tt_12', N'Ammatti- ja erikisammattitukinnot (oppisopimuskoulutus)', 2019, 2019, NULL, CAST(0.85 AS Decimal(4, 2)), CAST(0.60 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (13, N'erityisopetus', N'eo_13', N'Erityisopetus; Ei erityisen tuen tehtävää, tutkintoon johtava', 2019, 2019, NULL, CAST(0.47 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (14, N'erityisopetus', N'eo_14', N'Erityisopetus; Ei erityisen tuen tehtävää, valmentava', 2019, 2019, NULL, CAST(0.47 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (15, N'erityisopetus', N'eo_15', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava', 2019, 2019, CAST(1.35 AS Decimal(4, 2)), CAST(1.42 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (16, N'erityisopetus', N'eo_16', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vaikeasti vammainen', 2019, 2019, CAST(2.71 AS Decimal(4, 2)), CAST(2.85 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (17, N'erityisopetus', N'eo_17', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vammainen + avustaja', 2019, 2019, CAST(6.00 AS Decimal(4, 2)), CAST(6.32 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (18, N'erityisopetus', N'eo_18', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, TELMA&VALMA', 2019, 2019, NULL, CAST(1.04 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (19, N'erityisopetus', N'eo_19', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vaikeasti vammainen', 2019, 2019, NULL, CAST(2.47 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (20, N'erityisopetus', N'eo_20', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vammainen + avustaja', 2019, 2019, NULL, CAST(5.94 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (21, N'majoitusetu', N'me_21', N'Ryhmä1 (majoitus)', 2019, 2019, NULL, CAST(0.23 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (22, N'majoitusetu', N'me_22', N'Ryhmä2 (sisaoppilaitosmainen_majoitus)', 2019, 2019, NULL, CAST(0.31 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (23, N'majoitusetu', N'me_23', N'Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)', 2019, 2019, NULL, CAST(0.98 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (24, N'vankilaopetus', N'vo_24', N'Vankilaopetus', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (25, N'henkilostokoulutus', N'hk_25', N'Henkilöstökoulutus,Tutkintoon johtava koulutus', 2019, 2019, NULL, CAST(-0.53 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (26, N'henkilostokoulutus', N'hk_26', N'Henkilöstökoulutus, Muu kuin tutkintoon johtava koulutus', 2019, 2019, NULL, CAST(-0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (27, N'tyovoimakoulutus', N'tk_27', N'Työvoimakoulutus', 2019, 2019, NULL, CAST(0.19 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (28, N'ennenkoulutusta', N'ek_1', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ilman ammatillista tutkintoa olevien tutkinnot', 2019, 2019, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (29, N'ennenkoulutusta', N'ek_2', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ammatillisen tutkinnon omaavien tutkinnot (ml. korkeakoulututkinnot)', 2019, 2019, NULL, NULL, CAST(18.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (30, N'ennenkoulutusta', N'ek_3', N'Erityisopetuksen tutkinnon pisteet', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (31, N'ennenkoulutusta', N'ek_4', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja oli työllinen ennen koulutusta', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (32, N'ennenkoulutusta', N'ek_5', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja ei työllinen ennen koulutusta', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (33, N'ennenkoulutusta', N'ek_6', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja oli työllinen ennen koulutusta', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (34, N'ennenkoulutusta', N'ek_7', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja ei työllinen ennen koulutusta', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (35, N'opiskelijapalaute', N'op_1', N'Opiskelijapalaute, koko tutkinnon suorittanut', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (36, N'opiskelijapalaute', N'op_2', N'Opiskelijapalaute, tutkinnon osan tai osia suorittanut', 2019, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (37, N'kustannusryhma', N'kr_1', N'Ryhmä1', 2020, 2020, NULL, CAST(0.78 AS Decimal(4, 2)), CAST(0.78 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1.1.2018', N'31.12.2018', N'sh', N'näitä käytetään vuoden 2018 Koski-tietoihin, näissä kertoimissa ei ole mukana oppivelvollisuuskerrointa 0,06 perusrahoituksessa tietylle opiskelijajoukolle')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (38, N'kustannusryhma', N'kr_2', N'Ryhmä2', 2020, 2020, NULL, CAST(0.97 AS Decimal(4, 2)), CAST(0.97 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (39, N'kustannusryhma', N'kr_3', N'Ryhmä3', 2020, 2020, NULL, CAST(1.07 AS Decimal(4, 2)), CAST(1.07 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (40, N'kustannusryhma', N'kr_4', N'Ryhmä4  ', 2020, 2020, NULL, CAST(1.46 AS Decimal(4, 2)), CAST(1.46 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (41, N'kustannusryhma', N'kr_5', N'Ryhmä5', 2020, 2020, NULL, CAST(2.25 AS Decimal(4, 2)), CAST(2.25 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (42, N'kustannusryhma', N'kr_6', N'VALMA, TELMA', 2020, 2020, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (43, N'kustannusryhma', N'kr_7', N'Opiskelijavalmiuksia tukeva koulutus', 2020, 2020, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (44, N'kustannusryhma', N'kr_8', N'Muu ammatillinen koulutus (pl. VALMA, TELMA)', 2020, 2020, NULL, CAST(0.95 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (45, N'tutkintotyyppi', N'tt_9', N'Perustutkinnot (pl. oppisopimuskoulutus)', 2020, 2020, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (46, N'tutkintotyyppi', N'tt_10', N'Ammatti- ja erikisammattitukinnot (pl. oppisopimuskoulutus)', 2020, 2020, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (47, N'tutkintotyyppi', N'tt_11', N'Perustutkinnot (oppisopimuskoulutus)', 2020, 2020, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (48, N'tutkintotyyppi', N'tt_12', N'Ammatti- ja erikisammattitukinnot (oppisopimuskoulutus)', 2020, 2020, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (49, N'erityisopetus', N'eo_13', N'Erityisopetus; Ei erityisen tuen tehtävää, tutkintoon johtava', 2020, 2020, NULL, CAST(0.50 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (50, N'erityisopetus', N'eo_14', N'Erityisopetus; Ei erityisen tuen tehtävää, valmentava', 2020, 2020, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (51, N'erityisopetus', N'eo_15', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava', 2020, 2020, CAST(1.50 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (52, N'erityisopetus', N'eo_16', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vaikeasti vammainen', 2020, 2020, CAST(3.04 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (53, N'erityisopetus', N'eo_17', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vammainen + avustaja', 2020, 2020, CAST(6.81 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (54, N'erityisopetus', N'eo_18', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, TELMA&VALMA', 2020, 2020, NULL, CAST(1.41 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (55, N'erityisopetus', N'eo_19', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vaikeasti vammainen', 2020, 2020, NULL, CAST(3.27 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (56, N'erityisopetus', N'eo_20', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vammainen + avustaja', 2020, 2020, NULL, CAST(7.81 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (57, N'majoitusetu', N'me_21', N'Ryhmä1 (majoitus)', 2020, 2020, NULL, CAST(0.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (58, N'majoitusetu', N'me_22', N'Ryhmä2 (sisaoppilaitosmainen_majoitus)', 2020, 2020, NULL, CAST(0.77 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (59, N'majoitusetu', N'me_23', N'Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)', 2020, 2020, NULL, CAST(2.01 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (60, N'vankilaopetus', N'vo_24', N'Vankilaopetus', 2020, 2020, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (61, N'henkilostokoulutus', N'hk_25', N'Henkilöstökoulutus,Tutkintoon johtava koulutus', 2020, 2020, NULL, CAST(-0.71 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (62, N'henkilostokoulutus', N'hk_26', N'Henkilöstökoulutus, Muu kuin tutkintoon johtava koulutus', 2020, 2020, NULL, CAST(-0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (63, N'tyovoimakoulutus', N'tk_27', N'Työvoimakoulutus at&eat', 2020, 2020, NULL, CAST(0.09 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'sh', N'tämä kerroin työvoimakoulutuksena järjestettyssä at&eat-koulutuksessa')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (181, N'tyovoimakoulutus', N'tk_28', N'Työvoimakoulutus muu ammatillinen', 2020, 2020, NULL, CAST(0.18 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'tämä kerroin työvoimakoulutuksena järjestettyyn muuhun ammatilliseen koulutukseen')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (64, N'ennenkoulutusta', N'ek_1', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ilman ammatillista tutkintoa olevien tutkinnot', 2020, 2020, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (65, N'ennenkoulutusta', N'ek_2', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ammatillisen tutkinnon omaavien tutkinnot (ml. korkeakoulututkinnot)', 2020, 2020, NULL, NULL, CAST(18.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (66, N'ennenkoulutusta', N'ek_3', N'Erityisopetuksen tutkinnon pisteet', 2020, 2020, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (67, N'ennenkoulutusta', N'ek_4', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja oli työllinen ennen koulutusta', 2020, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (68, N'ennenkoulutusta', N'ek_5', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja ei työllinen ennen koulutusta', 2020, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (69, N'ennenkoulutusta', N'ek_6', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja oli työllinen ennen koulutusta', 2020, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (70, N'ennenkoulutusta', N'ek_7', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja ei työllinen ennen koulutusta', 2020, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (71, N'opiskelijapalaute', N'op_1', N'Opiskelijapalaute, koko tutkinnon suorittanut', 2020, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (72, N'opiskelijapalaute', N'op_2', N'Opiskelijapalaute, tutkinnon osan tai osia suorittanut', 2020, 2020, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (73, N'kustannusryhma', N'kr_1', N'Ryhmä1', 2021, 2021, NULL, CAST(0.78 AS Decimal(4, 2)), CAST(0.78 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1.1.2019', N'31.12.2019', N'sh', N'näitä käytetään vuoden 2019 Koski-tietoihin, näissä kertoimissa ei ole mukana oppivelvollisuuskerrointa 0,06 perusrahoituksessa tietylle opiskelijajoukolle')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (74, N'kustannusryhma', N'kr_2', N'Ryhmä2', 2021, 2021, NULL, CAST(0.97 AS Decimal(4, 2)), CAST(0.97 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (75, N'kustannusryhma', N'kr_3', N'Ryhmä3', 2021, 2021, NULL, CAST(1.07 AS Decimal(4, 2)), CAST(1.07 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (76, N'kustannusryhma', N'kr_4', N'Ryhmä4  ', 2021, 2021, NULL, CAST(1.46 AS Decimal(4, 2)), CAST(1.46 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (77, N'kustannusryhma', N'kr_5', N'Ryhmä5', 2021, 2021, NULL, CAST(2.25 AS Decimal(4, 2)), CAST(2.25 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (78, N'kustannusryhma', N'kr_6', N'VALMA, TELMA', 2021, 2021, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (79, N'kustannusryhma', N'kr_7', N'Opiskelijavalmiuksia tukeva koulutus', 2021, 2021, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (80, N'kustannusryhma', N'kr_8', N'Muu ammatillinen koulutus (pl. VALMA, TELMA)', 2021, 2021, NULL, CAST(0.95 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (81, N'tutkintotyyppi', N'tt_9', N'Perustutkinnot (pl. oppisopimuskoulutus)', 2021, 2021, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (82, N'tutkintotyyppi', N'tt_10', N'Ammatti- ja erikisammattitukinnot (pl. oppisopimuskoulutus)', 2021, 2021, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (83, N'tutkintotyyppi', N'tt_11', N'Perustutkinnot (oppisopimuskoulutus)', 2021, 2021, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (84, N'tutkintotyyppi', N'tt_12', N'Ammatti- ja erikisammattitukinnot (oppisopimuskoulutus)', 2021, 2021, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (85, N'erityisopetus', N'eo_13', N'Erityisopetus; Ei erityisen tuen tehtävää, tutkintoon johtava', 2021, 2021, NULL, CAST(0.50 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (86, N'erityisopetus', N'eo_14', N'Erityisopetus; Ei erityisen tuen tehtävää, valmentava', 2021, 2021, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (87, N'erityisopetus', N'eo_15', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava', 2021, 2021, CAST(1.50 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (88, N'erityisopetus', N'eo_16', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vaikeasti vammainen', 2021, 2021, CAST(3.04 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (89, N'erityisopetus', N'eo_17', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vammainen + avustaja', 2021, 2021, CAST(6.81 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (90, N'erityisopetus', N'eo_18', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, TELMA&VALMA', 2021, 2021, NULL, CAST(1.41 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (91, N'erityisopetus', N'eo_19', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vaikeasti vammainen', 2021, 2021, NULL, CAST(3.27 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (92, N'erityisopetus', N'eo_20', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vammainen + avustaja', 2021, 2021, NULL, CAST(7.81 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (93, N'majoitusetu', N'me_21', N'Ryhmä1 (majoitus)', 2021, 2021, NULL, CAST(0.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (94, N'majoitusetu', N'me_22', N'Ryhmä2 (sisaoppilaitosmainen_majoitus)', 2021, 2021, NULL, CAST(0.77 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (95, N'majoitusetu', N'me_23', N'Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)', 2021, 2021, NULL, CAST(2.01 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (96, N'vankilaopetus', N'vo_24', N'Vankilaopetus', 2021, 2021, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (97, N'henkilostokoulutus', N'hk_25', N'Henkilöstökoulutus,Tutkintoon johtava koulutus', 2021, 2021, NULL, CAST(-0.71 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (98, N'henkilostokoulutus', N'hk_26', N'Henkilöstökoulutus, Muu kuin tutkintoon johtava koulutus', 2021, 2021, NULL, CAST(-0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (99, N'tyovoimakoulutus', N'tk_27', N'Työvoimakoulutus at&eat', 2021, 2021, NULL, CAST(0.09 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'sh', N'tämä kerroin työvoimakoulutuksena järjestetyssä at&eat-koulutuksessa')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (182, N'tyovoimakoulutus', N'tk_28', N'Työvoimakoulutus muu ammatillinen', 2021, 2021, NULL, CAST(0.18 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'tämä kerroin työvoimakoulutuksena järjestettyyn muuhun ammatilliseen koulutukseen')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (100, N'ennenkoulutusta', N'ek_1', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ilman ammatillista tutkintoa olevien tutkinnot', 2021, 2021, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (101, N'ennenkoulutusta', N'ek_2', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ammatillisen tutkinnon omaavien tutkinnot (ml. korkeakoulututkinnot)', 2021, 2021, NULL, NULL, CAST(18.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (102, N'ennenkoulutusta', N'ek_3', N'Erityisopetuksen tutkinnon pisteet', 2021, 2021, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (103, N'ennenkoulutusta', N'ek_4', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja oli työllinen ennen koulutusta', 2021, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (104, N'ennenkoulutusta', N'ek_5', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja ei työllinen ennen koulutusta', 2021, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (105, N'ennenkoulutusta', N'ek_6', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja oli työllinen ennen koulutusta', 2021, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (106, N'ennenkoulutusta', N'ek_7', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja ei työllinen ennen koulutusta', 2021, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (107, N'opiskelijapalaute', N'op_1', N'Opiskelijapalaute, koko tutkinnon suorittanut', 2021, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (108, N'opiskelijapalaute', N'op_2', N'Opiskelijapalaute, tutkinnon osan tai osia suorittanut', 2021, 2021, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (109, N'kustannusryhma', N'kr_1', N'Ryhmä1', 2022, 2022, NULL, CAST(0.78 AS Decimal(4, 2)), CAST(0.78 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1.1.2020', N'31.12.2020', N'sh', N'näitä käytetään vuoden 2020 Koski-tietoihin, näissä ei mukana oppivelvollisuuskerrointa')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (110, N'kustannusryhma', N'kr_2', N'Ryhmä2', 2022, 2022, NULL, CAST(0.97 AS Decimal(4, 2)), CAST(0.97 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (111, N'kustannusryhma', N'kr_3', N'Ryhmä3', 2022, 2022, NULL, CAST(1.07 AS Decimal(4, 2)), CAST(1.07 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (112, N'kustannusryhma', N'kr_4', N'Ryhmä4  ', 2022, 2022, NULL, CAST(1.46 AS Decimal(4, 2)), CAST(1.46 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (113, N'kustannusryhma', N'kr_5', N'Ryhmä5', 2022, 2022, NULL, CAST(2.25 AS Decimal(4, 2)), CAST(2.25 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (114, N'kustannusryhma', N'kr_6', N'VALMA, TELMA', 2022, 2022, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (115, N'kustannusryhma', N'kr_7', N'Opiskelijavalmiuksia tukeva koulutus', 2022, 2022, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (116, N'kustannusryhma', N'kr_8', N'Muu ammatillinen koulutus (pl. VALMA, TELMA)', 2022, 2022, NULL, CAST(0.95 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (117, N'tutkintotyyppi', N'tt_9', N'Perustutkinnot (pl. oppisopimuskoulutus)', 2022, 2022, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (118, N'tutkintotyyppi', N'tt_10', N'Ammatti- ja erikisammattitukinnot (pl. oppisopimuskoulutus)', 2022, 2022, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (119, N'tutkintotyyppi', N'tt_11', N'Perustutkinnot (oppisopimuskoulutus)', 2022, 2022, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (120, N'tutkintotyyppi', N'tt_12', N'Ammatti- ja erikisammattitukinnot (oppisopimuskoulutus)', 2022, 2022, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (121, N'erityisopetus', N'eo_13', N'Erityisopetus; Ei erityisen tuen tehtävää, tutkintoon johtava', 2022, 2022, NULL, CAST(0.50 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (122, N'erityisopetus', N'eo_14', N'Erityisopetus; Ei erityisen tuen tehtävää, valmentava', 2022, 2022, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (123, N'erityisopetus', N'eo_15', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava', 2022, 2022, CAST(1.50 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (124, N'erityisopetus', N'eo_16', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vaikeasti vammainen', 2022, 2022, CAST(3.04 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (125, N'erityisopetus', N'eo_17', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vammainen + avustaja', 2022, 2022, CAST(6.81 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (126, N'erityisopetus', N'eo_18', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, TELMA&VALMA', 2022, 2022, NULL, CAST(1.41 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (127, N'erityisopetus', N'eo_19', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vaikeasti vammainen', 2022, 2022, NULL, CAST(3.27 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (128, N'erityisopetus', N'eo_20', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vammainen + avustaja', 2022, 2022, NULL, CAST(7.81 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (129, N'majoitusetu', N'me_21', N'Ryhmä1 (majoitus)', 2022, 2022, NULL, CAST(0.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (130, N'majoitusetu', N'me_22', N'Ryhmä2 (sisaoppilaitosmainen_majoitus)', 2022, 2022, NULL, CAST(0.77 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (131, N'majoitusetu', N'me_23', N'Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)', 2022, 2022, NULL, CAST(2.01 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (132, N'vankilaopetus', N'vo_24', N'Vankilaopetus', 2022, 2022, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (133, N'henkilostokoulutus', N'hk_25', N'Henkilöstökoulutus,Tutkintoon johtava koulutus', 2022, 2022, NULL, CAST(-0.71 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (134, N'henkilostokoulutus', N'hk_26', N'Henkilöstökoulutus, Muu kuin tutkintoon johtava koulutus', 2022, 2022, NULL, CAST(-0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (135, N'tyovoimakoulutus', N'tk_27', N'Työvoimakoulutus at&eat', 2022, 2022, NULL, CAST(0.09 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'sh', N'tämä kerroin työvoimakoulutuksena järjestetyssä at&eat-koulutuksessa')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (183, N'tyovoimakoulutus', N'tk_28', N'Työvoimakoulutus muu ammatillinen', 2022, 2022, NULL, CAST(0.18 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'tämä kerroin työvoimakoulutuksena järjestettyyn muuhun ammatilliseen koulutukseen')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (136, N'ennenkoulutusta', N'ek_1', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ilman ammatillista tutkintoa olevien tutkinnot', 2022, 2022, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (137, N'ennenkoulutusta', N'ek_2', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ammatillisen tutkinnon omaavien tutkinnot (ml. korkeakoulututkinnot)', 2022, 2022, NULL, NULL, CAST(18.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (138, N'ennenkoulutusta', N'ek_3', N'Erityisopetuksen tutkinnon pisteet', 2022, 2022, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (139, N'ennenkoulutusta', N'ek_4', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja oli työllinen ennen koulutusta', 2022, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (140, N'ennenkoulutusta', N'ek_5', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja ei työllinen ennen koulutusta', 2022, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (141, N'ennenkoulutusta', N'ek_6', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja oli työllinen ennen koulutusta', 2022, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (142, N'ennenkoulutusta', N'ek_7', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja ei työllinen ennen koulutusta', 2022, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (143, N'opiskelijapalaute', N'op_1', N'Opiskelijapalaute, koko tutkinnon suorittanut', 2022, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (144, N'opiskelijapalaute', N'op_2', N'Opiskelijapalaute, tutkinnon osan tai osia suorittanut', 2022, 2022, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (145, N'kustannusryhma', N'kr_1', N'Ryhmä1', 2023, 2023, NULL, CAST(0.78 AS Decimal(4, 2)), CAST(0.78 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1.1.2021', N'31.12.2021', N'sh', N'näitä käytetään vuoden 2021 Koski-tietoihin, näissä ei mukana oppivelvollisuuskerrointa 0,06')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (146, N'kustannusryhma', N'kr_2', N'Ryhmä2', 2023, 2023, NULL, CAST(0.97 AS Decimal(4, 2)), CAST(0.97 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (147, N'kustannusryhma', N'kr_3', N'Ryhmä3', 2023, 2023, NULL, CAST(1.07 AS Decimal(4, 2)), CAST(1.07 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (148, N'kustannusryhma', N'kr_4', N'Ryhmä4  ', 2023, 2023, NULL, CAST(1.46 AS Decimal(4, 2)), CAST(1.46 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (149, N'kustannusryhma', N'kr_5', N'Ryhmä5', 2023, 2023, NULL, CAST(2.25 AS Decimal(4, 2)), CAST(2.25 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (150, N'kustannusryhma', N'kr_6', N'VALMA, TELMA', 2023, 2023, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (151, N'kustannusryhma', N'kr_7', N'Opiskelijavalmiuksia tukeva koulutus', 2023, 2023, NULL, CAST(1.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (152, N'kustannusryhma', N'kr_8', N'Muu ammatillinen koulutus (pl. VALMA, TELMA)', 2023, 2023, NULL, CAST(0.95 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (153, N'tutkintotyyppi', N'tt_9', N'Perustutkinnot (pl. oppisopimuskoulutus)', 2023, 2023, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (154, N'tutkintotyyppi', N'tt_10', N'Ammatti- ja erikisammattitukinnot (pl. oppisopimuskoulutus)', 2023, 2023, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (155, N'tutkintotyyppi', N'tt_11', N'Perustutkinnot (oppisopimuskoulutus)', 2023, 2023, NULL, CAST(1.00 AS Decimal(4, 2)), CAST(1.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (156, N'tutkintotyyppi', N'tt_12', N'Ammatti- ja erikisammattitukinnot (oppisopimuskoulutus)', 2023, 2023, NULL, CAST(0.93 AS Decimal(4, 2)), CAST(0.65 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (157, N'erityisopetus', N'eo_13', N'Erityisopetus; Ei erityisen tuen tehtävää, tutkintoon johtava', 2023, 2023, NULL, CAST(0.50 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (158, N'erityisopetus', N'eo_14', N'Erityisopetus; Ei erityisen tuen tehtävää, valmentava', 2023, 2023, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (159, N'erityisopetus', N'eo_15', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava', 2023, 2023, CAST(1.50 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), CAST(1.67 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (160, N'erityisopetus', N'eo_16', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vaikeasti vammainen', 2023, 2023, CAST(3.04 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), CAST(3.38 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (161, N'erityisopetus', N'eo_17', N'Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava, vammainen + avustaja', 2023, 2023, CAST(6.81 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), CAST(7.57 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (162, N'erityisopetus', N'eo_18', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, TELMA&VALMA', 2023, 2023, NULL, CAST(1.41 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (163, N'erityisopetus', N'eo_19', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vaikeasti vammainen', 2023, 2023, NULL, CAST(3.27 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (164, N'erityisopetus', N'eo_20', N'Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava, vammainen + avustaja', 2023, 2023, NULL, CAST(7.81 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (165, N'majoitusetu', N'me_21', N'Ryhmä1 (majoitus)', 2023, 2023, NULL, CAST(0.54 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (166, N'majoitusetu', N'me_22', N'Ryhmä2 (sisaoppilaitosmainen_majoitus)', 2023, 2023, NULL, CAST(0.77 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (167, N'majoitusetu', N'me_23', N'Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)', 2023, 2023, NULL, CAST(2.01 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (168, N'vankilaopetus', N'vo_24', N'Vankilaopetus', 2023, 2023, NULL, CAST(0.64 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (169, N'henkilostokoulutus', N'hk_25', N'Henkilöstökoulutus,Tutkintoon johtava koulutus', 2023, 2023, NULL, CAST(-0.71 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (170, N'henkilostokoulutus', N'hk_26', N'Henkilöstökoulutus, Muu kuin tutkintoon johtava koulutus', 2023, 2023, NULL, CAST(-0.50 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (171, N'tyovoimakoulutus', N'tk_27', N'Työvoimakoulutus at&eat', 2023, 2023, NULL, CAST(0.09 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sh', N'tämä kerroin työvoimakoulutuksena järjestetyssä at&eat-koulutuksessa')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (184, N'tyovoimakoulutus', N'tk_28', N'Työvoimakoulutus muu ammatillinen', 2023, 2023, NULL, CAST(0.18 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', N'tämä kerroin työvoimakoulutuksena järjestettyyn muuhun ammatilliseen koulutukseen')
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (172, N'ennenkoulutusta', N'ek_1', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ilman ammatillista tutkintoa olevien tutkinnot', 2023, 2023, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (173, N'ennenkoulutusta', N'ek_2', N'Tutkinnon pisteet, ennen koulutuksen aloittamista ammatillisen tutkinnon omaavien tutkinnot (ml. korkeakoulututkinnot)', 2023, 2023, NULL, NULL, CAST(18.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (174, N'ennenkoulutusta', N'ek_3', N'Erityisopetuksen tutkinnon pisteet', 2023, 2023, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (175, N'ennenkoulutusta', N'ek_4', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja oli työllinen ennen koulutusta', 2023, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (176, N'ennenkoulutusta', N'ek_5', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut koko tutkinnon ja ei työllinen ennen koulutusta', 2023, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (177, N'ennenkoulutusta', N'ek_6', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja oli työllinen ennen koulutusta', 2023, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (178, N'ennenkoulutusta', N'ek_7', N'Tutkinnon tai tutkinnon osan suorittaneista työllistyneistä tai korkeakoulu-opskelijaksi siirtyneistä Suorittanut tutkinnon osia ja ei työllinen ennen koulutusta', 2023, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (179, N'opiskelijapalaute', N'op_1', N'Opiskelijapalaute, koko tutkinnon suorittanut', 2023, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_siirtotiedosto_okm7_uusi] ([kerroin_id], [kerroin_luokka], [kerroin_koodi], [kerroin_nimi], [vuosi], [varainhoitovuosi], [kokorahoitus], [perusrahoitus], [suoritusrahoitus], [vaikuttavuusrahoitus], [simulaatio_perusrahoitus], [simulaatio_suoritusrahoitus], [simulaatio_vaikuttavuusrahoitus], [simulaatio_1], [simulaatio_2], [simulaatio_3], [alkaa_pvm], [paattyy_pvm], [tekija], [kommentti]) VALUES (180, N'opiskelijapalaute', N'op_2', N'Opiskelijapalaute, tutkinnon osan tai osia suorittanut', 2023, 2023, NULL, NULL, CAST(72.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324116', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324126', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324127', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'331101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334112', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334114', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334115', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334116', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334117', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334118', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334119', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334120', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334121', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334145', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334146', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354107', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354112', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354113', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354114', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354115', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354116', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354146', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354201', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354202', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354203', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354205', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354206', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354207', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354209', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354211', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354212', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354245', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354302', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354307', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354309', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354310', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354312', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354313', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354314', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354315', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354345', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354401', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354403', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354404', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354405', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354406', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354407', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354408', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354409', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354445', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354446', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354601', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354602', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354603', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354604', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354645', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354646', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354702', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354705', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354708', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354745', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354801', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354802', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354803', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354804', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354845', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355107', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355145', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355146', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355208', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355209', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355211', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355212', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355301', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355402', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355407', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355410', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355411', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355412', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355413', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355445', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355645', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355901', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355902', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355903', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355905', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355906', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355945', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364905', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374113', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374114', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374115', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374117', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374118', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374119', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374121', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374122', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374123', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374124', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374147', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384112', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384113', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384114', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384145', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384146', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384147', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384148', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384202', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384203', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384204', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384205', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384246', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384247', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384248', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384301', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384401', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384445', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384501', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427115', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427126', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437107', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437112', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437113', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437141', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437142', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'437143', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457107', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457112', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457141', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457201', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457203', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457204', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457205', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457206', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457207', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457241', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457301', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457302', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457303', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457304', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457305', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457306', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457307', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457341', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457401', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457403', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457404', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457405', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457406', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457441', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457442', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457601', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457602', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457603', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457641', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457702', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457705', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457707', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457709', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457741', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457801', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457802', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457803', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457841', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458141', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458204', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458205', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458207', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458241', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458405', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458408', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458409', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458410', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458411', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458412', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458441', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458641', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458901', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458902', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458904', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477107', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477108', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477109', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477110', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477111', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477143', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487101', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487102', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487103', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487104', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487105', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487106', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487141', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487201', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487202', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487241', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487244', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487303', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487304', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487341', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487401', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487501', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'374125', N'1')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321901', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324107', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324109', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324110', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324115', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324117', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324119', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324120', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324128', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324129', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324130', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324146', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324201', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324301', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324502', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324601', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'324602', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'334113', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'341101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'341102', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'344101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'344103', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351204', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351502', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354311', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354605', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354709', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354710', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355501', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355502', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355504', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355505', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355904', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364102', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364103', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364105', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364106', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364107', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364108', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364109', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364145', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364146', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364201', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364202', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364203', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364204', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364205', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364245', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364308', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364401', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364402', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364403', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364445', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364901', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364902', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'371101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'371109', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'371110', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'371113', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381106', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381112', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381113', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381141', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381142', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381201', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381204', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381241', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381303', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381304', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381342', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381408', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381410', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381504', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384201', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'999900', N'muu')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427107', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427109', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427114', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427116', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427118', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427119', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427128', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427130', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427141', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427301', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427302', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427504', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'427601', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'447101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'447102', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'457708', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458502', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458503', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458504', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458505', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458506', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458508', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467101', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467102', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467103', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467104', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467141', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467142', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467201', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467203', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467241', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467302', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467304', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467342', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467441', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467903', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467904', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467905', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'999901', N'vt')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'477102', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'999902', N'vt')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'487203', N'2')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'999903', N'vt')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321101', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321141', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321301', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321501', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321602', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321603', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321604', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321902', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351101', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351106', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351108', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351203', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351301', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351407', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351603', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351605', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351701', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351703', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351704', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351741', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351805', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352101', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352201', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352401', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352441', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352503', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352902', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352903', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361201', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361401', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361902', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364301', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364904', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364906', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364946', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381402', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'417101', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467301', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467901', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467902', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'467942', N'3')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'321204', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351107', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'351307', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'352301', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'354301', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355201', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'355210', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361101', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361104', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'361301', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364302', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364304', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364305', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364307', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'364345', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'381203', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384402', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384403', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384405', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'384446', N'4')
GO
INSERT [sa].[sa_amos_tutkinto_kustannusryhma_uusi] ([tutkinto_koodi], [kustannusryhma_koodi]) VALUES (N'458206', N'4')
