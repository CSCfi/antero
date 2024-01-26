USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ytl_arvosanat]    Script Date: 27.9.2023 8:10:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
		FROM sa.sa_ytl_FT4001

		UNION ALL

		SELECT 
				id,tutkintokerta,koulun_nro,koulun_nimi,tyyppi,opetuskieli,sukup,YH,EA,BA,BB,FY,BI,FA,HI,FF,O5,QC,PC,PA,A5,TE,TC,A,VA,VC,PS,I,CB,CA,M,O,N,Q,SC,GE,GC,EC,W,L1,ET,IC,Z,KE,L7,DC,UO,FC,UE,SA
		FROM sa.sa_ytl_FT3001
		WHERE tutkintokerta = '2016K'

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


GO

USE [ANTERO]