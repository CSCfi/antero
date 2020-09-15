USE [Koski_SA]
GO


/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_osasuoritus]    Script Date: 15.9.2020 10:37:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_kustannusryhma_osasuoritus] AS

DROP TABLE dbo.kustannusryhma_osasuoritus

SELECT DISTINCT
	 tutkinnonosa_koodi = epe_to.[koodiarvo]
	,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
	,tutkinto_koodi = epe.tutkintokoodi
	,tutkinto_nimi_fi = epe.nimi_fi
	,osaamisala_koodi = oa.osaamisala_koodi
	,osaamisala_nimi_fi = oa.nimi_fi
	,kustannusryhma_koodi = coalesce(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)
	,kustannusryhma_koodi_uusi = coalesce(kr1.kustannusryhma_koodi, kr_u.kustannusryhma_koodi, kr2.kustannusryhma_koodi)

INTO dbo.kustannusryhma_osasuoritus
FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = epe.tutkintokoodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma kr1 on kr1.osaamisala_koodi = oa.osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi kr_u ON kr_u.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE RIGHT(diaarinumero,4) = (SELECT MAX(RIGHT(diaarinumero,4)) FROM Koski_SA.SA.sa_eperusteet epe2 WHERE epe2.tutkintokoodi = epe.tutkintokoodi)

ORDER BY tutkinnonosa_koodi




GO


