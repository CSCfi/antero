USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amm_paatason_suoritus]    Script Date: 20.12.2021 12:39:03 ******/
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
	,tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
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
		,suorituskieli_koodiarvo = case when suorituskieli_koodiarvo in ('FI','SE','SV','EN','RU','RI','VK') then suorituskieli_koodiarvo else 'XX' end	
		,vahvistus_paiva
		,suorituksen_alkamispaiva = CASE WHEN YEAR(suorituksen_alkamispaiva) < 1900 THEN NULL ELSE suorituksen_alkamispaiva END
		,ROW_NUMBER() OVER (PARTITION BY ps.opiskeluoikeus_oid ORDER BY ca.suorituksen_tyyppi_jarj,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
	FROM sa.sa_koski_paatason_suoritus ps		
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	CROSS APPLY (
		SELECT
			suorituksen_tyyppi_jarj = 
				case ps.suorituksen_tyyppi
					when 'ammatillinentutkinto' then 1
					when 'ammatillinentutkintoosittainen' then 2
					when 'muuammatillinenkoulutus' then 3
					when 'telma' then 4
					when 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 5
					when 'valma' then 6
					when 'nayttotutkintoonvalmistavakoulutus' then 10
					else 9
				end
	) ca
	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'	
	--AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
) a  
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = (CASE WHEN LEN(a.koulutusmoduuli_koodiarvo) > 6 THEN NULL ELSE COALESCE(NULLIF(a.koulutusmoduuli_koodiarvo, '999904'), a.tutkinto_koodiarvo) END)



CREATE NONCLUSTERED INDEX [NC_amm_paataso] ON [sa].[sa_amm_paatason_suoritus]
(
	[opiskeluoikeus_oid] ASC,
	[suorituksen_tyyppi] ASC,
	[vahvistus_paiva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
