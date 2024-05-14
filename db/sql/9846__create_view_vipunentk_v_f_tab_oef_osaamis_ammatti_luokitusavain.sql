USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_toimialaennuste]    Script Date: 14.5.2024 10:55:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_oef_osaamis_ammatti_luokitusavain] AS

SELECT DISTINCT
	d.oef_ammattiryhma1 as 'Ammattiala, taso 1',
	d.oef_ammattiryhma2 as 'Ammattiala, taso 2',
	d.oef_ammatti as 'OEF-ammatti',
	d.oef_ammattiryhma1_koodi  as 'Koodit Ammattiala, taso 1',
	d.oef_ammattiryhma2_koodi as 'Koodit Ammattiala, taso 2',
	d.oef_ammatti_koodi 'Koodit OEF-ammatti',
    [oef_osaaminen_koodi] as 'Koodit OEF-osaaminen, taso 2',
    [oef_osaaminen] as 'OEF-osaaminen, taso 2'
FROM [VipunenTK_lisatiedot].[dbo].[oef_osaamis_ammatti_luokitusavain] t
LEFT JOIN VipunenTK.dbo.d_oef_ammatti d on d.oef_ammatti_koodi = CONCAT(LEFT(t.oef_ammatti_koodi, 6), RIGHT(t.oef_ammatti_koodi, 1))


GO

USE [ANTERO]