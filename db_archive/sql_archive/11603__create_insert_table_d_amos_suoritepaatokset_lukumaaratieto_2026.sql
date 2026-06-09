USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_suoritepaatokset_lukumaaratieto_2026]') AND type in (N'U'))
DROP TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[lukumaaratiedon_tyyppi_fi] [varchar](255) NULL,
	[rahoitusosuus_fi] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[jarjestys_lukumaaratiedon_tyyppi] [int] NULL,
	[jarjestys_rahoitusosuus] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[desimaalien_lkm] [int] NULL,
 CONSTRAINT [PK__d_amos_suoritepaatokset_lukumaaratieto_2026] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ON 
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (1, N'0', N'Tavoitteellinen opiskelijavuosimäärä', N'Painottamattomat suoritteet', N'Tavoitteelliset opiskelijavuodet', 0, 1, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (2, N'1', N'Tavoitteellinen opiskelijavuosimäärä yhteensä', N'Painottamattomat suoritteet', N'Tavoitteelliset opiskelijavuodet', 1, 1, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (3, N'2', N'Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus', N'Painottamattomat suoritteet', N'Tavoitteelliset opiskelijavuodet', 2, 1, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (4, N'3', N'Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus', N'Painottamattomat suoritteet', N'Tavoitteelliset opiskelijavuodet', 3, 1, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (5, N'4', N'Profiilikerroin', N'Profiilikerroin', N'Tavoitteelliset opiskelijavuodet', 4, 2, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 5)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (6, N'5', N'Painotetut tavoitteelliset opiskelijavuodet', N'Painotetut suoritteet', N'Tavoitteelliset opiskelijavuodet', 5, 3, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (7, N'6', N'Tavoitteelliset opiskelijavuodet, €', N'Myönnetty rahoitus', N'Tavoitteelliset opiskelijavuodet', 6, 4, 1, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (8, N'7', N'Kiky-vähennys, €', N'Myönnetty rahoitus', N'Kiky-vähennys', 13, 4, 3, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (9, N'8', N'Harkinnanvarainen rahoitus, €', N'Myönnetty rahoitus', N'Harkinnanvarainen rahoitus', 37, 4, 8, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (11, N'10', N'Tutkintojen määrä', N'Painottamattomat suoritteet', N'Osaamispisteet ja tutkinnot', 16, 1, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (12, N'11', N'Tutkintojen painotetut pisteet', N'Painotetut suoritteet', N'Osaamispisteet ja tutkinnot', 17, 3, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (13, N'12', N'Osaamispisteiden määrä', N'Painottamattomat suoritteet', N'Osaamispisteet ja tutkinnot', 14, 1, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (14, N'13', N'Tutkinnon osien painotetut osaamispisteet', N'Painotetut suoritteet', N'Osaamispisteet ja tutkinnot', 15, 3, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (15, N'14', N'Osaamispisteiden ja tutkintojen pisteiden painotettu määrä', N'Painotetut suoritteet', N'Osaamispisteet ja tutkinnot', 18, 3, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 2)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (16, N'15', N'Osaamispisteet ja tutkinnot, €', N'Myönnetty rahoitus', N'Osaamispisteet ja tutkinnot', 19, 4, 4, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (17, N'16', N'Jatko-opintoihin siirtyneet ja työllistyneet', N'Painottamattomat suoritteet', N'Jatko-opiskelu ja työllistyminen', 20, 1, 5, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (18, N'17', N'Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä', N'Painotetut suoritteet', N'Jatko-opiskelu ja työllistyminen', 21, 3, 5, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 1)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (19, N'18', N'Jatko-opintoihin siirtyneet ja työllistyneet, €', N'Myönnetty rahoitus', N'Jatko-opiskelu ja työllistyminen', 22, 4, 5, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (20, N'19', N'Opiskelunsa aloittaneiden palautteen pisteet', N'Painottamattomat suoritteet', N'Opiskelijapalaute', 23, 1, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (21, N'20', N'Opiskelunsa aloittaneiden palautteen painotetut pisteet', N'Painotetut suoritteet', N'Opiskelijapalaute', 24, 3, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (22, N'21', N'Opiskelunsa aloittaneiden opiskelijapalaute, €', N'Myönnetty rahoitus', N'Opiskelijapalaute', 25, 4, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (23, N'22', N'Opiskelunsa päättäneiden palautteen pisteet', N'Painottamattomat suoritteet', N'Opiskelijapalaute', 26, 1, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (24, N'23', N'Opiskelunsa päättäneiden palautteen painotetut pisteet', N'Painotetut suoritteet', N'Opiskelijapalaute', 27, 3, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (25, N'24', N'Opiskelunsa päättäneiden opiskelijapalaute, €', N'Myönnetty rahoitus', N'Opiskelijapalaute', 28, 4, 6, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (26, N'25', N'Työpaikkaohjaajakyselyn pisteet', N'Painottamattomat suoritteet', N'Työelämäpalaute', 31, 1, 7, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (27, N'26', N'Työpaikkaohjaajakyselyn painotetut pisteet', N'Painotetut suoritteet', N'Työelämäpalaute', 32, 3, 7, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (28, N'27', N'Työpaikkaohjaajakysely, €', N'Myönnetty rahoitus', N'Työelämäpalaute', 33, 4, 7, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (29, N'28', N'Työpaikkakyselyn pisteet', N'Painottamattomat suoritteet', N'Työelämäpalaute', 29, 1, 7, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (30, N'29', N'Työpaikkakysely, €', N'Myönnetty rahoitus', N'Työelämäpalaute', 30, 4, 7, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (32, N'31', N'Rahoitus yhteensä (ei sis. alv), €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', 38, 4, 9, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (33, N'32', N'Arvonlisäverokorvaus, €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', 39, 4, 9, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (40, N'33', N'Painottamattomat opiskelijavuodet', N'Painottamattomat suoritteet', N'Toteutuneet opiskelijavuodet', 7, 1, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 2)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (41, N'34', N'Lähtötason mukaan painotetut opiskelijavuodet', N'Painotetut suoritteet', N'Toteutuneet opiskelijavuodet', 8, 3, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 2)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (43, N'35', N'Lähtötason mukaan painotetut opiskelijavuodet, €', N'Myönnetty rahoitus', N'Toteutuneet opiskelijavuodet', 9, 4, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (44, N'36', N'Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet', N'Painotetut suoritteet', N'Toteutuneet opiskelijavuodet', 10, 3, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 2)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (45, N'37', N'Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €', N'Myönnetty rahoitus', N'Toteutuneet opiskelijavuodet', 11, 4, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (46, N'38', N'Toteutuneet opiskelijavuodet yhteensä, €', N'Myönnetty rahoitus', N'Toteutuneet opiskelijavuodet', 12, 4, 2, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (47, N'39', N'Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', 34, 4, 9, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (48, N'40', N'Muutosrajoitteiden vaikutus (2026-2028), €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', 35, 4, 9, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ([id], [koodi], [selite_fi], [lukumaaratiedon_tyyppi_fi], [rahoitusosuus_fi], [jarjestys], [jarjestys_lukumaaratiedon_tyyppi], [jarjestys_rahoitusosuus], [loadtime], [source], [username], [desimaalien_lkm]) VALUES (49, N'41', N'Laskennallinen perusrahoitus, €', N'Myönnetty rahoitus', N'Rahoitusosuudet yhteensä', 36, 4, 9, CAST(N'2026-01-19T18:21:19.620' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', 0)
GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] OFF
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_lukumaaratieto_2026_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_lukumaaratieto_2026_username]  DEFAULT (suser_sname()) FOR [username]
GO
