USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet]    Script Date: 30.7.2025 11.44.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet] AS


--DROP TABLE IF EXISTS dw.f_ehoks_tutkinnon_suorittaneet

TRUNCATE TABLE dw.f_ehoks_tutkinnon_suorittaneet

;WITH kysely AS (
	SELECT distinct
		master_oid
		,opiskeluoikeus_oid
		,[ehoks_id]
		,[alkamispaiva]
		,[alkamisvuosi]
		,[paattymispaiva]
		,[paattymisvuosi]
		,[vahvistuspaiva]
		,[opiskeluoikeuden_kesto_paivia]
		,[opiskeluoikeuden_kesto_paivia_kaikki_tilat]
		,[d_organisaatioluokitus_jarj_id]
		,[d_kytkin_koulutus_paattynyt_id]
		,[d_kytkin_valmistunut_id]
		,[oppilaitosmuotoinen_paivat]
		,[koulutussopimus_paivat]
		,[oppisopimus_paivat]
		,[d_osaamisen_hankkimistavat_id]
		,[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id]
		--,[d_toimiala_id]
		,[d_koulutusluokitus_id]
		,[d_suorituksen_tyyppi_id]
		,[d_kytkin_muu_ammatillinen_id]
		,[d_sukupuoli_id]
		,[d_kansalaisuus_id]
		,[d_aidinkieli_id]
		,[d_ika_alkamisvuonna_id]
		--,[d_tutkinnon_osat_id]
	FROM dw.f_ehoks_opiskelijat
)

INSERT INTO dw.f_ehoks_tutkinnon_suorittaneet (
	[master_oid]
    ,[opiskeluoikeus_oid]
    ,[ehoks_id]
    ,[alkamispaiva]
    ,[alkamisvuosi]
    ,[paattymispaiva]
    ,[paattymisvuosi]
    ,[vahvistuspaiva]
    ,[opiskeluoikeuden_kesto_paivia]
    ,[opiskeluoikeuden_kesto_paivia_kaikki_tilat]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_kytkin_koulutus_paattynyt_id]
    ,[d_kytkin_valmistunut_id]
    ,[oppilaitosmuotoinen_paivat]
    ,[koulutussopimus_paivat]
    ,[oppisopimus_paivat]
    ,[d_osaamisen_hankkimistavat_id]
	,[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id]
    ,[d_koulutusluokitus_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_kytkin_muu_ammatillinen_id]
    ,[d_sukupuoli_id]
	,[d_kansalaisuus_id]
	,[d_aidinkieli_id]
    ,[d_ika_alkamisvuonna_id]
    ,[d_osaamisen_hankkimistapa_id]
    ,[ytunnus]
    ,[d_toimiala_id]
    ,[sopimuksen_alku]
    ,[sopimuksen_loppu]
    ,[paivat_hankkimistapa]
    ,[paivat_kaikki]
    ,[paivat_tyopaikka]
    ,[sopimusten_lkm_opiskeluoikeus_yritys]
    ,[koulutussopimuksen_osuus]
    ,[oppisopimuksen_osuus]
    ,[muu_oppismisympäristö_osuus]
    ,[generoitu]
)

SELECT 
	Q.*
	
--INTO dw.f_ehoks_tutkinnon_suorittaneet
FROM (
	SELECT 

		f.*
		,d_osaamisen_hankkimistapa_id = coalesce(d3.id, -1)
		,sj.ytunnus
		,d_toimiala_id = coalesce(d14.id,-1)
		,sopimuksen_alku = sj.alku
		,sopimuksen_loppu = sj.loppu
		,paivat_hankkimistapa = 
			case sj.sopimusmuoto 
				when 'oppilaitosmuotoinenkoulutus' then f.oppilaitosmuotoinen_paivat
				when 'koulutussopimus' then f.koulutussopimus_paivat
				when 'oppisopimus' then f.oppisopimus_paivat
			end
		,paivat_kaikki = coalesce(sj.paivat_kaikki, 0)
		,paivat_tyopaikka = coalesce(sj.paivat_tyopaikka, 0)

		,[sopimusten_lkm_opiskeluoikeus_yritys]

		,[koulutussopimuksen_osuus] = coalesce(f.koulutussopimus_paivat / (f.opiskeluoikeuden_kesto_paivia * 1.0), 0)
		,[oppisopimuksen_osuus] = coalesce(f.oppisopimus_paivat / (f.opiskeluoikeuden_kesto_paivia * 1.0), 0)
		,[muu_oppismisympäristö_osuus] = coalesce(f.oppilaitosmuotoinen_paivat / (f.opiskeluoikeuden_kesto_paivia * 1.0), 0)

		,generoitu = 0


	FROM kysely f
	LEFT JOIN sa.sa_ehoks_osaamisen_hankkimisjaksot sj on sj.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	--LEFT JOIN (SELECT opiskeluoikeus_oid,ytunnus, tyopaikkajaksojen_lkm = max(sopimuksen_jarjestys_yritys) FROM sa.sa_ehoks_osaamisen_hankkimisjaksot GROUP BY opiskeluoikeus_oid, ytunnus) sj2 on sj2.opiskeluoikeus_oid = f.opiskeluoikeus_oid and sj2.
	LEFT JOIN dw.d_kytkin d2 on d2.id = f.d_kytkin_valmistunut_id
	LEFT JOIN Koski_SA.sa.sa_ytj_yritystiedot ytj on ytj.ytunnus = sj.ytunnus
	LEFT JOIN dw.d_toimialaluokitus2008 d14 on d14.toimiala_koodi = ytj.toimiala_koodi
	LEFT JOIN dw.d_osaamisen_hankkimistapa d3 on d3.koodi = sj.sopimusmuoto
	WHERE 1=1
	--and sj.alku >= f.alkamispaiva 
	--and sj.paivat_kaikki > 0 
	and d2.kytkin_koodi = 1

) Q

LEFT JOIN dw.d_ytj_yritystiedot d23 ON d23.ytunnus = q.ytunnus
LEFT JOIN dw.d_toimialaluokitus2008 d24 ON d24.toimiala_koodi = d23.toimiala_koodi
--LEFT JOIN dw.d_kalenteri d25 ON d25.kalenteri_avain = q.alku
--LEFT JOIN dw.d_kalenteri d26 ON d26.kalenteri_avain = q.loppu
LEFT JOIN dw.d_alueluokitus d29 ON d29.kunta_koodi = d23.kotipaikkakunta_koodi


EXEC [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]

GO


