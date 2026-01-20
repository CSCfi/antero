USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto_esilataus]    Script Date: 4.8.2025 12.26.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto_esilataus] AS

TRUNCATE TABLE [dw].[api_lukio_opiskelijat_vuosi_tutkinto];

INSERT INTO [dw].[api_lukio_opiskelijat_vuosi_tutkinto]

SELECT 
	ROW_NUMBER() OVER(ORDER BY f.vuosi
							  ,REPLACE(f.tavoitetutkinto,';', ',')
							  ,d1.organisaatio_fi) as defaultorder
	,f.vuosi as tilastovuosi
	,REPLACE(f.tavoitetutkinto,';', ',') as tutkinto
	,d1.organisaatio_fi as koulutuksenJarjestaja
	,count(distinct case when f.uusi_opiskelija = 1 then f.master_oid end) as uudetOpiskelijatLkm
	,count(distinct f.master_oid) as opiskelijatLkm
	,d1.organisaatio_koodi as koodiKoulutuksenJarjestaja
	,CASE 
		WHEN tavoitetutkinto = 'Ylioppilastutkinto' then '301101'
		WHEN tavoitetutkinto = 'Ei tavoitetutkintoa' then '-1'
		ELSE COALESCE(d2.koulutusluokitus_koodi, '-1')
	END AS koodiTutkinto
FROM ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_oid = f.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_fi = f.tavoitetutkinto
GROUP BY 
f.vuosi, 
REPLACE(f.tavoitetutkinto,';', ','), 
d1.organisaatio_fi,
d1.organisaatio_koodi,
CASE 
	WHEN tavoitetutkinto = 'Ylioppilastutkinto' then '301101'
	WHEN tavoitetutkinto = 'Ei tavoitetutkintoa' then '-1'
	ELSE COALESCE(d2.koulutusluokitus_koodi, '-1')
END

GO


