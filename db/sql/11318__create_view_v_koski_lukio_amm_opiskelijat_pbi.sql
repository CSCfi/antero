USE [ANTERO]

GO

CREATE OR ALTER VIEW dw.v_koski_lukio_amm_opiskelijat_pbi as

SELECT 
	* 
FROM ANTERO.dw.f_koski_lukio_amm_opiskelijat_pbi