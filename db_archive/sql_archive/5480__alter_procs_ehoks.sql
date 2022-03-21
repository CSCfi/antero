USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_opiskelijat]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_ehoks_opiskelijat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__ehoks]    Script Date: 27.1.2022 17:16:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__ehoks]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__ehoks]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa__ehoks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa__ehoks] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa__ehoks] AS
	

EXEC	Koski_SA.sa.paivita_sa_taulujen_indeksit
EXEC	Koski_SA.sa.p_lataa_amm_paatason_suoritus
EXEC	sa.p_lataa_ehoks_osaamisen_hankkimisjaksot
EXEC	sa.p_lataa_ehoks_osaamisen_hankkimisjaksot_netto
EXEC	sa.p_lataa_ehoks_osaamisen_hankkimistavat_paivat
EXEC	dw.p_lataa_f_ehoks_opiskelijat
EXEC	dw.p_lataa_f_ehoks_tutkinnon_suorittaneet
EXEC	dw.p_lataa_f_ehoks_tutkinnon_suorittaneet_neljannekset


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_opiskelijat]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_ehoks_opiskelijat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_ehoks_opiskelijat] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_ehoks_opiskelijat] AS



DROP TABLE IF EXISTS dw.f_ehoks_opiskelijat

SELECT
	 oppija_oid
	,ehoks_id
	,opiskeluoikeus_oid
	,alkamispaiva
	,alkamisvuosi = year(alkamispaiva)
	,paattymispaiva
	,paattymisvuosi = coalesce(cast(year(paattymispaiva) as char(4)), 'Ei päättynyt')
	,vahvistuspaiva = vahvistus_paiva
	,opiskeluoikeuden_kesto_paivia = paivat
	,opiskeluoikeuden_kesto_paivia_kaikki_tilat = paivat_kaikki_tilat
	,ensikertainen_hyvaksyminen_kk = floor(datediff(day,alkamispaiva,ensikertainen_hyvaksyminen) / 30.0)
	,d_organisaatioluokitus_jarj_id = coalesce(d10.id, -1)
	,d_kytkin_koulutus_paattynyt_id = coalesce(d12.id, -1)
	,d_kytkin_valmistunut_id = coalesce(d13.id, -1)

	,oppilaitosmuotoinen_paivat
	,koulutussopimus_paivat
	,oppisopimus_paivat

	,sopimusjakso_alku = alku
	,sopimusjakso_loppu = loppu
	,d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id = coalesce(d17.id, -1)
	,d_osaamisen_hankkimistapa_id = coalesce(d16.id, -1)
	,d_osaamisen_hankkimistavat_id = coalesce(d18.id, -1)
	,d_kytkin_olennainen_seikka_hato_id = coalesce(d6.id, -1)
	,d_kytkin_nimetty_vastuullinen_tyopaikkaohjaaja_id = coalesce(d8.id, -1)
	,d_kytkin_opiskeluvalmiuksia_tukevat_opinnot_id = coalesce(d5.id, -1)
	,d_kytkin_osaamisen_hankkimisen_tarve_id = coalesce(d4.id, -1)
	,d_kytkin_ehoks_paivitetty_id = coalesce(d11.id, -1)
	,urasuunnitelma = coalesce(k.nimi, 'Tieto puuttuu')
	,d_toimiala_id = coalesce(d14.id, -1)

	,d_kytkin_olennainen_seikka_hyto_id = coalesce(d7.id, -1)
	,d_tutkinnon_osat_id = coalesce(t.id, -1)

	,d_koulutusluokitus_id = coalesce(d1.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d9.id, -1)
	,d_kytkin_muu_ammatillinen_id = coalesce(d15.id, -1)

	,d_sukupuoli_id = coalesce(d2.id, -1)
	,d_ika_alkamisvuonna_id = coalesce(d3.id, -1)

INTO dw.f_ehoks_opiskelijat

FROM (

	SELECT distinct
		 ep.oppija_oid
		,ep.opiskeluoikeus_oid
		,ep.ehoks_id
		,ca.alkamispaiva
		,oo.paattymispaiva
		,oo.koulutustoimija_oid
		,ps.vahvistus_paiva
		,paivat = aj.paivat + case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then datediff(day,ps.suorituksen_alkamispaiva,oo.alkamispaiva)+1 else 0 end
		,paivat_kaikki_tilat = datediff(day, ca.alkamispaiva, ca.paattymispaiva)+1

		,ep.ensikertainen_hyvaksyminen
		,paivitetty
		,osaamisen_hankkimisen_tarve = cast(ep.osaamisen_hankkimisen_tarve as int)
		,opiskeluvalmiuksia_tukevat_opinnot  = cast(ep.opiskeluvalmiuksia_tukevat_opinnot as int)
		,ep.urasuunnitelma_koodi

		,osaamisen_hankkimistapa_koodi
		--,osaamisen_hankkimistapa_koodi =
			--case 
			--	when hato2.koulutussopimus_paivat > 0 and hato2.oppisopimus_paivat = 0 and hato2.oppilaitosmuotoinen_paivat = 0 then 'Vain koulutussopimus'
			--	when hato2.koulutussopimus_paivat = 0 and hato2.oppisopimus_paivat > 0 and hato2.oppilaitosmuotoinen_paivat = 0 then 'Vain oppisopimus'
			--	when hato2.koulutussopimus_paivat = 0 and hato2.oppisopimus_paivat = 0 and hato2.oppilaitosmuotoinen_paivat > 0 then 'Vain muu koulutusympäristö'
			--	when hato2.koulutussopimus_paivat > 0 and hato2.oppisopimus_paivat > 0 and hato2.oppilaitosmuotoinen_paivat = 0 then 'Koulutussopimus ja oppisopimus'
			--	when hato2.koulutussopimus_paivat > 0 and hato2.oppisopimus_paivat = 0 and hato2.oppilaitosmuotoinen_paivat > 0 then 'Koulutussopimus ja muu oppimisympäristö'
			--	when hato2.koulutussopimus_paivat = 0 and hato2.oppisopimus_paivat > 0 and hato2.oppilaitosmuotoinen_paivat > 0 then 'Oppisopimus ja muu oppimisympäristö'
			--	when hato2.koulutussopimus_paivat > 0 and hato2.oppisopimus_paivat > 0 and hato2.oppilaitosmuotoinen_paivat > 0 then 'Koulutussopimus, oppisopimus ja muu oppimisympäristö'
			--	else 'Tieto puuttuu'
			--end
		,hato_olennainen_seikka = coalesce(hato1.olennainen_seikka, 0)
		,vastuullinen_tyopaikkaohjaaja = case when hato1.vastuullinen_tyopaikkaohjaaja = 'true' then 1 else 0 end
		,hato1.tyopaikan_ytunnus
		,hato1.alku
		,hato1.loppu

		,hato2.osaamisen_hankkimistavat

		,oppilaitosmuotoinen_paivat = coalesce(hato2.oppilaitosmuotoinenkoulutus, 0)
		,koulutussopimus_paivat = coalesce(hato2.koulutussopimus, 0)
		,oppisopimus_paivat = coalesce(hato2.oppisopimus, 0)

		,hyto_olennainen_seikka = coalesce(hyto.[olennainen-seikka],0)
		,hyto.tutkinnon_osa_koodi

		,suorituksen_tyyppi =
			case
				when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
				when ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
				else 2 --tutkinnon osa/osia
			end
		,ps.tutkinto_koodi
		,muu_ammatillinen = case when ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end

		,ika_alkamisvuonna = year(ca.alkamispaiva) - year(syntymaaika)
		,h.sukupuoli
		,h.kansalaisuus

	FROM sa.sa_ehoks_perustiedot_laajempi ep
	LEFT JOIN sa.sa_ehoks_hato hato1 on hato1.ehoks_id = ep.ehoks_id and hato1.osaamisen_hankkimistapa_koodi is not null
	LEFT JOIN sa.sa_ehoks_osaamisen_hankkimistavat_paivat hato2 on hato2.ehoks_id = ep.ehoks_id 
	LEFT JOIN (select distinct ehoks_id,tutkinnon_osa_koodi,[olennainen-seikka] FROM sa.sa_ehoks_hyto WHERE tutkinnon_osa_koodi is not null) hyto on hyto.ehoks_id = ep.ehoks_id
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.oppija_oid = ep.oppija_oid and oo.opiskeluoikeus_oid = ep.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = ep.opiskeluoikeus_oid 
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = ep.oppija_oid
	CROSS APPLY (
		select
			alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
			,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva)
	) ca
	LEFT JOIN (
		select
			opiskeluoikeus_oid
			,paivat = sum(datediff(day, alku, loppu)+1)
			--,paivat_kaikki_tilat = sum(datediff(day, alku, loppu)+1)
		from Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso
		where 1=1
		and tila in ('lasna','loma','valmistunut') 
		and loppu != '9999-12-31'
		group by opiskeluoikeus_oid
	) aj on aj.opiskeluoikeus_oid = ep.opiskeluoikeus_oid

	WHERE ca.alkamispaiva between '2018-01-01' and getdate()
	and oo.koulutusmuoto = 'ammatillinenkoulutus'
	and ps.rnk = 1

) Q

LEFT JOIN dw.d_koulutusluokitus d1a on d1a.koulutusluokitus_koodi = Q.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = coalesce(d1a.uusi_eat_koodi, d1a.koulutusluokitus_koodi)
LEFT JOIN dw.d_sukupuoli d2 on d2.sukupuoli_koodi = Q.sukupuoli
LEFT JOIN dw.d_ika d3 on d3.ika_avain = Q.ika_alkamisvuonna
LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = Q.osaamisen_hankkimisen_tarve
LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = Q.opiskeluvalmiuksia_tukevat_opinnot
LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = Q.hato_olennainen_seikka
LEFT JOIN dw.d_kytkin d7 on d7.kytkin_koodi = Q.hyto_olennainen_seikka
LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = Q.vastuullinen_tyopaikkaohjaaja
LEFT JOIN dw.d_suorituksen_tyyppi d9 on d9.koodi = Q.suorituksen_tyyppi
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.organisaatio_oid = Q.koulutustoimija_oid
LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi = (case when Q.paivitetty is not null then 1 else 0 end)
LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = (case when coalesce(Q.paattymispaiva, '9999-12-31') <= getdate() then 1 else 0 end)
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = (case when coalesce(Q.vahvistus_paiva, '9999-12-31') <= getdate() then 1 else 0 end)
LEFT JOIN Koski_SA.sa.sa_ytj_yritystiedot ytj on ytj.ytunnus = Q.tyopaikan_ytunnus
LEFT JOIN dw.d_toimialaluokitus2008 d14 on d14.toimiala_koodi = ytj.toimiala_koodi
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = Q.muu_ammatillinen
LEFT JOIN dw.d_osaamisen_hankkimistapa d16 on d16.koodi = Q.osaamisen_hankkimistapa_koodi
LEFT JOIN dw.d_kytkin d17 on d17.kytkin_koodi = (case when oppilaitosmuotoinen_paivat+koulutussopimus_paivat+oppisopimus_paivat = 0 then 0 else 1 end)
LEFT JOIN dw.d_osaamisen_hankkimistavat d18 on d18.koodi = Q.osaamisen_hankkimistavat

LEFT JOIN sa.sa_koodistot k on k.koodi = Q.urasuunnitelma_koodi and k.koodisto='urasuunnitelma'
LEFT JOIN (select koodiarvo,id=min(id) from Koski_SA.sa.sa_eperusteet_tutkinnonosat GROUP BY koodiarvo) t on t.koodiarvo = Q.tutkinnon_osa_koodi

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet] AS


--DROP TABLE IF EXISTS dw.f_ehoks_tutkinnon_suorittaneet

TRUNCATE TABLE dw.f_ehoks_tutkinnon_suorittaneet

;WITH kysely AS (
	SELECT distinct
		oppija_oid
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
		,[d_ika_alkamisvuonna_id]
		--,[d_tutkinnon_osat_id]
	FROM dw.f_ehoks_opiskelijat
)

INSERT INTO dw.f_ehoks_tutkinnon_suorittaneet (
	[oppija_oid]
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
/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat] AS

DECLARE @oht AS VARCHAR(50)

DECLARE db_cursor CURSOR FOR 
	SELECT distinct sopimusmuoto=f.d_osaamisen_hankkimistapa_id
	FROM dw.f_ehoks_tutkinnon_suorittaneet f
	WHERE f.d_osaamisen_hankkimistapa_id != -1

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @oht

WHILE @@FETCH_STATUS = 0  
BEGIN 
	
	INSERT INTO dw.f_ehoks_tutkinnon_suorittaneet (
		[oppija_oid]
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
		,[d_ika_alkamisvuonna_id]
		,[d_osaamisen_hankkimistapa_id]
		,[ytunnus]
		,[d_toimiala_id]
		,[paivat_kaikki]
		,[paivat_hankkimistapa]
		,[koulutussopimuksen_osuus]
		,[oppisopimuksen_osuus]
		,[muu_oppismisympäristö_osuus]
		,[generoitu]
	)
	--osaamisen hankkimistavat
	SELECT distinct
		[oppija_oid]
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
		,[d_ika_alkamisvuonna_id]
		,[d_osaamisen_hankkimistapa_id] = @oht
		,[ytunnus]
		,[d_toimiala_id]
		,[paivat_kaikki] = 0
		,[paivat_hankkimistapa] = 0
		,[koulutussopimuksen_osuus]
		,[oppisopimuksen_osuus]
		,[muu_oppismisympäristö_osuus]
		,[generoitu] = 1
	FROM dw.f_ehoks_tutkinnon_suorittaneet
	WHERE opiskeluoikeus_oid NOT IN (SELECT opiskeluoikeus_oid FROM dw.f_ehoks_tutkinnon_suorittaneet f WHERE d_osaamisen_hankkimistapa_id = @oht)

	FETCH NEXT FROM db_cursor INTO @oht

END
	
CLOSE db_cursor  
DEALLOCATE db_cursor 

DELETE FROM dw.f_ehoks_tutkinnon_suorittaneet WHERE d_osaamisen_hankkimistapa_id = -1
	





GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot] AS


DROP TABLE IF EXISTS [sa].[sa_ehoks_osaamisen_hankkimisjaksot]

SELECT distinct
	id = ehoks_id
	,h.opiskeluoikeus_oid
	,h.oppija_oid
	,ca2.alku
	,ca2.loppu
	,sopimusmuoto = osaamisen_hankkimistapa_koodi
	,tutkinnon_osa_koodi
	,ytunnus = tyopaikan_ytunnus
	,paivat = datediff(day,ca2.alku,ca2.loppu) + 1
	--,sopimusten_lkm_opiskeluoikeudessa = COUNT(*) OVER (PARTITION BY opiskeluoikeus_oid)
	,sopimusten_lkm_opiskeluoikeus_yritys = COUNT(*) OVER (PARTITION BY h.opiskeluoikeus_oid, tyopaikan_ytunnus)
	--,sopimuksen_jarjestys = DENSE_RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY alku, loppu, osaamisen_hankkimistapa_koodi, tyopaikan_ytunnus)
	--,sopimuksen_jarjestys_yritys = RANK() OVER (PARTITION BY opiskeluoikeus_oid, tyopaikan_ytunnus ORDER BY alku, loppu, osaamisen_hankkimistapa_koodi)
INTO #temp_ehoks
FROM [VIPUNEN_SA].[dbo].[sa_ehoks_hato] h
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=h.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
CROSS APPLY (
	SELECT 
		alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
		,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva)
) ca1
CROSS APPLY (
	SELECT 
		alku = case when h.alku < ca1.alkamispaiva then ca1.alkamispaiva else h.alku end
		,loppu = case when coalesce(h.loppu,'9999-12-31') > ca1.paattymispaiva then ca1.paattymispaiva else h.loppu end
) ca2
WHERE 1=1
and osaamisen_hankkimistapa_koodi is not null
and ca2.alku is not null and ca2.loppu is not null
and ca2.loppu between ca2.alku and getdate()
and ps.rnk=1


SELECT distinct
	t.[id]
	,t.[opiskeluoikeus_oid]
	,t.[oppija_oid]
	,t.[alku]
	,t.[loppu]
	,t.[sopimusmuoto]
	,t.tutkinnon_osa_koodi
	,t.[ytunnus]
	,paivat_kaikki = t.paivat
	,paivat_tyopaikka  = case when t.sopimusmuoto in ('koulutussopimus','oppisopimus') then t.paivat else 0 end

	--,ensimmainen_sopimus = 
	--	CASE 
	--		WHEN t.sopimuksen_jarjestys = 1 THEN 1
	--		ELSE 0 
	--	END 
	--,ensimmainen_sopimus_yritys = 
	--	CASE 
	--		WHEN t.sopimuksen_jarjestys_yritys = 1 THEN 1
	--		ELSE 0 
	--	END
	--,vahintaan_kaksi_sopimusta = 
	--	CASE 
	--		WHEN t.sopimusten_lkm_opiskeluoikeudessa > 1 THEN 1
	--		ELSE 0 
	--	END
	--,vahintaan_kaksi_sopimusta_yritys = 
	--	CASE 
	--		WHEN t.sopimusten_lkm_opiskeluoikeus_yritys > 1 THEN 1
	--		ELSE 0 
	--	END 
	--,t.[sopimusten_lkm_opiskeluoikeudessa]
	,t.[sopimusten_lkm_opiskeluoikeus_yritys]
	--,t.[sopimuksen_jarjestys]
	--,t.[sopimuksen_jarjestys_yritys]
	--,t2.sopimusmuoto AS edellinen_sopimus
	--,t3.sopimusmuoto AS edellinen_sopimus_sama_yritys
	--,edellinen_sopimus_koso = 
	--	CASE
	--		WHEN t2.sopimusmuoto = 'Koulutussopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_opso = 
	--	CASE
	--		WHEN t2.sopimusmuoto = 'Oppisopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_koso_yritys = 
	--	CASE
	--		WHEN t3.sopimusmuoto = 'Koulutussopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_opso_yritys = 
	--	CASE
	--		WHEN t3.sopimusmuoto = 'Oppisopimus' THEN 1
	--		ELSE 0 
	--	END

INTO [sa].[sa_ehoks_osaamisen_hankkimisjaksot]

FROM #temp_ehoks t
--LEFT JOIN #temp_ehoks t2 ON t.opiskeluoikeus_oid = t2.opiskeluoikeus_oid AND t.sopimuksen_jarjestys = t2.sopimuksen_jarjestys + 1
--LEFT JOIN #temp_ehoks t3 ON t.opiskeluoikeus_oid = t3.opiskeluoikeus_oid AND t.sopimuksen_jarjestys_yritys = t3.sopimuksen_jarjestys_yritys + 1 AND t.ytunnus = t3.ytunnus

ORDER BY t.opiskeluoikeus_oid, t.alku

DROP TABLE IF EXISTS #temp_ehoks




GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto] AS' 
END
GO


ALTER PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot_netto] AS


DROP TABLE IF EXISTS sa.sa_ehoks_osaamisen_hankkimisjaksot_netto

DECLARE @alku as date, @loppu as date, @pvm as date
SET @alku = '2018-01-01'
SET @loppu = DATEADD(yy, 1, @alku)

DROP TABLE IF EXISTS #pvm_taulu
DROP TABLE IF EXISTS #jaksot
DROP TABLE IF EXISTS #neljannekset
DROP TABLE IF EXISTS #yhdistetty
DROP TABLE IF EXISTS #temp_ehoks_netto

CREATE TABLE #pvm_taulu (pv date)


SET NOCOUNT ON

WHILE @alku < GETDATE()
BEGIN

	--pvm:t tauluun
	SET @pvm = @alku
	TRUNCATE TABLE #pvm_taulu

	WHILE @pvm < (case when @loppu > GETDATE() then GETDATE() else @loppu end)
	BEGIN 
		INSERT INTO #pvm_taulu VALUES (@pvm)
		SET @pvm = DATEADD(dd, 1, @pvm)
	END
	--


	SELECT 
		ehoks_id
		,h.opiskeluoikeus_oid
		,ca1.alkamispaiva
		,ca1.paattymispaiva
		,osaamisen_hankkimistapa_koodi
		,tyopaikan_ytunnus = left(ltrim(replace(tyopaikan_ytunnus,char(160),'')),9)
		,ca2.alku
		,ca2.loppu
	INTO #jaksot
	FROM [ANTERO].[sa].[sa_ehoks_hato] h
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=h.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
	CROSS APPLY (
		SELECT 
			alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
			,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva)
	) ca1
	CROSS APPLY (
		SELECT 
			alku = case when h.alku < ca1.alkamispaiva then ca1.alkamispaiva else h.alku end
			,loppu = case when coalesce(h.loppu,'9999-12-31') > ca1.paattymispaiva then ca1.paattymispaiva else h.loppu end
	) ca2
	WHERE 1=1
	and osaamisen_hankkimistapa_koodi is not null
	and ca2.alku is not null and ca2.loppu is not null
	and ca2.alku <= ca2.loppu
	and ca2.alku < @loppu and ca2.loppu >= @alku
	and ps.rnk=1
	

	
	SELECT
		opiskeluoikeus_oid
		,neljannes = left(pvm, 1)
		,neljannes_paivat
		,alku = jakso
		,loppu = jakso2
	INTO #neljannekset
	FROM (
		SELECT distinct
			opiskeluoikeus_oid
			,alkamispaiva
			,paattymispaiva
			,neljannes_paivat
			,[1_alku] = alkamispaiva
			,[1_loppu] = dateadd(day,neljannes_paivat-1,alkamispaiva)
			,[2_alku] = dateadd(day,neljannes_paivat,alkamispaiva)
			,[2_loppu] = dateadd(day,neljannes_paivat*2-1,alkamispaiva)
			,[3_alku] = dateadd(day,neljannes_paivat*2,alkamispaiva)
			,[3_loppu] = dateadd(day,neljannes_paivat*3-1,alkamispaiva)
			,[4_alku] = dateadd(day,neljannes_paivat*3,alkamispaiva)
			,[4_loppu] = paattymispaiva
		FROM #jaksot
		CROSS APPLY (SELECT neljannes_paivat = (datediff(day, alkamispaiva, paattymispaiva) + 1) / 4.0) ca
	) q
	UNPIVOT (
		jakso for pvm in ([1_alku],[2_alku],[3_alku],[4_alku])
	) unpvt
	UNPIVOT (
		jakso2 for pvm2 in ([1_loppu],[2_loppu],[3_loppu],[4_loppu])
	) unpvt
	WHERE left(unpvt.pvm, 1) = left(unpvt.pvm2, 1)	
	


	SELECT 
		pv
		,ehoks_id
		,oo.opiskeluoikeus_oid
		,osaamisen_hankkimistapa_koodi
		,tyopaikan_ytunnus
		,nel.neljannes
		,nel.neljannes_paivat
		,rnk = row_number() over (partition by ehoks_id, pv, osaamisen_hankkimistapa_koodi order by oo.alku desc, oo.loppu desc)
	INTO #yhdistetty
	FROM #jaksot oo
	INNER JOIN #pvm_taulu p ON p.pv between oo.alku and oo.loppu
	INNER JOIN #neljannekset nel on nel.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and p.pv between nel.alku and nel.loppu
	WHERE 1=1	



	SELECT 
		 ehoks_id
		,opiskeluoikeus_oid
		,neljannes
		,neljannes_paivat
		,osaamisen_hankkimistapa_koodi
		,tyopaikan_ytunnus
		,paivat = sum(paivat)
	INTO #temp_ehoks_netto
	FROM (
		SELECT 
			pv
			,neljannes
			,neljannes_paivat
			,ehoks_id
			,opiskeluoikeus_oid
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus
			,paivat = case when count(*) >= 1 then 1 else 0 end
		FROM #yhdistetty
		WHERE rnk = 1
		GROUP BY 
			 pv
			,neljannes
			,neljannes_paivat
			,ehoks_id
			,opiskeluoikeus_oid
			,osaamisen_hankkimistapa_koodi
			,tyopaikan_ytunnus	
	) Q
	GROUP BY neljannes
		,neljannes_paivat
		,ehoks_id
		,opiskeluoikeus_oid
		,osaamisen_hankkimistapa_koodi
		,tyopaikan_ytunnus
	
	--
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_ehoks_osaamisen_hankkimisjaksot_netto')
	BEGIN
		insert into sa.sa_ehoks_osaamisen_hankkimisjaksot_netto select * from #temp_ehoks_netto
	END
	ELSE BEGIN
		select * into sa.sa_ehoks_osaamisen_hankkimisjaksot_netto from #temp_ehoks_netto
	END
	--
	DROP TABLE #jaksot
	DROP TABLE #neljannekset
	DROP TABLE #yhdistetty
	DROP TABLE #temp_ehoks_netto
	--
	SET @alku =  DATEADD(yy, 1, @alku)
	SET @loppu = DATEADD(yy, 1, @alku)

END

DROP TABLE #pvm_taulu
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat]    Script Date: 27.1.2022 17:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat] AS' 
END
GO
ALTER PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimistavat_paivat] AS

DECLARE @cols nvarchar(max)
DECLARE @ranks nvarchar(max)
DECLARE @ranks_over nvarchar(max)
DECLARE @query nvarchar(max)

SELECT 
	@cols = COALESCE(@cols + ',[' + oht + ']', '[' + oht + ']')
	,@ranks = COALESCE(@ranks + ',[' + rnk + ']', '[' + rnk + ']')
	,@ranks_over = COALESCE(@ranks_over + ',''_'' + max([' + rnk + ']) over (partition by ehoks_id)', 'max([' + rnk + ']) over (partition by ehoks_id)')
FROM (
	SELECT DISTINCT 
		oht = koodi
		,rnk = cast(rank() over (order by koodi) as char(1))
	FROM dw.d_osaamisen_hankkimistapa
	WHERE koodi != '-1'
) PV  
ORDER BY oht



SET @query = 
'
	DROP TABLE IF EXISTS sa.sa_ehoks_osaamisen_hankkimistavat_paivat
	 
	;WITH kys AS (
		SELECT
			oht
			,rnk = row_number() over (order by jarjestys)
		FROM (
			SELECT DISTINCT 
				oht = koodi 
				,jarjestys
			FROM dw.d_osaamisen_hankkimistapa
			WHERE koodi != ''-1''
		) Q
	)
 
	
	SELECT 
		*	
	
	INTO sa.sa_ehoks_osaamisen_hankkimistavat_paivat

	FROM (
		SELECT 
			ehoks_id
			,opiskeluoikeus_oid
			,paivat
			,osaamisen_hankkimistapa_koodi = osaamisen_hankkimistapa2
			,osaamisen_hankkimistavat = ca.hankkimistavat
				
		FROM (
			SELECT
				ehoks_id
				,opiskeluoikeus_oid
				,paivat
				,osaamisen_hankkimistapa2
				,hankkimistavat = 
				concat('
					 + @ranks_over + 
				')
			FROM (
				SELECT 
					ehoks_id
					,opiskeluoikeus_oid
					,osaamisen_hankkimistapa = n.osaamisen_hankkimistapa_koodi
					,osaamisen_hankkimistapa2 = k.oht
					,paivat=sum(coalesce(paivat,0) )
					,k.rnk
				FROM sa.sa_ehoks_osaamisen_hankkimisjaksot_netto as n
				LEFT JOIN kys as k on k.oht = n.osaamisen_hankkimistapa_koodi
				--WHERE ehoks_id = 9082
				GROUP BY ehoks_id,opiskeluoikeus_oid,n.osaamisen_hankkimistapa_koodi,k.oht,rnk
			) Q
			PIVOT (
				min(osaamisen_hankkimistapa) for rnk in (' + @ranks + ')
			) pvt

			GROUP BY ehoks_id,opiskeluoikeus_oid,paivat,osaamisen_hankkimistapa2,' + @ranks + '
		) Q
		CROSS APPLY (
			SELECT hankkimistavat = case when left(hankkimistavat,1) = ''_'' then substring(hankkimistavat,2,len(hankkimistavat)-1) else hankkimistavat end
		) ca

    ) q
    PIVOT (
		sum(paivat) FOR osaamisen_hankkimistapa_koodi IN (' + @cols + ')
	) p    
	ORDER BY ehoks_id  
'     

EXEC SP_EXECUTESQL @query;
