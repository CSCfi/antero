USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] AS

DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

SELECT 
	vuosi
	,kuukausi
	,sukupuoli = h.sukupuoli
	,aidinkieli = h.aidinkieli
	,ika = vuosi - year(h.syntymaaika)
	,perusopetuksen_suoritusvuosi = coalesce(year(oa1.perusopetuksen_paattymispaiva), -1)
	,oa1.keskiarvoluokka
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,oppilaitos_oid_pihvi
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,maksuttomuus = oa.maksuttomuus
	,suorituksen_tyyppi_koodi = ca.suorituksen_tyyppi_koodi
	,osaamisala_koodiarvo
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi
	,tutkinnot = count(distinct ca.oppija_opiskeluoikeus) --opiskeluoikeus huomioitu niitä ei-duplikaatteja varten, joissa vain tutkintonimikkeissä eroja
	,tutkinnon_osat = count(distinct suoritustason_tunniste)
	,osaamispisteet = sum(koulutusmoduuli_laajuus_arvo)

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
LEFT JOIN sa.sa_koski_henkilo_master h ON h.master_oid = f.master_oid
OUTER APPLY (
	SELECT 
		suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
		,oppija_opiskeluoikeus = case when paataso = 1 and suorituksen_tyyppi = 'ammatillinentutkinto' then concat(h.master_oid,'|',f.opiskeluoikeus_oid) end
) ca
OUTER APPLY (
	SELECT TOP 1
		perusopetuksen_paattymispaiva
		,keskiarvoluokka
	FROM sa.perusopetuksen_keskiarvot
	WHERE master_oid = h.master_oid
	AND tarkasteluajankohta < f.alkamispaiva
	ORDER BY tarkasteluajankohta DESC 
) oa1
OUTER APPLY (
	select 
		toisen_asteen_pohjakoulutus_2018 =
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = f.master_oid
	and tat.vahvistus_paiva < f.alkamispaiva
	and tat.vahvistus_paiva > '2017-12-31'
) oa2
OUTER APPLY (
	select 
		toisen_asteen_tutkinto_2018 = 
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = f.master_oid
	and tat.vahvistus_paiva < datefromparts(f.vuosi, f.kuukausi, 1)
	and tat.vahvistus_paiva > '2017-12-31'
) oa2b
OUTER APPLY (
	select 
		kotikunta_mannersuomessa_18v_mennessa = coalesce(max(0+d.mannersuomessa), 0)
	from sa.sa_koski_kotikuntahistoria kkh
	left join ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kkh.kotikunta
	where kkh.master_oid = h.master_oid
	and coalesce(kkh.muutto_pvm, '1900-01-01') < dateadd(year, 18, h.syntymaaika)
) oa3
OUTER APPLY (
	select 
		vapautettu_oppivelvollisuudesta = coalesce(max(1), 0)
	from sa.sa_valpas_oppivelvollisuudesta_vapautetut ovv
	left join sa.sa_koski_henkilo_master h2 on h2.master_oid = ovv.master_oid
	where h2.master_oid = h.master_oid
	and ovv.vapautettu < datefromparts(f.vuosi, f.kuukausi, 1)
	and coalesce(year(ovv.mitatoity), 9999) = 9999
) oa4
OUTER APPLY (
	select 
		maksuttomuus = 
			case 
				when 
					f.maksuton = 1
					and year(h.syntymaaika) > 2003
					and coalesce(year(oa1.perusopetuksen_paattymispaiva), 9999) > 2020
					and (
						f.vuosi - year(h.syntymaaika) < 21
						or (
							f.oikeutta_maksuttomuuteen_pidennetty = 1
							and year(f.alkamispaiva) - year(h.syntymaaika) < 21
						)
					)
					and	(
						oa3.kotikunta_mannersuomessa_18v_mennessa = 1
						or h.turvakielto = 1
					)
					and oa4.vapautettu_oppivelvollisuudesta = 0
					and oa2.toisen_asteen_pohjakoulutus_2018 = ''
					and oa2b.toisen_asteen_tutkinto_2018 not like '%amm%'
					and suorituksen_tyyppi != 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
					and kustannusryhma_koodi != 'muu'
				then 1
				else 0
			end
) oa

WHERE 1=1
AND duplikaatti_suorituskausittain = 0
AND paallekkainen_tuva = 0

GROUP BY
	vuosi
	,kuukausi
	,h.sukupuoli
	,h.aidinkieli
	,year(h.syntymaaika)
	,oa1.perusopetuksen_paattymispaiva
	,oa1.keskiarvoluokka
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,oppilaitos_oid
	,oppilaitos_oid_pihvi
	,toimipiste_oid
	,hankintakoulutus
	,alkamispaiva
	,opintojen_rahoitus_koodi
	,oa.maksuttomuus
	,ca.suorituksen_tyyppi_koodi
	,osaamisala_koodiarvo
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,tutkinto_koodi

GO
