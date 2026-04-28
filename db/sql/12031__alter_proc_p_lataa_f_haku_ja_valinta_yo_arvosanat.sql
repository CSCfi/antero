USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat]    Script Date: 27.4.2026 14.32.33 ******/
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
	,coalesce(d_koskiyokokeet_id,-1) as d_koskiyokokeet_id
	,d.id as d_koskiyokokeet_matematiikka_id
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
		,aine_koodi = aine
		,arvosana_kirjain = Arvosana
		,arvosana_numero = ArvosanaAsteikko
		,d_koskiyokokeet_id
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
			,valmistumispaivamaara
			,Valmistumisvuosi = YEAR(Valmistumispaivamaara) 
			,ArvosanaAsteikko = CAST(arviointi_pisteet AS decimal(11,9))
			,koodiarvo as aine
			,arviointi_arvosana_koodiarvo as arvosana
			,matikka_koodi = CASE WHEN f.koodiarvo in ('M','N') THEN f.koodiarvo ELSE NULL END
			,kielet = CASE WHEN d.aineryhma_selite_fi <> 'Kieli' THEN NULL ELSE f.koodiarvo END
			,reaali = CASE WHEN d.aineryhma_selite_fi <> 'Reaali' THEN NULL ELSE f.koodiarvo END
			,l = CASE WHEN arviointi_arvosana_koodiarvo != 'L' THEN NULL ELSE arviointi_arvosana_koodiarvo END
			,el = CASE WHEN arviointi_arvosana_koodiarvo NOT IN ('E','L') THEN NULL ELSE arviointi_arvosana_koodiarvo END
			,mel = CASE WHEN arviointi_arvosana_koodiarvo NOT IN ('M','E','L') THEN NULL ELSE arviointi_arvosana_koodiarvo END
			,rnk_aine_arvosana = RANK() OVER (PARTITION BY master_oid, f.koodiarvo ORDER BY arviointi_pisteet DESC)
			,d.id as d_koskiyokokeet_id
		FROM [Koski_SA].[dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat] f
		LEFT JOIN ANTERO.dw.d_koskiyokokeet d on d.koodi = f.koodiarvo
	) q2
	WHERE rnk_aine_arvosana = 1
	GROUP BY master_oid
		,valmistumispaivamaara
		,valmistumisvuosi
		,ArvosanaAsteikko
		,d_koskiyokokeet_id
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
LEFT JOIN ANTERO.dw.d_koskiyokokeet d on d.koodi = q.matikka_koodi


CREATE NONCLUSTERED INDEX [NC_f_haku_ja_valinta_yoarvosanat] ON [dw].[f_haku_ja_valinta_yoarvosanat]
(
	[master_oid] ASC
)
INCLUDE ( 	[valmistumispaivamaara]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]