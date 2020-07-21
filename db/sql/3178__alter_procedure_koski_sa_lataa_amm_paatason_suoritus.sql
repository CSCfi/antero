USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amm_paatason_suoritus]    Script Date: 21.7.2020 11:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_amm_paatason_suoritus] AS

IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC_amm_paataso' AND object_id = OBJECT_ID('sa.sa_amm_paatason_suoritus'))
BEGIN
	DROP INDEX [NC_amm_paataso] ON sa.sa_amm_paatason_suoritus
END

TRUNCATE TABLE sa.sa_amm_paatason_suoritus

INSERT INTO sa.sa_amm_paatason_suoritus

SELECT 
	 a.opiskeluoikeus_oid
	,a.paatason_suoritus_id
	,a.suorituksen_tyyppi
	,tutkinto_koodi = CASE WHEN LEN(a.koulutusmoduuli_koodiarvo) > 6 THEN NULL ELSE COALESCE(NULLIF(a.koulutusmoduuli_koodiarvo, '999904'), a.tutkinto_koodiarvo) END
	,a.koulutusmoduuli_koodiarvo 
	,a.tutkinto_koodiarvo
	,a.osaamisala_koodiarvo
	,a.toimipiste_oid
	,a.koulutussopimusjaksojen_paivat
	,a.oppisopimusjaksojen_paivat
	,a.suorituskieli_koodiarvo
	,a.vahvistus_paiva
	,a.suorituksen_alkamispaiva
	,a.rnk 
FROM 
(
	SELECT DISTINCT 
		 ps.opiskeluoikeus_oid
		,paatason_suoritus_id
		,suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,koulutussopimusjaksojen_paivat
		,oppisopimusjaksojen_paivat
		,suorituskieli_koodiarvo
		,vahvistus_paiva
		,suorituksen_alkamispaiva = CASE WHEN YEAR(suorituksen_alkamispaiva) < 1900 THEN NULL ELSE suorituksen_alkamispaiva END
		,RANK() OVER (PARTITION BY ps.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
	FROM sa.sa_koski_paatason_suoritus ps		
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'	
	--AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
) a  


CREATE NONCLUSTERED INDEX [NC_amm_paataso] ON Koski_SA.[sa].[sa_amm_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC,
	[suorituksen_tyyppi] ASC,
	[vahvistus_paiva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
