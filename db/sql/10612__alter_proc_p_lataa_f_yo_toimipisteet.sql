USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_toimipisteet]    Script Date: 3.3.2025 9.51.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_yo_toimipisteet]
AS
TRUNCATE TABLE dw.f_yo_toimipisteet;

INSERT INTO dw.f_yo_toimipisteet (
	[d_yliopisto_id]
	,[d_toimipiste_id]
	,[d_toimipaikka_id]
	,[vuosi]
	,[toimipaikan_henkilokunnan_henkilotyovuodet]
	,[tutkimusaseman_henkilokunnan_maksimimäärä]
	,[tutkimusaseman_henkilokunnan_minimäärä]
	,[tutkimusaseman_yopymisvuorokaudet]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,s3.id
	,s4.id
	,s1.[Vuosi]
	,COALESCE(toimipaikan_htv_lkm,0)
	,COALESCE(tutkaseman_henk_max_maara,0)
	,COALESCE(tutkaseman_henk_min_maara,0)
	,COALESCE(tutkaseman_yopymisvuorokaudet_lkm,0)
	,getdate()
	,'etl: p_lataa_f_yo_toimipisteet'
	,suser_sname()
FROM [sa].[sa_suorat_yo4_toimipisteet_fakta] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.yliopisto_tunnus = s2.organisaatio_koodi
JOIN [dw].[d_yo_toimipiste] s3 ON s1.yliopisto_tunnus= s3.koodi_yliopisto
	AND s1.toimipiste_koodi = s3.koodi_toimipiste and s1.vuosi = s3.vuosi
JOIN [dw].[d_yo_toimipisteen_toimipaikka] s4 ON s1.yliopisto_tunnus = s4.koodi_yliopisto
	AND s1.toimipiste_koodi = s4.koodi_toimipiste
	AND s1.toimipaikka_koodi = s4.koodi_toimipaikka
	AND s1.vuosi = s4.vuosi

GO

USE [ANTERO]