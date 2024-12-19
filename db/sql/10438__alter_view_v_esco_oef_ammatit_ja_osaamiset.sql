USE [ANTERO]
GO

/****** Object:  View [dw].[v_esco_oef_ammatit_ja_osaamiset]    Script Date: 19.12.2024 15.28.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER   VIEW  [dw].[v_esco_oef_ammatit_ja_osaamiset] as

SELECT DISTINCT
	d.ammattiala_taso3_fi as 'Ammatti (OEF)', 
	d.ammattiala_taso3_sv as 'Yrke (OEF)',
	d.ammattiala_taso3_en as 'Profession (OEF)',
	d.ammattiala_taso3_koodi as 'Koodit Ammatti (OEF)',
	oo.osaaminen_fi as 'Osaaminen (OEF)',
	oo.osaaminen_sv as 'Kompetens (OEF)',
	oo.osaaminen_en as 'Competence (OEF)',
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
LEFT JOIN ANTERO.dw.d_oef_ammattiala d on d.koodi = la.oef_ammatti_koodi
LEFT JOIN ANTERO.[sa].[sa_oef_esco_ammattiavain] aa on aa.koodi_oef = la.oef_ammatti_koodi
LEFT JOIN ANTERO.dw.d_esco_ammatti d1 on d1.koodit_ammatti_taso1 = aa.koodi_esco
LEFT JOIN ANTERO.sa.sa_esco_luokitusavain ela on ela.koodi_ammatti = d1.koodit_ammatti
LEFT JOIN ANTERO.dw.d_esco_osaaminen d2 on d2.koodit_osaaminen = ela.koodi_osaaminen
LEFT JOIN [ANTERO].[dw].[d_oef_osaaminen] oo on oo.koodi = la.oef_osaaminen_koodi
WHERE ela.id is not null and d2.id is not null

GO


