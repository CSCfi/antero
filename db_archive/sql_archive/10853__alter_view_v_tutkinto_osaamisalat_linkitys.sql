USE [ANTERO]
GO

/****** Object:  View [sa].[v_tutkinto_osaamisalat_linkitys]    Script Date: 17.7.2025 18.38.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [sa].[v_tutkinto_osaamisalat_linkitys] AS


SELECT DISTINCT 
		ep.tutkintokoodi as tutkinto_koodi
		,ep.voimassaoloalkaa
		,ep.voimassaololoppuu
		,ep.siirtymapaattyy
	   ,epo.osaamisala_koodi
FROM Koski_SA.sa.sa_eperusteet ep 
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat epo ON epo.eperusteid = ep.eperusteid
WHERE ep.tutkintokoodi is not null and len(ep.tutkintokoodi)=6