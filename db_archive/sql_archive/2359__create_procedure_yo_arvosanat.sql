USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat]    Script Date: 15.8.2019 20:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_yo_arvosanat] AS

TRUNCATE TABLE dw.f_haku_ja_valinta_yoarvosanat

INSERT INTO dw.f_haku_ja_valinta_yoarvosanat


SELECT
	henkiloOID
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
			,Valmistumisvuosi = YEAR(Valmistumispaivamaara)
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

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_ytl_arvosanat]    Script Date: 15.8.2019 20:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_ytl_arvosanat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_ytl_arvosanat] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_ytl_arvosanat] AS


TRUNCATE TABLE [ANTERO].[dw].[f_ytl_arvosanat]

INSERT INTO [ANTERO].[dw].[f_ytl_arvosanat]

SELECT 
	 opiskelijaID
	,vuosi
	,d_kausi_id = COALESCE(d1.id, -1)
	,d_organisaatioluokitus_id = COALESCE(d2a.id, d2b.id, -1)
	,d_sukupuoli_id = COALESCE(d3.id, -1)
	,d_ytl_aine_id = COALESCE(d4.id, -1)
	,d_ytl_aine_laajuus_id = COALESCE(d5.id, -1)
	,arvosana_kirjain
	,arvosana_numero
FROM (

	SELECT 
		opiskelijaID = id
		,vuosi = left(tutkintokerta,4)
		,kausi_koodi = right(tutkintokerta,1)
		,oppilaitos_koodi = koulun_nro
		,oppilaitos_nimi = koulun_nimi
		,sukupuoli_koodi = sukup
		,aine_koodi = 
			case koe
				when 'A' then 'FI'
				when 'A5' then 'FI'
				when 'BA' then 'RU'
				when 'BB' then 'RU'
				when 'CA' then 'FI'
				when 'CB' then 'FI'
				when 'DC' then 'ZA'
				when 'EA' then 'EN'
				when 'EC' then 'EN'
				when 'FA' then 'RA'
				when 'FC' then 'RA'
				when 'GC' then 'PG'
				when 'I' then 'IS'
				when 'IC' then 'IS'
				when 'L1' then 'LA'
				when 'L7' then 'LA'
				when 'M' then 'MA'
				when 'N' then 'MA'
				when 'O' then 'RU'
				when 'O5' then 'RU'
				when 'PA' then 'ES'
				when 'PC' then 'ES'
				when 'QC' then 'QC'
				when 'SA' then 'SA'
				when 'SC' then 'SA'
				when 'TC' then 'IT'
				when 'VA' then 'VE'
				when 'VC' then 'VE'
				when 'W' then 'QC'
				when 'Z' then 'ZA'
				else koe 
			end
		,aine_laajuus_koodi = 
			case koe
				when 'A' then 'AI'
				when 'A5' then 'TOINENKIELI'
				when 'BA' then 'A'
				when 'BB' then 'B'
				when 'CA' then 'A'
				when 'CB' then 'B'
				when 'DC' then 'C'
				when 'EA' then 'A'
				when 'EC' then 'C'
				when 'FA' then 'A'
				when 'FC' then 'C'
				when 'GC' then 'C'
				when 'I' then 'AI'
				when 'IC' then 'C'
				when 'L1' then 'D'
				when 'L7' then 'C'
				when 'M' then 'PITKA'
				when 'N' then 'LYHYT'
				when 'O' then 'AI'
				when 'O5' then 'TOINENKIELI'
				when 'PA' then 'A'
				when 'PC' then 'C'
				when 'QC' then 'C'
				when 'SA' then 'A'
				when 'SC' then 'C'
				when 'TC' then 'C'
				when 'VA' then 'A'
				when 'VC' then 'C'
				when 'W' then 'AI'
				when 'Z' then 'AI' 
			end
		,arvosana_kirjain =
			case arvosana
				when '0' then 'I'
				when '2' then 'A'
				when '3' then 'B'
				when '4' then 'C'
				when '5' then 'M'
				when '6' then 'E'
				when '7' then 'L' 
			end
		,arvosana_numero = arvosana + 3
	FROM (

		SELECT 
			id,tutkintokerta,koulun_nro,koulun_nimi,tyyppi,opetuskieli,sukup,YH,EA,BA,BB,FY,BI,FA,HI,FF,O5,QC,PC,PA,A5,TE,TC,A,VA,VC,PS,I,CB,CA,M,O,N,Q,SC,GE,GC,EC,W,L1,ET,IC,Z,KE,L7,DC,UO,FC,UE,SA
		FROM sa.sa_ytl_FT3001

	) p

	UNPIVOT (
		arvosana FOR koe IN (YH,EA,BA,BB,FY,BI,FA,HI,FF,O5,QC,PC,PA,A5,TE,TC,A,VA,VC,PS,I,CB,CA,M,O,N,Q,SC,GE,GC,EC,W,L1,ET,IC,Z,KE,L7,DC,UO,FC,UE,SA)
	) AS unpvt

	WHERE arvosana <> ''

) q

LEFT JOIN dw.d_kausi d1 ON d1.koodi = q.kausi_koodi
--koulun nimi ja koodi ei välttämättä täysin vastaa organisaatiopalvelun tietoja, joten pientä kikkailua:
LEFT JOIN dw.d_organisaatioluokitus d2a on d2a.organisaatio_fi = q.oppilaitos_nimi
LEFT JOIN dw.d_organisaatioluokitus d2b on right(d2b.organisaatio_koodi,3) = right(q.oppilaitos_koodi,3) and left(d2b.organisaatio_fi,5) = left(q.oppilaitos_nimi,5)
LEFT JOIN dw.d_sukupuoli d3 ON d3.sukupuoli_koodi = q.sukupuoli_koodi
LEFT JOIN dw.d_ytl_aine d4 ON d4.koodi = q.aine_koodi
LEFT JOIN dw.d_ytl_aine_laajuus d5 ON d5.koodi = q.aine_laajuus_koodi

WHERE q.vuosi >= 2016

