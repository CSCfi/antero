USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_paallekkainen_tuva]    Script Date: 30.7.2025 17.12.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_paallekkainen_tuva] AS

--
--Päällekkäisen valmentavan opiskelun tunnistus
--

DROP TABLE IF EXISTS #tuva;

--Tuvatiedot temp-tauluun
SELECT DISTINCT 
	d.oid_amos_spl
	,oo.master_oid
	,ooa.alku
	,ooa.loppu
	,min_alku = min(ooa.alku) over (partition by oo.opiskeluoikeus_oid order by ooa.alku)
INTO #tuva
FROM sa.sa_koski_opiskeluoikeus oo
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d on d.oid_avain = oo.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d2 on d2.koodi = ooa.opintojen_rahoitus
WHERE 1=1
and (
	oo.tuva_jarjestamislupa = 'ammatillinen'
	or ps.suorituksen_tyyppi in ('valma','telma')
)
and oo.sisaltyy_opiskeluoikeuteen_oid is null
and ooa.tila = 'lasna'
and d2.sisaltyy_okm_perusrahoitus = 1

--Päällekkäisyyden liputus välitauluun
UPDATE vt
SET vt.paallekkainen_tuva = 1
FROM dbo.tutkinnot_ja_tutkinnonosat_valitaulu vt
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d on d.oid_avain = vt.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d2 on d2.koodi = vt.opintojen_rahoitus_koodi
JOIN #tuva t on 
	t.oid_amos_spl = d.oid_amos_spl
	and t.master_oid = vt.master_oid
	and t.min_alku <= vt.alkamispaiva
	and (case when vt.paataso = 1 then vt.vahvistus_paiva else vt.arviointi_paiva end) between t.alku and coalesce(t.loppu,'9999-12-31')
	and d2.sisaltyy_okm_suoritusrahoitus = 1
WHERE vt.suorituksen_tyyppi = 'ammatillinentutkintoosittainen'

DROP TABLE #tuva;

GO
