USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_osasuoritus]    Script Date: 23.8.2020 19:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_kustannusryhma_osasuoritus] AS

DROP TABLE dbo.kustannusryhma_osasuoritus

SELECT
	tutkinnonosa_koodi
	,kr = min(case when q2.kr_count > 1 then q2.kr_min_ilman1 else q2.kr_min end)

INTO dbo.kustannusryhma_osasuoritus

FROM (
	select 
		 tutkinnonosa_koodi
		,kr_min = min(kustannusryhma_koodi)
		,kr_min_ilman1 = min(case when kustannusryhma_koodi='1' then '5' else kustannusryhma_koodi end)
		,kr_count = count(distinct kustannusryhma_koodi)
	from (

		SELECT DISTINCT
			 tutkinnonosa_koodi = epe_to.[koodiarvo]
			--,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
			--,tutkinto_koodi = epe.tutkintokoodi
			--,tutkinto_nimi_fi = epe.nimi_fi
			--,osaamisala_koodi = oa.osaamisala_koodi
			--,osaamisala_nimi_fi = oa.nimi_fi
			,kustannusryhma_koodi = coalesce(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)

		FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
		LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
		LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
		LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = epe.tutkintokoodi
		LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma kr1 on kr1.osaamisala_koodi = oa.osaamisala_koodi
		LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

		WHERE RIGHT(diaarinumero,4) = (SELECT MAX(RIGHT(diaarinumero,4)) FROM Koski_SA.SA.sa_eperusteet epe2 WHERE epe2.tutkintokoodi = epe.tutkintokoodi)

	) q1
	
	GROUP BY tutkinnonosa_koodi

) q2

GROUP BY tutkinnonosa_koodi

GO
USE ANTERO