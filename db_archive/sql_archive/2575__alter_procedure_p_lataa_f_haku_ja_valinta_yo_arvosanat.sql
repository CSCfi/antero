USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat]    Script Date: 25.10.2019 14:54:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat] AS

TRUNCATE TABLE dw.f_haku_ja_valinta_yoarvosanat

INSERT INTO dw.f_haku_ja_valinta_yoarvosanat


SELECT
	henkiloOID
	,valmistumispaivamaara
	,valmistumisvuosi
	,d_ytl_aine_id = COALESCE(d1.id,-1)
	,d_ytl_aine_laajuus_id = COALESCE(d2.id,-1)
	,d_ytl_aine_matikka_id = COALESCE(d3.id,-1)
	,kielet_lkm
	,reaali_lkm
	,l_lkm
	,el_lkm
	,mel_lkm
	,arvosana_kirjain
	,arvosana_numero
	,arvosana_keskiarvo

FROM (

	SELECT 
		 henkiloOID = HenkiloOID
		,valmistumispaivamaara
		,valmistumisvuosi
		,arvosana_keskiarvo = CAST(AVG(ArvosanaAsteikko) OVER (PARTITION BY HenkiloOID) AS decimal(4,2))
		,aine_koodi = Lisatieto
		,aine_laajuus = Aine
		,arvosana_kirjain = Arvosana
		,arvosana_numero = ArvosanaAsteikko
		,matikka_koodi = MAX(matikka_koodi) OVER (PARTITION BY HenkiloOID)
		--,kielet
		,kielet_lkm =	COUNT(kielet) OVER (PARTITION BY HenkiloOID)
		--,reaali
		,reaali_lkm = COUNT(reaali) OVER (PARTITION BY HenkiloOID)
		,l_lkm = COUNT(l) OVER (PARTITION BY HenkiloOID)
		,el_lkm = COUNT(el) OVER (PARTITION BY HenkiloOID)
		,mel_lkm = COUNT(mel) OVER (PARTITION BY HenkiloOID)
	FROM (

		SELECT
			 HenkiloOID
			,Valmistumispaivamaara = CASE WHEN Valmistumispaivamaara = '1897-05-30' THEN '1987-05-30' ELSE Valmistumispaivamaara END
			,Valmistumisvuosi = CASE WHEN YEAR(Valmistumispaivamaara) = 1897 THEN 1987 ELSE YEAR(Valmistumispaivamaara) END
			,ArvosanaAsteikko = CAST(ArvosanaAsteikko AS decimal(11,9))
			,Lisatieto
			,aine
			,Arvosana
			,matikka_koodi = CASE WHEN Aine = 'PITKA' AND Lisatieto = 'MA' THEN 2 WHEN Aine = 'LYHYT' AND Lisatieto = 'MA' THEN 1 ELSE 0 END
			,kielet = CASE WHEN Aine NOT IN ('A','B','C','D','SAKSALKOUL','KYPSYYS','TOINENKIELI','VI2') THEN NULL ELSE Lisatieto END
			,reaali = CASE WHEN AINE NOT LIKE '%REAALI' THEN NULL ELSE Lisatieto END
			,l = CASE WHEN Arvosana != 'L' THEN NULL ELSE Arvosana END
			,el = CASE WHEN Arvosana NOT IN ('E','L') THEN NULL ELSE Arvosana END
			,mel = CASE WHEN Arvosana NOT IN ('M','E','L') THEN NULL ELSE Arvosana END
			,rnk_aine_arvosana = RANK() OVER (PARTITION BY HenkiloOID, Lisatieto ORDER BY ArvosanaAsteikko DESC)
		FROM [ANTERO].[sa].[sa_odw_yoarvosanat] f
		WHERE Tila = 'VALMIS'
	
	) q2

	WHERE rnk_aine_arvosana = 1
	--AND Valmistumisvuosi >= 2010

	GROUP BY  HenkiloOID
		,valmistumispaivamaara
		,valmistumisvuosi
		,ArvosanaAsteikko
		,Lisatieto
		,aine
		,Arvosana
		,ArvosanaAsteikko
		,matikka_koodi
		,kielet
		,reaali
		,l
		,el
		,mel

) q

LEFT JOIN ANTERO.dw.d_ytl_aine d1 ON d1.koodi = q.aine_koodi
LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d2 ON d2.koodi = q.aine_laajuus
LEFT JOIN ANTERO.dw.d_ytl_aine d3 ON d3.koodi = (CASE matikka_koodi WHEN 2 THEN 'PITKA' WHEN 1 THEN 'LYHYT' ELSE 'EI_MATIKKA' END)

ORDER BY HenkiloOID



