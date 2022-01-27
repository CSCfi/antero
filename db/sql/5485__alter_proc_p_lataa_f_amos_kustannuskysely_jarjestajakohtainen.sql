--USE [ANTERO_31102021]
USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 25.1.2022 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)


EXEC sa.p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet
EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet


TRUNCATE TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen


SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_tili
			WHERE summatieto = 0 and koodi != '-1'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')


SET @query = '
INSERT INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

SELECT
	 vuosi
	,d_organisaatioluokitus_id = coalesce(d2.id,-1)
	,d_amos_tili_id = coalesce(d1.id,-1)
	,omistajatyyppi_nimi
	,maara_euroa


FROM (

	SELECT DISTINCT
	
		 [vuosi]
		,[ytunnus]
		,[omistajatyyppi_koodi] = LEFT(omistaja,1)
		,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
		,[tilitunnus]
		,[maara_euroa]
   
	FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] sa
	UNPIVOT (
		[maara_euroa] FOR [tilitunnus]
		IN (' + @cols + ')
	) tilinpaatos

	WHERE maara_euroa != 0

) Q

LEFT JOIN dw.d_amos_kustannuskysely_tili d1 ON d1.koodi = Q.tilitunnus
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus

WHERE d1.Summatieto = 0
'

EXEC sp_executesql @query