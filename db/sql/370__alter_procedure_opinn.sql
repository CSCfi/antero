ALTER PROCEDURE [dw].[p_lataa_f_amk_opinnaytetyot]
AS
TRUNCATE TABLE dw.f_amk_opinnaytetyot;

INSERT INTO dw.f_amk_opinnaytetyot (
	[d_amk_id]
	,[d_koulutusala_id]
	,[d_ohjauksen_ala_id]
	,[d_koulutustyyppi_id]
	,[vuosi]
	,[hankkeistetut_opinnaytetyot]
	,[opinnaytetyot_ei_hankkeistetut]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT COALESCE(s2.id, -1)
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,[Vuosi]
	,COALESCE([Hankkeistetut opinnaytetyot], 0)
	,COALESCE([Opinnaytetyot (ei hankkeistetut)],0)
	,getdate()
	,'etl: p_lataa_f_amk_opinnaytetyot'
	,suser_sname()
FROM [sa].[sa_suorat_amk9_opinnaytetyot] s1
JOIN [dw].[d_amk] s2 ON s1.Ammattikorkeakoulu = s2.amk_tunnus
LEFT JOIN [dw].d_koulutusala_2002 s3 ON s1.Koulutusala = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.ohjauksenala = s4.ohjauksenala_koodi
LEFT JOIN [dw].d_amk_koulutustyyppi s5 ON s1.Koulutustyyppi = s5.koodi
;