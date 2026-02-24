USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat]    Script Date: 5.2.2026 8.05.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat]

GO

CREATE  OR ALTER  PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat] AS

DROP TABLE IF EXISTS ANTERO.[dw].[f_haku_ja_valinta_yo_arvosanat_temp]

SELECT DISTINCT
	s.master_oid, 
	LEFT(s.Arvosana,1) AS Arvosana,
	CASE 
		WHEN s.Arvosana = 'L' THEN 7 
		WHEN s.Arvosana = 'E' THEN 6 
		WHEN s.Arvosana = 'M' THEN 5 
		WHEN s.Arvosana = 'C' THEN 4 
		WHEN s.Arvosana = 'B' THEN 3 
		WHEN s.Arvosana = 'A' THEN 2 
		ELSE 0 
	END as ArvosanaNumero,  
	s.Valmistumispaivamaara, 
	LEFT(s.Myonnetty,10) as ArvosanaMyonnettyPvm,
	d1.id as d_ytl_aine_id,
	d2.id as d_ytl_aine_laajuus_id
INTO [ANTERO].[dw].[f_haku_ja_valinta_yo_arvosanat_temp]
FROM [ANTERO].[sa].[sa_ovara_yo_arvosanat] s
LEFT JOIN ANTERO.dw.d_ytl_aine d1 ON d1.koodi = CASE WHEN s.Lisatieto = 'MA' THEN s.Aine ELSE s.Lisatieto END
LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d2 ON d2.koodi = s.Aine

DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat

SELECT
	f.master_oid,
	f.koulutuksen_alkamisvuosi,
	f.hakutoive,
	f.hakukerta,
	f.hakukohde_oid,
	f.d_koulutusluokitus_id,
	f.d_ika_id,
	f.d_maatjavaltiot2_kansalaisuus_id,
	f.d_sukupuoli_id,
	f.d_organisaatioluokitus_oppilaitos_id,
	f.valittu,
	f.vastaanottanut_paikan,
	ka.keskiarvo as yo_arvosanojen_keskiarvo,
	a.d_ytl_aine_id,
	a.d_ytl_aine_laajuus_id,
	a.Arvosana as yo_aineen_arvosana,
	VH.valittu_haussa,
	VPH.vastaanottanut_paikan_haussa
INTO ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi_yo_arvosanat
FROM [ANTERO].[dw].[f_haku_ja_valinta_kk_ovara_analyysi] f
OUTER APPLY (
	SELECT 
		MIN(hakutoive) as HakutoiveNumero_MAX
	FROM [ANTERO].[dw].[f_haku_ja_valinta_kk_ovara_analyysi] f2
	WHERE f2.master_oid = f.master_oid and f.Hakukerta = f2.Hakukerta and f2.vastaanottanut_paikan = 1
) f2
OUTER APPLY (
	SELECT 
		MAX(valittu) as valittu_haussa
	FROM [ANTERO].[dw].[f_haku_ja_valinta_kk_ovara_analyysi] f2
	WHERE f2.master_oid = f.master_oid and f.Hakukerta = f2.Hakukerta
) VH
OUTER APPLY (
	SELECT 
		MAX(vastaanottanut_paikan) as vastaanottanut_paikan_haussa
	FROM [ANTERO].[dw].[f_haku_ja_valinta_kk_ovara_analyysi] f2
	WHERE f2.master_oid = f.master_oid and f.Hakukerta = f2.Hakukerta
) VPH
CROSS APPLY(
	SELECT 
		master_oid,
		AVG(cast(arvosana as float)) as keskiarvo
	FROM (
		SELECT 
			t.[master_oid],
			t.d_ytl_aine_id,
			t.d_ytl_aine_laajuus_id,
			MAX(t.ArvosanaNumero) as Arvosana
		FROM [ANTERO].[dw].[f_haku_ja_valinta_yo_arvosanat_temp] t
		WHERE YEAR(t.Valmistumispaivamaara) <= f.koulutuksen_alkamisvuosi and YEAR(t.ArvosanaMyonnettyPvm) <= f.koulutuksen_alkamisvuosi and t.master_oid = f.master_oid
		GROUP BY t.master_oid, t.d_ytl_aine_id, t.d_ytl_aine_laajuus_id) arvosana
	GROUP BY arvosana.master_oid
) ka
OUTER APPLY (
	SELECT * FROM (
		SELECT 
			t.master_oid,
			t.d_ytl_aine_id,
			t.d_ytl_aine_laajuus_id,
			MAX(t.ArvosanaNumero) as Arvosana
		FROM [ANTERO].[dw].[f_haku_ja_valinta_yo_arvosanat_temp] t
		WHERE YEAR(t.Valmistumispaivamaara) <= f.koulutuksen_alkamisvuosi and YEAR(t.ArvosanaMyonnettyPvm) <= f.koulutuksen_alkamisvuosi and t.master_oid = f.master_oid
		GROUP BY t.master_oid, t.d_ytl_aine_id, t.d_ytl_aine_laajuus_id) arvosana
) a
WHERE (f.hakutoive <= f2.HakutoiveNumero_MAX or f2.HakutoiveNumero_MAX is null)

DROP TABLE IF EXISTS [ANTERO].[dw].[f_haku_ja_valinta_yo_arvosanat_temp]