USE [Koski_SA]

GO

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_ylioppilastutkinnon_suorittaneiden_arvosanat] AS

-- Haku ja valinta -raportteja varten

TRUNCATE TABLE Koski_SA.dbo.ylioppilastutkinnon_suorittaneiden_arvosanat

INSERT INTO Koski_SA.dbo.ylioppilastutkinnon_suorittaneiden_arvosanat
SELECT 
	ooy.master_oid,
	ooy.alku as valmistumispaivamaara,
	tks2.vuosi as suoritusvuosi,
	tks2.vuodenaika_koodiarvo as suorituskausi,
	CASE
		WHEN ks.koulutusmoduuli_koodiarvo = 'RY' THEN 'ET'
		WHEN ks.koulutusmoduuli_koodiarvo = 'RR' THEN 'UE'
		WHEN ks.koulutusmoduuli_koodiarvo = 'RR' THEN 'UO'
		ELSE ks.koulutusmoduuli_koodiarvo
	END as koodiarvo,
	ks.arviointi_arvosana_koodiarvo,
	CASE
		WHEN ks.arviointi_arvosana_koodiarvo = 'I=' THEN 1
		WHEN ks.arviointi_arvosana_koodiarvo = 'I-' THEN 2
		WHEN ks.arviointi_arvosana_koodiarvo = 'I' THEN 3
		WHEN ks.arviointi_arvosana_koodiarvo = 'I+' THEN 4
		ELSE ks.arviointi_pisteet + 3
	END as arviointi_pisteet,
	GETDATE() as loadtime,
	SUSER_NAME() as username
FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy
LEFT JOIN [Koski_SA].[sa].[sa_koski_ytr_tutkintokokonaisuuden_suoritus] tks on tks.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid
LEFT JOIN [Koski_SA].[sa].[sa_koski_ytr_tutkintokerran_suoritus] tks2 on tks2.ytr_tutkintokokonaisuuden_suoritus_id = tks.ytr_tutkintokokonaisuuden_suoritus_id 
LEFT JOIN [Koski_SA].[sa].[sa_koski_ytr_kokeen_suoritus] ks on ks.ytr_tutkintokerran_suoritus_id = tks2.ytr_tutkintokerran_suoritus_id 
WHERE ooy.tila_koodiarvo = 'valmistunut' and not (ks.koulutusmoduuli_koodiarvo is not null and ks.arviointi_arvosana_koodiarvo is null)