USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_toimipisteet]    Script Date: 3.3.2025 9.49.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_amk_toimipisteet]
AS
TRUNCATE TABLE dw.f_amk_toimipisteet;

INSERT INTO dw.f_amk_toimipisteet (
	d_amk_id
	,d_toimipisteen_toimipaikka_id
	,vuosi
	,toimipaikan_henkilokunnan_henkilotyovuodet
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,s3.id
	,s1.[Vuosi]
	,COALESCE(henkilosto_lkm,0)
	,getdate()
	,'etl: p_lataa_f_amk_toimipisteet'
	,suser_sname()
FROM [sa].[sa_suorat_amk4_toimipisteet_fakta] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.korkeakoulu_tunnus = s2.organisaatio_koodi
JOIN [dw].[d_amk_toimipisteen_toimipaikka] s3 ON s1.korkeakoulu_tunnus = s3.koodi_amk
	AND s1.toimipiste_koodi = s3.koodi_toimipiste
	AND s1.toimipaikka_koodi = s3.koodi_toimipaikka
	AND s1.vuosi = s3.vuosi
	
GO

USE [ANTERO]