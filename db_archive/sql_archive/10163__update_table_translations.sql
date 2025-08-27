USE [ANTERO]
GO

DELETE FROM [dbo].[translations]
WHERE 1=1
AND tyyppi='mittari'
AND koodi 
IN (
	'kyselyn_kohteet_tyopaikkojen_lkm',
	'kyselyn_kohteet_tyopaikkajaksojen_lkm',
	'kyselyn_kohteet_tyopaikkajaksojen_paivien_lkm',
	'vastattu_tyopaikkojen_lkm',
	'vastattu_tyopaikkajaksojen_lkm',
	'vastattu_tyopaikkajaksojen_paivien_lkm',
	'vastausosuus_tyopaikkojen_lkm',
	'vastausosuus_tyopaikkajaksojen_lkm',
	'vastausosuus_tyopaikkajaksojen_paivien_lkm',
	'kyselyn_kohteiden_keskimaarainen_kesto',
	'vastattujen_tyopaikkajaksojen_keskimaarainen_kesto',
	'keskiarvo_painotettu_tyopaikkajaksojen_kestolla',
	'keskihajonta_painotettu_tyopaikkajaksojen_kestolla'
);

INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastattujen_tyopaikkajaksojen_keskimaarainen_kesto', N'Vastattujen työpaikkajaksojen keskimääräinen kesto', N'Svar, längden på arbetsplatsperioderna i medeltal', N'Average duration of responded on-the-job learning periods', NULL, N'mittari', 11)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastausosuus_tyopaikkajaksojen_lkm', N'Vastausosuus, työpaikkajaksojen lkm', N'Svarsandel, antalet arbetsplatsperioder', N'Response rate, number of on-the-job learning periods', NULL, N'mittari', 8)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastausosuus_tyopaikkajaksojen_paivien_lkm', N'Vastausosuus, työpaikkajaksojen päivien lkm', N'Svarsandel, antalet dagar under arbetsplatsperioderna', N'Response rate, number of on-the-job learning days', NULL, N'mittari', 9)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'kyselyn_kohteet_tyopaikkajaksojen_lkm', N'Kyselyn kohteet, työpaikkajaksojen lkm', N'Målgrupp för enkäten, antalet arbetsplatsperioder', N'Survey target group, number of on-the-job learning periods', NULL, N'mittari', 2)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'kyselyn_kohteet_tyopaikkajaksojen_paivien_lkm', N'Kyselyn kohteet, työpaikkajaksojen päivien lkm', N'Målgrupp för enkäten, antalet dagar under arbetsplatsperioderna', N'Survey target group, number of days in on-the-job learning periods', NULL, N'mittari', 3)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'kyselyn_kohteiden_keskimaarainen_kesto', N'Kyselyn kohteiden (työpaikkajaksojen) keskimääräinen kesto', N'Målgrupp för enkäten, längden på arbetsplatsperioderna i medeltal', N'Survey target group, average duration on-the-job learning periods', NULL, N'mittari', 10)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastattu_tyopaikkajaksojen_lkm', N'Vastattu, työpaikkajaksojen lkm', N'Svar, antalet arbetsplatsperioder', N'Responded, number of on-the-job learning periods', NULL, N'mittari', 5)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastattu_tyopaikkajaksojen_paivien_lkm', N'Vastattu, työpaikkajaksojen päivien lkm', N'Svar, antalet dagar under arbetsplatsperioderna', N'Responded, number of days in on-the-job learning periods', NULL, N'mittari', 6)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'keskiarvo_painotettu_tyopaikkajaksojen_kestolla', N'Keskiarvo (painotettu työpaikkajaksojen kestolla)', N'Medeltal (viktat med längden på arbetsplatsperioderna)', N'Mean (weighted by duration of on-the-job learning periods)', NULL, N'mittari', 12)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'keskihajonta_painotettu_tyopaikkajaksojen_kestolla', N'Keskihajonta (painotettu työpaikkajaksojen kestolla)', N'Standardavvikelse (viktad med längden på arbetsplatsperioderna)', N'Standard deaviation (weighted by duration of on-the-job learning periods)', NULL, N'mittari', 13)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastausosuus_tyopaikkojen_lkm', N'Vastausosuus, työpaikkojen lkm', N'Svarsandel, antalet arbetsplatser', N'Response rate, number of workplaces', NULL, N'mittari', 7)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'kyselyn_kohteet_tyopaikkojen_lkm', N'Kyselyn kohteet, työpaikkojen lkm', N'Målgrupp för enkäten, antalet arbetsplatser', N'Survey target group, number of workplaces', NULL, N'mittari', 1)
GO
INSERT [dbo].[translations] ([koodi], [selite_fi], [selite_sv], [selite_en], [kansio_koodi], [tyyppi], [jarjestys]) VALUES (N'vastattu_tyopaikkojen_lkm', N'Vastattu, työpaikkojen lkm', N'Svar, antalet arbetsplatser', N'Responded, number of workplaces', NULL, N'mittari', 4)
GO
