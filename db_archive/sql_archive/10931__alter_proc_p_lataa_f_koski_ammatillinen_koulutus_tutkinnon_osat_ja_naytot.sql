USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot]    Script Date: 30.7.2025 8.17.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE [dw].[p_lataa_f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot] as

-- Ammatillisen koulutuksen tutkinnon osien suoritukset ja niihin sisältyvien näyttöjen tiedot

/* PROSEDUURIN OSIOT */
-------------------------------------------------------------------------------------------------
-- 1. Tietojen alustus
-- 2. Esilataukset
-- 3. Dimensiolataus
-- 4. Faktalataus
-------------------------------------------------------------------------------------------------

-------------------------
/* 1. TIETOJEN ALUSTUS */
-------------------------

-- Tiedot vuodesta 2018 alkaen
DECLARE @alkuVuosi int
DECLARE @loppuVuosi int

SET @alkuVuosi = 2018
SET @loppuVuosi = YEAR(eomonth(dateadd(month, -1, getdate())))

-- Temp-taulujen pudotus
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_paatason_suoritukset
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_hankintakoulutus
DROP TABLE IF EXISTS Koski_SA.sa.temp_tutkinnon_osat
DROP TABLE IF EXISTS Koski_SA.sa.temp_naytot
DROP TABLE IF EXISTS Koski_SA.sa.temp_naytot2

---------------------
/* 2. ESILATAUKSET */
---------------------
-- Hankintakoulutusten tiedot temp-tauluun
SELECT
	oo.opiskeluoikeus_oid
	,oo.sisaltyy_opiskeluoikeuteen_oid
	,oo.koulutustoimija_oid
	,oo.oppilaitos_oid
	,ps.paatason_suoritus_id
	,ps.tutkinto_koodi
	,ps.suorituksen_tyyppi
	,ps.vahvistus_paiva
	,ps.toimipiste_oid
INTO Koski_SA.sa.temp_amm_hankintakoulutus
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE oo.sisaltyy_opiskeluoikeuteen_oid is not null
AND ps.vahvistus_paiva is not null
AND ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'ammatillinentutkinto')
AND ps.rnk = 1

-- Henkilöön ja opiskeluoikeuteen liittyvät tiedot temp-tauluun
SELECT
	oo.master_oid
	,h.sukupuoli
	,h.syntymaaika
	,h.aidinkieli
	,h.kansalaisuus
	,oo.opiskeluoikeus_oid
	,oo.alkamispaiva
	,oo.paattymispaiva
	,oo.koulutustoimija_oid
	,oo.oppilaitos_oid
	,suorituskieli = ps.suorituskieli_koodiarvo
	-- Suoritukset ensisijaisesti hankintakoulutuksen opiskeluoikeudesta
	,paatason_suoritus_id = case when pihvi.opiskeluoikeus_oid is not null then pihvi.paatason_suoritus_id else ps.paatason_suoritus_id end
	,suorituksen_tyyppi = case when pihvi.opiskeluoikeus_oid is not null then pihvi.suorituksen_tyyppi else ps.suorituksen_tyyppi end
	,tutkinto = case when pihvi.opiskeluoikeus_oid is not null then pihvi.tutkinto_koodi else ps.tutkinto_koodi end
	,vahvistus_paiva = case when pihvi.opiskeluoikeus_oid is not null then pihvi.vahvistus_paiva else ps.vahvistus_paiva end
	,toimipiste_oid = case when pihvi.opiskeluoikeus_oid is not null then pihvi.toimipiste_oid else ps.toimipiste_oid end
	,hankintakoulutus = case when pihvi.opiskeluoikeus_oid is not null then 1 else 0 end
	,ooa_ed.opintojen_rahoitus
INTO Koski_SA.sa.temp_amm_paatason_suoritukset
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.temp_amm_hankintakoulutus pihvi
	ON pihvi.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid
	AND pihvi.koulutustoimija_oid != oo.koulutustoimija_oid
	AND pihvi.suorituksen_tyyppi = ps.suorituksen_tyyppi
LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
-- Opintojen rahoitus viimeisimmältä läsnäpäivältä
OUTER APPLY (
	SELECT 
		ooa_ed.opintojen_rahoitus
	FROM (
		SELECT
			ooa_ed.opintojen_rahoitus,
			ooa_ed.alku,
			MAX(ooa_ed.alku) OVER (PARTITION BY ooa_ed.opiskeluoikeus_oid) as max_alku
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa_ed
		WHERE ooa_ed.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa_ed.tila = 'lasna'
	) ooa_ed
	WHERE ooa_ed.alku = ooa_ed.max_alku
) ooa_ed
WHERE oo.sisaltyy_opiskeluoikeuteen_oid is null
AND ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'ammatillinentutkinto')
AND ps.rnk = 1

-- Tutkinnon osien suoritukset temp-tauluun
SELECT
	osasuoritus_id,
	opiskeluoikeus_oid,
	paatason_suoritus_id,
	koulutusmoduuli_koodisto,
	koulutusmoduuli_koodiarvo as tutkinnon_osa,
	-- Konvertoidaan numeroksi virheiden välttämiseksi
	CAST(koulutusmoduuli_paikallinen as int) as paikallinen,
	CAST(koulutusmoduuli_pakollinen as int) as pakollinen,
	CAST(tunnustettu as int) as tunnustettu,
	-- Yhteiset tutkinnot
	CASE
		WHEN koulutusmoduuli_koodiarvo in ('101056','101054','106728','400013','101053','106727','600002','400012','101055','106729','600001','400014') THEN 1
		ELSE 0
	END as yhteinen_tutkinnon_osa,
	-- Yhteiset ammatilliset valinnaiset
	CASE
		WHEN koulutusmoduuli_koodiarvo in ('101050','101052','101331','200508','400008','101040','103931','101051','400009','400011','103423','400010','106735','106731','106732','106730','106733','106734') THEN 1
		ELSE 0
	END as yhteinen_ammatillinen_valinnainen,
	arviointi_paiva
INTO Koski_SA.sa.temp_tutkinnon_osat
FROM Koski_SA.sa.sa_koski_osasuoritus
WHERE suorituksen_tyyppi = 'ammatillisentutkinnonosa'
AND arviointi_hyvaksytty = 1
AND YEAR(arviointi_paiva) >= @alkuVuosi

-- Näyttöjen tiedot temp-tauluun
SELECT
	[osasuoritus_id],
	sp2.value as suorituspaikka_koodi,
	ap2.value as arvioinnista_paattaneet_koodi,
	os.tyossaoppimisenYhteydessa
INTO Koski_SA.sa.temp_naytot
FROM Koski_SA.sa.sa_koski_osasuoritus os
OUTER APPLY OPENJSON([suorituspaikkaJson]) as sp
OUTER APPLY OPENJSON(sp.value) sp2
OUTER APPLY OPENJSON([arvioinnistaPaattaneetJson]) as ap
OUTER APPLY OPENJSON(ap.value) ap2
WHERE 
(
	[suorituspaikkaJson] IS NOT NULL 
	OR [arvioinnistaPaattaneetJson] IS NOT NULL
)
AND (
		(
			sp.[key] = 'tunniste' 
			AND sp2.[key] = 'koodiarvo'
		) 
		OR [suorituspaikkaJson] IS NULL
	)
AND (
	ap2.[key] = 'koodiarvo' 
	OR [arvioinnistaPaattaneetJson] IS NULL
-- Ei mene Jenkinsin kautta ajettuna läpi ilman alla olevaa
) OPTION (MAXDOP 1)

-- Arvioinnista päättäneet omiksi sarakkeiksi
SELECT
	osasuoritus_id,
	suorituspaikka_koodi,
	tyossaoppimisenYhteydessa,
	[1] as arvioinnista_paattaneet_1,
	[2] as arvioinnista_paattaneet_2,
	[3] as arvioinnista_paattaneet_3,
	[4] as arvioinnista_paattaneet_4,
	[5] as arvioinnista_paattaneet_5
INTO Koski_SA.sa.temp_naytot2
FROM (
	SELECT 
		osasuoritus_id, 
		suorituspaikka_koodi, 
		arvioinnista_paattaneet_koodi,
		tyossaoppimisenYhteydessa,
		COUNT(*) as lkm
	FROM Koski_SA.sa.temp_naytot
	GROUP BY osasuoritus_id, suorituspaikka_koodi, arvioinnista_paattaneet_koodi, tyossaoppimisenYhteydessa
) f
PIVOT (
    AVG(lkm) FOR arvioinnista_paattaneet_koodi IN
    ([1], [2], [3], [4], [5])
) AS PivotTable
-- Ei mene Jenkinsin kautta ajettuna läpi ilman alla olevaa
OPTION (MAXDOP 1)

-----------------------
/* 3. DIMENSIOLATAUS */
-----------------------

if not exists (select * from ANTERO.dw.d_nayton_arvioinnista_paattaneet where id=-1) 
begin
	set identity_insert ANTERO.dw.d_nayton_arvioinnista_paattaneet on;
	insert into ANTERO.dw.d_nayton_arvioinnista_paattaneet (
		id,
		[opettajat],
		[tyontekijat],
        [tyonantajan_edustajat],
		[itsenaiset_ammatinharjoittajat],
		[muut_koulutuksen_jarjestajan_edustajat],
		[selite_fi],
		[selite_sv],
		[selite_en],
		source
	)
	select
		-1,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
	;
  set identity_insert ANTERO.dw.d_nayton_arvioinnista_paattaneet off;

end 
else begin
	update d
	set
		d.[opettajat] = s.koodi,
		d.[tyontekijat] = s.koodi,
        d.[tyonantajan_edustajat] = s.koodi,
		d.[itsenaiset_ammatinharjoittajat] = s.koodi,
		d.[muut_koulutuksen_jarjestajan_edustajat] = s.koodi,
		d.[selite_fi] = nimi,
		d.[selite_sv] = nimi_sv,
		d.[selite_en] = nimi_en,
		d.source = s.source
	from ANTERO.dw.d_nayton_arvioinnista_paattaneet d
	join ANTERO.sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
end

MERGE ANTERO.dw.d_nayton_arvioinnista_paattaneet AS target
USING (
	-- Temp-taulusta kaikki mahdolliset variaatiot arvioinnista päättäneistä
	SELECT DISTINCT
		COALESCE(arvioinnista_paattaneet_1,0) as opettajat,
		COALESCE(arvioinnista_paattaneet_2,0) as tyontekijat,
		COALESCE(arvioinnista_paattaneet_3,0) as tyonantajan_edustajat,
		COALESCE(arvioinnista_paattaneet_4,0) as itsenaiset_ammatinharjoittajat,
		COALESCE(arvioinnista_paattaneet_5,0) as muut_koulutuksen_jarjestajan_edustajat,
		CASE
			WHEN arvioinnista_paattaneet_1 is null and arvioinnista_paattaneet_2 is null and arvioinnista_paattaneet_3 is null and arvioinnista_paattaneet_4 is null and arvioinnista_paattaneet_5 is null THEN 'Tieto puuttuu'
			ELSE
			REVERSE(STUFF(REVERSE(TRIM(CONCAT(
				CASE
					WHEN arvioinnista_paattaneet_1 is null THEN ''
					WHEN arvioinnista_paattaneet_1 = 1 THEN '1 opettaja, '
					ELSE CONCAT(arvioinnista_paattaneet_1, ' opettajaa, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_2 is null THEN ''
					WHEN arvioinnista_paattaneet_2 = 1 THEN '1 työntekijä, '
					ELSE CONCAT(arvioinnista_paattaneet_2, ' työntekijää, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_3 is null THEN ''
					WHEN arvioinnista_paattaneet_3 = 1 THEN '1 työnantaja/työelämän edustaja, '
					ELSE CONCAT(arvioinnista_paattaneet_3, ' työnantajaa/työelämän edustajaa, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_4 is null THEN ''
					WHEN arvioinnista_paattaneet_4 = 1 THEN '1 itsenäinen ammatinharjoittaja, '
					ELSE CONCAT(arvioinnista_paattaneet_4, ' itsenäistä ammatinharjoittajaa, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_5 is null THEN ''
					WHEN arvioinnista_paattaneet_5 = 1 THEN '1 muu koulutuksen järjestäjän edustaja, '
					ELSE CONCAT(arvioinnista_paattaneet_5, ' muuta koulutuksen järjestäjän edustajaa, ')
				END
			))), 1, 1, '')) 
		END as selite_fi,
		CASE
			WHEN arvioinnista_paattaneet_1 is null and arvioinnista_paattaneet_2 is null and arvioinnista_paattaneet_3 is null and arvioinnista_paattaneet_4 is null and arvioinnista_paattaneet_5 is null THEN 'Tieto puuttuu'
			ELSE
			REVERSE(STUFF(REVERSE(TRIM(CONCAT(
				CASE
					WHEN arvioinnista_paattaneet_1 is null THEN ''
					WHEN arvioinnista_paattaneet_1 = 1 THEN '1 lärare, '
					ELSE CONCAT(arvioinnista_paattaneet_1, ' lärare, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_2 is null THEN ''
					WHEN arvioinnista_paattaneet_2 = 1 THEN '1 arbetstagare, '
					ELSE CONCAT(arvioinnista_paattaneet_2, ' arbetstagare, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_3 is null THEN ''
					WHEN arvioinnista_paattaneet_3 = 1 THEN '1 arbetsgivare/företrädare för arbetslivet, '
					ELSE CONCAT(arvioinnista_paattaneet_3, ' arbetsgivare/företrädare för arbetslivet, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_4 is null THEN ''
					WHEN arvioinnista_paattaneet_4 = 1 THEN '1 självständig yrkesutövare, '
					ELSE CONCAT(arvioinnista_paattaneet_4, ' självständiga yrkesutövare, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_5 is null THEN ''
					WHEN arvioinnista_paattaneet_5 = 1 THEN '1 annan företrädare för utbildningsanordnaren, '
					ELSE CONCAT(arvioinnista_paattaneet_5, ' andra företrädare för utbildningsanordnaren, ')
				END
			))), 1, 1, '')) 
		END as selite_sv,
		CASE
			WHEN arvioinnista_paattaneet_1 is null and arvioinnista_paattaneet_2 is null and arvioinnista_paattaneet_3 is null and arvioinnista_paattaneet_4 is null and arvioinnista_paattaneet_5 is null THEN 'Tieto puuttuu'
			ELSE
			REVERSE(STUFF(REVERSE(TRIM(CONCAT(
				CASE
					WHEN arvioinnista_paattaneet_1 is null THEN ''
					WHEN arvioinnista_paattaneet_1 = 1 THEN '1 teacher, '
					ELSE CONCAT(arvioinnista_paattaneet_1, ' teachers, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_2 is null THEN ''
					WHEN arvioinnista_paattaneet_2 = 1 THEN '1 employee, '
					ELSE CONCAT(arvioinnista_paattaneet_2, ' employees, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_3 is null THEN ''
					WHEN arvioinnista_paattaneet_3 = 1 THEN '1 työnantaja/työelämän edustaja*EN, '
					ELSE CONCAT(arvioinnista_paattaneet_3, ' työnantajaa/työelämän edustajaa*EN, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_4 is null THEN ''
					WHEN arvioinnista_paattaneet_4 = 1 THEN '1 itsenäinen ammatinharjoittaja*EN, '
					ELSE CONCAT(arvioinnista_paattaneet_4, ' itsenäistä ammatinharjoittajaa*EN, ')
				END,
				CASE
					WHEN arvioinnista_paattaneet_5 is null THEN ''
					WHEN arvioinnista_paattaneet_5 = 1 THEN '1 muu koulutuksen järjestäjän edustaja*EN, '
					ELSE CONCAT(arvioinnista_paattaneet_5, ' muuta koulutuksen järjestäjän edustajaa*EN, ')
				END
			))), 1, 1, '')) 
		END as selite_en,
		source = 'ETL: p_lataa_f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot'
	FROM Koski_SA.sa.temp_naytot2
	WHERE NOT (
		arvioinnista_paattaneet_1 is null and 
		arvioinnista_paattaneet_2 is null and 
		arvioinnista_paattaneet_3 is null and 
		arvioinnista_paattaneet_4 is null and arvioinnista_paattaneet_5 is null
	)
) AS src
ON	target.opettajat = src.opettajat and 
	target.tyontekijat = src.tyontekijat and 
	target.tyonantajan_edustajat = src.tyonantajan_edustajat and
	target.itsenaiset_ammatinharjoittajat = src.itsenaiset_ammatinharjoittajat and 
	target.muut_koulutuksen_jarjestajan_edustajat = src.muut_koulutuksen_jarjestajan_edustajat

WHEN MATCHED THEN
	UPDATE SET
		target.selite_fi= src.selite_fi,
		target.selite_sv= src.selite_sv,
		target.selite_en= src.selite_en,
		target.source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		opettajat,
		tyontekijat,
		tyonantajan_edustajat,
		itsenaiset_ammatinharjoittajat,
		muut_koulutuksen_jarjestajan_edustajat,
		selite_fi,
		selite_sv,
		selite_en,
		source
	)
	VALUES (
		src.opettajat,
		src.tyontekijat,
		src.tyonantajan_edustajat,
		src.itsenaiset_ammatinharjoittajat,
		src.muut_koulutuksen_jarjestajan_edustajat,
		src.selite_fi,
		src.selite_sv,
		src.selite_en,
		src.source
	);

--------------------
/* 4. FAKTALATAUS */
--------------------

TRUNCATE TABLE ANTERO.dw.f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot

INSERT INTO ANTERO.dw.f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot
SELECT
	
	tos.arviointi_paiva,
	ps.vahvistus_paiva,

	ps.master_oid,
	ps.opiskeluoikeus_oid,
	tos.osasuoritus_id,

	coalesce(d1.id, -1) as d_sukupuoli_id,
	coalesce(d2.id, -1) as d_aidinkieli_id,
	coalesce(d3.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
	coalesce(d4.id, -1) as d_ika_id,
	coalesce(d5.id, -1) as d_kytkin_oppivelvollinen_id,

	coalesce(d6.id, -1) as d_koski_tutkinnon_osat_id,
	coalesce(d7.id, -1) as d_kytkin_pakollinen_tutkinnon_osa_id,
	coalesce(d8.id, -1) as d_kytkin_paikallinen_tutkinnon_osa_id,
	coalesce(d9.id, -1) as d_kytkin_tunnustettu_tutkinnon_osa_id,
	coalesce(d10.id, -1) as d_kytkin_yhteinen_tutkinnon_osa_id,
	coalesce(d11.id, -1) as d_kytkin_yhteinen_ammatillinen_valinnainen_tutkinnon_osa_id,

	coalesce(d12.id, -1) as d_koulutusluokitus_id,
	coalesce(d13.id, -1) as d_koski_suorituksen_tyyppi_id,
	coalesce(d14.id, -1) as d_osaamisala_koodisto_id,
	coalesce(d15.id, -1) as d_tutkintonimike_id,
	coalesce(d16.id, -1) as d_suorituskieli_id,
	coalesce(d17.id, -1) as d_opintojenrahoitus_id,
	coalesce(d24.id, -1) as d_kytkin_hankintakoulutus_id,

	coalesce(d18.id, -1) as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
	coalesce(d19.id, -1) as d_organisaatioluokitus_oppilaitos_id,
	coalesce(d20.id, -1) as d_organisaatioluokitus_toimipiste_id,

	coalesce(d21.id, -1) as d_kytkin_tyossaoppimisen_yhteydessa_id,
	coalesce(d22.id, -1) as d_nayton_arvioinnista_paattaneet_id,
	coalesce(d23.id, -1) as d_nayton_suorituspaikka_id,

	'ETL: p_lataa_f_koski_ammatillinen_koulutus_tutkinnon_osat_ja_naytot' as source,
	GETDATE() as loadtime,
	SUSER_NAME() as username

FROM Koski_SA.sa.temp_amm_paatason_suoritukset ps
LEFT JOIN Koski_SA.sa.temp_tutkinnon_osat tos on ps.paatason_suoritus_id = tos.paatason_suoritus_id
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus_osaamisala pso on pso.paatason_suoritus_id = ps.paatason_suoritus_id
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus_tutkintonimike pst on pst.paatason_suoritus_id = ps.paatason_suoritus_id
LEFT JOIN Koski_SA.sa.temp_naytot2 n on n.osasuoritus_id = tos.osasuoritus_id
LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.master_oid = ps.master_oid and tos.arviointi_paiva between ov.alkuPvm and ov.loppuPvm
LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.sukupuoli_koodi = ps.sukupuoli
LEFT JOIN ANTERO.dw.d_kieli d2 on d2.kieli_koodi = ps.aidinkieli
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.maatjavaltiot2_koodi = LEFT(ps.kansalaisuus,3)
LEFT JOIN ANTERO.dw.d_ika d4 on d4.ika_avain = FLOOR(CAST(DATEDIFF(day, ps.syntymaaika, tos.arviointi_paiva) as float) / 365.25)
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_koodi = CASE WHEN ov.master_oid is null THEN 0 ELSE 1 END
LEFT JOIN ANTERO.dw.d_koski_tutkinnonosat d6 on d6.koodi = tos.tutkinnon_osa
LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.kytkin_koodi = CAST(tos.pakollinen as int)
LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = CAST(tos.paikallinen as int)
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.kytkin_koodi = CAST(tos.tunnustettu as int)
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = tos.yhteinen_tutkinnon_osa
LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.kytkin_koodi = tos.yhteinen_ammatillinen_valinnainen
LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 on d12.koulutusluokitus_koodi = ps.tutkinto
LEFT JOIN ANTERO.dw.d_koski_suorituksen_tyyppi d13 on d13.koodi = ps.suorituksen_tyyppi
LEFT JOIN ANTERO.dw.d_osaamisala_koodisto d14 on d14.koodi = pso.osaamisala_koodiarvo
LEFT JOIN ANTERO.dw.d_tutkintonimike d15 on d15.tutkintonimike_koodi = pst.tutkintonimike_koodiarvo
LEFT JOIN ANTERO.dw.d_kieli d16 on d16.kieli_koodi = ps.suorituskieli
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d17 ON d17.koodi = ps.opintojen_rahoitus
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d18 on d18.organisaatio_oid = ps.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d19 on d19.organisaatio_oid = ps.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d20 on d20.organisaatio_oid = ps.toimipiste_oid
LEFT JOIN ANTERO.dw.d_kytkin d21 on d21.kytkin_koodi = n.tyossaoppimisenYhteydessa
LEFT JOIN ANTERO.dw.d_nayton_arvioinnista_paattaneet d22 on d22.opettajat = coalesce(n.arvioinnista_paattaneet_1,0) and 
															d22.tyontekijat = coalesce(n.arvioinnista_paattaneet_2,0) and 
															d22.tyonantajan_edustajat = coalesce(n.arvioinnista_paattaneet_3,0) and
															d22.itsenaiset_ammatinharjoittajat = coalesce(n.arvioinnista_paattaneet_4,0) and
															d22.muut_koulutuksen_jarjestajan_edustajat = coalesce(n.arvioinnista_paattaneet_5,0)
LEFT JOIN ANTERO.dw.d_nayton_suorituspaikka d23 on d23.koodi = n.suorituspaikka_koodi
LEFT JOIN ANTERO.dw.d_kytkin d24 on d24.kytkin_koodi = ps.hankintakoulutus
WHERE tos.opiskeluoikeus_oid IS NOT NULL AND YEAR(tos.arviointi_paiva) <= @loppuVuosi

DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_paatason_suoritukset
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_hankintakoulutus
DROP TABLE IF EXISTS Koski_SA.sa.temp_tutkinnon_osat
DROP TABLE IF EXISTS Koski_SA.sa.temp_naytot
DROP TABLE IF EXISTS Koski_SA.sa.temp_naytot2

GO


