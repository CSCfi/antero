USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_osasuoritus]    Script Date: 7.7.2022 13:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_kustannusryhma_osasuoritus] AS

TRUNCATE TABLE dbo.kustannusryhma_osasuoritus

INSERT INTO dbo.kustannusryhma_osasuoritus

SELECT DISTINCT
	epe.voimassaoloalkaa
	,voimassaololoppuu = coalesce(epe.voimassaololoppuu,'9999-12-31')
	,siirtymapaattyy
	,tutkinnonosa_koodi = epe_to.[koodiarvo]
	,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
	,tutkinto_koodi = epe.tutkintokoodi
	,tutkinto_nimi_fi = epe.nimi_fi
	,osaamisala_koodi = oa.osaamisala_koodi
	,osaamisala_nimi_fi = oa.nimi_fi



FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid

ORDER BY tutkinnonosa_koodi

GO
USE ANTERO