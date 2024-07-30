USE [ANTERO]
GO

/****** Object:  View [dw].[v_esco_oef_ammatit_ja_osaamiset]    Script Date: 30.7.2024 11:37:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW  [dw].[v_esco_oef_ammatit_ja_osaamiset] as

SELECT DISTINCT
	SUBSTRING(d.oef_ammatti, CHARINDEX(' ', d.oef_ammatti) +1, DATALENGTH(d.oef_ammatti) - CHARINDEX(' ', d.oef_ammatti) +1 ) as 'Ammatti (OEF)', 
	SUBSTRING(d.oef_ammatti_SV, CHARINDEX(' ', d.oef_ammatti_SV) +1, DATALENGTH(d.oef_ammatti_SV) - CHARINDEX(' ', d.oef_ammatti_SV) +1 ) as 'Yrke (OEF)',
	SUBSTRING(d.oef_ammatti_EN, CHARINDEX(' ', d.oef_ammatti_EN) +1, DATALENGTH(d.oef_ammatti_EN) - CHARINDEX(' ', d.oef_ammatti_EN) +1 ) as 'Profession (OEF)',
	d.oef_ammatti_koodi as 'Koodit Ammatti (OEF)',
	la.oef_osaaminen as 'Osaaminen (OEF)',
	oo.oef_osaaminen_SV as 'Kompetens (OEF)',
	oo.oef_osaaminen_EN as 'Competence (OEF)',
	la.oef_osaaminen_koodi as 'Koodit Osaaminen (OEF)',
	d1.ammatti_taso1_fi as 'Ammatti (ESCO)',
	d1.ammatti_taso1_sv as 'Yrke (ESCO)',
	d1.ammatti_taso1_en as 'Profession (ESCO)',
	d1.koodit_ammatti_taso1 as 'Koodit Ammatti (ESCO)',
	d2.osaaminen_taso1_fi as 'Osaaminen, taso 1 (ESCO)',
	d2.osaaminen_taso1_sv as 'Kompetens, nivå 1 (ESCO)',
	d2.osaaminen_taso1_en as 'Competence, level 1 (ESCO)',
	d2.koodit_osaaminen_taso1 as 'Koodit Osaaminen, taso 1 (ESCO)',
	d2.osaaminen_taso2_fi as 'Osaaminen, taso 2 (ESCO)',
	d2.osaaminen_taso2_sv as 'Kompetens, nivå 2 (ESCO)',
	d2.osaaminen_taso2_en as 'Competence, level 2 (ESCO)',
	d2.koodit_osaaminen_taso2 as 'Koodit Osaaminen, taso 2 (ESCO)',
	COALESCE(d2.osaaminen_taso3_fi, d2.osaaminen_taso2_fi) as 'Osaaminen, taso 3 (ESCO)',
	COALESCE(d2.osaaminen_taso3_sv, d2.osaaminen_taso2_sv) as 'Kompetens, nivå 3 (ESCO)',
	COALESCE(d2.osaaminen_taso3_en, d2.osaaminen_taso2_en) as 'Competence, level 3 (ESCO)',
	COALESCE(d2.koodit_osaaminen_taso3, d2.koodit_osaaminen_taso2) as 'Koodit Osaaminen, taso 3 (ESCO)',
	COALESCE(d2.osaaminen_taso4_fi, d2.osaaminen_taso3_fi, d2.osaaminen_taso2_fi) as 'Osaaminen, taso 4 (ESCO)',
	COALESCE(d2.osaaminen_taso4_sv, d2.osaaminen_taso3_sv, d2.osaaminen_taso2_sv) as 'Kompetens, nivå 4 (ESCO)',
	COALESCE(d2.osaaminen_taso4_en, d2.osaaminen_taso3_en, d2.osaaminen_taso2_en) as 'Competence, level 4 (ESCO)',
	COALESCE(d2.koodit_osaaminen_taso4, d2.koodit_osaaminen_taso3, d2.koodit_osaaminen_taso2) as 'Koodit Osaaminen, taso 4 (ESCO)',
	d2.ryhma_fi as 'Osaamisryhmä (ESCO)',
	d2.ryhma_sv as 'Kompetensgrupp (ESCO)',
	d2.ryhma_en as 'Competence group (ESCO)',
	CASE WHEN ela.essential = 1 THEN 'Välttämätön' ELSE 'Valinnainen' END as 'Osaamisen tyyppi (ESCO)',
	CASE WHEN ela.essential = 1 THEN 'Grundläggande' ELSE 'Frivillig' END as 'Typ av kompetens (ESCO)',
	CASE WHEN ela.essential = 1 THEN 'Essential' ELSE 'Optional' END as 'Type of competence (ESCO)'
FROM [VipunenTK_lisatiedot].[dbo].[oef_osaamis_ammatti_luokitusavain] la
LEFT JOIN VipunenTK.dbo.d_oef_ammatti d on CASE WHEN LEN(d.oef_ammatti_koodi) = 7 THEN CONCAT(LEFT(d.oef_ammatti_koodi,6),'0',RIGHT(d.oef_ammatti_koodi,1)) ELSE d.oef_ammatti_koodi END = la.oef_ammatti_koodi
LEFT JOIN ANTERO.[sa].[sa_oef_esco_ammattiavain] aa on aa.koodi_oef = la.oef_ammatti_koodi
LEFT JOIN ANTERO.dw.d_esco_ammatti d1 on d1.koodit_ammatti_taso1 = aa.koodi_esco
LEFT JOIN ANTERO.sa.sa_esco_luokitusavain ela on ela.koodi_ammatti = d1.koodit_ammatti
LEFT JOIN ANTERO.dw.d_esco_osaaminen d2 on d2.koodit_osaaminen = ela.koodi_osaaminen
LEFT JOIN [VipunenTK_lisatiedot].[dbo].[oef_osaaminen] oo on oo.oef_osaaminen_koodi = la.oef_osaaminen_koodi
WHERE ela.id is not null and d2.id is not null

GO


