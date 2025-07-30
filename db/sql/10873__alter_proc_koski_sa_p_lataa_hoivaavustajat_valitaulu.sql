USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_hoivaavustajat_valitaulu]    Script Date: 29.7.2025 17.54.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_hoivaavustajat_valitaulu] AS

/*
käytetyt lyhenteet:
- pätevyys "pat" 
- tutkinto "tutk"
- tutkintotodistus/(pää)opiskeluoikeus "tt"/"oo" <-> pihvi/kuori hankintakoulutuksen tapauksessa 
*/

DECLARE @alkuPvm date, @loppuPvm date, @endOfTime date

SET @alkuPvm = '2018-01-01'
SET @loppuPvm = EOMONTH(@alkuPvm)
SET @endOfTime = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0))

TRUNCATE TABLE dbo.hoivaavustajat_valitaulu

WHILE @alkuPvm <= @endOfTime

BEGIN

	INSERT dbo.hoivaavustajat_valitaulu

	SELECT DISTINCT
		vuosi = year(@alkuPvm)
		,kuukausi = month(@alkuPvm)
		,[alkamisvuosi_oo_pat] = year(coalesce(oo_pat.alkamispaiva, tt_pat.alkamispaiva))
		,[alkamiskuukausi_oo_pat] = month(coalesce(oo_pat.alkamispaiva, tt_pat.alkamispaiva))
		,t.tutkinnon_perusteiden_voimaantulo

		,t.master_oid

		,h.sukupuoli
		,[ika] = year(@alkuPvm) - year(h.syntymaaika)
		,h.aidinkieli
		,[kansalaisuus] = left(h.kansalaisuus, 3)
		,h.kotikunta

		--huom. vain viimeisimpään tilastokuukauteen ulottuvia saavuttamis-/suorittamisaikoja näkyviin
		,[patevyys] = case when pvm_patevyys between @alkuPvm and @loppuPvm then 1 else 0 end
		,[patevyys_kumulatiivinen] = case when pvm_patevyys <= @loppuPvm then 1 else 0 end --nyk. poiminnalla aina 1
		,[patevyyden_saavuttamisvuosi] = case when pvm_patevyys <= @endOfTime then year(pvm_patevyys) end --nyk. poiminnalla turha case
		,[patevyyden_saavuttamiskuukausi] = case when pvm_patevyys <= @endOfTime then month(pvm_patevyys) end --nyk. poiminnalla turha case
		,[patevyyden_opiskeluoikeus_voimassa] = 
			case
				when coalesce(case when tt_pat.sisaltyy_opiskeluoikeuteen_oid is not null then oo_pat.paattymispaiva else tt_pat.paattymispaiva end, '9999-01-01') > @loppuPvm then 1 
				else 0 
			end
		,[tutkinto] = case when pvm_tutkinto between @alkuPvm and @loppuPvm then 1 else 0 end
		,[tutkinto_kumulatiivinen] = case when pvm_tutkinto <= @loppuPvm then 1 else 0 end
		,[tutkinnon_suorittamisvuosi] = case when pvm_tutkinto <= @endOfTime then year(pvm_tutkinto) end
		,[tutkinnon_suorittamiskuukausi] = case when pvm_tutkinto <= @endOfTime then month(pvm_tutkinto) end

		--org
		,koulutustoimija_oid_oo_pat = coalesce(oo_pat.koulutustoimija_oid, tt_pat.koulutustoimija_oid)
		,oppilaitos_oid_oo_pat = coalesce(oo_pat.oppilaitos_oid, tt_pat.oppilaitos_oid)
		,koulutustoimija_oid_tt_pat = tt_pat.koulutustoimija_oid
		,oppilaitos_oid_tt_pat = tt_pat.oppilaitos_oid
		,toimipiste_oid_tt_pat = ps_pat.toimipiste_oid
		,koulutustoimija_oid_oo_tutk = coalesce(oo_tutk.koulutustoimija_oid, tt_tutk.koulutustoimija_oid)
		,oppilaitos_oid_oo_tutk = coalesce(oo_tutk.oppilaitos_oid, tt_tutk.oppilaitos_oid)
		,koulutustoimija_oid_tt_tutk = tt_tutk.koulutustoimija_oid
		,oppilaitos_oid_tt_tutk = tt_tutk.oppilaitos_oid
		,toimipiste_oid_tt_tutk = ps_tutk.toimipiste_oid

		--rahoitusmuoto jotpaa varten
		,opintojen_rahoitus_oo_pat = coalesce(oa.opintojen_rahoitus_pvm_patevyys, oa2.opintojen_rahoitus_max)

	FROM [sa].[sa_hoivaavustajat] t
	LEFT JOIN sa.sa_koski_henkilo_master h on h.master_oid = t.master_oid
	--pat
	LEFT JOIN sa.sa_amm_paatason_suoritus ps_pat on ps_pat.paatason_suoritus_id = t.paatason_suoritus_id_patevyys
	LEFT JOIN sa.sa_koski_opiskeluoikeus tt_pat on tt_pat.opiskeluoikeus_oid = ps_pat.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo_pat on oo_pat.opiskeluoikeus_oid = tt_pat.sisaltyy_opiskeluoikeuteen_oid
	OUTER APPLY (
		select opintojen_rahoitus_pvm_patevyys = ooa_pat.opintojen_rahoitus
		from sa.sa_koski_opiskeluoikeus_aikajakso ooa_pat
		where ooa_pat.opiskeluoikeus_oid = coalesce(oo_pat.opiskeluoikeus_oid, tt_pat.opiskeluoikeus_oid)
		and t.pvm_patevyys between ooa_pat.alku and ooa_pat.loppu 
		and ooa_pat.tila = 'lasna'
	) oa
	OUTER APPLY (
		select opintojen_rahoitus_max = max(0+ooa_pat.opintojen_rahoitus)
		from sa.sa_koski_opiskeluoikeus_aikajakso ooa_pat
		where ooa_pat.opiskeluoikeus_oid = coalesce(oo_pat.opiskeluoikeus_oid, tt_pat.opiskeluoikeus_oid) 
		and ooa_pat.tila = 'lasna'
	) oa2
	--tutk
	LEFT JOIN sa.sa_amm_paatason_suoritus ps_tutk on ps_tutk.paatason_suoritus_id = t.paatason_suoritus_id_tutkinto
	LEFT JOIN sa.sa_koski_opiskeluoikeus tt_tutk on tt_tutk.opiskeluoikeus_oid = ps_tutk.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo_tutk on oo_tutk.opiskeluoikeus_oid = tt_tutk.sisaltyy_opiskeluoikeuteen_oid

	WHERE pvm_patevyys <= @loppuPvm


	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)

END

GO
