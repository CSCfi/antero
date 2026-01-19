USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_koonti_rahoitusperusteet] AS 

/*
1. muodostetaan tulevan varainhoitovuoden (alustava) järjestäjärakenne koskien koko siirtymäaikaa
2. liitetään edellisten varainhoitovuosien laskennallinen rahoitus ilman harkinnanvaraista korotusta
3. alustetaan siirtymäajan varainhoitovuosien rahoituksen laskentaan tarvittavat osuudet, painot ja rajoitteet
*/

SELECT DISTINCT
	Varainhoitovuosi = oa.Vuosi + 1
	,d.ytunnus_amos_spl
	,d.nimi_amos_spl

	--ed. v. laskennallinen rahoitusosuus (ilman harkinnanvaraista korotusta)
	,laskennallinen_rahoitus_ed_v = sp.laskennallinen_rahoitus
	,laskennallinen_rahoitus_osuus_ed_v = sp.laskennallinen_rahoitus_osuus

	--tulevaa varainhoitovuotta koskevien suoritteiden osuudet
	,[painotetut_opv_lahtotaso_hyv_ka_osuus] = cast(null as decimal(30,29))
	,[painotetut_opv_kr_hyv_ka_osuus] = cast(null as decimal(30,29))
	,[painotetut_tutk_ja_osp_hyv_ka_osuus] = cast(null as decimal(30,29))
	,[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus] = cast(null as decimal(30,29))
	,[tyopaikkakysely_pisteet_osuus] = cast(null as decimal(30,29))
	,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus] = cast(null as decimal(30,29))
	,[aloituskysely_painotetut_pisteet_osuus] = cast(null as decimal(30,29))
	,[paattokysely_painotetut_pisteet_osuus] = cast(null as decimal(30,29))

	--osuuksien painot mallissa
	,[painotetut_opv_lahtotaso_hyv_ka_osuus_paino] = 0.10
	,[painotetut_opv_kr_hyv_ka_osuus_paino] = 0.40
	,[painotetut_tutk_ja_osp_hyv_ka_osuus_paino] = 0.30
	,[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino] = 0.18
	,[tyopaikkakysely_pisteet_osuus_paino] = 0.0025
	,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino] = 0.0075
	,[aloituskysely_painotetut_pisteet_osuus_paino] = 0.0025
	,[paattokysely_painotetut_pisteet_osuus_paino] = 0.0075

	--osuus painotukset huomioiden yhteensä
	,laskennallinen_rahoitus_osuus_ilman_rajoitteita = cast(null as decimal(30,29))
	,muutos_minimikerroin = cast(case oa.Vuosi+1 when 2026 then 0.95 when 2027 then 0.93 when 2028 then 0.90 end as decimal (30,29))
	,muutos_maksimikerroin = cast(case when oa.Vuosi+1 in (2026, 2027, 2028) then 1.10 end as decimal (30,29))
	,rajoitekerroin_minimi = cast(null as decimal(30,27))
	,rajoitekerroin_maksimi = cast(null as decimal(30,27))
	,laskennallinen_rahoitus_rajoitekerroin = cast(null as decimal(30,27))
	,laskennallinen_rahoitus_osuus = cast(null as decimal(30,29))
	,laskennallinen_rahoitus_rajoitekerroin_estimaatti = cast(null as decimal(30,27))
	,laskennallinen_rahoitus_osuus_estimaatti = cast(null as decimal(30,29))

FROM dw.d_amos_spl_jarjestaja_linkki  d
OUTER APPLY (	
	SELECT DISTINCT 
		Vuosi 
	FROM dw.v_amos_suoritepaatokset_2026
	--siirtymäaika 2026-28 (ed. v. 2025-27); seuraavan vuoden estimointi aloitetaan vasta viimeisellä 2-v. kauden vuosipuolikkaalla
	WHERE Vuosi between 2025 and least(year(getdate()), 2027) 
) oa
LEFT JOIN (
	SELECT  
		v.Vuosi
		,d2.ytunnus_amos_spl
		,laskennallinen_rahoitus = sum(case when v.[Lukumäärätieto] = 'Harkinnanvarainen rahoitus, €' then -arvo else arvo end)
		,laskennallinen_rahoitus_osuus = 
			cast(
				cast(sum(case when v.[Lukumäärätieto] = 'Harkinnanvarainen rahoitus, €' then -arvo else arvo end) as decimal(18,7))
				/ cast(sum(sum(case when v.[Lukumäärätieto] = 'Harkinnanvarainen rahoitus, €' then -arvo else arvo end)) over (partition by v.Vuosi) as decimal(18,7))
				as decimal(30,29)
			)
	FROM dw.v_amos_suoritepaatokset_2026 v
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = v.[Y-tunnus]
	wHERE 1=1
	AND v.raportti = 'rahoitusperusteet_ja_myonnetty_rahoitus'
	AND v.[Lukumäärätieto] in ('Rahoitus yhteensä (ei sis. alv), €', 'Harkinnanvarainen rahoitus, €')
	GROUP BY 
		v.Vuosi
		,d2.ytunnus_amos_spl
) sp
	ON sp.ytunnus_amos_spl = d.ytunnus_amos_spl
	AND sp.Vuosi = oa.Vuosi

WHERE d.sisaltyy_amos_spl = 1

GO
