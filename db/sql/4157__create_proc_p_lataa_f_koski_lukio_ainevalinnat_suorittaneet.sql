USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_ainevalinnat_suorittaneet]    Script Date: 1.12.2020 22:43:05 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_lukio_ainevalinnat_suorittaneet]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_ainevalinnat_suorittaneet]    Script Date: 1.12.2020 22:43:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_f_koski_lukio_ainevalinnat_suorittaneet] 
AS

/* 
  Huom. vuosipäivityksessä (erit. lops2021):
  - yhdenmukaistetaanko näkymässä kurssi vs. opintopiste -laajuus
  - nimetäänkö muuttujia uusiksi näkymässä tai kuutiossa
  - "suorituksen_tyyppi" uudet arvot rajauksissa
  - "kurssin_tyyppi_koodiarvo" / "koulutusmoduuli_paikallinen" uudet arvot
  - päivitä näkymän käyttämät dimensiot, huomioi tarvittaessa tässä latauksessa
*/ 

-- Jäädytys:
-- 1) Huomioi kohdat _jäädytyspvm, vapauta kommentit declare/set:n ympäriltä ja aja alle muodostuva proseduurin luontiskripti arkistointipalvelimella
-- 2) Aja luotu proseduuri arkistointipalvelimella
-- 3) Päivitä normipalvelimen näkymä ja prosessoi kuutio

/*
USE ANTERO--_jäädytyspvm
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS dw.p_lataa_f_koski_lukio_ainevalinnat_suorittaneet--_jäädytyspvm
GO

CREATE PROCEDURE dw.p_lataa_f_koski_lukio_ainevalinnat_suorittaneet--_jäädytyspvm
AS
*/

DECLARE @alkuPvm as date, @loppuPvm as date, @maxPvm as date

SET @alkuPvm = '2018-08-01' --huom. _jäädytyspvm
SET @loppuPvm = dateadd(year, 1, dateadd(day, -1, @alkuPvm))
SET @maxPvm = case year(@alkuPvm) when 2018 then '2020-07-31' else @loppuPvm end --ekalla kerralla 2 v, jatkossa 1 v

--DROP TABLE IF EXISTS dw.f_koski_lukio_ainevalinnat_suorittaneet--_jäädytyspvm
--SELECT TOP 0
--INTO dw.f_koski_lukio_ainevalinnat_suorittaneet--_jäädytyspvm
--FROM dw.f_koski_lukio_ainevalinnat_suorittaneet

TRUNCATE TABLE dw.f_koski_lukio_ainevalinnat_suorittaneet --saa tyhjentyä jäädytyspalvelimella

WHILE @loppuPvm <= @maxPvm

BEGIN

--aputaulut

	DROP TABLE IF EXISTS #oppiaineet
	DROP TABLE IF EXISTS #kurssit

	SELECT * INTO #oppiaineet
	FROM 
	(
	  SELECT

	  --lukion oppimäärä
		ps.paatason_suoritus_id
		,[lukionoppimaara] = ps.oppimaara
		,[lukionoppimaara_suorituskieli] = ps.suorituskieli_koodiarvo
		,ps.toimipiste_oid
		,oo.oppilaitos_oid
		,oo.koulutustoimija_oid
		--,d.organisaatiotyypit

	  --henkilö
		,sukupuoli_koodi = 
			case 
				when cast(substring(h.hetu,8,3) as int) % 2 = 1 then '1' 
				when cast(substring(h.hetu,8,3) as int) % 2 = 0 then '2'
				else '-1'
			end
		,[ika] = coalesce(year(ps.vahvistus_paiva) - year(h.syntymaaika), -1)
		,h.aidinkieli
		,[kansalaisuus] = left(coalesce(kansalaisuus,'999'),3)

	  --aine ja oppimäärä
		,os.osasuoritus_id
		,[aine_koodisto] = os.koulutusmoduuli_koodisto 
		,[aine] = os.koulutusmoduuli_koodiarvo
		,[aineenoppimaara_koodisto] =	
			case 
				when os.matematiikan_oppimaara_koodiarvo is not null /*AND os.koulutusmoduuli_koodiarvo = 'MA'*/ then 'oppiainematematiikka'		
				--when os.uskonnon_oppimaara_koodiarvo is not null /*AND os.koulutusmoduuli_koodiarvo in ('KT','ET')*/ then 'uskonnonoppimaara' --in the future
				when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo = 'AI' then 'oppiaineaidinkielijakirjallisuus'
				when os.kieli_koodiarvo is not null /*AND os.koulutusmoduuli_koodiarvo <> 'AI'*/ then 'kielivalikoima'
				else os.koulutusmoduuli_koodisto
			end
		,[aineenoppimaara] = coalesce(os.matematiikan_oppimaara_koodiarvo, /*os.uskonnon_oppimaara_koodiarvo,*/ os.kieli_koodiarvo, os.koulutusmoduuli_koodiarvo)	
		,[aine_suorituskieli] = os.suorituskieli_koodiarvo
		,[aine_laajuus] = os.koulutusmoduuli_laajuus_arvo
		,[aine_laajuus_yksikko] = coalesce(os.koulutusmoduuli_laajuus_yksikko, '4') --null estetty lops2021-?
		,[aine_laajuus_puuttuu_0_1] = case when os.koulutusmoduuli_laajuus_arvo is null then 1 else 0 end
		,[aine_S_arvosana_0_1] = case os.arviointi_arvosana_koodiarvo when 'S' then 1 else 0 end
		,[aine_arvosana] = os.arviointi_arvosana_koodiarvo
		,[aine_arviointi_hyvaksytty] = os.arviointi_hyvaksytty

	  --kielten määrä
		,[kielet_lkm] = sum(case when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo <> 'AI' then 1 else 0 end) 
						over (partition by ps.paatason_suoritus_id)
	  
	  --Koski_SA_jäädytyspvm
		FROM Koski_SA.sa.sa_koski_paatason_suoritus ps	
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		--LEFT JOIN Koski_SA.sa.sa_koski_organisaatio d on d.organisaatio_oid = ps.toimipiste_oid
		LEFT JOIN Koski_SA.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		
		WHERE ps.suorituksen_tyyppi = 'lukionoppimaara'
			AND ps.vahvistus_paiva between @alkuPvm and @loppuPvm
			AND os.suorituksen_tyyppi in ('lukionoppiaine','lukionmuuopinto')
			AND os.koulutusmoduuli_koodisto is not null --ei tuntemattomia
			AND os.arviointi_hyvaksytty = 1 --ei hylättyjä
			AND os.arviointi_arvosana_koodiarvo <> 'O' --ei kesken jääneitä
	) f1
	;
	
	SELECT * INTO #kurssit 
	FROM 
	(
	  SELECT

		ylempi_osasuoritus_id
		,[kurssi_paikallinen_OPS_0_1] = cast(koulutusmoduuli_paikallinen as int)
		,[kurssi_tyyppi] = os.kurssin_tyyppi_koodiarvo
		,[kurssi_suorituskieli] = os.suorituskieli_koodiarvo
		--,[kurssi_arvosana] = arviointi_arvosana_koodiarvo

		,kurssit_laajuus = sum(coalesce(os.koulutusmoduuli_laajuus_arvo, 1)) --laajuus nykyään pakollinen
		,[kurssit_laajuus_all_suorituskieli] = sum(sum(coalesce(os.koulutusmoduuli_laajuus_arvo, 1))) 
												over (partition by ylempi_osasuoritus_id, koulutusmoduuli_paikallinen, kurssin_tyyppi_koodiarvo)
		,kurssit_lkm_total = sum(count(*)) over (partition by ylempi_osasuoritus_id)
		,[kurssit_S_arvosanat_laajuus] = sum(case os.arviointi_arvosana_koodiarvo when 'S' then coalesce(os.koulutusmoduuli_laajuus_arvo, 1) else 0 end)
		--,kurssit_lkm = count(*)
		--,[kurssit_lkm_all_suorituskieli] = sum(count(*)) over (partition by ylempi_osasuoritus_id, koulutusmoduuli_paikallinen, kurssin_tyyppi_koodiarvo)
		--,[kurssit_S_arvosanat_lkm] = sum(case os.arviointi_arvosana_koodiarvo when 'S' then 1 else 0 end)

	  --Koski_SA_jäädytyspvm
		FROM [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps
		LEFT JOIN [Koski_SA].[sa].[sa_koski_osasuoritus] os on ps.paatason_suoritus_id = os.paatason_suoritus_id
		
		WHERE ps.suorituksen_tyyppi = 'lukionoppimaara'
			AND ps.vahvistus_paiva between @alkuPvm and @loppuPvm
			AND os.suorituksen_tyyppi = 'lukionkurssi'
			AND os.ylempi_osasuoritus_id is not null --ei irtokursseja
			AND os.arviointi_arvosana_koodiarvo <> 'O' --ei kesken jääneitä

		GROUP BY os.ylempi_osasuoritus_id
			,os.koulutusmoduuli_paikallinen
			,os.kurssin_tyyppi_koodiarvo
			,os.suorituskieli_koodiarvo
	) f2
	;

	
	INSERT INTO dw.f_koski_lukio_ainevalinnat_suorittaneet--_jäädytyspvm

	SELECT 
	
	[Tilastovuosi] = year(@loppuPvm)

	,paatason_suoritus_id
	,lukionoppimaara
	,lukionoppimaara_suorituskieli
	,toimipiste_oid
	,oppilaitos_oid
	,koulutustoimija_oid
	--,d.organisaatiotyypit

	,sukupuoli = sukupuoli_koodi
	,ika
	,aidinkieli
	,kansalaisuus

	,#oppiaineet.osasuoritus_id
	,aine_koodisto
	,[aine] = --kielet luokitellaan "vähimmäislaajuuden" mukaan
		case 
			when aineenoppimaara_koodisto <> 'kielivalikoima' then aine
			when (aine = 'B1' 
					AND ((aine_laajuus_yksikko = '4' and aine_laajuus < 5)
						OR (aine_laajuus_yksikko is null and kurssit_lkm_total < 5)
						OR (aine_laajuus_yksikko = '2' and aine_laajuus < 10)
					)
				) 
				OR 
				(aine <> 'B1'
					AND ((aine_laajuus_yksikko = '4' and aine_laajuus < 6)
						OR (aine_laajuus_yksikko is null and kurssit_lkm_total < 6)
						OR (aine_laajuus_yksikko = '2' and aine_laajuus < 12)
					)
				) then aine + 'X'
			else aine
		end
	,aineenoppimaara_koodisto
	,aineenoppimaara
	,aine_suorituskieli
	,aine_laajuus
	,aine_laajuus_yksikko
	,aine_laajuus_puuttuu_0_1
	,aine_S_arvosana_0_1
	,aine_arvosana
	,aine_arviointi_hyvaksytty
		
	,kielet_lkm
		
	,kurssi_paikallinen_OPS_0_1
	,kurssi_tyyppi
	,kurssi_suorituskieli

	,kurssit_laajuus
	,kurssit_laajuus_all_suorituskieli
	,kurssit_S_arvosanat_laajuus

	FROM #oppiaineet
	LEFT JOIN #kurssit on #kurssit.ylempi_osasuoritus_id = #oppiaineet.osasuoritus_id

	--vain täyspitkät matikat mukaan huomioiden may1, joka merkitty usein kokonaisuudeksi
	WHERE aineenoppimaara not in ('MAA','MAB','MAY')
	OR (aineenoppimaara = 'MAA' 
		AND ((aine_laajuus_yksikko = '4' and aine_laajuus >= 9)
			OR (aine_laajuus_yksikko is null and kurssit_lkm_total >= 9)
			OR (aine_laajuus_yksikko = '2' and aine_laajuus >= 18)
		)
	)
	OR (aineenoppimaara = 'MAB'
		AND ((aine_laajuus_yksikko = '4' and aine_laajuus >= 5)
			OR (aine_laajuus_yksikko is null and kurssit_lkm_total >= 5)
			OR (aine_laajuus_yksikko = '2' and aine_laajuus >= 10)
		)
	)

	DROP TABLE IF EXISTS #oppiaineet
	DROP TABLE IF EXISTS #kurssit

	SET @alkuPvm = dateadd(year, 1, @alkuPvm)
	SET @loppuPvm = dateadd(year, 1, @loppuPvm)

END

