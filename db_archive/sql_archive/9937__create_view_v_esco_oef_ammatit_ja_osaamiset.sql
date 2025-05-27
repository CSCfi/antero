USE [ANTERO]
GO

/****** Object:  View [dw].[v_esco_oef_ammatit_ja_osaamiset]    Script Date: 11.6.2024 12:32:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW  [dw].[v_esco_oef_ammatit_ja_osaamiset] as

SELECT DISTINCT
	SUBSTRING(d.oef_ammatti, CHARINDEX(' ', d.oef_ammatti) +1, DATALENGTH(d.oef_ammatti) - CHARINDEX(' ', d.oef_ammatti) +1 ) as 'Ammatti (OEF)', 
	d.oef_ammatti_koodi as 'Koodit Ammatti (OEF)',
	la.oef_osaaminen as 'Osaaminen (OEF)',
	la.oef_osaaminen_koodi as 'Koodit Osaaminen (OEF)',
	d1.ammatti_taso1_fi as 'Ammatti (ESCO)',
	d1.koodit_ammatti_taso1 as 'Koodit Ammatti (ESCO)',
	d2.osaaminen_taso1_fi as 'Osaaminen, taso 1 (ESCO)',
	d2.osaaminen_taso2_fi as 'Osaaminen, taso 2 (ESCO)',
	COALESCE(d2.osaaminen_taso3_fi, d2.osaaminen_taso2_fi) as 'Osaaminen, taso 3 (ESCO)',
	COALESCE(d2.osaaminen_taso4_fi, d2.osaaminen_taso3_fi, d2.osaaminen_taso2_fi) as 'Osaaminen, taso 4 (ESCO)',
	d2.ryhma_fi as 'Osaamisryhmä (ESCO)',
	CASE WHEN ela.essential = 1 THEN 'Välttämätön' ELSE 'Valinnainen' END as 'Osaamisen tyyppi (ESCO)'
FROM [VipunenTK_lisatiedot].[dbo].[oef_osaamis_ammatti_luokitusavain] la
LEFT JOIN VipunenTK.dbo.d_oef_ammatti d on CASE WHEN LEN(d.oef_ammatti_koodi) = 7 THEN CONCAT(LEFT(d.oef_ammatti_koodi,6),'0',RIGHT(d.oef_ammatti_koodi,1)) ELSE d.oef_ammatti_koodi END = la.oef_ammatti_koodi
LEFT JOIN ANTERO.[sa].[sa_oef_esco_ammattiavain] aa on aa.koodi_oef = la.oef_ammatti_koodi
LEFT JOIN ANTERO.dw.d_esco_ammatti d1 on d1.koodit_ammatti_taso1 = aa.koodi_esco
LEFT JOIN ANTERO.sa.sa_esco_luokitusavain ela on ela.koodi_ammatti = d1.koodit_ammatti
LEFT JOIN ANTERO.dw.d_esco_osaaminen d2 on d2.koodit_osaaminen = ela.koodi_osaaminen
WHERE ela.id is not null and d2.id is not null

GO

USE [ANTERO]