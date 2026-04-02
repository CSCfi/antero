USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_koonti_kaikki_vuodet_apiin] AS

/*
HUOM. 
- suppea_sisalto_1_0 oltava liputettuna rivitason raportoinnissa
- tiedon "huomioidaan_rahoituksessa_kylla_ei" päättely päivitettävä API-lataukseen, jos oletussuodatuksiin tulisi muutoksia
*/

SELECT * 
FROM [ANTERO].[dw].[v_amos_koonti_2027] 
WHERE 1=1 
AND suppea_sisalto_1_0 = 1

UNION ALL

SELECT * 
FROM [ANTERO].[dw].[v_amos_koonti_2026]
WHERE 1=1 
AND suppea_sisalto_1_0 = 1

GO
