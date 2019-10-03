ALTER PROCEDURE [dw].[p_lataa_f_amk_luennoitsijat]
AS
TRUNCATE TABLE dw.f_amk_luennoitsijat;

INSERT INTO dw.f_amk_luennoitsijat (
	[d_amk_id]
	,d_koulutusala_id
	,d_ohjauksenala_id
	,vuosi
	,kansainvalinen
	,luennoitsijoiden_oppitunnit
	,luennoitsijat
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,[vuosi]
	,CASE WHEN [KANSAINVALISYYS_KOODI] = 1 THEN 0 ELSE 1 END
    ,[LUENNNOITSIJOIDEN_OPPITUNNIT_LKM]
    ,[LUENNNOITSIJAT_LKM]
	,getdate()
	,'etl: p_lataa_f_amk_sivutoimiset_opettajat'
	,suser_sname()
FROM [sa].sa_suorat_amk6a_luennoitsijat s1
JOIN [dw].[d_amk] s2 ON s1.AMK_TUNNUS = s2.amk_tunnus
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.KOULUTUSALA_KOODI ='N' OR s1.KOULUTUSALA_KOODI ='NN' THEN -1 ELSE s1.KOULUTUSALA_KOODI END) = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON COALESCE(s1.ohjauksenala,-1) = s4.ohjauksenala_koodi
;
