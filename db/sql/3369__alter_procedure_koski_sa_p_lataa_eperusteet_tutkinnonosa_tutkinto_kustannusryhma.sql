USE [Koski_SA]
GO


/****** Object:  StoredProcedure [dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma]    Script Date: 15.9.2020 8:38:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma] AS

TRUNCATE TABLE dbo.eperusteet_tutkinnonosa_tutkinto_kustannusryhma

INSERT INTO dbo.eperusteet_tutkinnonosa_tutkinto_kustannusryhma

--uloin select tarvitaan sellaisten tutkinnonosakoodien takia, joihin liittyy monta osaamisalaa ja vain osa löytyy kustannusryhmä taulusta
SELECT 
	tutkinnonosa_koodi
	,tutkinto_koodi
	,osaamisala_koodi = case max(coalesce(osaamisala,0)) when 0 then null else max(coalesce(osaamisala,0)) end
	,kuuluu_useaan_tutkintoon
	,kuuluu_eri_kustannusryhmiin
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma
	,kuuluu_eri_kustannusryhmiin_uusi
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma_uusi
FROM (

	SELECT DISTINCT
		 q.tutkinnonosa_koodi
		,tutkinto_koodi = e2.tutkintokoodi
		,osaamisala = CASE WHEN e2.osaamisala_koodi IN (SELECT osaamisala_koodi FROM ANTERO.sa.sa_amos_osaamisala_kustannusryhma) THEN e2.osaamisala_koodi ELSE 0 END
		,kuuluu_useaan_tutkintoon
		,kuuluu_eri_kustannusryhmiin
		,kuuluu_useaan_tutkintoon_yksi_kustannusryhma = kustannusryhma
		,kuuluu_eri_kustannusryhmiin_uusi
		,kuuluu_useaan_tutkintoon_yksi_kustannusryhma_uusi = kustannusryhma_uusi
	FROM (
	--tutkinnonosat jotka kuuluu useaan tutkintoon
		SELECT 
			tutkinnonosa_koodi = eto.koodiarvo
			,kuuluu_useaan_tutkintoon = case when count(distinct e.tutkintokoodi) > 1 then 1 else 0 end
		FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
		JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid=eto.eperusteid
		group by eto.koodiarvo
	) q

	--haetaan niille tutkinnonosakoodeille tutkintokoodi, jotka eivät kuulu useaan tutkintoon
	left join (
		SELECT distinct
			eto.koodiarvo 
			,e.tutkintokoodi
			,eoa.osaamisala_koodi
		FROM [sa].[sa_eperusteet_tutkinnonosat] eto
		JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid = eto.eperusteid
		LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat eoa on eoa.eperusteid = eto.eperusteid
	) e2 on e2.koodiarvo = q.tutkinnonosa_koodi AND kuuluu_useaan_tutkintoon = 0

	--haetaan niille tutkinnonosakoodeille "kuuluu eri kustannusryhmiin" -tieto, jotka kuuluvat useaan tutkintoon
	left join (
		SELECT 
			tutkinnonosa_koodi
			,kuuluu_eri_kustannusryhmiin = CASE WHEN min(kustannusryhma) != max(kustannusryhma) THEN 1 ELSE 0 END
			,kustannusryhma = CASE WHEN min(kustannusryhma) = max(kustannusryhma) THEN min(kustannusryhma) ELSE NULL END
			,kuuluu_eri_kustannusryhmiin_uusi = CASE WHEN min(kustannusryhma_uusi) != max(kustannusryhma_uusi) THEN 1 ELSE 0 END
			,kustannusryhma_uusi = CASE WHEN min(kustannusryhma_uusi) = max(kustannusryhma_uusi) THEN min(kustannusryhma_uusi) ELSE NULL END
		FROM (

			SELECT DISTINCT
				tutkinnonosa_koodi = eto.koodiarvo
				,tutkinto_koodi = e.tutkintokoodi
				,eoa.osaamisala_koodi
				,kustannusryhma = CASE WHEN okr.kustannusryhma_koodi IS NULL THEN tkr.kustannusryhma_koodi ELSE okr.kustannusryhma_koodi END
				,kustannusryhma_uusi = CASE WHEN okr.kustannusryhma_koodi IS NULL THEN tkr_u.kustannusryhma_koodi ELSE okr.kustannusryhma_koodi END
			FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
			JOIN Koski_SA.sa.sa_eperusteet e ON e.eperusteid = eto.eperusteid
			LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat eoa ON eoa.eperusteid = eto.eperusteid
			LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = e.tutkintokoodi
			LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u ON tkr_u.tutkinto_koodi = e.tutkintokoodi
			LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = eoa.osaamisala_koodi
			WHERE eto.koodiarvo IN (
				SELECT 
					tutkinnonosa_koodi = eto.koodiarvo
				FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
				JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid=eto.eperusteid
				group by eto.koodiarvo
				having count(distinct e.tutkintokoodi) > 1
			)

		) q
		GROUP BY tutkinnonosa_koodi

	) e3 ON e3.tutkinnonosa_koodi = q.tutkinnonosa_koodi AND kuuluu_useaan_tutkintoon = 1

	WHERE tutkintokoodi IS NOT NULL OR osaamisala_koodi IS NOT NULL OR kuuluu_useaan_tutkintoon = 1


) q2
GROUP BY tutkinnonosa_koodi
	,tutkinto_koodi
	,kuuluu_useaan_tutkintoon
	,kuuluu_eri_kustannusryhmiin
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma
	,kuuluu_eri_kustannusryhmiin_uusi
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma_uusi
ORDER BY tutkinnonosa_koodi

GO

USE ANTERO
