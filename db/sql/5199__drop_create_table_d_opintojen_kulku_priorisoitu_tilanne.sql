USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opintojen_kulku_priorisoitu_tilanne]    Script Date: 11.11.2021 12:41:27 ******/
DROP TABLE [dw].[d_opintojen_kulku_priorisoitu_tilanne]
GO
/****** Object:  Table [dw].[d_opintojen_kulku_priorisoitu_tilanne]    Script Date: 11.11.2021 12:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_opintojen_kulku_priorisoitu_tilanne](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koulutus_kytkin] [varchar](50) NULL,
	[priorisoitu_tilanne_koodi] [int] NULL,
	[priorisoitu_tilanne_fi] [varchar](100) NULL,
	[priorisoitu_tilanne_se] [varchar](100) NULL,
	[priorisoitu_tilanne_en] [varchar](100) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ON 

GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (-1, N'tuntematon', 99, N'Tieto puuttuu', N'Information saknas', N'Missing data')
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (1, N'ammatillinen', 1, N'Valmistunut alkuperäisestä tutkinnosta', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (2, N'ammatillinen', 2, N'Valmistunut toisesta ammatillisesta tutkinnosta', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (3, N'ammatillinen', 3, N'Jatkaa alkuperäisessä tutkinnossa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (4, N'ammatillinen', 4, N'Jatkaa toisessa amm. tutkinnossa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (5, N'ammatillinen', 5, N'Jatkaa VALMA-koulutuksessa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (6, N'ammatillinen', 6, N'Jatkaa TELMA-koulutuksessa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (7, N'ammatillinen', 7, N'Jatkaa muussa ammatillisessa koulutuksessa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (8, N'ammatillinen', 8, N'Keskeyttänyt ammatillisen koulutuksen', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (9, N'yleissivistava2aste', 1, N'Suorittanut aloitetun oppimäärän', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (10, N'yleissivistava2aste', 2, N'Suorittanut eri yleissiv. oppimäärän', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (11, N'yleissivistava2aste', 3, N'Jatkaa alkuperäisessä oppimäärässä', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (12, N'yleissivistava2aste', 4, N'Jatkaa toisessa yleissiv. oppimäärässä', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (13, N'yleissivistava2aste', 6, N'Jatkaa ammatillisessa koulutuksessa', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (14, N'yleissivistava2aste', 8, N'Keskeyttänyt toisen asteen', NULL, NULL)
GO
INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] ([id], [koulutus_kytkin], [priorisoitu_tilanne_koodi], [priorisoitu_tilanne_fi], [priorisoitu_tilanne_se], [priorisoitu_tilanne_en]) VALUES (15, N'yleissivistava2aste', 5, N'Suorittanut ammatillisen tutkinnon', NULL, NULL)
GO
SET IDENTITY_INSERT [dw].[d_opintojen_kulku_priorisoitu_tilanne] OFF
GO
