USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_tilanne]    Script Date: 28.3.2025 7.46.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_ohjauksen_alat] AS

SELECT 
	d1.Vuosi as Vuosi,
	d2.organisaatio_fi as Korkeakoulu,
	d1.korkeakoulu_koodi as 'Korkeakoulu koodi',
	d3.alayksikko_nimi as 'Alayksikkö',
	d3.alayksikko_koodi as 'Alayksikkö koodi',
	d4.ohjauksenala_nimi_fi as 'Ohjauksen ala',
	cast(d1.jyvitys as decimal)/100 as apusarake_jyvitys
FROM [ANTERO].[dw].[d_organisaatiot_ohjauksen_alat] d1
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi=d1.korkeakoulu_koodi
LEFT JOIN ANTERO.dw.d_organisaation_alayksikot d3 on d3.alayksikko_koodi=d1.alayksikko_koodi and d3.vuosi = d1.Vuosi and d3.korkeakoulu_koodi = d1.korkeakoulu_koodi
LEFT JOIN ANTERO.dw.d_ohjauksenala d4 on d4.ohjauksenala_koodi=d1.ohjauksen_ala_koodi
where jyvitys != '-1'

GO 

USE [ANTERO]