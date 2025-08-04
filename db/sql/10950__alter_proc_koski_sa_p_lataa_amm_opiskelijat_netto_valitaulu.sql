USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu]    Script Date: 30.7.2025 10.06.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu] @alku as date = '2018-01-01', @loppu as date = null AS

DECLARE @pvmAlku as date
DECLARE @pvmLoppu as date
DECLARE @pvmViimeinen as date

SET @pvmAlku = @alku
SET @pvmLoppu = EOMONTH(@pvmAlku)
SET @pvmViimeinen = COALESCE(@loppu, EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0))) --annettu tai edellisen kuukauden loppu


--hankintakoulutus aputauluun
DROP TABLE IF EXISTS sa.temp_amm_opiskeluoikeudet_hk

SELECT
	sisaltyy_opiskeluoikeuteen_oid = cast(sisaltyy_opiskeluoikeuteen_oid as varchar(255))
	,koulutustoimija_oid = cast(koulutustoimija_oid as varchar(255))
	,rnk = row_number() over (partition by sisaltyy_opiskeluoikeuteen_oid order by alkamispaiva desc, viimeisin_tila desc, opiskeluoikeus_oid)
INTO sa.temp_amm_opiskeluoikeudet_hk
FROM sa.sa_koski_opiskeluoikeus 
WHERE sisaltyy_opiskeluoikeuteen_oid is not null

CREATE NONCLUSTERED INDEX [NC_temp_amm_opiskeluoikeudet_hk] ON [sa].temp_amm_opiskeluoikeudet_hk
(
	sisaltyy_opiskeluoikeuteen_oid
	,koulutustoimija_oid
	,rnk
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


--varsinainen lataus
TRUNCATE TABLE [dbo].[amm_opiskelijat_netto_valitaulu]

WHILE @pvmAlku < @pvmViimeinen 

BEGIN

	--kalenteri
	DROP TABLE IF EXISTS sa.temp_amm_netto_kalenteri

	SELECT kalenteri_avain
	INTO sa.temp_amm_netto_kalenteri
	FROM antero.dw.d_kalenteri
	WHERE kalenteri_avain between @pvmAlku and @pvmLoppu

	CREATE NONCLUSTERED INDEX [NC_temp_amm_netto_kalenteri] ON [sa].temp_amm_netto_kalenteri
	(
		kalenteri_avain
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	--opiskeluoikeudet
	DROP TABLE IF EXISTS sa.temp_amm_opiskeluoikeudet

	SELECT DISTINCT
		oo.opiskeluoikeus_oid, 
		oo.master_oid,
		oo.alkamispaiva,
		ooa.alku,
		ooa.loppu,
		ooa.tila,
		h.sukupuoli,
		h.aidinkieli,
		h.syntymaaika, 
		kansalaisuus = left(h.kansalaisuus, 3),
		erityisopetus = 
			CASE				
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				WHEN ooa.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
				ELSE -1
			END,
		ooa.opintojen_rahoitus,
		majoitus =
			CASE					
				WHEN ooa.majoitus = 1 THEN 2
				WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
				WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
				ELSE 1
			END,
		ps.tutkinto_koodi,
		ps.osaamisala_koodiarvo,
		ps.suorituskieli_koodiarvo,
		ps.suorituksen_tyyppi,
		ps.toimipiste_oid,
		oo.oppilaitos_oid,
		oo.koulutustoimija_oid,
		hankintakoulutuksen_koulutustoimija_oid = oo_hk.koulutustoimija_oid,
		hankintakoulutus = case when oo_hk.koulutustoimija_oid is not null then 1 else 0 end,
		henkilostokoulutus = oo.lisatiedot_henkilostokoulutus,
		koulutusvienti = oo.lisatiedot_koulutusvienti,
		ika_oo_alk = year(oo.alkamispaiva) - year(h.syntymaaika),
		ika_oo_alk_tarkka = datediff(hour, h.syntymaaika, oo.alkamispaiva) / 8766,
		oo_aloitusvuosi = year(oo.alkamispaiva),
		oo_aloituskuukausi = month(oo.alkamispaiva),
		oppivelvollinen = case when ov.master_oid is not null then 1 else 0 end
	INTO sa.temp_amm_opiskeluoikeudet 
	FROM sa.sa_koski_opiskeluoikeus oo 
	JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
	JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
	LEFT JOIN sa.temp_amm_opiskeluoikeudet_hk oo_hk on oo_hk.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo_hk.koulutustoimija_oid != oo.koulutustoimija_oid and oo_hk.rnk = 1
	LEFT JOIN sa.sa_oppivelvolliset ov on ov.master_oid = oo.master_oid and @pvmAlku BETWEEN ov.alkuPvm and ov.loppuPvm
		
	WHERE ooa.alku <= @pvmLoppu 
	AND ooa.loppu >= @pvmAlku
	AND ooa.tila in ('lasna','loma') 
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL

	CREATE NONCLUSTERED INDEX [NC_temp_amm_opiskeluoikeudet] ON [sa].temp_amm_opiskeluoikeudet
	(
		master_oid
		,opiskeluoikeus_oid
		,alku
		,loppu
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	--sopimusjaksot
	DROP TABLE IF EXISTS sa.temp_amm_sopimusjaksot_opso
	DROP TABLE IF EXISTS sa.temp_amm_sopimusjaksot_koso

	SELECT
		opiskeluoikeus_oid
		,alku
		,loppu = coalesce(loppu,'9999-12-31')
	INTO sa.temp_amm_sopimusjaksot_opso
	FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] sj
	WHERE alku <= @pvmLoppu 
	AND coalesce(loppu,'9999-12-31') >= @pvmAlku 
	AND sopimusmuoto = 'Oppisopimus'

	SELECT
		opiskeluoikeus_oid
		,alku
		,loppu = coalesce(loppu,'9999-12-31')
	INTO sa.temp_amm_sopimusjaksot_koso
	FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]
	WHERE alku <= @pvmLoppu 
	AND coalesce(loppu,'9999-12-31') >= @pvmAlku 
	AND sopimusmuoto = 'Koulutussopimus'
	
	CREATE NONCLUSTERED INDEX [NC_temp_amm_sopimusjaksot_opso] ON [sa].temp_amm_sopimusjaksot_opso
	(
		opiskeluoikeus_oid
		,alku
		,loppu
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

	CREATE NONCLUSTERED INDEX [NC_temp_amm_sopimusjaksot_koso] ON [sa].temp_amm_sopimusjaksot_koso
	(
		opiskeluoikeus_oid
		,alku
		,loppu
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	--raakataulu
	DROP TABLE IF EXISTS sa.temp_amm_netto_raaka

	SELECT --DISTINCT
		--oo.alku,
		--oo.loppu,
		--oo.tila,
		oo.master_oid
		,oo.opiskeluoikeus_oid

		,vuosi = year(@pvmLoppu) 
		,kuukausi = month(@pvmLoppu)
		,kalenteripaivat = day(@pvmLoppu)
		,sukupuoli
		,aidinkieli
		,ika = year(@pvmLoppu) - year(oo.syntymaaika)
		,kansalaisuus
		,oppivelvollinen
		,erityisopetus
		,opintojen_rahoitus
		,koulutusvienti
		,majoitus
		,tutkinto_koodi
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,hankintakoulutuksen_koulutustoimija_oid
		,hankintakoulutus
		,henkilostokoulutus 
		,suorituksen_tyyppi
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,oo_aloitusvuosi
		,oo_aloituskuukausi

		,ca.opiskelijapaivat
		,ca.oppisopimus
		,ca.koulutussopimus
		,ika_opsoj_alk = year(ca.min_opso_alku) - year(oo.syntymaaika)
		,ika_opsoj_alk_tarkka =	datediff(hour, oo.syntymaaika, ca.min_opso_alku) / 8766
		,opsoj_aloitusvuosi = year(ca.min_opso_alku)
		,opsoj_aloituskuukausi = month(ca.min_opso_alku)

	INTO sa.temp_amm_netto_raaka

	FROM [sa].[temp_amm_opiskeluoikeudet] oo

	CROSS APPLY (
		select
			oppisopimus
			,koulutussopimus
			,opiskelijapaivat = count(distinct kalenteri_avain)
			,min_opso_alku = min(opso_alku)
		from (
			select 
				kal.kalenteri_avain
				,opso_alku = opsot.alku
				,oppisopimus = case when opsot.opiskeluoikeus_oid is not null then 1 else 0 end
				,koulutussopimus = case when kosot.opiskeluoikeus_oid is not null then 1 else 0 end
			from sa.temp_amm_netto_kalenteri kal
			left join sa.temp_amm_sopimusjaksot_opso opsot on opsot.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and kalenteri_avain between opsot.alku and opsot.loppu
			left join sa.temp_amm_sopimusjaksot_koso kosot on kosot.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and kalenteri_avain between kosot.alku and kosot.loppu
			where kalenteri_avain between oo.alku and oo.loppu
			and not exists (
				select 1 
				from sa.tuva_lasna_loma_jaksot tuvat 
				where kal.kalenteri_avain between tuvat.alku and tuvat.loppu
				and tuvat.master_oid = oo.master_oid 
				and oo.suorituksen_tyyppi != 'tuvakoulutuksensuoritus'
			)
		) q
		group by 
			oppisopimus
			,koulutussopimus	  
	) ca


	--tiedot välitauluun
	INSERT INTO [dbo].[amm_opiskelijat_netto_valitaulu] 

	SELECT 
		vuosi 
		,kuukausi 
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,oppivelvollinen
		,erityisopetus
		,opintojen_rahoitus
		,koulutusvienti
		,majoitus
		,tutkinto_koodi
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,hankintakoulutuksen_koulutustoimija_oid
		,hankintakoulutus
		,henkilostokoulutus 
		,suorituksen_tyyppi
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,ika_opsoj_alk
		,ika_opsoj_alk_tarkka
		,opsoj_aloitusvuosi
		,opsoj_aloituskuukausi
		,ka = 1.0 * sum(opiskelijapaivat) / kalenteripaivat
	FROM sa.temp_amm_netto_raaka
	GROUP BY 
		vuosi
		,kuukausi
		,kalenteripaivat
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus
		,oppivelvollinen
		,opintojen_rahoitus
		,koulutusvienti
		,majoitus
		,tutkinto_koodi
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,hankintakoulutuksen_koulutustoimija_oid
		,hankintakoulutus
		,henkilostokoulutus 
		,suorituksen_tyyppi
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,ika_opsoj_alk
		,ika_opsoj_alk_tarkka
		,opsoj_aloitusvuosi
		,opsoj_aloituskuukausi


	SET @pvmAlku = DATEADD(MONTH, 1, @pvmAlku)
	SET @pvmLoppu = EOMONTH(@pvmAlku)

END

DROP TABLE sa.temp_amm_netto_raaka
DROP TABLE sa.temp_amm_sopimusjaksot_opso
DROP TABLE sa.temp_amm_sopimusjaksot_koso
DROP TABLE sa.temp_amm_opiskeluoikeudet
DROP TABLE sa.temp_amm_netto_kalenteri
DROP TABLE sa.temp_amm_opiskeluoikeudet_hk

GO


