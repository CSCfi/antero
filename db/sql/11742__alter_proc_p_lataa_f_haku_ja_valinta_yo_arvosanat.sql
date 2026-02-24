USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ovara_haku_ja_valinta_yo_arvosanat]    Script Date: 5.2.2026 7.43.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat] AS

DROP INDEX IF EXISTS [NC_f_haku_ja_valinta_yoarvosanat] ON [dw].[f_haku_ja_valinta_yoarvosanat]

TRUNCATE TABLE dw.f_haku_ja_valinta_yoarvosanat

INSERT INTO dw.f_haku_ja_valinta_yoarvosanat

SELECT
	master_oid
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
	,'etl: p_lataa_f_haku_ja_valinta_yo_arvosanat' as source
	,SUSER_SNAME() as username
	,GETDATE() as loadtime
FROM (

	SELECT 
		 master_oid
		,valmistumispaivamaara
		,valmistumisvuosi
		,arvosana_keskiarvo = CAST(AVG(ArvosanaAsteikko) OVER (PARTITION BY master_oid) AS decimal(4,2))
		,aine_koodi = Lisatieto
		,aine_laajuus = Aine
		,arvosana_kirjain = Arvosana
		,arvosana_numero = ArvosanaAsteikko
		,matikka_koodi = MAX(matikka_koodi) OVER (PARTITION BY master_oid)
		--,kielet
		,kielet_lkm =	COUNT(kielet) OVER (PARTITION BY master_oid)
		--,reaali
		,reaali_lkm = COUNT(reaali) OVER (PARTITION BY master_oid)
		,l_lkm = COUNT(l) OVER (PARTITION BY master_oid)
		,el_lkm = COUNT(el) OVER (PARTITION BY master_oid)
		,mel_lkm = COUNT(mel) OVER (PARTITION BY master_oid)
	FROM (

		SELECT
			 master_oid
			,Valmistumispaivamaara = CASE WHEN Valmistumispaivamaara = '1897-05-30' THEN '1987-05-30' ELSE Valmistumispaivamaara END
			,Valmistumisvuosi = CASE WHEN YEAR(Valmistumispaivamaara) = 1897 THEN 1987 ELSE YEAR(Valmistumispaivamaara) END
			,ArvosanaAsteikko = CAST(arvosana_asteikko AS decimal(11,9))
			,Lisatieto
			,aine
			,Arvosana
			,matikka_koodi = CASE WHEN Aine = 'PITKA' AND Lisatieto = 'MA' THEN 2 WHEN Aine = 'LYHYT' AND Lisatieto = 'MA' THEN 1 ELSE 0 END
			,kielet = CASE WHEN Aine NOT IN ('A','B','C','D','SAKSALKOUL','KYPSYYS','TOINENKIELI','VI2') THEN NULL ELSE Lisatieto END
			,reaali = CASE WHEN AINE NOT LIKE '%REAALI' THEN NULL ELSE Lisatieto END
			,l = CASE WHEN Arvosana != 'L' THEN NULL ELSE Arvosana END
			,el = CASE WHEN Arvosana NOT IN ('E','L') THEN NULL ELSE Arvosana END
			,mel = CASE WHEN Arvosana NOT IN ('M','E','L') THEN NULL ELSE Arvosana END
			,rnk_aine_arvosana = RANK() OVER (PARTITION BY master_oid, Lisatieto ORDER BY arvosana_asteikko DESC)
		FROM [ANTERO].[sa].[sa_ovara_yo_arvosanat] f

	) q2

	WHERE rnk_aine_arvosana = 1
	--AND Valmistumisvuosi >= 2010

	GROUP BY master_oid
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

ORDER BY master_oid

CREATE NONCLUSTERED INDEX [NC_f_haku_ja_valinta_yoarvosanat] ON [dw].[f_haku_ja_valinta_yoarvosanat]
(
	[master_oid] ASC
)
INCLUDE ( 	[valmistumispaivamaara]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]