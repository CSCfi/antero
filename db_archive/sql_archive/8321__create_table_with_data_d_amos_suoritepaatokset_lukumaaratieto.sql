USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_suoritepaatokset_lukumaaratieto]    Script Date: 24.11.2023 15:56:10 ******/
DROP TABLE IF EXISTS [dw].[d_amos_suoritepaatokset_lukumaaratieto]
GO
/****** Object:  Table [dw].[d_amos_suoritepaatokset_lukumaaratieto]    Script Date: 24.11.2023 15:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[lukumaaratiedon_tyyppi_fi] [varchar](255) NULL,
	[rahoitusosuus_fi] [varchar](255) NULL,
	[vaikuttavuusrahoituksen_peruste_fi] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[jarjestys_lukumaaratiedon_tyyppi] [int] NULL,
	[jarjestys_rahoitusosuus] [int] NULL,
	[jarjestys_vaikuttavuusrahoituksen_peruste] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[desimaalien_lkm] [int] NULL,
 CONSTRAINT [PK__d_amos_suoritepaatokset_lukumaaratieto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ON 

GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (1, N'0', N'Tavoitteellinen opiskelijavuosimäärä', N'Painottamattomat tavoitteelliset opiskelijavuodet', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 0, 1, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (2, N'1', N'Tavoitteellinen opiskelijavuosimäärä yhteensä', N'Painottamattomat tavoitteelliset opiskelijavuodet', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 1, 1, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (3, N'2', N'Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus', N'Painottamattomat tavoitteelliset opiskelijavuodet', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 2, 1, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (4, N'3', N'Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus', N'Painottamattomat tavoitteelliset opiskelijavuodet', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 3, 1, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (5, N'4', N'Profiilikerroin', N'Profiilikerroin', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 4, 2, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 5)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (6, N'5', N'Painotetut tavoitteelliset opiskelijavuodet', N'Painotetut tavoitteelliset opiskelijavuodet', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 5, 3, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (7, N'6', N'Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €', N'Myönnetty rahoitus', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 6, 6, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (8, N'8', N'Harkinnanvarainen korotus, €', N'Myönnetty rahoitus', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 8, 6, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (9, N'9', N'Perusrahoitus yhteensä, €', N'Myönnetty rahoitus', N'Perusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 9, 6, 1, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (10, N'10', N'Tutkintojen määrä', N'Painottamattomat suoritteet', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 10, 4, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (11, N'11', N'Tutkintojen painotetut pisteet', N'Painotetut suoritteet', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 11, 5, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (12, N'12', N'Tutkinnon osien osaamispisteet', N'Painottamattomat suoritteet', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 12, 4, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (13, N'13', N'Tutkinnon osien painotetut osaamispisteet', N'Painotetut suoritteet', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 13, 5, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (14, N'14', N'Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä', N'Painotetut suoritteet', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 14, 5, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (15, N'15', N'Suoritusrahoitus yhteensä, €', N'Myönnetty rahoitus', N'Suoritusrahoitus', N'Muu kuin vaikuttavuusrahoitus', 15, 6, 2, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (16, N'16', N'Työllistyneet ja jatko-opintoihin siirtyneet', N'Painottamattomat suoritteet', N'Vaikuttavuusrahoitus', N'Työllistyminen ja jatko-opintoihin siirtyminen', 16, 4, 3, 1, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (17, N'17', N'Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet', N'Painotetut suoritteet', N'Vaikuttavuusrahoitus', N'Työllistyminen ja jatko-opintoihin siirtyminen', 17, 5, 3, 1, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (18, N'18', N'Työllistyneet ja jatko-opintoihin siirtyneet, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Työllistyminen ja jatko-opintoihin siirtyminen', 18, 6, 3, 1, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (19, N'19', N'Opiskelunsa aloittaneiden palautteen pisteet', N'Painottamattomat suoritteet', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 19, 4, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (20, N'20', N'Opiskelunsa aloittaneiden palautteen painotetut pisteet', N'Painotetut suoritteet', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 20, 5, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (21, N'21', N'Opiskelunsa aloittaneiden opiskelijapalaute, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 21, 6, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (22, N'22', N'Opiskelunsa päättäneiden palautteen pisteet', N'Painottamattomat suoritteet', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 22, 4, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (23, N'23', N'Opiskelunsa päättäneiden palautteen painotetut pisteet', N'Painotetut suoritteet', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 23, 5, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (24, N'24', N'Opiskelunsa päättäneiden opiskelijapalaute, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Opiskelijapalaute', 24, 6, 3, 2, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (25, N'25', N'Työpaikkaohjaajakyselyn pisteet', N'Painottamattomat suoritteet', N'Vaikuttavuusrahoitus', N'Työelämäpalaute', 25, 4, 3, 3, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (26, N'26', N'Työpaikkaohjaajakyselyn painotetut pisteet', N'Painotetut suoritteet', N'Vaikuttavuusrahoitus', N'Työelämäpalaute', 26, 5, 3, 3, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (27, N'27', N'Työpaikkaohjaajakysely, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Työelämäpalaute', 27, 6, 3, 3, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (28, N'28', N'Työpaikkakyselyn pisteet', N'Painottamattomat suoritteet', N'Vaikuttavuusrahoitus', N'Työelämäpalaute', 28, 4, 3, 3, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (29, N'29', N'Työpaikkakysely, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Työelämäpalaute', 29, 6, 3, 3, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (30, N'30', N'Vaikuttavuusrahoitus yhteensä, €', N'Myönnetty rahoitus', N'Vaikuttavuusrahoitus', N'Vaikuttavuusrahoitus yhteensä', 30, 6, 3, 4, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (31, N'31', N'Laskennallinen rahoitus yhteensä (ei sis. alv), €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', N'Muu kuin vaikuttavuusrahoitus', 31, 6, 4, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [vaikuttavuusrahoituksen_peruste_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [jarjestys_vaikuttavuusrahoituksen_peruste], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (32, N'32', N'Arvonlisäverokorvaus, €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', N'Muu kuin vaikuttavuusrahoitus', 32, 6, 4, 5, CAST(N'2023-09-08T19:17:57.240' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto] OFF
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_lukumaaratieto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_lukumaaratieto_username]  DEFAULT (suser_sname()) FOR [username]
GO
