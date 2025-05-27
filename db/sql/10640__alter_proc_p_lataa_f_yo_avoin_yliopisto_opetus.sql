USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_avoin_yliopisto_opetus]    Script Date: 10.3.2025 9.25.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_avoin_yliopisto_opetus]
AS
TRUNCATE TABLE dw.f_yo_avoin_yliopisto_opetus;

INSERT INTO dw.f_yo_avoin_yliopisto_opetus (
	d_yliopisto_id
	,d_koulutusala95_id
	,vuosi
	,tarjotut_pisteet_lkm
    ,itse_jarj_tutkopiskelijoille
    ,itse_jarj_ei_tutkopiskelijoille
    ,kans_ja_tyovaen_tutkopiskelijoille
    ,kans_ja_tyovaen_ei_tutkopiskelijoille
    ,kans_opiston_tutkopiskelijoille
    ,kans_opiston_ei_tutkopiskelijoille
    ,kesäyliop_tutkopiskelijoille
    ,kesäyliop_ei_tutkopiskelijoille
    ,muut_jarj_tutkopiskelijoille
    ,muut_jarj_ei_tutkopiskelijoille
	,loadtime
	,source
	,username
	)
SELECT s2.id
	,s3.id
	,Vuosi
	, COALESCE(tarjotut_pisteet_lkm, 0)
    , COALESCE(itse_jarj_tutkopiskelijoille, 0)
    , COALESCE(itse_jarj_ei_tutkopiskelijoille, 0)
    , COALESCE(kans_ja_tyovaen_tutkopiskelijoille, 0)
    , COALESCE(kans_ja_tyovaen_ei_tutkopiskelijoille, 0)
    , COALESCE(kans_opiston_tutkopiskelijoille, 0)
    , COALESCE(kans_opiston_ei_tutkopiskelijoille, 0)
    , COALESCE(kesäyliop_tutkopiskelijoille, 0)
    , COALESCE(kesäyliop_ei_tutkopiskelijoille, 0)
    , COALESCE(muut_jarj_tutkopiskelijoille, 0)
    , COALESCE(muut_jarj_ei_tutkopiskelijoille, 0)
	,getdate()
	,'etl: p_lataa_f_yo_avoin_yliopisto_opetus'
	,suser_sname()
FROM sa.sa_suorat_hist_yo6a_avoin_yliopisto_opetus s1
JOIN dw.d_organisaatioluokitus s2 ON s1.yliopisto_tunnus = s2.organisaatio_koodi
JOIN dw.d_koulutusala_1995 s3 ON s1.koulutusalakoodi = s3.koodi
;
GO


USE [ANTERO]