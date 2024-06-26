USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_15] AS 

--huom. kala_t2 nimivastineet noudettu dimensiosta, koska ovat aineistossa englanniksi. JS 24.6.2024

SELECT
	[tilv]
	,[ikar8]
	,[jarj]
	,[jarjnim]
	,[tutktyyp]
	,[koulk] = nullif([koulk], 'NULL')
	,[alvv]
	,[rahoitus]
	,[pohjakoulutus]
	,[kaste_t2_e]
	,[kaste_t2ni_e] = coalesce(nullif([kaste_t2ni_e], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e]
	,[kala_t2ni_e] = d.iscfinarrow2013
	,[pohjakoulutus_ulkom]
	,[kaste_t2_e_ulkom]
	,[kaste_t2ni_e_ulkom] = coalesce(nullif([kaste_t2ni_e_ulkom], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e_ulkom]
	,[kala_t2ni_e_ulkom] = db.iscfinarrow2013
	,[opiskelijavuodet]
FROM [TK_H9098_CSC].[dbo].[TK_K1_15_sopv_24] t
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d ON d.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e]
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus db ON db.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e_ulkom]

--UNION ALL

GO
