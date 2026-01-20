USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_opinnaytetyot]    Script Date: 10.3.2025 9.05.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


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
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.Ammattikorkeakoulu = s2.organisaatio_koodi
LEFT JOIN [dw].d_koulutusala_2002 s3 ON s1.Koulutusala = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.ohjauksenala = s4.ohjauksenala_koodi
LEFT JOIN [dw].d_amk_koulutustyyppi s5 ON s1.Koulutustyyppi = s5.koodi

UNION ALL

SELECT COALESCE(v2.id, -1)
	,-1
	,COALESCE(v4.id,-1)
	,COALESCE(v5.id,-1)
	,[vuosi]
	,COALESCE([hankeistettuja], 0)
	,COALESCE([eihankeistettuja],0)
	,getdate()
	,'etl: p_lataa_f_amk_opinnaytetyot'
	,suser_sname()
FROM [sa].[sa_virta_otp_opinnaytetyot] v1
JOIN  [dw].[d_organisaatioluokitus] v2 ON v1.organisaatio = v2.organisaatio_koodi
LEFT JOIN [dw].d_ohjauksenala v4 ON v1.ohjausala = v4.ohjauksenala_koodi
LEFT JOIN [dw].d_amk_koulutustyyppi v5 ON v1.koulutustyyppi = v5.koodi
;

GO


USE [ANTERO]