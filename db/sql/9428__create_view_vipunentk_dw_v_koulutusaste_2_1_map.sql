USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutusaste_2_1_map]    Script Date: 21.12.2023 13:17:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dbo].[v_koulutusaste_2_1_map] AS 
SELECT DISTINCT Koulutusaste_taso2_koodi, [iscle2011_koodi] from [dbo].[d_koulutusluokitus]
where Koulutusaste_taso2_koodi != '91'

UNION ALL

SELECT '50', '5'

UNION ALL

SELECT '91', '9'



GO


