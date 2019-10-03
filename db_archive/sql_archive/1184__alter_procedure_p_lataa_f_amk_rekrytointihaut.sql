ALTER PROCEDURE [dw].[p_lataa_f_amk_rekrytointihaut] AS

TRUNCATE TABLE [dw].[f_amk_rekrytointihaut]

INSERT INTO dw.f_amk_rekrytointihaut
	(
	 [d_korkeakoulu_id] -- avaimen yliopisto+hakunumero 1. osa
	,[vuosi]
	,[hakunumero] -- avaimen yliopisto+hakunumero 2. osa
	,[d_kytkin_haun_kansainvalisyys_id]
	,[d_sukupuoli_id]
	,[d_kytkin_kansalaisuus_suomi_id]
	,[d_rekrytointi_maanosa_id]
	,[hakijat_lkm]
	,[loadtime]
	,[source]
	,[username]
	)


SELECT
	COALESCE(s2.id, - 1) AS [d_korkeakoulu_id]
	,s1.tilastovuosi AS vuosi
	,COALESCE(s1.hakunumero, '- 1') AS [hakunumero]
	,COALESCE(s3.id, - 1) AS [d_kytkin_haun_kansainvalisyys_id]
	,COALESCE(s4.id, - 1) AS [d_sukupuoli_id]
	,COALESCE(s5.id, - 1) AS [d_kytkin_kansalaisuus_suomi_id]
	,COALESCE(s6.id, -1) AS  [d_rekrytointi_maanosa_id]
	,COALESCE(s1.[Hakijoiden määrä], - 1) AS [hakijat_lkm]
	,getdate() AS [loadtime]
	,'etl: p_lataa_f_amk_rekrytointihaut' AS source
	,suser_sname() AS username
FROM [sa].sa_suorat_amk7a_rekrytointihaut s1
LEFT JOIN [dw].d_amk s2 ON s2.amk_tunnus = s1.korkeakoulu
	--LEFT JOIN [dw].d_hakunumerot s3 ON s1.[hakunumero_id] = s3.hakunumero_id
LEFT JOIN [dw].[d_kytkin] s3 ON s3.kytkin_koodi = s1.[haun kansainvälisyys]
LEFT JOIN [dw].[d_sukupuoli] s4 ON s4.sukupuoli_koodi = s1.sukupuoli
LEFT JOIN [dw].[d_kytkin] s5 ON (
		SELECT CASE
				WHEN [kansalaisuus] = '0'
					THEN '1'
				WHEN [kansalaisuus] = '1'
						THEN '0'
				ELSE '-1'
				END AS kansalaisuus_id) =  s5.kytkin_koodi

LEFT  JOIN [dw].[d_rekrytointi_maanosat] s6 ON s6.[rekrytointi_maanosat_koodi] = s1.[ei-suomalaisen hakijan maanosa]
