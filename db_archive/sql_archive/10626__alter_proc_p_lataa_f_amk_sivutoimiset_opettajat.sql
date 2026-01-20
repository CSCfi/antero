USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_sivutoimiset_opettajat]    Script Date: 10.3.2025 8.44.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_amk_sivutoimiset_opettajat]
AS
TRUNCATE TABLE dw.f_amk_sivutoimiset_opettajat;

INSERT INTO dw.f_amk_sivutoimiset_opettajat (
	[d_amk_id]
	,d_koulutusala_id
	,d_ohjauksenala_id
	,vuosi
	,[sivutoimisten_tuntiopettajien_opetustunnit]
	,[ostopalveluna_hankittu_tuntiopetus]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,[vuosi]
    ,SIVUTOIMISTEN_TUNNIT_LKM
    ,OSTOPALVELU_TUNNIT_LKM
	,getdate()
	,'etl: p_lataa_f_amk_sivutoimiset_opettajat'
	,suser_sname()
FROM [sa].sa_suorat_amk6a_sivutoimiset_opettajat s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.AMK_TUNNUS = s2.organisaatio_koodi
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.KOULUTUSALA_KOODI ='N' OR s1.KOULUTUSALA_KOODI ='NN' THEN -1 ELSE s1.KOULUTUSALA_KOODI END) = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON COALESCE(s1.ohjauksenala,-1) = s4.ohjauksenala_koodi
;
GO

USE [ANTERO]