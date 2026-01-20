USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ytr_update]    Script Date: 30.7.2025 7.52.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_ytr_update] AS

DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ytr_update]

SELECT DISTINCT
	oo.master_oid,
	oo.opiskeluoikeus_oid,
	CONCAT(YEAR(ooy.alku), LEFT(d3.lukukausi_fi,1)) as tutkintokerta,
	tks.suorituskieli_koodiarvo,
	ks.koulutusmoduuli_koodiarvo,
	ks.arviointi_arvosana_koodiarvo,
	ks.arviointi_pisteet,
	d1.id as d_organisaatioluokitus_yo_id, 
	d2.id as d_organisaatioluokitus_koulutustoimija_yo_id
INTO Koski_SA.sa.sa_ytr_update
FROM [Koski_SA].[sa].[sa_koski_ytr_tutkintokokonaisuuden_suoritus] tks
INNER JOIN [Koski_SA].[sa].[sa_koski_ytr_tutkintokerran_suoritus] tks2 on tks2.ytr_tutkintokokonaisuuden_suoritus_id = tks.ytr_tutkintokokonaisuuden_suoritus_id 
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 on d1.organisaatio_oid = tks2.oppilaitos_oid
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 on d1.ylaorganisaatio_oid = d2.organisaatio_oid and d2.organisaatio_avain like 'koulutustoimija%'
LEFT JOIN [Koski_SA].[sa].[sa_koski_ytr_kokeen_suoritus] ks on ks.opiskeluoikeus_oid = tks.opiskeluoikeus_oid and ks.arviointi_hyvaksytty = 1
LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.opiskeluoikeus_oid = tks.opiskeluoikeus_oid
LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.master_oid = ooy.master_oid and ooy.tila_koodiarvo = 'valmistunut'
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d3 on d3.kalenteri_avain = ooy.alku
WHERE d3.vuosi >= 2018 and tks2.tutkintokerta_koodiarvo <= CONCAT(YEAR(ooy.alku), LEFT(d3.lukukausi_fi,1))

GO


