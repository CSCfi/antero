USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_valitaulu]    Script Date: 7.3.2023 21:07:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--exec [dbo].[p_lataa_hoivaavustajat_valitaulu] 

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_hoivaavustajat_valitaulu] AS

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

		,t.[oppija_oid]

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
		,[patevyyden_opiskeluoikeus_voimassa] = case when coalesce(oo_pat.paattymispaiva, tt_pat.paattymispaiva, '9999-01-01') > @loppuPvm then 1 else 0 end
		,[tutkinto] = case when pvm_tutkinto between @alkuPvm and @loppuPvm then 1 else 0 end
		,[tutkinto_kumulatiivinen] = case when pvm_tutkinto <= @loppuPvm then 1 else 0 end
		,[tutkinnon_suorittamisvuosi] = case when pvm_tutkinto <= @endOfTime then year(pvm_tutkinto) end
		,[tutkinnon_suorittamiskuukausi] = case when pvm_tutkinto <= @endOfTime then month(pvm_tutkinto) end

		--org
		,coalesce(oo_pat.koulutustoimija_oid, tt_pat.koulutustoimija_oid) as koulutustoimija_oid_oo_pat
		,tt_pat.koulutustoimija_oid as koulutustoimija_oid_tt_pat
		,tt_pat.oppilaitos_oid as oppilaitos_oid_tt_pat
		,ps_pat.toimipiste_oid as toimipiste_oid_tt_pat
		,coalesce(oo_tutk.koulutustoimija_oid, tt_tutk.koulutustoimija_oid) as koulutustoimija_oid_oo_tutk
		,tt_tutk.koulutustoimija_oid as koulutustoimija_oid_tt_tutk
		,tt_tutk.oppilaitos_oid as oppilaitos_oid_tt_tutk
		,ps_tutk.toimipiste_oid as toimipiste_oid_tt_tutk

	FROM [sa].[sa_hoivaavustajat] t

	LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = t.oppija_oid
	--pat
	LEFT JOIN sa.sa_amm_paatason_suoritus ps_pat on ps_pat.paatason_suoritus_id = t.paatason_suoritus_id_patevyys
	LEFT JOIN sa.sa_koski_opiskeluoikeus tt_pat on tt_pat.opiskeluoikeus_oid = ps_pat.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo_pat on oo_pat.opiskeluoikeus_oid = tt_pat.sisaltyy_opiskeluoikeuteen_oid
	--tutk
	LEFT JOIN sa.sa_amm_paatason_suoritus ps_tutk on ps_tutk.paatason_suoritus_id = t.paatason_suoritus_id_tutkinto
	LEFT JOIN sa.sa_koski_opiskeluoikeus tt_tutk on tt_tutk.opiskeluoikeus_oid = ps_tutk.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo_tutk on oo_tutk.opiskeluoikeus_oid = tt_tutk.sisaltyy_opiskeluoikeuteen_oid

	WHERE pvm_patevyys <= @loppuPvm


	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)

END

GO
