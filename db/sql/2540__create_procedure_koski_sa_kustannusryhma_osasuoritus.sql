USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_osasuoritus]    Script Date: 22.10.2019 20:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_kustannusryhma_osasuoritus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_kustannusryhma_osasuoritus] AS' 
END
GO



ALTER procedure [dbo].[p_lataa_kustannusryhma_osasuoritus] AS

TRUNCATE TABLE dbo.kustannusryhma_osasuoritus

INSERT INTO dbo.kustannusryhma_osasuoritus

SELECT DISTINCT
	 tutkinnonosa_koodi = epe_to.[koodiarvo]
	,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
	,tutkinto_koodi = epe.tutkintokoodi
	,tutkinto_nimi_fi = epe.nimi_fi
	,osaamisala_koodi = oa.osaamisala_koodi
	,osaamisala_nimi_fi = oa.nimi_fi
	,COALESCE(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)
FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = epe.tutkintokoodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma kr1 on kr1.osaamisala_koodi = oa.osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE RIGHT(diaarinumero,4) = (SELECT MAX(RIGHT(diaarinumero,4)) FROM Koski_SA.SA.sa_eperusteet epe2 WHERE epe2.tutkintokoodi = epe.tutkintokoodi)

ORDER BY tutkinnonosa_koodi


GO
USE [ANTERO]