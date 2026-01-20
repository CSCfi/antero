USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_ostopalveluna_hankittu_tyo]    Script Date: 10.3.2025 8.45.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_amk_ostopalveluna_hankittu_tyo]
AS
TRUNCATE TABLE dw.f_amk_ostopalveluna_hankittu_tyo;

INSERT INTO dw.f_amk_ostopalveluna_hankittu_tyo (
	[d_amk_id]
	,d_henkilostoryhma_id
	,[vuosi]
	,henkilostoryhman_tunnit_lkm
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,s3.id
	,[vuosi]
	,henkilostoryhman_tunnit_lkm
	,getdate()
	,'etl: p_lataa_f_amk_ostopalveluna_hankittu_tyo'
	,suser_sname()
FROM [sa].[sa_suorat_amk6b_ostopalveluna_hankittu_tyo] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.Ammattikorkeakoulu = s2.organisaatio_koodi
JOIN [dw].d_amk_muun_henkilokunnan_henkilostoryhma s3 ON s1.Henkilostoryhma = s3.koodi
;
GO

USE [ANTERO]