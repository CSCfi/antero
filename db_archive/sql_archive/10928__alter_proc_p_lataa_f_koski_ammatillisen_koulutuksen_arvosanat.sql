USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_ammatillisen_koulutuksen_arvosanat]    Script Date: 30.7.2025 8.12.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_koski_ammatillisen_koulutuksen_arvosanat] AS

-- Ammatillisen koulutuksen arvosanatiedot

/* PROSEDUURIN OSIOT */
-------------------------------------------------------------------------------------------------
-- 1. Esilataukset
-- 2. Faktalataus
-------------------------------------------------------------------------------------------------

---------------------
/* 1. ESILATAUKSET */
---------------------

-- Temp-taulujen pudotus
DROP TABLE IF EXISTS Koski_SA.sa.temp_osasuoritus_tutkinnonosat1
DROP TABLE IF EXISTS Koski_SA.sa.temp_osasuoritus_tutkinnonosat2
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_opiskeluoikeus_ammatillinen

-- Lasnapaivat temp-tauluun
SELECT
	opiskeluoikeus_oid
	,paivat = sum(datediff(day, alku, loppu) + 1)
INTO Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa	
WHERE tila in ('lasna', 'valmistunut', 'loma')
GROUP BY opiskeluoikeus_oid

-- Hylatyt lomapaivat temp-tauluun
SELECT 
	opiskeluoikeus_oid
	,paivat 
		= sum(
			CASE 
				WHEN datediff(day, tila_alkanut, loppu) + 1 > 28 
				THEN datediff(day, tila_alkanut, loppu) + 1 - 28 
				ELSE 0 
			end
		)
INTO Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
FROM (
	SELECT 
		opiskeluoikeus_oid
		,tila_alkanut
		,loppu = max(loppu)
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa	
	WHERE tila = 'loma'
	GROUP BY opiskeluoikeus_oid, tila_alkanut
) Q
GROUP BY opiskeluoikeus_oid

-- Oppisopimus- ja koulutussopimuspaivat temp-tauluun
SELECT 
	opiskeluoikeus_oid
	,sopimusmuoto
	,paivat = sum(paivat)
INTO Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat
FROM (
	SELECT distinct 
		sj.opiskeluoikeus_oid
		,sopimusmuoto = CASE WHEN sopimusmuoto like '%oppisopimu%' THEN 1 WHEN sopimusmuoto = 'Koulutussopimus' THEN 2 ELSE 0 end
		,alku
		,paivat = datediff(day, alku, CASE WHEN loppu > COALESCE(oo2.paattymispaiva, oo.paattymispaiva) and COALESCE(oo2.paattymispaiva, oo.paattymispaiva) is not null THEN COALESCE(oo2.paattymispaiva, oo.paattymispaiva) ELSE loppu END) + 1
	FROM Koski_SA.[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] sj
	LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.paatason_suoritus_id = sj.paatason_suoritus_id
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = sj.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 on oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid
	WHERE rnk = 1
) k
WHERE sopimusmuoto in (1,2)
GROUP BY opiskeluoikeus_oid, sopimusmuoto

-- Oppisopimus- ja koulutussopimuspaivien osuus temp-tauluun
SELECT 
	 hyv_pv.opiskeluoikeus_oid
	,oppis_osuus = SUM(coalesce(case when os_ks.sopimusmuoto = 1 then os_ks.paivat end, 0) / nullif(cast(hyv_pv.paivat - coalesce(hyl_pv.paivat,0) as float), 0))
	,koulutussop_osuus = SUM(coalesce(case when os_ks.sopimusmuoto = 2 then os_ks.paivat end, 0) / nullif(cast(hyv_pv.paivat - coalesce(hyl_pv.paivat,0) as float), 0))
INTO Koski_SA.sa.temp_amm_paivat
FROM Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat hyv_pv
LEFT JOIN Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat hyl_pv on hyv_pv.opiskeluoikeus_oid = hyl_pv.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat os_ks on os_ks.opiskeluoikeus_oid = hyv_pv.opiskeluoikeus_oid
GROUP BY hyv_pv.opiskeluoikeus_oid
			

/* 
Tutkinnon osien ja yhteisten tutkinnon osien osa-alueiden arvosanat temp-tauluun. Yhteisten tutkinnon osien 
osa-alueiden tiedot priorisoidaan tutkinnon osan tietojen edelle ellei muuttujan nimessä mainita tutkinnon osaa
*/
SELECT
	os.paatason_suoritus_id,
	COALESCE(os2.osasuoritus_id, os.osasuoritus_id) as osasuoritus_id,
	os.osasuoritus_id as osasuoritus_id_tutkinnon_osa,
	os.opiskeluoikeus_oid,
	os.koulutusmoduuli_koodisto,
	TRIM(os.koulutusmoduuli_koodiarvo) as tutkinnonosa,
	CASE WHEN TRIM(os.koulutusmoduuli_koodiarvo) in ('106728','400013','106727','600002','400012','106729','600001','400014') THEN os2.arviointi_arvosana_koodiarvo ELSE os.arviointi_arvosana_koodiarvo END as arvosana,
	CASE WHEN TRIM(os.koulutusmoduuli_koodiarvo) in ('106728','400013','106727','600002','400012','106729','600001','400014') THEN os2.arviointi_arvosana_koodisto ELSE os.arviointi_arvosana_koodisto END as arvosana_koodisto,
	-- Yhteiset tutkinnon osat
	CASE WHEN TRIM(os.koulutusmoduuli_koodiarvo) in ('106728','400013','106727','600002','400012','106729','600001','400014') THEN 1 ELSE 0 END as yto,
	CAST(os.koulutusmoduuli_paikallinen as int) as paikallinen_tutkinnonosa,
	CAST(os.koulutusmoduuli_pakollinen as int) as pakollinen_tutkinnonosa,
	CAST(os.tunnustettu as int) as tunnustettu_tutkinnonosa,
	-- Erikoiskäsittely koodille VVAI22, jos kieli_koodiarvo on tiedossa
	CASE 
		WHEN TRIM(os2.koulutusmoduuli_koodiarvo) = 'VVAI22' and os2.kieli_koodiarvo is null THEN 'VVAI22'
		-- suomi toisena kielenä, ruotsi toisena kielenä, suomi viittomakielisille, ruotsi viittomakielisille, suomi, romani, viittomakieli, saame ja ruotsi. Suomi ja saame yhdistetty.
		WHEN TRIM(os2.koulutusmoduuli_koodiarvo) = 'VVAI22' and os2.kieli_koodiarvo in ('RI', 'SV', 'XAI8', 'XAI12', 'SE', 'FI', 'XAI7', 'XAI11', 'VK') THEN REPLACE(CONCAT('VVAI22_', os2.kieli_koodiarvo), '_SE', '_FI')
		-- Opiskelijan oma äidinkieli (muu)
		WHEN TRIM(os2.koulutusmoduuli_koodiarvo) = 'VVAI22' THEN 'VVAI22_OOAM'
		ELSE TRIM(os2.koulutusmoduuli_koodiarvo)
	END as tutkinnonosan_osaalue,
	--Laajuudet vain osaamispisteina
	COALESCE(CASE WHEN os2.koulutusmoduuli_laajuus_yksikko <> 6 THEN NULL ELSE os2.koulutusmoduuli_laajuus_arvo END, CASE WHEN os.koulutusmoduuli_laajuus_yksikko <> 6 THEN NULL ELSE os.koulutusmoduuli_laajuus_arvo END) as laajuus,
	CASE WHEN os.koulutusmoduuli_laajuus_yksikko <> 6 THEN NULL ELSE os.koulutusmoduuli_laajuus_arvo END as laajuus_tutkinnon_osa,
	CAST(os2.koulutusmoduuli_paikallinen as int) as paikallinen_tutkinnonosan_osaalue,
	CAST(os2.koulutusmoduuli_pakollinen as int) as pakollinen_tutkinnonosan_osaalue,
	CAST(os2.tunnustettu as int) as tunnustettu_tutkinnonosan_osaalue,
	os.arviointi_paiva as tutkinnon_osan_arviointi_paiva
INTO Koski_SA.sa.temp_osasuoritus_tutkinnonosat1
FROM [Koski_SA].[sa].[sa_koski_osasuoritus] os
-- Yhteisten tutkinnon osien osa-alueiden tiedot
LEFT JOIN [Koski_SA].[sa].[sa_koski_osasuoritus] os2 on os2.ylempi_osasuoritus_id = os.osasuoritus_id AND TRIM(os.koulutusmoduuli_koodiarvo) in ('101054','106728','400013','101053','106727','600002','400012','101055','106729','600001','400014')
WHERE 
-- Tutkinnon osat
(
	os.koulutusmoduuli_koodisto = 'tutkinnonosat' 
	OR os.koulutusmoduuli_koodisto is null
) 
AND os.suorituksen_tyyppi = 'ammatillisentutkinnonosa' 
-- Vain hyväksytyt suoritukset
AND os.arviointi_hyvaksytty = 1 
AND (
	os2.arviointi_hyvaksytty = 1
	OR os2.osasuoritus_id is null
)
-- Ei vanhoja ytoja
AND os.koulutusmoduuli_koodiarvo not in ('101053', '101054', '101055', '101056')
-- Vain suoritukset, jotka on arvioitu asteikolla 1-5
AND 
(
	CASE 
		WHEN TRIM(os.koulutusmoduuli_koodiarvo) in ('106728','400013','106727','600002','400012','106729','600001','400014') 
		THEN os2.arviointi_arvosana_koodisto 
		ELSE os.arviointi_arvosana_koodisto 
	END = 'arviointiasteikkoammatillinen15'
)

-- Priorisoidaan suoritukset arvosanan mukaan
SELECT * 
INTO Koski_SA.sa.temp_osasuoritus_tutkinnonosat2
FROM (
	SELECT
		os.*,
		rnk = RANK() OVER(partition by os.opiskeluoikeus_oid, os.osasuoritus_id_tutkinnon_osa, os.tutkinnonosan_osaalue ORDER BY arvosana desc, osasuoritus_id)
	FROM Koski_SA.sa.temp_osasuoritus_tutkinnonosat1 os
	WHERE arvosana in ('1','2','3','4','5')
) f
WHERE f.rnk = 1

-- Opiskeluoikeuksien tiedot. Organisaatiotiedot, paattymispaiva ja koulutusvienti hankintakoulutuksesta.
SELECT
	oo.opiskeluoikeus_oid as opiskeluoikeus_oid2,
	oo.master_oid,
	COALESCE(oo2.opiskeluoikeus_oid, oo.opiskeluoikeus_oid) as opiskeluoikeus_oid,
	COALESCE(oo2.oppilaitos_oid, oo.oppilaitos_oid) as oppilaitos_oid,
	COALESCE(oo2.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
	oo.alkamispaiva,
	COALESCE(oo2.paattymispaiva, oo.paattymispaiva) as paattymispaiva,
	COALESCE(oo2.lisatiedot_koulutusvienti,oo.lisatiedot_koulutusvienti) as lisatiedot_koulutusvienti
INTO Koski_SA.sa.temp_opiskeluoikeus_ammatillinen
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 on oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo.sisaltyy_opiskeluoikeuteen_oid is not null
WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'

--------------------
/* 1. FAKTALATAUS */
--------------------

TRUNCATE TABLE ANTERO.dw.f_koski_ammatillisen_koulutuksen_arvosanat

INSERT INTO ANTERO.dw.f_koski_ammatillisen_koulutuksen_arvosanat
SELECT DISTINCT
	YEAR(ps.vahvistus_paiva) as koulutuksen_paattymisvuosi,
	YEAR(os.tutkinnon_osan_arviointi_paiva) as tutkinnon_osan_suoritusvuosi,
	d2.id as d_kalenteri_id,

	oo.master_oid,
	ps.opiskeluoikeus_oid,
	yto,
	os.osasuoritus_id,
	os.osasuoritus_id_tutkinnon_osa,
	os.arvosana,
	os.laajuus,
	os.laajuus_tutkinnon_osa,
	ps.perusteenDiaarinumero as diaarinumero,

	d3.id as d_suorituksen_tyyppi_id,
	COALESCE(d1.id, -1) as d_koulutusluokitus_id,

	os.tutkinnonosa,
	os.tutkinnonosan_osaalue,
	
	COALESCE(d9.id,-1) as d_kytkin_pakollinen_tutkinnon_osa_id,
	COALESCE(d10.id,-1) as d_kytkin_paikallinen_tutkinnon_osa_id,
	COALESCE(d11.id,-1) as d_kytkin_tunnustettu_tutkinnon_osa_id,
	COALESCE(d12.id,-1) as d_kytkin_pakollinen_tutkinnon_osan_osaalue_id,
	COALESCE(d13.id,-1) as d_kytkin_paikallinen_tutkinnon_osan_osaalue_id,
	COALESCE(d14.id,-1) as d_kytkin_tunnustettu_tutkinnon_osan_osaalue_id,

	COALESCE(d15.id,-1) as d_opintojen_rahoitus_rahoitusmuoto_id,
	COALESCE(d16.id,-1) as d_kytkin_koulutussopimus_id,
	COALESCE(d17.id,-1) as d_kytkin_oppisopimus_id,
	COALESCE(d18.id,-1) as d_kytkin_koulutusvienti_id,

	CASE				
		WHEN (ooa_ed.erityinen_tuki = 1 or ooa_ed.hojks = 1) and ooa_ed.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
		WHEN (ooa_ed.erityinen_tuki = 1 or ooa_ed.hojks = 1) and ooa_ed.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN ooa_ed.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vaikeasti_vammainen = 0 and ooa_ed.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN ooa_ed.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vaikeasti_vammainen = 0 and ooa_ed.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa_ed.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN ooa_ed.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
		ELSE -1
	END  as erityisopetus,
	 
	tp.koulutussop_osuus as koulutussopimus_osuus,
	tp.oppis_osuus as oppisopimus_osuus,

	COALESCE(d4.id,-1) as d_ika_opiskeluoikeuden_alku_id,
	COALESCE(d4b.id,-1) as d_ika_opiskeluoikeuden_loppu_id,
	COALESCE(d5.id,-1) as d_maatjavaltiot2_kansalaisuus_id,
	COALESCE(d6.id,-1) as d_sukupuoli_id,
	COALESCE(d7.id,-1) as d_kieli_aidinkieli_id,

	COALESCE(d7b.id,-1) as d_kieli_suorituskieli_id,

	COALESCE(d19.id, -1) as d_kytkin_oppivelvollinen_id,

	d8.id as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
	d8b.id as d_organisaatioluokitus_oppilaitos_id,
	d8c.id as d_organisaatioluokitus_toimipiste_id,

	'ETL: p_lataa_f_koski_ammatillisen_koulutuksen_arvosanat' as source,
	getdate() as loadtime,
	SUSER_NAME() as username

FROM Koski_SA.sa.sa_amm_paatason_suoritus ps
LEFT JOIN Koski_SA.sa.temp_opiskeluoikeus_ammatillinen oo on oo.opiskeluoikeus_oid2 = ps.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on oo.master_oid = h.master_oid
LEFT JOIN Koski_SA.sa.temp_osasuoritus_tutkinnonosat2 os on os.paatason_suoritus_id = ps.paatason_suoritus_id
LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.master_oid = h.master_oid
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa_ed ON ooa_ed.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND datediff(day, ooa_ed.loppu, oo.paattymispaiva) = 1
LEFT JOIN ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = ps.tutkinto_koodi
LEFT JOIN ANTERO.dw.d_kalenteri d2 on d2.kalenteri_avain = ps.vahvistus_paiva
LEFT JOIN ANTERO.dw.d_suorituksen_tyyppi d3 on d3.koodi = CASE WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1 ELSE 2 END
LEFT JOIN ANTERO.dw.d_ika d4 on d4.ika_avain = YEAR(oo.alkamispaiva) - YEAR(h.syntymaaika)
LEFT JOIN ANTERO.dw.d_ika d4b on d4b.ika_avain = YEAR(ps.vahvistus_paiva) - YEAR(h.syntymaaika)
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d5 on d5.maatjavaltiot2_koodi = LEFT(h.kansalaisuus,3)
LEFT JOIN ANTERO.dw.d_sukupuoli d6 on d6.sukupuoli_koodi = h.sukupuoli
LEFT JOIN ANTERO.dw.d_kieli d7 on d7.kieli_koodi = h.aidinkieli
LEFT JOIN ANTERO.dw.d_kieli d7b on d7b.kieli_koodi = ps.suorituskieli_koodiarvo
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8 on d8.organisaatio_oid = oo.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8b on d8b.organisaatio_oid = oo.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8c on d8c.organisaatio_oid = ps.toimipiste_oid
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.kytkin_koodi = os.pakollinen_tutkinnonosa
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = os.paikallinen_tutkinnonosa
LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.kytkin_koodi = os.tunnustettu_tutkinnonosa
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.kytkin_koodi = os.pakollinen_tutkinnonosan_osaalue
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.kytkin_koodi = os.paikallinen_tutkinnonosan_osaalue
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.kytkin_koodi = os.tunnustettu_tutkinnonosan_osaalue
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d15 ON d15.koodi = ooa_ed.opintojen_rahoitus
OUTER APPLY (
	select 
		koulutussopimus = max(CASE WHEN sopimusmuoto = 'Koulutussopimus' THEN 1 ELSE 0 end)
		,oppisopimus = max(CASE WHEN sopimusmuoto = 'Oppisopimus' THEN 1 ELSE 0 end)
	from Koski_SA.sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 
	where opiskeluoikeus_oid = oo.opiskeluoikeus_oid
) sj
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.kytkin_koodi = COALESCE(sj.koulutussopimus,0)
LEFT JOIN ANTERO.dw.d_kytkin d17 on d17.kytkin_koodi = COALESCE(sj.oppisopimus,0)
LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.kytkin_koodi = oo.lisatiedot_koulutusvienti
LEFT JOIN ANTERO.dw.d_kytkin d19 on d19.kytkin_koodi = CASE WHEN oo.alkamispaiva BETWEEN ov.alkuPvm AND ov.loppuPvm THEN 1 ELSE 0 END
LEFT JOIN Koski_SA.sa.temp_amm_paivat tp on tp.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE 
((YEAR(ps.vahvistus_paiva) >= 2021 
AND ps.vahvistus_paiva < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)) OR ps.vahvistus_paiva is null)
AND ps.rnk = 1 
AND ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'ammatillinentutkinto')
AND os.opiskeluoikeus_oid is not null
-- Ammatilliset perustutkinnot
AND d1.tutkintotyyppi_koodi = '02' 
--kuoriopiskeluoikeudet pois
AND NOT EXISTS (
	select 1 from Koski_SA.sa.sa_koski_opiskeluoikeus sa 
	where (sa.koulutusmuoto = 'ammatillinenkoulutus' OR sa.tuva_jarjestamislupa = 'ammatillinen')
	and sa.sisaltyy_opiskeluoikeuteen_oid is not null 
	and sa.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid2
)

DROP TABLE IF EXISTS Koski_SA.sa.temp_osasuoritus_tutkinnonosat1
DROP TABLE IF EXISTS Koski_SA.sa.temp_osasuoritus_tutkinnonosat2
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_opiskeluoikeus_ammatillinen

GO


