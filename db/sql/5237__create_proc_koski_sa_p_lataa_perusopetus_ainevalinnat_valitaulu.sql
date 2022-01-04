USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_perusopetus_ainevalinnat_valitaulu]    Script Date: 20.12.2021 9:29:51 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_perusopetus_ainevalinnat_valitaulu]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_perusopetus_ainevalinnat_valitaulu]    Script Date: 20.12.2021 9:29:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[p_lataa_perusopetus_ainevalinnat_valitaulu]
AS

DECLARE @tilv int = 2020
DECLARE @alkuPvm date = DATEFROMPARTS(@tilv, 1, 1)
DECLARE @loppuPvm date = DATEFROMPARTS(@tilv, 7, 31)

TRUNCATE TABLE dbo.perusopetus_ainevalinnat_valitaulu

WHILE @tilv <= year(getdate())
BEGIN

	INSERT INTO dbo.perusopetus_ainevalinnat_valitaulu
	SELECT
		[Lukuvuosi] = cast(@tilv-1 as nvarchar(4)) + '/' + cast(@tilv as nvarchar(4))
		,oppija_oid
		,opiskeluoikeus_oid
		,paatason_suoritus_id
		,vuosiluokka
		,[vuosiluokan_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,ika
		,aidinkieli
		,kansalaisuus
		,osasuoritus_id
		,[aine_koodisto]
		,[aine]
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara]
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,koulutusmoduuli_pakollinen
		,koulutusmoduuli_paikallinen
		,koulutusmoduuli_laajuus_arvo
		,koulutusmoduuli_laajuus_yksikko
		,kielet_lkm

	FROM 
	(
	  SELECT	  
		oo.oppija_oid
		,oo.opiskeluoikeus_oid

	  --suor
	    ,ps.paatason_suoritus_id
		,vuosiluokka = case when ps.suorituksen_tyyppi = 'perusopetuksenoppimaara' then '9' else ps.koulutusmoduuli_koodiarvo end
		,vuosiluokan_suorituskieli = 
			case 
				when ps.suorituskieli_koodiarvo	in ('EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK'/*, '98', '99', '-1'*/) then ps.suorituskieli_koodiarvo
				else /*ps.suorituskieli_koodiarvo is not null then*/ 'XX'
			end	

	  --org
		,ps.[toimipiste_oid]
		,oo.[oppilaitos_oid]
		,oo.[koulutustoimija_oid]

	  --hlö
		,h.sukupuoli
		,[ika] = @tilv - year(h.syntymaaika)
		,h.aidinkieli
		,[kansalaisuus] = left(coalesce(kansalaisuus,'999'),3)

	  --aineet ja oppimäärät
	    ,os.osasuoritus_id
	    ,[aine_koodisto] = os.[koulutusmoduuli_koodisto]
		,[aine] = 
			case 
				when /*@tilv < N --sovitaan vapauttamisesta, kun uskonto/et laatu parantunut
				  and*/ os.[koulutusmoduuli_koodisto] = 'koskioppiaineetyleissivistava' 
				  and os.[koulutusmoduuli_koodiarvo] = 'ET'
				then 'KT'
				else os.[koulutusmoduuli_koodiarvo]
			end
		,[aineen_oppimaara_koodisto] =	
			case 
				when os.[kieli_koodiarvo] is not null AND os.[koulutusmoduuli_koodiarvo] = 'AI' 
				then 'oppiaineaidinkielijakirjallisuus'
				when os.[kieli_koodiarvo] is not null --AND os.[koulutusmoduuli_koodiarvo] <> 'AI'
				then 'kielivalikoima'
				else os.[koulutusmoduuli_koodisto]
			end
		,[aineen_oppimaara] = 
			coalesce(os.[kieli_koodiarvo], 
				case 
					when /*@tilv < N --sovitaan vapauttamisesta, kun uskonto/et laatu parantunut
					  and*/ os.[koulutusmoduuli_koodisto] = 'koskioppiaineetyleissivistava' 
					  and os.[koulutusmoduuli_koodiarvo] = 'ET'
					then 'KT'
					else os.[koulutusmoduuli_koodiarvo]
				end
			)
		,[aineen_suorituskieli] = 
			case 
				when os.suorituskieli_koodiarvo	in ('EN', 'FR', 'RI', 'SV', 'SE', 'DE', 'FI', 'RU', 'VK'/*, '98', '99', '-1'*/) then os.suorituskieli_koodiarvo
				else /*ps.suorituskieli_koodiarvo is not null then*/ 'XX'
			end	
		,[aineen_arvosana] = os.arviointi_arvosana_koodiarvo
		,[aineen_arviointi_hyvaksytty] = os.arviointi_hyvaksytty
		,os.koulutusmoduuli_pakollinen
		,os.koulutusmoduuli_paikallinen
		,os.koulutusmoduuli_laajuus_arvo
		,os.koulutusmoduuli_laajuus_yksikko

		,[kielet_lkm] = sum(case when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo <> 'AI' then 1 else 0 end) 
						  over (partition by ps.paatason_suoritus_id)
		
		FROM Koski_SA.sa.[sa_koski_paatason_suoritus] ps
		LEFT JOIN Koski_SA.sa.[sa_koski_opiskeluoikeus] oo on oo.[opiskeluoikeus_oid] = ps.[opiskeluoikeus_oid]
		LEFT JOIN Koski_SA.sa.[sa_koski_henkilo] h on h.[oppija_oid] = oo.[oppija_oid]
		LEFT JOIN Koski_SA.sa.[sa_koski_osasuoritus] os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		
		WHERE ((ps.[suorituksen_tyyppi] = 'perusopetuksenvuosiluokka' AND ps.koulutusmoduuli_koodiarvo <> '9')
				OR ps.[suorituksen_tyyppi] = 'perusopetuksenoppimaara')
		  AND ps.[vahvistus_paiva] between @alkuPvm and @loppuPvm
		  AND os.[suorituksen_tyyppi] = 'perusopetuksenoppiaine'
		  AND os.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava'
		  AND os.arviointi_hyvaksytty = 1
	) q

	SET @tilv += 1
	SET @alkuPvm = DATEFROMPARTS(@tilv, 1, 1)
	SET @loppuPvm = DATEFROMPARTS(@tilv, 7, 31)

END

GO


